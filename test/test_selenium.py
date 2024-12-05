from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager

# Optionally, set headless mode
chrome_options = Options()
chrome_options.add_argument("--headless")  # Run in headless mode

# Set up the Chrome WebDriver
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)

# Navigate to your app
driver.get("http://localhost:5001")  # Replace with your Flask app's URL

# Find the link by its full text and click it
link = driver.find_element(By.LINK_TEXT, "Marathon Facts")
link.click()

print(driver.page_source)

# Optionally, you can do something after clicking, like waiting for a page to load
driver.quit()
