class CandidatesController < ApplicationController
  before_action :find_candidate,
    only: [:show, :edit, :update, :destroy, :vote]
  
  def index
    @candidates = Candidate.all
  end
  
  def new
    @candidate = Candidate.new
  end

  def vote
    log = Log.new(candidate: @candidate, ip_address: request.remote_ip)
    @candidate.logs << log
    @candidate.save
    redirect_to candidates_path, notice: "done！"
  end
  
  def show
  end 
  
  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    redirect_to candidates_path
  end
  
  def create
      @candidate = Candidate.new(candidate_params)
      if @candidate.save
        redirect_to candidates_path, notice: "建立完成！"
      else
        render 'new'
        #redirect_to new_candidate_path
      end
  end
  
  def destroy
    @candidate.destroy
    redirect_to candidates_path, notice: "deleted！"
  end
  
  def edit
  end
  
  def update
      redirect_to candidates_path, notice: "no data！" if @candidate.nil?
      if @candidate.update(candidate_params)
        redirect_to candidates_path, notice: "修改完成！"
      else
        render 'edit'
      end
  end
  
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "no data！" if @candidate.nil?
  end
  
  
private
  def candidate_params
    params.require("candidate").permit(:name, :party, :age, :politics)
  end
end