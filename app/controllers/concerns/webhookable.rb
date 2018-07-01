module Webhookable
	extend ActiveSupport::Concern

	def set_header
		# byebug
      response.headers["Content-Type"] = "application/xml"
	end

	def render_twiml(response)
		# byebug
    # render text: response.text
		render xml: response.to_xml
	end

end
