require 'selenium-webdriver'

def login(driver)
  driver.get "https://app.jubelio.com/login"

  username_field = driver.find_element(name: "email")
  username_field.send_keys("qa.rakamin.jubelio@gmail.com")

  password_field = driver.find_element(name: "password")
  password_field.send_keys("Jubelio123!")

  wait = Selenium::WebDriver::Wait.new(timeout: 3)
  submit_button = wait.until { driver.find_element(css: "button[type='submit']") }
  submit_button.click
end


