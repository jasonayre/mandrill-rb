module Mandrill
  class Tags
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Return all of the user-defined tag information
    # @return [Array] a list of user-defined tags
    #     - [Hash] return[] a user-defined tag
    #         - [String] tag the actual tag as a string
    #         - [Integer] reputation the tag's current reputation on a scale from 0 to 100.
    #         - [Integer] sent the total number of messages sent with this tag
    #         - [Integer] hard_bounces the total number of hard bounces by messages with this tag
    #         - [Integer] soft_bounces the total number of soft bounces by messages with this tag
    #         - [Integer] rejects the total number of rejected messages with this tag
    #         - [Integer] complaints the total number of spam complaints received for messages with this tag
    #         - [Integer] unsubs the total number of unsubscribe requests received for messages with this tag
    #         - [Integer] opens the total number of times messages with this tag have been opened
    #         - [Integer] clicks the total number of times tracked URLs in messages with this tag have been clicked
    #         - [Integer] unique_opens the number of unique opens for emails sent with this tag
    #         - [Integer] unique_clicks the number of unique clicks for emails sent with this tag
    def list()
      _params = {}
      return @master.call 'tags/list', _params
    end

    # Deletes a tag permanently. Deleting a tag removes the tag from any messages that have been sent, and also deletes the tag's stats. There is no way to undo this operation, so use it carefully.
    # @param [String] tag a tag name
    # @return [Hash] the tag that was deleted
    #     - [String] tag the actual tag as a string
    #     - [Integer] reputation the tag's current reputation on a scale from 0 to 100.
    #     - [Integer] sent the total number of messages sent with this tag
    #     - [Integer] hard_bounces the total number of hard bounces by messages with this tag
    #     - [Integer] soft_bounces the total number of soft bounces by messages with this tag
    #     - [Integer] rejects the total number of rejected messages with this tag
    #     - [Integer] complaints the total number of spam complaints received for messages with this tag
    #     - [Integer] unsubs the total number of unsubscribe requests received for messages with this tag
    #     - [Integer] opens the total number of times messages with this tag have been opened
    #     - [Integer] clicks the total number of times tracked URLs in messages with this tag have been clicked
    #     - [Integer] unique_opens the number of unique opens for emails sent with this tag
    #     - [Integer] unique_clicks the number of unique clicks for emails sent with this tag
    def delete(tag)
      _params = {:tag => tag}
      return @master.call 'tags/delete', _params
    end

    # Return more detailed information about a single tag, including aggregates of recent stats
    # @param [String] tag an existing tag name
    # @return [Hash] the detailed information on the tag
    #     - [String] tag the actual tag as a string
    #     - [Integer] sent the total number of messages sent with this tag
    #     - [Integer] hard_bounces the total number of hard bounces by messages with this tag
    #     - [Integer] soft_bounces the total number of soft bounces by messages with this tag
    #     - [Integer] rejects the total number of rejected messages with this tag
    #     - [Integer] complaints the total number of spam complaints received for messages with this tag
    #     - [Integer] unsubs the total number of unsubscribe requests received for messages with this tag
    #     - [Integer] opens the total number of times messages with this tag have been opened
    #     - [Integer] clicks the total number of times tracked URLs in messages with this tag have been clicked
    #     - [Hash] stats an aggregate summary of the tag's sending stats
    #         - [Hash] today stats with this tag so far today
    #             - [Integer] sent the number of emails sent with this tag so far today
    #             - [Integer] hard_bounces the number of emails hard bounced with this tag so far today
    #             - [Integer] soft_bounces the number of emails soft bounced with this tag so far today
    #             - [Integer] rejects the number of emails rejected for sending this tag so far today
    #             - [Integer] complaints the number of spam complaints with this tag so far today
    #             - [Integer] unsubs the number of unsubscribes with this tag so far today
    #             - [Integer] opens the number of times emails have been opened with this tag so far today
    #             - [Integer] unique_opens the number of unique opens for emails sent with this tag so far today
    #             - [Integer] clicks the number of URLs that have been clicked with this tag so far today
    #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag so far today
    #         - [Hash] last_7_days stats with this tag in the last 7 days
    #             - [Integer] sent the number of emails sent with this tag in the last 7 days
    #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 7 days
    #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 7 days
    #             - [Integer] rejects the number of emails rejected for sending this tag in the last 7 days
    #             - [Integer] complaints the number of spam complaints with this tag in the last 7 days
    #             - [Integer] unsubs the number of unsubscribes with this tag in the last 7 days
    #             - [Integer] opens the number of times emails have been opened with this tag in the last 7 days
    #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 7 days
    #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 7 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 7 days
    #         - [Hash] last_30_days stats with this tag in the last 30 days
    #             - [Integer] sent the number of emails sent with this tag in the last 30 days
    #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 30 days
    #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 30 days
    #             - [Integer] rejects the number of emails rejected for sending this tag in the last 30 days
    #             - [Integer] complaints the number of spam complaints with this tag in the last 30 days
    #             - [Integer] unsubs the number of unsubscribes with this tag in the last 30 days
    #             - [Integer] opens the number of times emails have been opened with this tag in the last 30 days
    #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 30 days
    #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 30 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 30 days
    #         - [Hash] last_60_days stats with this tag in the last 60 days
    #             - [Integer] sent the number of emails sent with this tag in the last 60 days
    #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 60 days
    #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 60 days
    #             - [Integer] rejects the number of emails rejected for sending this tag in the last 60 days
    #             - [Integer] complaints the number of spam complaints with this tag in the last 60 days
    #             - [Integer] unsubs the number of unsubscribes with this tag in the last 60 days
    #             - [Integer] opens the number of times emails have been opened with this tag in the last 60 days
    #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 60 days
    #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 60 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 60 days
    #         - [Hash] last_90_days stats with this tag in the last 90 days
    #             - [Integer] sent the number of emails sent with this tag in the last 90 days
    #             - [Integer] hard_bounces the number of emails hard bounced with this tag in the last 90 days
    #             - [Integer] soft_bounces the number of emails soft bounced with this tag in the last 90 days
    #             - [Integer] rejects the number of emails rejected for sending this tag in the last 90 days
    #             - [Integer] complaints the number of spam complaints with this tag in the last 90 days
    #             - [Integer] unsubs the number of unsubscribes with this tag in the last 90 days
    #             - [Integer] opens the number of times emails have been opened with this tag in the last 90 days
    #             - [Integer] unique_opens the number of unique opens for emails sent with this tag in the last 90 days
    #             - [Integer] clicks the number of URLs that have been clicked with this tag in the last 90 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent with this tag in the last 90 days
    def info(tag)
      _params = {:tag => tag}
      return @master.call 'tags/info', _params
    end

    # Return the recent history (hourly stats for the last 30 days) for a tag
    # @param [String] tag an existing tag name
    # @return [Array] the array of history information
    #     - [Hash] return[] the stats for a single hour
    #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
    #         - [Integer] sent the number of emails that were sent during the hour
    #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
    #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
    #         - [Integer] rejects the number of emails that were rejected during the hour
    #         - [Integer] complaints the number of spam complaints received during the hour
    #         - [Integer] unsubs the number of unsubscribes received during the hour
    #         - [Integer] opens the number of emails opened during the hour
    #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
    #         - [Integer] clicks the number of tracked URLs clicked during the hour
    #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
    def time_series(tag)
      _params = {:tag => tag}
      return @master.call 'tags/time-series', _params
    end

    # Return the recent history (hourly stats for the last 30 days) for all tags
    # @return [Array] the array of history information
    #     - [Hash] return[] the stats for a single hour
    #         - [String] time the hour as a UTC date string in YYYY-MM-DD HH:MM:SS format
    #         - [Integer] sent the number of emails that were sent during the hour
    #         - [Integer] hard_bounces the number of emails that hard bounced during the hour
    #         - [Integer] soft_bounces the number of emails that soft bounced during the hour
    #         - [Integer] rejects the number of emails that were rejected during the hour
    #         - [Integer] complaints the number of spam complaints received during the hour
    #         - [Integer] unsubs the number of unsubscribes received during the hour
    #         - [Integer] opens the number of emails opened during the hour
    #         - [Integer] unique_opens the number of unique opens generated by messages sent during the hour
    #         - [Integer] clicks the number of tracked URLs clicked during the hour
    #         - [Integer] unique_clicks the number of unique clicks generated by messages sent during the hour
    def all_time_series()
      _params = {}
      return @master.call 'tags/all-time-series', _params
    end

  end
end
