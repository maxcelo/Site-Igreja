class AdminsBackoffice::MembersController < AdminsBackofficeController

  before_action :set_positions_options, only: [:new, :create, :edit, :update]
  before_action :set_churches_options, only: [:new, :create, :edit, :update]
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params_member)
    if @member.save
      redirect_to admins_backoffice_members_path, notice: "Membro cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(params_member)
      redirect_to admins_backoffice_members_path, notice: "Membro atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @member.destroy
      redirect_to admins_backoffice_members_path, notice: "Membro exluído com sucesso!"
    else
      render :index
    end
  end

  private
  
  def params_member
    params_member = params.require(:member).permit(:num_member ,:name, :rg, :date_birth, :sex, 
                                                  :date_baptism, :phone, :position_id, 
                                                  :church_id, addresses_atributes: 
                                                  [:id, :street, :neighborhood, :number, 
                                                  :zip_code, :complement, :city,
                                                  :state])
  end

  def set_member
    @member = Member.find(params[:id])
  end

  def set_positions_options
    @positions_options = Position.all.pluck( :description, :id )
  end
  
  def set_churches_options
    @churches_options = Church.all.pluck( :description, :id )
  end
end
