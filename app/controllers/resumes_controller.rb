class UesumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.find(params[:job_id])
    @resumes = Resumes.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resumes = Resumes.new(resumes_params)
    @resumes.job = @job

    if @resumes.save
      flash[:notice] = "成功提交"
      redirect_to job_path(@job)
    else
      render :new
    end
  end


  private
  def resumes_params
    resumes.require(:resumes).permit(:content)
  end
end
