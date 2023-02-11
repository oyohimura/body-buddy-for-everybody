if @lesson.persisted?
  json.form render(partial: "lessons/form", formats: :html, locals: {program: @program, lesson: Lesson.new})
  json.inserted_item render(partial: "programs/lesson", formats: :html, locals: {lesson: @lesson})
else
  json.form render(partial: "lessons/form", formats: :html, locals: {program: @program, lesson: @lesson})
end
