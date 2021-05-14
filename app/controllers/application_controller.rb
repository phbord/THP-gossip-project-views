class ApplicationController < ActionController::Base
    include SessionsHelper
    include UserHelper
    include LikesHelper

    add_flash_types :info, :error, :warning
end
