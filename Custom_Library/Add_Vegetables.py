from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
import string


@library
class Add_Vegetables:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
        self.selcol = BuiltIn().get_library_instance("Collections")

    @keyword
    def add_veggies(self):
        print("Veggies")

    @keyword
    def add_req_veggies(self, *productslist):
        elements = self.selLib.get_webelements("xpath://div[@class='products']/div/h4")
        for element in elements:
            text_veg = element.text
            split_text = text_veg.split("-")
            trimmed = split_text[0].strip()
            if trimmed in productslist:
                index = elements.index(element)
                true_index = index + 1
                self.selLib.click_element("(//div[@class='product-action']/button)["+str(true_index)+"]")

    @keyword
    def checkout_and_validate_add_veggies(self,*productlist):
        Cart_Veggies = []
        self.selLib.click_element("css:.cart-icon")
        self.selLib.wait_until_element_is_visible("css:.action-block button")
        self.selLib.click_element("css:.action-block button")
        self.selLib.wait_until_page_contains("Total Amount")
        added_veggies = self.selLib.get_webelements("xpath://tbody/tr/td[2]/p")
        for veggie in added_veggies:
            text_veg = veggie.text
            split_text = text_veg.split("-")
            trimmed = split_text[0].strip()
            Cart_Veggies.append(trimmed)
        for products in productlist:
            self.selcol.list_should_contain_value(Cart_Veggies, products)






