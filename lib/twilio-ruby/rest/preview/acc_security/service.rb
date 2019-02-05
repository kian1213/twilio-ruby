##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class AccSecurity < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Services"
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] name A 1-64 character string with friendly name of service
          # @param [String] code_length The length of the verification code to be generated.
          #   Must be an integer value between 4-10
          # @return [ServiceInstance] Newly created ServiceInstance
          def create(name: nil, code_length: :unset)
            data = Twilio::Values.of({'Name' => name, 'CodeLength' => code_length, })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            ServiceInstance.new(@version, payload, )
          end

          ##
          # Lists ServiceInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams ServiceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields ServiceInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ServiceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Preview.AccSecurity.ServiceList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            ServiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Preview.AccSecurity.ServicePage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The unique SID identifier of Verification Service Instance.
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Services/#{@solution[:sid]}"

            # Dependents
            @verifications = nil
            @verification_checks = nil
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the ServiceInstance
          # @param [String] name A 1-64 character string with friendly name of service
          # @param [String] code_length The length of the verification code to be generated.
          #   Must be an integer value between 4-10
          # @return [ServiceInstance] Updated ServiceInstance
          def update(name: :unset, code_length: :unset)
            data = Twilio::Values.of({'Name' => name, 'CodeLength' => code_length, })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the verifications
          # @return [VerificationList]
          # @return [VerificationContext]
          def verifications
            unless @verifications
              @verifications = VerificationList.new(@version, service_sid: @solution[:sid], )
            end

            @verifications
          end

          ##
          # Access the verification_checks
          # @return [VerificationCheckList]
          # @return [VerificationCheckContext]
          def verification_checks
            unless @verification_checks
              @verification_checks = VerificationCheckList.new(@version, service_sid: @solution[:sid], )
            end

            @verification_checks
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.AccSecurity.ServiceContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.AccSecurity.ServiceContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The unique SID identifier of Verification Service Instance.
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'name' => payload['name'],
                'code_length' => payload['code_length'].to_i,
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] A string that uniquely identifies this Service.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] Account Sid.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] Friendly name of the service
          def name
            @properties['name']
          end

          ##
          # @return [String] Length of verification code. Valid values are 4-10
          def code_length
            @properties['code_length']
          end

          ##
          # @return [Time] The date this Service was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date this Service was updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Update the ServiceInstance
          # @param [String] name A 1-64 character string with friendly name of service
          # @param [String] code_length The length of the verification code to be generated.
          #   Must be an integer value between 4-10
          # @return [ServiceInstance] Updated ServiceInstance
          def update(name: :unset, code_length: :unset)
            context.update(name: name, code_length: code_length, )
          end

          ##
          # Access the verifications
          # @return [verifications] verifications
          def verifications
            context.verifications
          end

          ##
          # Access the verification_checks
          # @return [verification_checks] verification_checks
          def verification_checks
            context.verification_checks
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.AccSecurity.ServiceInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.AccSecurity.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end