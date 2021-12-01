module Mrkt
  module CrudAssetEmails

    def browse_emails(filters={})
      query_params = Mrkt::Faraday::ParamsEncoder.encode(filters)
      get("/rest/asset/v1/emails.json?#{query_params}")
    end

    def get_email_by_id(id = 0)
      get("/rest/asset/v1/email/#{id}.json")
    end

    def get_email_by_name(options={})
      wildcard_default = { name: '%' }
      params = wildcard_default.merge(options)
      qs = Mrkt::Faraday::ParamsEncoder.encode(params)
      get("/rest/asset/v1/email/byName.json?#{qs}")
    end

    def get_email_full_content(id, filters={})
      query_params = Mrkt::Faraday::ParamsEncoder.encode(filters)
      get("/rest/asset/v1/email/#{id}/fullContent.json?#{query_params}")
    end

    def approve_email(id)
      post_json "/rest/asset/v1/email/#{id}/approveDraft.json"
    end

    def unapprove_email(id)
      post_json "/rest/asset/v1/email/#{id}/unapprove.json"
    end

    def send_email_sample(id, options={})
      query_params = Mrkt::Faraday::ParamsEncoder.encode(options)
      post_json("/rest/asset/v1/email/#{id}/sendSample.json?#{query_params}")
    end

  end
end
