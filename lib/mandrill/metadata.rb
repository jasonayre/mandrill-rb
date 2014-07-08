module Mandrill
  class Metadata
    attr_accessor :master

    def initialize(master)
      @master = master
    end

    # Get the list of custom metadata fields indexed for the account.
    # @return [Array] the custom metadata fields for the account
    #     - [Hash] return[] the individual custom metadata field info
    #         - [String] name the unique identifier of the metadata field to update
    #         - [String] state the current state of the metadata field, one of "active", "delete", or "index"
    #         - [String] view_template Mustache template to control how the metadata is rendered in your activity log
    def list()
      _params = {}
      return @master.call 'metadata/list', _params
    end

    # Add a new custom metadata field to be indexed for the account.
    # @param [String] name a unique identifier for the metadata field
    # @param [String] view_template optional Mustache template to control how the metadata is rendered in your activity log
    # @return [Hash] the information saved about the new metadata field
    #     - [String] name the unique identifier of the metadata field to update
    #     - [String] state the current state of the metadata field, one of "active", "delete", or "index"
    #     - [String] view_template Mustache template to control how the metadata is rendered in your activity log
    def add(name, view_template=nil)
      _params = {:name => name, :view_template => view_template}
      return @master.call 'metadata/add', _params
    end

    # Update an existing custom metadata field.
    # @param [String] name the unique identifier of the metadata field to update
    # @param [String] view_template optional Mustache template to control how the metadata is rendered in your activity log
    # @return [Hash] the information for the updated metadata field
    #     - [String] name the unique identifier of the metadata field to update
    #     - [String] state the current state of the metadata field, one of "active", "delete", or "index"
    #     - [String] view_template Mustache template to control how the metadata is rendered in your activity log
    def update(name, view_template)
      _params = {:name => name, :view_template => view_template}
      return @master.call 'metadata/update', _params
    end

    # Delete an existing custom metadata field. Deletion isn't instataneous, and /metadata/list will continue to return the field until the asynchronous deletion process is complete.
    # @param [String] name the unique identifier of the metadata field to update
    # @return [Hash] the information for the deleted metadata field
    #     - [String] name the unique identifier of the metadata field to update
    #     - [String] state the current state of the metadata field, one of "active", "delete", or "index"
    #     - [String] view_template Mustache template to control how the metadata is rendered in your activity log
    def delete(name)
      _params = {:name => name}
      return @master.call 'metadata/delete', _params
    end
  end
end
