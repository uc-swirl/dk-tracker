class TextQuestionField < SurveyField
  def is_valid? (response)
    {:value => true}
  end
end
