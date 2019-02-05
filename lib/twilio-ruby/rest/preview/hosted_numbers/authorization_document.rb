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
      class HostedNumbers < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class AuthorizationDocumentList < ListResource
          ##
          # Initialize the AuthorizationDocumentList
          # @param [Version] version Version that contains the resource
          # @return [AuthorizationDocumentList] AuthorizationDocumentList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/AuthorizationDocuments"
          end

          ##
          # Lists AuthorizationDocumentInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] email Email that this AuthorizationDocument will be sent to for
          #   signing.
          # @param [authorization_document.Status] status Status of an instance resource. It
          #   can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5.
          #   failed. See the section entitled [Status
          #   Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(email: :unset, status: :unset, limit: nil, page_size: nil)
            self.stream(email: email, status: status, limit: limit, page_size: page_size).entries
          end

          ##
          # Streams AuthorizationDocumentInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] email Email that this AuthorizationDocument will be sent to for
          #   signing.
          # @param [authorization_document.Status] status Status of an instance resource. It
          #   can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5.
          #   failed. See the section entitled [Status
          #   Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(email: :unset, status: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(email: email, status: status, page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields AuthorizationDocumentInstance records from the API.
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
          # Retrieve a single page of AuthorizationDocumentInstance records from the API.
          # Request is executed immediately.
          # @param [String] email Email that this AuthorizationDocument will be sent to for
          #   signing.
          # @param [authorization_document.Status] status Status of an instance resource. It
          #   can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5.
          #   failed. See the section entitled [Status
          #   Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of AuthorizationDocumentInstance
          def page(email: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Email' => email,
                'Status' => status,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            AuthorizationDocumentPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of AuthorizationDocumentInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of AuthorizationDocumentInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            AuthorizationDocumentPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of AuthorizationDocumentInstance records from the API.
          # Request is executed immediately.
          # @param [String] hosted_number_order_sids A list of HostedNumberOrder sids that
          #   this AuthorizationDocument will authorize for hosting phone number capabilities
          #   on Twilio's platform.
          # @param [String] address_sid A 34 character string that uniquely identifies the
          #   Address resource that is associated with this AuthorizationDocument.
          # @param [String] email Email that this AuthorizationDocument will be sent to for
          #   signing.
          # @param [String] contact_title The title of the person authorized to sign the
          #   Authorization Document for this phone number.
          # @param [String] contact_phone_number The contact phone number of the person
          #   authorized to sign the Authorization Document.
          # @param [String] cc_emails Email recipients who will be informed when an
          #   Authorization Document has been sent and signed.
          # @return [AuthorizationDocumentInstance] Newly created AuthorizationDocumentInstance
          def create(hosted_number_order_sids: nil, address_sid: nil, email: nil, contact_title: nil, contact_phone_number: nil, cc_emails: :unset)
            data = Twilio::Values.of({
                'HostedNumberOrderSids' => Twilio.serialize_list(hosted_number_order_sids) { |e| e },
                'AddressSid' => address_sid,
                'Email' => email,
                'ContactTitle' => contact_title,
                'ContactPhoneNumber' => contact_phone_number,
                'CcEmails' => Twilio.serialize_list(cc_emails) { |e| e },
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            AuthorizationDocumentInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Preview.HostedNumbers.AuthorizationDocumentList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class AuthorizationDocumentPage < Page
          ##
          # Initialize the AuthorizationDocumentPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [AuthorizationDocumentPage] AuthorizationDocumentPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of AuthorizationDocumentInstance
          # @param [Hash] payload Payload response from the API
          # @return [AuthorizationDocumentInstance] AuthorizationDocumentInstance
          def get_instance(payload)
            AuthorizationDocumentInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Preview.HostedNumbers.AuthorizationDocumentPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class AuthorizationDocumentContext < InstanceContext
          ##
          # Initialize the AuthorizationDocumentContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid A 34 character string that uniquely identifies this
          #   AuthorizationDocument.
          # @return [AuthorizationDocumentContext] AuthorizationDocumentContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/AuthorizationDocuments/#{@solution[:sid]}"

            # Dependents
            @dependent_hosted_number_orders = nil
          end

          ##
          # Fetch a AuthorizationDocumentInstance
          # @return [AuthorizationDocumentInstance] Fetched AuthorizationDocumentInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            AuthorizationDocumentInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the AuthorizationDocumentInstance
          # @param [String] hosted_number_order_sids A list of HostedNumberOrder sids that
          #   this AuthorizationDocument will authorize for hosting phone number capabilities
          #   on Twilio's platform.
          # @param [String] address_sid A 34 character string that uniquely identifies the
          #   Address resource that is associated with this AuthorizationDocument.
          # @param [String] email Email that this AuthorizationDocument will be sent to for
          #   signing.
          # @param [String] cc_emails Email recipients who will be informed when an
          #   Authorization Document has been sent and signed
          # @param [authorization_document.Status] status Status of an instance resource. It
          #   can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5.
          #   failed. See the section entitled [Status
          #   Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
          # @param [String] contact_title The title of the person authorized to sign the
          #   Authorization Document for this phone number.
          # @param [String] contact_phone_number The contact phone number of the person
          #   authorized to sign the Authorization Document.
          # @return [AuthorizationDocumentInstance] Updated AuthorizationDocumentInstance
          def update(hosted_number_order_sids: :unset, address_sid: :unset, email: :unset, cc_emails: :unset, status: :unset, contact_title: :unset, contact_phone_number: :unset)
            data = Twilio::Values.of({
                'HostedNumberOrderSids' => Twilio.serialize_list(hosted_number_order_sids) { |e| e },
                'AddressSid' => address_sid,
                'Email' => email,
                'CcEmails' => Twilio.serialize_list(cc_emails) { |e| e },
                'Status' => status,
                'ContactTitle' => contact_title,
                'ContactPhoneNumber' => contact_phone_number,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            AuthorizationDocumentInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the dependent_hosted_number_orders
          # @return [DependentHostedNumberOrderList]
          # @return [DependentHostedNumberOrderContext]
          def dependent_hosted_number_orders
            unless @dependent_hosted_number_orders
              @dependent_hosted_number_orders = DependentHostedNumberOrderList.new(
                  @version,
                  signing_document_sid: @solution[:sid],
              )
            end

            @dependent_hosted_number_orders
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.HostedNumbers.AuthorizationDocumentContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Preview.HostedNumbers.AuthorizationDocumentContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class AuthorizationDocumentInstance < InstanceResource
          ##
          # Initialize the AuthorizationDocumentInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid A 34 character string that uniquely identifies this
          #   AuthorizationDocument.
          # @return [AuthorizationDocumentInstance] AuthorizationDocumentInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'address_sid' => payload['address_sid'],
                'status' => payload['status'],
                'email' => payload['email'],
                'cc_emails' => payload['cc_emails'],
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
          # @return [AuthorizationDocumentContext] AuthorizationDocumentContext for this AuthorizationDocumentInstance
          def context
            unless @instance_context
              @instance_context = AuthorizationDocumentContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] AuthorizationDocument sid.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] Address sid.
          def address_sid
            @properties['address_sid']
          end

          ##
          # @return [authorization_document.Status] The Status of this AuthorizationDocument.
          def status
            @properties['status']
          end

          ##
          # @return [String] Email.
          def email
            @properties['email']
          end

          ##
          # @return [String] A list of emails.
          def cc_emails
            @properties['cc_emails']
          end

          ##
          # @return [Time] The date this AuthorizationDocument was created.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date this AuthorizationDocument was updated.
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
          # Fetch a AuthorizationDocumentInstance
          # @return [AuthorizationDocumentInstance] Fetched AuthorizationDocumentInstance
          def fetch
            context.fetch
          end

          ##
          # Update the AuthorizationDocumentInstance
          # @param [String] hosted_number_order_sids A list of HostedNumberOrder sids that
          #   this AuthorizationDocument will authorize for hosting phone number capabilities
          #   on Twilio's platform.
          # @param [String] address_sid A 34 character string that uniquely identifies the
          #   Address resource that is associated with this AuthorizationDocument.
          # @param [String] email Email that this AuthorizationDocument will be sent to for
          #   signing.
          # @param [String] cc_emails Email recipients who will be informed when an
          #   Authorization Document has been sent and signed
          # @param [authorization_document.Status] status Status of an instance resource. It
          #   can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5.
          #   failed. See the section entitled [Status
          #   Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
          # @param [String] contact_title The title of the person authorized to sign the
          #   Authorization Document for this phone number.
          # @param [String] contact_phone_number The contact phone number of the person
          #   authorized to sign the Authorization Document.
          # @return [AuthorizationDocumentInstance] Updated AuthorizationDocumentInstance
          def update(hosted_number_order_sids: :unset, address_sid: :unset, email: :unset, cc_emails: :unset, status: :unset, contact_title: :unset, contact_phone_number: :unset)
            context.update(
                hosted_number_order_sids: hosted_number_order_sids,
                address_sid: address_sid,
                email: email,
                cc_emails: cc_emails,
                status: status,
                contact_title: contact_title,
                contact_phone_number: contact_phone_number,
            )
          end

          ##
          # Access the dependent_hosted_number_orders
          # @return [dependent_hosted_number_orders] dependent_hosted_number_orders
          def dependent_hosted_number_orders
            context.dependent_hosted_number_orders
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.HostedNumbers.AuthorizationDocumentInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Preview.HostedNumbers.AuthorizationDocumentInstance #{values}>"
          end
        end
      end
    end
  end
end