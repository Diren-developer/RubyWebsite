class ContactMailer < ApplicationMailer
  default from: 'S3327365@student.rmit.edu.au'
 
  def feedback_email
    @feedback = params[:feedback]
    delivery_options = { user_name: 'S3327365@student.rmit.edu.au',
                        password: 'Newrmit29*',
                        address: 'smtp.office365.com',
                        port: 587,
                        authentication: 'login',
                        enable_starttls_auto: true }
    mail(to: 'S3327365@student.rmit.edu.au', subject: 'Your Course Feedback', body: params[:feedback], content_type: "text/html", delivery_method_options: delivery_options)
  end
end
