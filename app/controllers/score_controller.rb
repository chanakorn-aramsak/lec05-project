class ScoreController < ApplicationController

  def list
    # @package = Subject.find(params[:id])
    subject = Subject.all
    
    scores = subject.select(:score)
    max_score = Subject.maximum('score')
    @max_of_all_score = Subject.find_by(score: max_score).name
    @sum_of_all_score = scores.sum(:score)
    
    
    
  end
  def delete
      val = params[:subject_name]
      data = Subject.find_by(name:val)
      puts data
      data.destroy
      render 'score/list'
  end
  def edit
      name = params[:subject_name]
      data = Subject.find_by(name:name)
      @n = data.name  
      @s = data.score
  end
  def edited
    new_name = params[:new_name]
    new_score = params[:new_score]
    data = Subject.find_by(name:params[:old_name])
    data.update(name: new_name, score:new_score)
    render 'score/list'
  end

  
end
