class User < ApplicationRecord
    before_save { email.downcase! }
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    # /             :   bắt đầu của regex
    # \A            :   đánh dấu bắt đầu của một chuỗi
    # [\w+\-.]+     :   ít nhất 1 từ (\w) thay thế  [a-zA-Z0-9], cộng với gạch ngang (\-) hoặc chấm
    # @             :   dấu @ trong email
    # [a-z\d\-]+    :   ít nhất 1 từ a-z, một số  bất kỳ (\d), gạch ngang
    # \.            :   dấu chấm
    # +(\.[a-z\d\-]+)*\.[a-z]   :   thêm phần sau như sinhvien.hoasen.edu.vn
    # \z            :   đánh dấu kết thúc của một chuỗi
    # /             :   kết thúc 1 regex

    validates :email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX }, # kiểm tra format email
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
