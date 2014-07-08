module Mandrill
  class Users
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Return the information about the API-connected user
    # @return [Hash] the user information including username, key, reputation, quota, and historical sending stats
    #     - [String] username the username of the user (used for SMTP authentication)
    #     - [String] created_at the date and time that the user's Mandrill account was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] public_id a unique, permanent identifier for this user
    #     - [Integer] reputation the reputation of the user on a scale from 0 to 100, with 75 generally being a "good" reputation
    #     - [Integer] hourly_quota the maximum number of emails Mandrill will deliver for this user each hour.  Any emails beyond that will be accepted and queued for later delivery.  Users with higher reputations will have higher hourly quotas
    #     - [Integer] backlog the number of emails that are queued for delivery due to exceeding your monthly or hourly quotas
    #     - [Hash] stats an aggregate summary of the account's sending stats
    #         - [Hash] today stats for this user so far today
    #             - [Integer] sent the number of emails sent for this user so far today
    #             - [Integer] hard_bounces the number of emails hard bounced for this user so far today
    #             - [Integer] soft_bounces the number of emails soft bounced for this user so far today
    #             - [Integer] rejects the number of emails rejected for sending this user so far today
    #             - [Integer] complaints the number of spam complaints for this user so far today
    #             - [Integer] unsubs the number of unsubscribes for this user so far today
    #             - [Integer] opens the number of times emails have been opened for this user so far today
    #             - [Integer] unique_opens the number of unique opens for emails sent for this user so far today
    #             - [Integer] clicks the number of URLs that have been clicked for this user so far today
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user so far today
    #         - [Hash] last_7_days stats for this user in the last 7 days
    #             - [Integer] sent the number of emails sent for this user in the last 7 days
    #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 7 days
    #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 7 days
    #             - [Integer] rejects the number of emails rejected for sending this user in the last 7 days
    #             - [Integer] complaints the number of spam complaints for this user in the last 7 days
    #             - [Integer] unsubs the number of unsubscribes for this user in the last 7 days
    #             - [Integer] opens the number of times emails have been opened for this user in the last 7 days
    #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 7 days
    #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 7 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 7 days
    #         - [Hash] last_30_days stats for this user in the last 30 days
    #             - [Integer] sent the number of emails sent for this user in the last 30 days
    #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 30 days
    #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 30 days
    #             - [Integer] rejects the number of emails rejected for sending this user in the last 30 days
    #             - [Integer] complaints the number of spam complaints for this user in the last 30 days
    #             - [Integer] unsubs the number of unsubscribes for this user in the last 30 days
    #             - [Integer] opens the number of times emails have been opened for this user in the last 30 days
    #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 30 days
    #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 30 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 30 days
    #         - [Hash] last_60_days stats for this user in the last 60 days
    #             - [Integer] sent the number of emails sent for this user in the last 60 days
    #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 60 days
    #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 60 days
    #             - [Integer] rejects the number of emails rejected for sending this user in the last 60 days
    #             - [Integer] complaints the number of spam complaints for this user in the last 60 days
    #             - [Integer] unsubs the number of unsubscribes for this user in the last 60 days
    #             - [Integer] opens the number of times emails have been opened for this user in the last 60 days
    #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 60 days
    #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 60 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 60 days
    #         - [Hash] last_90_days stats for this user in the last 90 days
    #             - [Integer] sent the number of emails sent for this user in the last 90 days
    #             - [Integer] hard_bounces the number of emails hard bounced for this user in the last 90 days
    #             - [Integer] soft_bounces the number of emails soft bounced for this user in the last 90 days
    #             - [Integer] rejects the number of emails rejected for sending this user in the last 90 days
    #             - [Integer] complaints the number of spam complaints for this user in the last 90 days
    #             - [Integer] unsubs the number of unsubscribes for this user in the last 90 days
    #             - [Integer] opens the number of times emails have been opened for this user in the last 90 days
    #             - [Integer] unique_opens the number of unique opens for emails sent for this user in the last 90 days
    #             - [Integer] clicks the number of URLs that have been clicked for this user in the last 90 days
    #             - [Integer] unique_clicks the number of unique clicks for emails sent for this user in the last 90 days
    #         - [Hash] all_time stats for the lifetime of the user's account
    #             - [Integer] sent the number of emails sent in the lifetime of the user's account
    #             - [Integer] hard_bounces the number of emails hard bounced in the lifetime of the user's account
    #             - [Integer] soft_bounces the number of emails soft bounced in the lifetime of the user's account
    #             - [Integer] rejects the number of emails rejected for sending this user so far today
    #             - [Integer] complaints the number of spam complaints in the lifetime of the user's account
    #             - [Integer] unsubs the number of unsubscribes in the lifetime of the user's account
    #             - [Integer] opens the number of times emails have been opened in the lifetime of the user's account
    #             - [Integer] unique_opens the number of unique opens for emails sent in the lifetime of the user's account
    #             - [Integer] clicks the number of URLs that have been clicked in the lifetime of the user's account
    #             - [Integer] unique_clicks the number of unique clicks for emails sent in the lifetime of the user's account
    def info()
      _params = {}
      return @master.call 'users/info', _params
    end

    # Validate an API key and respond to a ping (anal JSON parser version)
    # @return [Hash] a struct with one key "PING" with a static value "PONG!"
    def ping()
      _params = {}
      return @master.call 'users/ping2', _params
    end

    # Return the senders that have tried to use this account, both verified and unverified
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
    def senders()
      _params = {}
      return @master.call 'users/senders', _params
    end

  end
end
