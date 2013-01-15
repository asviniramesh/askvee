class Attachment < ActiveRecord::Base
 belongs_to :attachable,:polymorphic=>true
  has_attached_file :image, :storage => :s3, :s3_credentials => YAML.load_file("config/s3.yml"), :path => ":attachment/:id/:style.:extension", :styles => lambda{|a| ['image/jpg','image/jpeg', 'image/gif', 'image/png', 'image/bmp'].include?( a.content_type ) ? { :user => "33x33", :carer => "38x37>", :carer_subject => "115x115>", :subject => "53x52", :avatar => "121x119", :profile=>"98x97", :withdraw=>"115x115", :xlarge=>"180>x150"} : {}}


def self.create_file(encoded,category,file_name)
  @category_type = category.type
  @id = category.id
		File.open("#{Rails.root}/tmp/#{file_name}", 'wb') do|f|
		f.write(Base64.decode64("#{encoded}"))
   end
     new_file=File.new("#{Rails.root}/tmp/#{file_name}")
        Attachment.create(:image=>new_file, :attachable_id=>@id, :attachable_type=>@category_type)
         File.delete(new_file)
		#~ case category_type
      #~ when "Dinner"
         #~ new_file=File.new("#{Rails.root}/tmp/#{file_name}")
         #~ Attachment.create(:image=>new_file, :attachable_type=>"Dinner", :attachable_id=>@id)
         #~ #File.delete(new_file)
      #~ when "TourGuide"
        #~ new_file=File.new("#{Rails.root}/tmp/#{file_name}")
        #~ category.attachments << Attachment.create(:image=>new_file)
         #~ File.delete(new_file)
      #~ when "Breakfast"
        #~ new_file=File.new("#{Rails.root}/tmp/#{file_name}")
        #~ category.attachments << Attachment.create(:image=>new_file)
         #~ File.delete(new_file)
      #~ end
end

def self.update_file(encoded,room,file_name)
			File.open("#{Rails.root}/tmp/#{file_name}", 'wb') do|f|
      f.write(Base64.decode64("#{encoded}"))
      end
      new_file=File.new("#{Rails.root}/tmp/#{file_name}")
      room.attachments.destroy_all
      room.attachments.create(:image=>new_file)
      File.delete(new_file)
     end
     
     def self.find_attachments(id,type)
    attachment=Attachment.find_all_by_attachable_id_and_attachable_type(id,type)
			 @attachment=[]
			 attachment.each do |attach|
			 @attachment << attach.image(:avatar).to_s
      end
      return  @attachment
      end
end


