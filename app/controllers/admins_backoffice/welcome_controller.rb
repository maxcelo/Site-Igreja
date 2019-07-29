class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @users = User.all
    authorize @users
  end
end
