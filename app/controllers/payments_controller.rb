	class PaymentsController < ApplicationController
 before_filter :current_user 
	def new
	@payment=Payment.new
	end

	def create 
		if params[:body][:payment][:expiry_date]["expiry_date(1i)"]!="" && params[:body][:payment][:expiry_date]["expiry_date(2i)"]!="" && params[:body][:payment][:expiry_date]["expiry_date(3i)"]!=""
	@year=params[:body][:payment][:expiry_date]["expiry_date(1i)"]
	@month=params[:body][:payment][:expiry_date]["expiry_date(2i)"]
	@day=params[:body][:payment][:expiry_date]["expiry_date(3i)"]
	@expiry_date=Date.civil(@year.to_i,@month.to_i,@day.to_i)
end 
	@payment=Payment.new(:type_of_card=>params[:body][:payment][:type_of_card],:card_number=>params[:body][:payment][:card_number],:cvv_number=>params[:body][:payment][:cvv_number],  
	:expiry_date=>@expiry_date,:name_as_on_card=>params[:body][:payment][:name_as_on_card],:amount=>params[:body][:payment][:amount])
 
	ActiveMerchant::Billing::Base.mode = :test
	gateway = ActiveMerchant::Billing::PaypalGateway.new(
	:login => "parthi_1338377898_biz_api1.gmail.com",
	:password => "1338377940",
	:signature => "AhVajd.tZKGt2h3gCCumP3NOghvPAAPIW83SOigEAEZsmTM-.a5abqwI"
	)

	credit_card = ActiveMerchant::Billing::CreditCard.new(
	:type                   => "#{params[:body][:payment][:type_of_card]}",
	:number                 => "#{params[:body][:payment][:card_number]}",
	:verification_value     => "#{params[:body][:payment][:cvv_number]}",
	:month                  => "#{params[:body][:payment][:expiry_date]["expiry_date(2i)"]}",
	:year                   =>"#{params[:body][:payment][:expiry_date]["expiry_date(1i)"]}",
	:first_name             => "#{params[:body][:payment][:name_as_on_card]}",
	:last_name              => "#{params[:body][:payment][:name_as_on_card]}"
	)
	@amount="#{params[:body][:payment][:amount]}"
	if @payment.valid?
	if credit_card.valid?
	if @payment.save
	@days=Payment.calculate_no_of_days(params[:body][:payment][:check_in],params[:body][:payment][:check_out])
	@room_booking=RoomBooking.create(:room_id=>params[:body][:payment][:ad_id],:guest_id=>@current_user.id,:check_in=>params[:body][:payment][:check_in],:check_out=>params[:body][:payment][:check_out],:no_of_person=>params[:body][:payment][:person],:actual_rate=>params[:body][:payment][:price],:host_id=>params[:body][:payment][:host_id],:is_amount_paid=>true,:no_of_days=>@days)
	@room_booking.payment=@payment
	Host.booking_request(params[:body][:payment][:ad_id],@current_user.id,params[:body][:payment][:check_in],params[:body][:payment][:check_out],params[:body][:payment][:person]).deliver
	render :json=>{:response=>"success"}
	else
	render :json=>failure1(@payment.errors)
end
p "1111111111111111111111111"
 unless @current_user.country.blank? 
 @country_name=@current_user.country.name
 else
	 @coountry_name=""
 end
 
	response = gateway.purchase(@amount.to_i,credit_card,:ip => "127.0.0.1", :billing_address =>{ 
	:name     => "#{@current_user.user_name}",
	:address1 => "#{@current_user.address}",
	:city     => "#{@current_user.city_name}",
	:state    => "#{@current_user.state_name}",
	:country  => "#{@country_name}",
	:zip      => "#{@current_user.area_code}"
	} )    
	@transaction_id= response.params['transaction_id']
	@payment.update_attributes(:transaction_id=>@transaction_id)
	else
	@errors=credit_card.errors
	render :json=>failure2(@payment.errors,@errors["number"])
	end

	else
	render :json=>failure1(@payment.errors)
	end
	end

	def index
	@payments=Payment.find(:all,:conditions=>["is_refund in (?)",false],:order=>"created_at DESC")
	end

	def show 
	@payment=Payment.find_by_id(params[:id])
	end

	def destroy
	@payment =Payment.find_by_id(params[:id])
	if @payment.destroy
	render :json=>{:response=>"success"}
	else
	render :json=>failure1(@payment.errors)
	end
	end

	def refund
	unless params[:body][:amount].blank? &&  params[:body][:booking_id].blank? && params[:body][:id].blank?
	@amount=params[:body][:amount]
	@booking_id= params[:body][:booking_id]
	@id=params[:body][:id]
	@payment=Payment.find_by_id(@id)
	@transaction_id=@payment.transaction_id
	@room_booking=RoomBooking.find_by_id(@booking_id)
	@guest=User.find_by_id(@room_booking.guest_id)
	@email=@guest.email
	ActiveMerchant::Billing::Base.mode = :test
	gateway = ActiveMerchant::Billing::PaypalGateway.new(
	:login => "parthi_1338377898_biz_api1.gmail.com",
	:password => "1338377940",
	:signature => "AhVajd.tZKGt2h3gCCumP3NOghvPAAPIW83SOigEAEZsmTM-.a5abqwI"
	)
	response=gateway.refund(@amount.to_i, @transaction_id, :subject => "Refund from Askvee", :note => "Your booking has been rejected by the host so your booking amount has been refunded")
	if response.message=="Success"
	@refund_transaction_id=response.params['refund_transaction_id']
	@payment=Payment.find_by_id(@id)
	@payment.update_attributes(:is_refund=>true,:transaction_id=>nil,:refund_transaction_id=>@refund_transaction_id)
	render :json=>{:response=>"success"}
	else
	render :json=>failure1(response.params['Errors'])
	end
	end
	end

	end



