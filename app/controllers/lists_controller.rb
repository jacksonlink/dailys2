class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user! ,except[:index]
  before_action :authenticate_user!

  # GET /lists
  # GET /lists.json
  def index
    #@lists = List.all

    # Validate the user role: if developer then filter only lists created by himself
    #                         else filter all lists created by users who belongs to his team
    if current_user.role == "developer"
      
      @lists = List.where(user_id: current_user.id).order('id DESC')
      #@user = User.where(id: @lists.first.user_id).take
      #@team = Team.where(id: @user.team_id).take
    
    else
    
      #@lists = List.all
      
      @users = User.where(team_id: current_user.team.id).all
      
      @users.each do |user|
         @lists = List.where(user_id: User.where(team_id: current_user.team.id).all)
      end
      
      @lists.each do |list|
        @users_mail = User.where(id: list.user_id).take.email
      end
      
      @team = Team.where(id: current_user.team.id).take

    end

  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:today, :yesterday, :impediment, :user_id)
    end
end
