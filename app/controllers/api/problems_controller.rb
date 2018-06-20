class Api::ProblemsController < ApplicationController
   # before_action :authenticate_admin, only:[:create, :update, :destroy]
  def index
    @problems = Problem.all
    render 'index.json.jbuilder'
  end  

  def show
    problem_id = params[:id]
    @problem = Problem.find(problem_id)
    render 'show.json.jbuilder'
  end

  def create
    @problem = Problem.new(
                          prompt: params[:prompt],
                          solution_tests: params[:solution_tests]
                            )

    @problem.save
    render 'show.json.jbuilder'
  end

  def update
    problem_id = params[:id]
    @problem = Problem.find(problem_id)
    @problem.prompt = params[:prompt] || @problem.prompt
    @problem.solution_tests = params[:solution_tests] || @problem.solution_tests

    @problem.save
    render 'show.json.jbuilder'
  end

  def destroy
    problem_id = params[:id]
    @problem = Problem.find(problem_id)
    @problem.destroy
    render json: {message: "Problem destroyed!"}
  end
end

