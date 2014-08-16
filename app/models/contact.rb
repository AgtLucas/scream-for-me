class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha => true

  # Declare the email headers
  def headers
    {
      :subject => "Contact form, whatever...",
      :to => "lucas.silva@catolicasc.org.br",
      :from => %("#{name}" <#{email}>)
    }
  end
end