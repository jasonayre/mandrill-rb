module Mandrill
  class Senders
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Return the senders that have tried to use this account.
    # @return [Array] an array of sender data, one for each sending addresses used by the account
    #     - [Hash] return[] the information on each sending address in the account
    #         - [String] address the sender's email address
    #         - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
    #         - [Integer] sent the total number of messages sent by this sender
    #         - [Integer] hard_bounces the total number of hard bounces by messages by this sender
    #         - [Integer] soft_bounces the total number of soft bounces by messages by this sender
    #         - [Integer] rejects the total number of rejected messages by this sender
    #         - [Integer] complaints the total number of spam complaints received for messages by this sender
    #         - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
    #         - [Integer] opens the total number of times messages by this sender have been opened
    #         - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
    #         - [Integer] unique_opens the number of unique opens for emails sent for this sender
    #         - [Integer] unique_clicks the number of unique clicks for emails sent for this sender
    def list()
      _params = {}
      return @master.call 'senders/list', _params
    end

    # Returns the sender domains that have been added to this account.
    # @return [Array] an array of sender domain data, one for each sending domain used by the account
    #     - [Hash] return[] the information on each sending domain for the account
    #         - [String] domain the sender domain name
    #         - [String] created_at the date and time that the sending domain was first seen as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [Hash] spf details about the domain's SPF record
    #             - [Boolean] valid whether the domain's SPF record is valid for use with Mandrill
    #             - [String] valid_after when the domain's SPF record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
    #             - [String] error an error describing the spf record, or null if the record is correct
    #         - [Hash] dkim details about the domain's DKIM record
    #             - [Boolean] valid whether the domain's DKIM record is valid for use with Mandrill
    #             - [String] valid_after when the domain's DKIM record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
    #             - [String] error an error describing the DKIM record, or null if the record is correct
    #         - [String] verified_at if the domain has been verified, this indicates when that verification occurred as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [Boolean] valid_signing whether this domain can be used to authenticate mail, either for itself or as a custom signing domain. If this is false but spf and dkim are both valid, you will need to verify the domain before using it to authenticate mail
    def domains()
      _params = {}
      return @master.call 'senders/domains', _params
    end

    # Adds a sender domain to your account. Sender domains are added automatically as you send, but you can use this call to add them ahead of time.
    # @param [String] domain a domain name
    # @return [Hash] information about the domain
    #     - [String] domain the sender domain name
    #     - [String] created_at the date and time that the sending domain was first seen as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Hash] spf details about the domain's SPF record
    #         - [Boolean] valid whether the domain's SPF record is valid for use with Mandrill
    #         - [String] valid_after when the domain's SPF record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
    #         - [String] error an error describing the spf record, or null if the record is correct
    #     - [Hash] dkim details about the domain's DKIM record
    #         - [Boolean] valid whether the domain's DKIM record is valid for use with Mandrill
    #         - [String] valid_after when the domain's DKIM record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
    #         - [String] error an error describing the DKIM record, or null if the record is correct
    #     - [String] verified_at if the domain has been verified, this indicates when that verification occurred as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Boolean] valid_signing whether this domain can be used to authenticate mail, either for itself or as a custom signing domain. If this is false but spf and dkim are both valid, you will need to verify the domain before using it to authenticate mail
    def add_domain(domain)
      _params = {:domain => domain}
      return @master.call 'senders/add-domain', _params
    end

    # Checks the SPF and DKIM settings for a domain. If you haven't already added this domain to your account, it will be added automatically.
    # @param [String] domain a domain name
    # @return [Hash] information about the sender domain
    #     - [String] domain the sender domain name
    #     - [String] created_at the date and time that the sending domain was first seen as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Hash] spf details about the domain's SPF record
    #         - [Boolean] valid whether the domain's SPF record is valid for use with Mandrill
    #         - [String] valid_after when the domain's SPF record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
    #         - [String] error an error describing the spf record, or null if the record is correct
    #     - [Hash] dkim details about the domain's DKIM record
    #         - [Boolean] valid whether the domain's DKIM record is valid for use with Mandrill
    #         - [String] valid_after when the domain's DKIM record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
    #         - [String] error an error describing the DKIM record, or null if the record is correct
    #     - [String] verified_at if the domain has been verified, this indicates when that verification occurred as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Boolean] valid_signing whether this domain can be used to authenticate mail, either for itself or as a custom signing domain. If this is false but spf and dkim are both valid, you will need to verify the domain before using it to authenticate mail
    def check_domain(domain)
      _params = {:domain => domain}
      return @master.call 'senders/check-domain', _params
    end

    # Sends a verification email in order to verify ownership of a domain. Domain verification is an optional step to confirm ownership of a domain. Once a domain has been verified in a Mandrill account, other accounts may not have their messages signed by that domain unless they also verify the domain. This prevents other Mandrill accounts from sending mail signed by your domain.
    # @param [String] domain a domain name at which you can receive email
    # @param [String] mailbox a mailbox at the domain where the verification email should be sent
    # @return [Hash] information about the verification that was sent
    #     - [String] status "sent" indicates that the verification has been sent, "already_verified" indicates that the domain has already been verified with your account
    #     - [String] domain the domain name you provided
    #     - [String] email the email address the verification email was sent to
    def verify_domain(domain, mailbox)
      _params = {:domain => domain, :mailbox => mailbox}
      return @master.call 'senders/verify-domain', _params
    end

    # Return more detailed information about a single sender, including aggregates of recent stats
    # @param [String] address the email address of the sender
    # @return [Hash] the detailed information on the sender
    #     - [String] address the sender's email address
    #     - [String] created_at the date and time that the sender was first seen by Mandrill as a UTC date string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] sent the total number of messages sent by this sender
    #     - [Integer] hard_bounces the total number of hard bounces by messages by this sender
    #     - [Integer] soft_bounces the total number of soft bounces by messages by this sender
    #     - [Integer] rejects the total number of rejected messages by this sender
    #     - [Integer] complaints the total number of spam complaints received for messages by this sender
    #     - [Integer] unsubs the total number of unsubscribe requests received for messages by this sender
    #     - [Integer] opens the total number of times messages by this sender have been opened
    #     - [Integer] clicks the total number of times tracked URLs in messages by this sender have been clicked
    #     - [Hash] stats an aggregate summary of the sender's sending stats
    #         - [Hash] today stats for this sender so far today
    #             - [Integer] sent the number of emails sent for this sender so far today
    #             - [Integer] hard_bounces the number of emails hard bounced for this sender so far today
    #             - [Integer] soft_bounces the number of emails soft bounced for this sender so far today
    #             - [Integer] rejects the number of emails rejected for sending this sender so far today
    #             - [Integer] complaints the number of spam complaints for this sender so far today
    #             - [Integer] unsubs the number of unsubscribes for this sender so far today
    #             - [Integer] opens the number of times emails have been opened for this sender so far today
    #             - [Integer] unique_opens the number of unique opens for emails sent for this sender so far today
    #             - [Integer] clicks the number of URLs that have been clicked for this sender so far today
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender so far today
    #         - [Hash] last_7_days stats for this sender in the last 7 days
    #             - [Integer] sent the number of emails sent for this sender in the last 7 days
    #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 7 days
    #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 7 days
    #             - [Integer] rejects the number of emails rejected for sending this sender in the last 7 days
    #             - [Integer] complaints the number of spam complaints for this sender in the last 7 days
    #             - [Integer] unsubs the number of unsubscribes for this sender in the last 7 days
    #             - [Integer] opens the number of times emails have been opened for this sender in the last 7 days
    #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 7 days
    #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 7 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 7 days
    #         - [Hash] last_30_days stats for this sender in the last 30 days
    #             - [Integer] sent the number of emails sent for this sender in the last 30 days
    #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 30 days
    #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 30 days
    #             - [Integer] rejects the number of emails rejected for sending this sender in the last 30 days
    #             - [Integer] complaints the number of spam complaints for this sender in the last 30 days
    #             - [Integer] unsubs the number of unsubscribes for this sender in the last 30 days
    #             - [Integer] opens the number of times emails have been opened for this sender in the last 30 days
    #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 30 days
    #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 30 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 30 days
    #         - [Hash] last_60_days stats for this sender in the last 60 days
    #             - [Integer] sent the number of emails sent for this sender in the last 60 days
    #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 60 days
    #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 60 days
    #             - [Integer] rejects the number of emails rejected for sending this sender in the last 60 days
    #             - [Integer] complaints the number of spam complaints for this sender in the last 60 days
    #             - [Integer] unsubs the number of unsubscribes for this sender in the last 60 days
    #             - [Integer] opens the number of times emails have been opened for this sender in the last 60 days
    #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 60 days
    #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 60 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 60 days
    #         - [Hash] last_90_days stats for this sender in the last 90 days
    #             - [Integer] sent the number of emails sent for this sender in the last 90 days
    #             - [Integer] hard_bounces the number of emails hard bounced for this sender in the last 90 days
    #             - [Integer] soft_bounces the number of emails soft bounced for this sender in the last 90 days
    #             - [Integer] rejects the number of emails rejected for sending this sender in the last 90 days
    #             - [Integer] complaints the number of spam complaints for this sender in the last 90 days
    #             - [Integer] unsubs the number of unsubscribes for this sender in the last 90 days
    #             - [Integer] opens the number of times emails have been opened for this sender in the last 90 days
    #             - [Integer] unique_opens the number of unique opens for emails sent for this sender in the last 90 days
    #             - [Integer] clicks the number of URLs that have been clicked for this sender in the last 90 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this sender in the last 90 days
    def info(address)
      _params = {:address => address}
      return @master.call 'senders/info', _params
    end

    # Return the recent history (hourly stats for the last 30 days) for a sender
    # @param [String] address the email address of the sender
    # @return [Array] the array of history information
    #     - [Hash] return[] the stats for a single hour
    #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
    #         - [Integer] sent the number of emails that were sent during the hour
    #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
    #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
    #         - [Integer] rejects the number of emails that were rejected during the hour
    #         - [Integer] complaints the number of spam complaints received during the hour
    #         - [Integer] opens the number of emails opened during the hour
    #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
    #         - [Integer] clicks the number of tracked URLs clicked during the hour
    #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
    def time_series(address)
      _params = {:address => address}
      return @master.call 'senders/time-series', _params
    end

  end
end
