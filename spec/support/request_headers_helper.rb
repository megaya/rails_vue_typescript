# https://ver-1-0.net/2019/10/06/request-spec-set-header-every-request
module RequestHeadersHelper
  %i[get post patch put delete head].each do |name|
    define_method(name) do |path, params: {}, headers: {}|
      super(path, params: params&.to_json, headers: respond_to?(:default_request_headers) ? default_request_headers&.merge(headers) : headers)
    end
  end
end