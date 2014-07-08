module Mandrill
  class Inbound
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # List the domains that have been configured for inbound delivery
    # @return [Array] the inbound domains associated with the account
    #     - [Hash] return[] the individual domain info
    #         - [String] domain the domain name that is accepting mail
    #         - [String] created_at the date and time that the inbound domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [Boolean] valid_mx true if this inbound domain has successfully set up an MX record to deliver mail to the Mandrill servers
    def domains()
      _params = {}
      return @master.call 'inbound/domains', _params
    end

    # Add an inbound domain to your account
    # @param [String] domain a domain name
    # @return [Hash] information about the domain
    #     - [String] domain the domain name that is accepting mail
    #     - [String] created_at the date and time that the inbound domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Boolean] valid_mx true if this inbound domain has successfully set up an MX record to deliver mail to the Mandrill servers
    def add_domain(domain)
      _params = {:domain => domain}
      return @master.call 'inbound/add-domain', _params
    end

    # Check the MX settings for an inbound domain. The domain must have already been added with the add-domain call
    # @param [String] domain an existing inbound domain
    # @return [Hash] information about the inbound domain
    #     - [String] domain the domain name that is accepting mail
    #     - [String] created_at the date and time that the inbound domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Boolean] valid_mx true if this inbound domain has successfully set up an MX record to deliver mail to the Mandrill servers
    def check_domain(domain)
      _params = {:domain => domain}
      return @master.call 'inbound/check-domain', _params
    end

    # Delete an inbound domain from the account. All mail will stop routing for this domain immediately.
    # @param [String] domain an existing inbound domain
    # @return [Hash] information about the deleted domain
    #     - [String] domain the domain name that is accepting mail
    #     - [String] created_at the date and time that the inbound domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Boolean] valid_mx true if this inbound domain has successfully set up an MX record to deliver mail to the Mandrill servers
    def delete_domain(domain)
      _params = {:domain => domain}
      return @master.call 'inbound/delete-domain', _params
    end

    # List the mailbox routes defined for an inbound domain
    # @param [String] domain the domain to check
    # @return [Array] the routes associated with the domain
    #     - [Hash] return[] the individual mailbox route
    #         - [String] id the unique identifier of the route
    #         - [String] pattern the search pattern that the mailbox name should match
    #         - [String] url the webhook URL where inbound messages will be published
    def routes(domain)
      _params = {:domain => domain}
      return @master.call 'inbound/routes', _params
    end

    # Add a new mailbox route to an inbound domain
    # @param [String] domain an existing inbound domain
    # @param [String] pattern the search pattern that the mailbox name should match
    # @param [String] url the webhook URL where the inbound messages will be published
    # @return [Hash] the added mailbox route information
    #     - [String] id the unique identifier of the route
    #     - [String] pattern the search pattern that the mailbox name should match
    #     - [String] url the webhook URL where inbound messages will be published
    def add_route(domain, pattern, url)
      _params = {:domain => domain, :pattern => pattern, :url => url}
      return @master.call 'inbound/add-route', _params
    end

    # Update the pattern or webhook of an existing inbound mailbox route. If null is provided for any fields, the values will remain unchanged.
    # @param [String] id the unique identifier of an existing mailbox route
    # @param [String] pattern the search pattern that the mailbox name should match
    # @param [String] url the webhook URL where the inbound messages will be published
    # @return [Hash] the updated mailbox route information
    #     - [String] id the unique identifier of the route
    #     - [String] pattern the search pattern that the mailbox name should match
    #     - [String] url the webhook URL where inbound messages will be published
    def update_route(id, pattern=nil, url=nil)
      _params = {:id => id, :pattern => pattern, :url => url}
      return @master.call 'inbound/update-route', _params
    end

    # Delete an existing inbound mailbox route
    # @param [String] id the unique identifier of an existing route
    # @return [Hash] the deleted mailbox route information
    #     - [String] id the unique identifier of the route
    #     - [String] pattern the search pattern that the mailbox name should match
    #     - [String] url the webhook URL where inbound messages will be published
    def delete_route(id)
      _params = {:id => id}
      return @master.call 'inbound/delete-route', _params
    end

    # Take a raw MIME document destined for a domain with inbound domains set up, and send it to the inbound hook exactly as if it had been sent over SMTP
    # @param [String] raw_message the full MIME document of an email message
    # @param [Array, nil] to optionally define the recipients to receive the message - otherwise we'll use the To, Cc, and Bcc headers provided in the document
    #     - [String] to[] the email address of the recipient
    # @param [String] mail_from the address specified in the MAIL FROM stage of the SMTP conversation. Required for the SPF check.
    # @param [String] helo the identification provided by the client mta in the MTA state of the SMTP conversation. Required for the SPF check.
    # @param [String] client_address the remote MTA's ip address. Optional; required for the SPF check.
    # @return [Array] an array of the information for each recipient in the message (usually one) that matched an inbound route
    #     - [Hash] return[] the individual recipient information
    #         - [String] email the email address of the matching recipient
    #         - [String] pattern the mailbox route pattern that the recipient matched
    #         - [String] url the webhook URL that the message was posted to
    def send_raw(raw_message, to=nil, mail_from=nil, helo=nil, client_address=nil)
      _params = {:raw_message => raw_message, :to => to, :mail_from => mail_from, :helo => helo, :client_address => client_address}
      return @master.call 'inbound/send-raw', _params
    end

  end
end
