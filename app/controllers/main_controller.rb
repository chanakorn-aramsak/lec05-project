class MainController < ApplicationController
  def test
    @round = params[:round]
    @name = params[:name]
    @score = params[:score]
  end
  def calculate

    not_fill = false
    @rows = params[:round].to_i
    @message = Array.new(@rows)
    1.upto(@rows) do |i|
      if (params[:subject][:name][i-1].empty? || params[:subject][:score][i-1].empty?)
        not_fill = true
        @message[i-1] = "please fill this"
      end
    end
    # if not fill, rerender the main/test form with error messages
    if (not_fill)
      render 'retest'
      return
    end

    names = params[:subject][:name]
    scores = params[:subject][:score]
    scores = scores.map(&:to_i)
    names.zip(scores).each do |name, score|
      subject = Subject.find_by(name: name)
      if subject
        subject.update(score:score)
      else
        new_subject = Subject.create(name:name, score:score)
        new_subject.save
      end
    end
    max_number = scores.max()
    index_of_max_number = scores.rindex(max_number)
    @subject_of_max = names[index_of_max_number]
    @sum_number = scores.sum
    
  end 

end
