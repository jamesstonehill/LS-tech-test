class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   validate :password_complexity

   def password_complexity
     if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*(_|[^\w])).+$/)
       errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one character"
     end
   end
end
