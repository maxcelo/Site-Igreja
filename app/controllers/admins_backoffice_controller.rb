class AdminsBackofficeController < ApplicationController
  before_action :authenticate_user!
  layout 'layout_admin'
end
