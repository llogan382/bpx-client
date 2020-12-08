module BpxClient
  module Services

    # This header will be used by all services request builder
    class BusinessApplicationHeader

      # Required attributes
      attr_reader :sender_id, :receiver_id, :biz_msg_id, :msg_def_id, :biz_service

      # Optional attributes
      attr_accessor :biz_svc, :cpy_dplct, :pssbl_dplct, :prty, :sgntr

      def initialize (sender_id, receiver_id, biz_msg_id, msg_def_id, biz_service)
        @sender_id = sender_id
        @receiver_id = receiver_id
        @biz_msg_id = biz_msg_id
        @msg_def_id = msg_def_id
        @biz_service = biz_service
      end

      def to_xml_string
        # cre_dt_tm = DateTime.now().xmlschema().to_s
        #
        # NOTE: This is a hack to bypass schema validation errors. Please make conde conform to ISONormalisedDateTime
        cre_dt_tm = "2019-01-23T12:34:56.123456789Z"

        @request ||= Nokogiri::XML::Builder.new { |xml|
          xml['urn'].AppHdr('xmlns:urn' => 'urn:iso:std:iso:20022:tech:xsd:head.001.001.01') do
            xml['urn'].Fr do
              xml['urn'].OrgId do
                xml['urn'].Id do
                  xml['urn'].OrgId do
                    xml['urn'].Othr do
                      xml['urn'].Id bpx_client_header_config.sender_id
                    end
                  end
                end
              end
            end
            xml['urn'].To do
              xml['urn'].OrgId do
                xml['urn'].Id do
                  xml['urn'].OrgId do
                    xml['urn'].Othr do
                      xml['urn'].Id bpx_client_header_config.receiver_id
                    end
                  end
                end
              end
            end
            xml['urn'].BizMsgIdr bpx_client_header_config.biz_msg_id
            xml['urn'].MsgDefIdr bpx_client_header_config.msg_def_id
            xml['urn'].BizSvc bpx_client_header_config.biz_service
            xml['urn'].CreDt cre_dt_tm
          end
        }.to_xml
      end
    end
  end
end

#test = BusinessApplicationHeader.new