module Mandrill
  class Exports
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Returns information about an export job. If the export job's state is 'complete', the returned data will include a URL you can use to fetch the results. Every export job produces a zip archive, but the format of the archive is distinct for each job type. The api calls that initiate exports include more details about the output format for that job type.
    # @param [String] id an export job identifier
    # @return [Hash] the information about the export
    #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
    #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] type the type of the export job - activity, reject, or whitelist
    #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] state the export job's state - waiting, working, complete, error, or expired.
    #     - [String] result_url the url for the export job's results, if the job is completed.
    def info(id)
      _params = {:id => id}
      return @master.call 'exports/info', _params
    end

    # Returns a list of your exports.
    # @return [Array] the account's exports
    #     - [Hash] return[] the individual export info
    #         - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
    #         - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] type the type of the export job - activity, reject, or whitelist
    #         - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] state the export job's state - waiting, working, complete, error, or expired.
    #         - [String] result_url the url for the export job's results, if the job is completed.
    def list()
      _params = {}
      return @master.call 'exports/list', _params
    end

    # Begins an export of your rejection blacklist. The blacklist will be exported to a zip archive containing a single file named rejects.csv that includes the following fields: email, reason, detail, created_at, expires_at, last_event_at, expires_at.
    # @param [String] notify_email an optional email address to notify when the export job has finished.
    # @return [Hash] information about the rejects export job that was started
    #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
    #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] type the type of the export job
    #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format, or null for jobs that have not run
    #     - [String] state the export job's state
    #     - [String] result_url the url for the export job's results, if the job is complete
    def rejects(notify_email=nil)
      _params = {:notify_email => notify_email}
      return @master.call 'exports/rejects', _params
    end

    # Begins an export of your rejection whitelist. The whitelist will be exported to a zip archive containing a single file named whitelist.csv that includes the following fields: email, detail, created_at.
    # @param [String] notify_email an optional email address to notify when the export job has finished.
    # @return [Hash] information about the whitelist export job that was started
    #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
    #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] type the type of the export job
    #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format, or null for jobs that have not run
    #     - [String] state the export job's state
    #     - [String] result_url the url for the export job's results, if the job is complete
    def whitelist(notify_email=nil)
      _params = {:notify_email => notify_email}
      return @master.call 'exports/whitelist', _params
    end

    # Begins an export of your activity history. The activity will be exported to a zip archive containing a single file named activity.csv in the same format as you would be able to export from your account's activity view. It includes the following fields: Date, Email Address, Sender, Subject, Status, Tags, Opens, Clicks, Bounce Detail. If you have configured any custom metadata fields, they will be included in the exported data.
    # @param [String] notify_email an optional email address to notify when the export job has finished
    # @param [String] date_from start date as a UTC string in YYYY-MM-DD HH:MM:SS format
    # @param [String] date_to end date as a UTC string in YYYY-MM-DD HH:MM:SS format
    # @param [Array] tags an array of tag names to narrow the export to; will match messages that contain ANY of the tags
    #     - [String] tags[] a tag name
    # @param [Array] senders an array of senders to narrow the export to
    #     - [String] senders[] a sender address
    # @param [Array] states an array of states to narrow the export to; messages with ANY of the states will be included
    #     - [String] states[] a message state
    # @param [Array] api_keys an array of api keys to narrow the export to; messsagse sent with ANY of the keys will be included
    #     - [String] api_keys[] an API key associated with your account
    # @return [Hash] information about the activity export job that was started
    #     - [String] id the unique identifier for this Export. Use this identifier when checking the export job's status
    #     - [String] created_at the date and time that the export job was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] type the type of the export job
    #     - [String] finished_at the date and time that the export job was finished as a UTC string in YYYY-MM-DD HH:MM:SS format, or null for jobs that have not run
    #     - [String] state the export job's state
    #     - [String] result_url the url for the export job's results, if the job is complete
    def activity(notify_email=nil, date_from=nil, date_to=nil, tags=nil, senders=nil, states=nil, api_keys=nil)
      _params = {:notify_email => notify_email, :date_from => date_from, :date_to => date_to, :tags => tags, :senders => senders, :states => states, :api_keys => api_keys}
      return @master.call 'exports/activity', _params
    end
  end
end
