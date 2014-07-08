module Mandrill
  class Urls
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Get the 100 most clicked URLs
    # @return [Array] the 100 most clicked URLs and their stats
    #     - [Hash] return[] the individual URL stats
    #         - [String] url the URL to be tracked
    #         - [Integer] sent the number of emails that contained the URL
    #         - [Integer] clicks the number of times the URL has been clicked from a tracked email
    #         - [Integer] unique_clicks the number of unique emails that have generated clicks for this URL
    def list()
      _params = {}
      return @master.call 'urls/list', _params
    end

    # Return the 100 most clicked URLs that match the search query given
    # @param [String] q a search query
    # @return [Array] the 100 most clicked URLs matching the search query
    #     - [Hash] return[] the URL matching the query
    #         - [String] url the URL to be tracked
    #         - [Integer] sent the number of emails that contained the URL
    #         - [Integer] clicks the number of times the URL has been clicked from a tracked email
    #         - [Integer] unique_clicks the number of unique emails that have generated clicks for this URL
    def search(q)
      _params = {:q => q}
      return @master.call 'urls/search', _params
    end

    # Return the recent history (hourly stats for the last 30 days) for a url
    # @param [String] url an existing URL
    # @return [Array] the array of history information
    #     - [Hash] return[] the information for a single hour
    #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
    #         - [Integer] sent the number of emails that were sent with the URL during the hour
    #         - [Integer] clicks the number of times the URL was clicked during the hour
    #         - [Integer] unique_clicks the number of unique clicks generated for emails sent with this URL during the hour
    def time_series(url)
      _params = {:url => url}
      return @master.call 'urls/time-series', _params
    end

    # Get the list of tracking domains set up for this account
    # @return [Array] the tracking domains and their status
    #     - [Hash] return[] the individual tracking domain
    #         - [String] domain the tracking domain name
    #         - [String] created_at the date and time that the tracking domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [Hash] cname details about the domain's CNAME record
    #             - [Boolean] valid whether the domain's CNAME record is valid for use with Mandrill
    #             - [String] valid_after when the domain's CNAME record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
    #             - [String] error an error describing the CNAME record, or null if the record is correct
    #         - [Boolean] valid_tracking whether this domain can be used as a tracking domain for email.
    def tracking_domains()
      _params = {}
      return @master.call 'urls/tracking-domains', _params
    end

    # Add a tracking domain to your account
    # @param [String] domain a domain name
    # @return [Hash] information about the domain
    #     - [String] domain the tracking domain name
    #     - [String] created_at the date and time that the tracking domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Hash] cname details about the domain's CNAME record
    #         - [Boolean] valid whether the domain's CNAME record is valid for use with Mandrill
    #         - [String] valid_after when the domain's CNAME record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
    #         - [String] error an error describing the CNAME record, or null if the record is correct
    #     - [Boolean] valid_tracking whether this domain can be used as a tracking domain for email.
    def add_tracking_domain(domain)
      _params = {:domain => domain}
      return @master.call 'urls/add-tracking-domain', _params
    end

    # Checks the CNAME settings for a tracking domain. The domain must have been added already with the add-tracking-domain call
    # @param [String] domain an existing tracking domain name
    # @return [Hash] information about the tracking domain
    #     - [String] domain the tracking domain name
    #     - [String] created_at the date and time that the tracking domain was added as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] last_tested_at when the domain's DNS settings were last tested as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Hash] cname details about the domain's CNAME record
    #         - [Boolean] valid whether the domain's CNAME record is valid for use with Mandrill
    #         - [String] valid_after when the domain's CNAME record will be considered valid for use with Mandrill as a UTC string in YYYY-MM-DD HH:MM:SS format. If set, this indicates that the record is valid now, but was previously invalid, and Mandrill will wait until the record's TTL elapses to start using it.
    #         - [String] error an error describing the CNAME record, or null if the record is correct
    #     - [Boolean] valid_tracking whether this domain can be used as a tracking domain for email.
    def check_tracking_domain(domain)
      _params = {:domain => domain}
      return @master.call 'urls/check-tracking-domain', _params
    end

  end
end
