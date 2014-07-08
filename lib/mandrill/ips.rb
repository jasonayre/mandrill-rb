module Mandrill
  class Ips
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Lists your dedicated IPs.
    # @return [Array] an array of structs for each dedicated IP
    #     - [Hash] return[] information about a single dedicated IP
    #         - [String] ip the ip address
    #         - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] pool the name of the pool that this dedicated IP belongs to
    #         - [String] domain the domain name (reverse dns) of this dedicated IP
    #         - [Hash] custom_dns information about the ip's custom dns, if it has been configured
    #             - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
    #             - [Boolean] valid whether the ip's custom dns is currently valid
    #             - [String] error if the ip's custom dns is invalid, this will include details about the error
    #         - [Hash] warmup information about the ip's warmup status
    #             - [Boolean] warming_up whether the ip is currently in warmup mode
    #             - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    #             - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    def list()
      _params = {}
      return @master.call 'ips/list', _params
    end

    # Retrieves information about a single dedicated ip.
    # @param [String] ip a dedicated IP address
    # @return [Hash] Information about the dedicated ip
    #     - [String] ip the ip address
    #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] pool the name of the pool that this dedicated IP belongs to
    #     - [String] domain the domain name (reverse dns) of this dedicated IP
    #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
    #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
    #         - [Boolean] valid whether the ip's custom dns is currently valid
    #         - [String] error if the ip's custom dns is invalid, this will include details about the error
    #     - [Hash] warmup information about the ip's warmup status
    #         - [Boolean] warming_up whether the ip is currently in warmup mode
    #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    def info(ip)
      _params = {:ip => ip}
      return @master.call 'ips/info', _params
    end

    # Requests an additional dedicated IP for your account. Accounts may have one outstanding request at any time, and provisioning requests are processed within 24 hours.
    # @param [Boolean] warmup whether to enable warmup mode for the ip
    # @param [String] pool the id of the pool to add the dedicated ip to, or null to use your account's default pool
    # @return [Hash] a description of the provisioning request that was created
    #     - [String] requested_at the date and time that the request was created as a UTC timestamp in YYYY-MM-DD HH:MM:SS format
    def provision(warmup=false, pool=nil)
      _params = {:warmup => warmup, :pool => pool}
      return @master.call 'ips/provision', _params
    end

    # Begins the warmup process for a dedicated IP. During the warmup process, Mandrill will gradually increase the percentage of your mail that is sent over the warming-up IP, over a period of roughly 30 days. The rest of your mail will be sent over shared IPs or other dedicated IPs in the same pool.
    # @param [String] ip a dedicated ip address
    # @return [Hash] Information about the dedicated IP
    #     - [String] ip the ip address
    #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] pool the name of the pool that this dedicated IP belongs to
    #     - [String] domain the domain name (reverse dns) of this dedicated IP
    #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
    #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
    #         - [Boolean] valid whether the ip's custom dns is currently valid
    #         - [String] error if the ip's custom dns is invalid, this will include details about the error
    #     - [Hash] warmup information about the ip's warmup status
    #         - [Boolean] warming_up whether the ip is currently in warmup mode
    #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    def start_warmup(ip)
      _params = {:ip => ip}
      return @master.call 'ips/start-warmup', _params
    end

    # Cancels the warmup process for a dedicated IP.
    # @param [String] ip a dedicated ip address
    # @return [Hash] Information about the dedicated IP
    #     - [String] ip the ip address
    #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] pool the name of the pool that this dedicated IP belongs to
    #     - [String] domain the domain name (reverse dns) of this dedicated IP
    #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
    #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
    #         - [Boolean] valid whether the ip's custom dns is currently valid
    #         - [String] error if the ip's custom dns is invalid, this will include details about the error
    #     - [Hash] warmup information about the ip's warmup status
    #         - [Boolean] warming_up whether the ip is currently in warmup mode
    #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    def cancel_warmup(ip)
      _params = {:ip => ip}
      return @master.call 'ips/cancel-warmup', _params
    end

    # Moves a dedicated IP to a different pool.
    # @param [String] ip a dedicated ip address
    # @param [String] pool the name of the new pool to add the dedicated ip to
    # @param [Boolean] create_pool whether to create the pool if it does not exist; if false and the pool does not exist, an Unknown_Pool will be thrown.
    # @return [Hash] Information about the updated state of the dedicated IP
    #     - [String] ip the ip address
    #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] pool the name of the pool that this dedicated IP belongs to
    #     - [String] domain the domain name (reverse dns) of this dedicated IP
    #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
    #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
    #         - [Boolean] valid whether the ip's custom dns is currently valid
    #         - [String] error if the ip's custom dns is invalid, this will include details about the error
    #     - [Hash] warmup information about the ip's warmup status
    #         - [Boolean] warming_up whether the ip is currently in warmup mode
    #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    def set_pool(ip, pool, create_pool=false)
      _params = {:ip => ip, :pool => pool, :create_pool => create_pool}
      return @master.call 'ips/set-pool', _params
    end

    # Deletes a dedicated IP. This is permanent and cannot be undone.
    # @param [String] ip the dedicated ip to remove from your account
    # @return [Hash] a description of the ip that was removed from your account.
    #     - [String] ip the ip address
    #     - [String] deleted a boolean indicating whether the ip was successfully deleted
    def delete(ip)
      _params = {:ip => ip}
      return @master.call 'ips/delete', _params
    end

    # Lists your dedicated IP pools.
    # @return [Array] the dedicated IP pools for your account, up to a maximum of 1,000
    #     - [Hash] return[] information about each dedicated IP pool
    #         - [String] name this pool's name
    #         - [String] created_at the date and time that this pool was created as a UTC timestamp in YYYY-MM-DD HH:MM:SS format
    #         - [Array] ips the dedicated IPs in this pool
    #             - [Hash] ips[] information about each dedicated IP
    #                 - [String] ip the ip address
    #                 - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #                 - [String] pool the name of the pool that this dedicated IP belongs to
    #                 - [String] domain the domain name (reverse dns) of this dedicated IP
    #                 - [Hash] custom_dns information about the ip's custom dns, if it has been configured
    #                     - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
    #                     - [Boolean] valid whether the ip's custom dns is currently valid
    #                     - [String] error if the ip's custom dns is invalid, this will include details about the error
    #                 - [Hash] warmup information about the ip's warmup status
    #                     - [Boolean] warming_up whether the ip is currently in warmup mode
    #                     - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    #                     - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    def list_pools()
      _params = {}
      return @master.call 'ips/list-pools', _params
    end

    # Describes a single dedicated IP pool.
    # @param [String] pool a pool name
    # @return [Hash] Information about the dedicated ip pool
    #     - [String] name this pool's name
    #     - [String] created_at the date and time that this pool was created as a UTC timestamp in YYYY-MM-DD HH:MM:SS format
    #     - [Array] ips the dedicated IPs in this pool
    #         - [Hash] ips[] information about each dedicated IP
    #             - [String] ip the ip address
    #             - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #             - [String] pool the name of the pool that this dedicated IP belongs to
    #             - [String] domain the domain name (reverse dns) of this dedicated IP
    #             - [Hash] custom_dns information about the ip's custom dns, if it has been configured
    #                 - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
    #                 - [Boolean] valid whether the ip's custom dns is currently valid
    #                 - [String] error if the ip's custom dns is invalid, this will include details about the error
    #             - [Hash] warmup information about the ip's warmup status
    #                 - [Boolean] warming_up whether the ip is currently in warmup mode
    #                 - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    #                 - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    def pool_info(pool)
      _params = {:pool => pool}
      return @master.call 'ips/pool-info', _params
    end

    # Creates a pool and returns it. If a pool already exists with this name, no action will be performed.
    # @param [String] pool the name of a pool to create
    # @return [Hash] Information about the dedicated ip pool
    #     - [String] name this pool's name
    #     - [String] created_at the date and time that this pool was created as a UTC timestamp in YYYY-MM-DD HH:MM:SS format
    #     - [Array] ips the dedicated IPs in this pool
    #         - [Hash] ips[] information about each dedicated IP
    #             - [String] ip the ip address
    #             - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #             - [String] pool the name of the pool that this dedicated IP belongs to
    #             - [String] domain the domain name (reverse dns) of this dedicated IP
    #             - [Hash] custom_dns information about the ip's custom dns, if it has been configured
    #                 - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
    #                 - [Boolean] valid whether the ip's custom dns is currently valid
    #                 - [String] error if the ip's custom dns is invalid, this will include details about the error
    #             - [Hash] warmup information about the ip's warmup status
    #                 - [Boolean] warming_up whether the ip is currently in warmup mode
    #                 - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    #                 - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    def create_pool(pool)
      _params = {:pool => pool}
      return @master.call 'ips/create-pool', _params
    end

    # Deletes a pool. A pool must be empty before you can delete it, and you cannot delete your default pool.
    # @param [String] pool the name of the pool to delete
    # @return [Hash] information about the status of the pool that was deleted
    #     - [String] pool the name of the pool
    #     - [Boolean] deleted whether the pool was deleted
    def delete_pool(pool)
      _params = {:pool => pool}
      return @master.call 'ips/delete-pool', _params
    end

    # Tests whether a domain name is valid for use as the custom reverse DNS for a dedicated IP.
    # @param [String] ip a dedicated ip address
    # @param [String] domain the domain name to test
    # @return [Hash] validation results for the domain
    #     - [String] valid whether the domain name has a correctly-configured A record pointing to the ip address
    #     - [String] error if valid is false, this will contain details about why the domain's A record is incorrect
    def check_custom_dns(ip, domain)
      _params = {:ip => ip, :domain => domain}
      return @master.call 'ips/check-custom-dns', _params
    end

    # Configures the custom DNS name for a dedicated IP.
    # @param [String] ip a dedicated ip address
    # @param [String] domain a domain name to set as the dedicated IP's custom dns name.
    # @return [Hash] information about the dedicated IP's new configuration
    #     - [String] ip the ip address
    #     - [String] created_at the date and time that the dedicated IP was created as a UTC string in YYYY-MM-DD HH:MM:SS format
    #     - [String] pool the name of the pool that this dedicated IP belongs to
    #     - [String] domain the domain name (reverse dns) of this dedicated IP
    #     - [Hash] custom_dns information about the ip's custom dns, if it has been configured
    #         - [Boolean] enabled a boolean indicating whether custom dns has been configured for this ip
    #         - [Boolean] valid whether the ip's custom dns is currently valid
    #         - [String] error if the ip's custom dns is invalid, this will include details about the error
    #     - [Hash] warmup information about the ip's warmup status
    #         - [Boolean] warming_up whether the ip is currently in warmup mode
    #         - [String] start_at the start time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    #         - [String] end_at the end date and time for the warmup process as a UTC string in YYYY-MM-DD HH:MM:SS format
    def set_custom_dns(ip, domain)
      _params = {:ip => ip, :domain => domain}
      return @master.call 'ips/set-custom-dns', _params
    end

  end
end
