require 'ucsimc/trivial_xml'
require 'ucsimc/managed_object'

module Ucsimc
  class ConfigResolveClasses < TrivialXml
    attr_accessor :action, :action_property, :inner_content, :req, :classes
    attr_reader :cookie
    
    def initialize cookie
      @cookie = cookie
      xml_opts = {
        :inner => "inIds",
        :inner_id => "Id",
      }
      super xml_opts
    end
    
    def request classes
      @action = "configResolveClasses"
      @action_properties = {:cookie => @cookie, :inHierarchical => "false" }
      @inner_opt = classes
      easy_xml
    end
    
    def response resp
      mo = Ucsimc::ManagedObject.new(easy_response(resp))
      mo
    end
    
  end
end