require 'excon'
require 'mandrill/error'
require 'mandrill/exports'
require 'mandrill/inbound'
require 'mandrill/internal'
require 'mandrill/ips'
require 'mandrill/messages'
require 'mandrill/metadata'
require 'mandrill/rejects'
require 'mandrill/senders'
require 'mandrill/subaccounts'
require 'mandrill/tags'
require 'mandrill/templates'
require 'mandrill/urls'
require 'mandrill/users'
require 'mandrill/webhooks'
require 'mandrill/whitelists'

module Mandrill
  class API
    attr_accessor :host, :path, :apikey, :debug, :session

    def initialize(apikey=nil, debug=false)
      @host = 'https://mandrillapp.com'
      @path = '/api/1.0/'

      @session = ::Excon.new @host
      @debug = debug

      if not apikey
        if ENV['MANDRILL_APIKEY']
          apikey = ENV['MANDRILL_APIKEY']
        else
          apikey = read_configs
        end
      end

      raise ::Mandrill::Error, 'You must provide a Mandrill API key' if not apikey
      @apikey = apikey
    end

    def call(url, params={})
      params[:key] = @apikey
      params = JSON.generate(params)
      r = @session.post(:path => "#{@path}#{url}.json", :headers => {'Content-Type' => 'application/json'}, :body => params)

      cast_error(r.body) if r.status != 200
      return JSON.parse(r.body)
    end

    def read_configs()
      [File.expand_path('~/.mandrill.key'), '/etc/mandrill.key'].delete_if{ |p| not File.exist? p}.each do |path|
        f = File.new path
        apikey = f.read.strip
        f.close
        return apikey if apikey != ''
      end

      return nil
    end

    def cast_error(body)

      error_map = {
        'ValidationError' => ::Mandrill::ValidationError,
        'Invalid_Key' => ::Mandrill::InvalidKeyError,
        'PaymentRequired' => ::Mandrill::PaymentRequiredError,
        'Unknown_Subaccount' => ::Mandrill::UnknownSubaccountError,
        'Unknown_Template' => ::Mandrill::UnknownTemplateError,
        'ServiceUnavailable' => ::Mandrill::ServiceUnavailableError,
        'Unknown_Message' => ::Mandrill::UnknownMessageError,
        'Invalid_Tag_Name' => ::Mandrill::InvalidTagNameError,
        'Invalid_Reject' => ::Mandrill::InvalidRejectError,
        'Unknown_Sender' => ::Mandrill::UnknownSenderError,
        'Unknown_Url' => ::Mandrill::UnknownUrlError,
        'Unknown_TrackingDomain' => ::Mandrill::UnknownTrackingDomainError,
        'Invalid_Template' => ::Mandrill::InvalidTemplateError,
        'Unknown_Webhook' => ::Mandrill::UnknownWebhookError,
        'Unknown_InboundDomain' => ::Mandrill::UnknownInboundDomainError,
        'Unknown_InboundRoute' => ::Mandrill::UnknownInboundRouteError,
        'Unknown_Export' => ::Mandrill::UnknownExportError,
        'IP_ProvisionLimit' => ::Mandrill::IPProvisionLimitError,
        'Unknown_Pool' => ::Mandrill::UnknownPoolError,
        'NoSendingHistory' => ::Mandrill::NoSendingHistoryError,
        'PoorReputation' => ::Mandrill::PoorReputationError,
        'Unknown_IP' => ::Mandrill::UnknownIPError,
        'Invalid_EmptyDefaultPool' => ::Mandrill::InvalidEmptyDefaultPoolError,
        'Invalid_DeleteDefaultPool' => ::Mandrill::InvalidDeleteDefaultPoolError,
        'Invalid_DeleteNonEmptyPool' => ::Mandrill::InvalidDeleteNonEmptyPoolError,
        'Invalid_CustomDNS' => ::Mandrill::InvalidCustomDNSError,
        'Invalid_CustomDNSPending' => ::Mandrill::InvalidCustomDNSPendingError,
        'Metadata_FieldLimit' => ::Mandrill::MetadataFieldLimitError,
        'Unknown_MetadataField' => ::Mandrill::UnknownMetadataFieldError
      }

      begin
        error_info = JSON.parse(body)
        if error_info['status'] != 'error' or not error_info['name']
          raise Error, "We received an unexpected error: #{body}"
        end
        if error_map[error_info['name']]
          raise error_map[error_info['name']], error_info['message']
        else
          raise Error, error_info['message']
        end
      rescue JSON::ParserError
        raise Error, "We received an unexpected error: #{body}"
      end
    end

    def templates()
      ::Mandrill::Templates.new self
    end

    def exports()
      ::Mandrill::Exports.new self
    end

    def users()
      ::Mandrill::Users.new self
    end

    def rejects()
      ::Mandrill::Rejects.new self
    end

    def inbound()
      ::Mandrill::Inbound.new self
    end

    def tags()
      ::Mandrill::Tags.new self
    end

    def messages()
      ::Mandrill::Messages.new self
    end

    def whitelists()
      ::Mandrill::Whitelists.new self
    end

    def ips()
      ::Mandrill::Ips.new self
    end

    def internal()
      ::Mandrill::Internal.new self
    end

    def subaccounts()
      ::Mandrill::Subaccounts.new self
    end

    def urls()
      ::Mandrill::Urls.new self
    end

    def webhooks()
      ::Mandrill::Webhooks.new self
    end

    def senders()
      ::Mandrill::Senders.new self
    end

    def metadata()
      ::Mandrill::Metadata.new self
    end
  end
end
