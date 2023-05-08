require 'selenium-webdriver'
require_relative 'login'

driver = Selenium::WebDriver.for :chrome

describe 'Inventory' do
    before(:all) do
      @driver = Selenium::WebDriver.for :chrome
      @wait = Selenium::WebDriver::Wait.new(timeout: 10)
      login(@driver) # panggil method login dari file login.rb
    end
  
    after(:all) do
      @driver.quit
    end

    it 'should be able to access inventory page' do

        # klik button dengan class navbar-minimalize (kode error)
        # navbar_button = @wait.until { @driver.find_element(class: "navbar-minimalize") }
        # navbar_button.click
    
        # klik menu barang dengan class metismenu-link
        barang_menu = @wait.until { @driver.find_element(class: "metismenu-link", text: "Barang") }
        barang_menu.click

        persediaan_menu = @wait.until { @driver.find_element(class: "metismenu-link", text: "Persediaan") }
        persediaan_menu.click

        @driver.navigate.to "https://app.jubelio.com/home/inventory/"
        sleep 5

        wait = Selenium::WebDriver::Wait.new(timeout: 5)
        button_element = wait.until { @driver.find_element(:xpath, "//button[contains(@class, 'ladda-button')]//span[contains(text(), 'Penyesuaian Persediaan')]") }
        button_element.click        
      end
    end


