module Mandrill
  class Subaccounts
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Get the list of subaccounts defined for the account, optionally filtered by a prefix
    # @param [String] q an optional prefix to filter the subaccounts' ids and names
    # @return [Array] the subaccounts for the account, up to a maximum of 1,000
    #     - [Hash] return[] the individual subaccount info
    #         - [String] id a unique indentifier for the subaccount
    #         - [String] name an optional display name for the subaccount
    #         - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
    #         - [String] status the current sending status of the subaccount, one of "active" or "paused"
    #         - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
    #         - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
    #         - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
    #         - [Integer] sent_total the number of emails the subaccount has sent since it was created
    def list(q=nil)
      _params = {:q => q}
      return @master.call 'subaccounts/list', _params
    end

    # Add a new subaccount
    # @param [String] id a unique identifier for the subaccount to be used in sending calls
    # @param [String] name an optional display name to further identify the subaccount
    # @param [String] notes optional extra text to associate with the subaccount
    # @param [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, Mandrill will manage this based on reputation
    # @return [Hash] the information saved about the new subaccount
    #     - [String] id a unique indentifier for the subaccount
    #     - [String] name an optional display name for the subaccount
    #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
    #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
    #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
    #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
    #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
    #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
    def add(id, name=nil, notes=nil, custom_quota=nil)
      _params = {:id => id, :name => name, :notes => notes, :custom_quota => custom_quota}
      return @master.call 'subaccounts/add', _params
    end

    # Given the ID of an existing subaccount, return the data about it
    # @param [String] id the unique identifier of the subaccount to query
    # @return [Hash] the information about the subaccount
    #     - [String] id a unique indentifier for the subaccount
    #     - [String] name an optional display name for the subaccount
    #     - [String] notes optional extra text to associate with the subaccount
    #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
    #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
    #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
    #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
    #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
    #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
    #     - [Integer] sent_hourly the number of emails the subaccount has sent in the last hour
    #     - [Integer] hourly_quota the current hourly quota for the subaccount, either manual or reputation-based
    #     - [Hash] last_30_days stats for this subaccount in the last 30 days
    #         - [Integer] sent the number of emails sent for this subaccount in the last 30 days
    #         - [Integer] hard_bounces the number of emails hard bounced for this subaccount in the last 30 days
    #         - [Integer] soft_bounces the number of emails soft bounced for this subaccount in the last 30 days
    #         - [Integer] rejects the number of emails rejected for sending this subaccount in the last 30 days
    #         - [Integer] complaints the number of spam complaints for this subaccount in the last 30 days
    #         - [Integer] unsubs the number of unsbuscribes for this subaccount in the last 30 days
    #         - [Integer] opens the number of times emails have been opened for this subaccount in the last 30 days
    #         - [Integer] unique_opens the number of unique opens for emails sent for this subaccount in the last 30 days
    #         - [Integer] clicks the number of URLs that have been clicked for this subaccount in the last 30 days
    #         - [Integer] unique_clicks the number of unique clicks for emails sent for this subaccount in the last 30 days
    def info(id)
      _params = {:id => id}
      return @master.call 'subaccounts/info', _params
    end

    # Update an existing subaccount
    # @param [String] id the unique identifier of the subaccount to update
    # @param [String] name an optional display name to further identify the subaccount
    # @param [String] notes optional extra text to associate with the subaccount
    # @param [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, Mandrill will manage this based on reputation
    # @return [Hash] the information for the updated subaccount
    #     - [String] id a unique indentifier for the subaccount
    #     - [String] name an optional display name for the subaccount
    #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
    #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
    #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
    #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
    #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
    #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
    def update(id, name=nil, notes=nil, custom_quota=nil)
      _params = {:id => id, :name => name, :notes => notes, :custom_quota => custom_quota}
      return @master.call 'subaccounts/update', _params
    end

    # Delete an existing subaccount. Any email related to the subaccount will be saved, but stats will be removed and any future sending calls to this subaccount will fail.
    # @param [String] id the unique identifier of the subaccount to delete
    # @return [Hash] the information for the deleted subaccount
    #     - [String] id a unique indentifier for the subaccount
    #     - [String] name an optional display name for the subaccount
    #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
    #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
    #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
    #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
    #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
    #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
    def delete(id)
      _params = {:id => id}
      return @master.call 'subaccounts/delete', _params
    end

    # Pause a subaccount's sending. Any future emails delivered to this subaccount will be queued for a maximum of 3 days until the subaccount is resumed.
    # @param [String] id the unique identifier of the subaccount to pause
    # @return [Hash] the information for the paused subaccount
    #     - [String] id a unique indentifier for the subaccount
    #     - [String] name an optional display name for the subaccount
    #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
    #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
    #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
    #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
    #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
    #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
    def pause(id)
      _params = {:id => id}
      return @master.call 'subaccounts/pause', _params
    end

    # Resume a paused subaccount's sending
    # @param [String] id the unique identifier of the subaccount to resume
    # @return [Hash] the information for the resumed subaccount
    #     - [String] id a unique indentifier for the subaccount
    #     - [String] name an optional display name for the subaccount
    #     - [Integer] custom_quota an optional manual hourly quota for the subaccount. If not specified, the hourly quota will be managed based on reputation
    #     - [String] status the current sending status of the subaccount, one of "active" or "paused"
    #     - [Integer] reputation the subaccount's current reputation on a scale from 0 to 100
    #     - [String] created_at the date and time that the subaccount was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] first_sent_at the date and time that the subaccount first sent as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [Integer] sent_weekly the number of emails the subaccount has sent so far this week (weeks start on midnight Monday, UTC)
    #     - [Integer] sent_monthly the number of emails the subaccount has sent so far this month (months start on midnight of the 1st, UTC)
    #     - [Integer] sent_total the number of emails the subaccount has sent since it was created
    def resume(id)
      _params = {:id => id}
      return @master.call 'subaccounts/resume', _params
    end

  end
end
