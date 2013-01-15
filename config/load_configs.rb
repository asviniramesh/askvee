require 'yaml'

YAML::ENGINE.yamler= 'syck'
APP_MESSAGE = YAML.load_file("config/notification_message.yml")
askvee=YAML.load_file("config/askvee.yml")
Api_host=askvee[Rails.env]["api"]["host"]
Web_host=askvee[Rails.env]["web"]["host"]