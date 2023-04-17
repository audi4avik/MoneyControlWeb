# Custom methods to get browser instances from WDM
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager


def get_chromedriver():
    chromedriver = ChromeDriverManager().install()
    option = webdriver.ChromeOptions()

    # Hiding the chrome automation message
    option.add_argument('disable-infobars')
    option.add_experimental_option('excludeSwitches', 'enable-automation')

    return chromedriver

# noinspection SpellCheckingInspection
def get_edgedriver():
    edgedriver = EdgeChromiumDriverManager().install()
    return edgedriver
