class Api::ScoresController < ApplicationController
   def index
    @scores = Score.all
    render 'index.json.jbuilder'
  end  

  def show
    score_id = params[:id]
    @score = Score.find(score_id)
    render 'show.json.jbuilder'
  end
  def create
    @score = Score.new(
                          user_id: params[:user_id],
                          problem_id: params[:problem_id],
                          progress: params[:progress],
                          previous_solution: params[:previous_solution]
                            )

    @score.save
    render 'show.json.jbuilder'
  end


  def update
    score_id = params[:id]
    @score = Score.find(score_id)
    @score.user_id = params[:user_id]
    @score.problem_id = params[:problem_id]
    @score.progress = params[:progress] || @score.progress
    @score.previous_solution = params[:previous_solution] || @score.previous_solution

    @score.save
    render 'show.json.jbuilder'
  end

  def destroy
    score_id = params[:id]
    @score = Score.find(score_id)
    @score.destroy
    render json: {message: "score destroyed!"}
  end
end

