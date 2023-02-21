if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {program: @program, review: Review.new})
  json.inserted_item render(partial: "programs/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {program: @program, review: @review})
end
