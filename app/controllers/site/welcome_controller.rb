class Site::WelcomeController < SiteController
  def index
    @users = User.all
  end
end
