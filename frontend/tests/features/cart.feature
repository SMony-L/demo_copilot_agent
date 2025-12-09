Feature: Shopping cart management
  As a customer
  I want to add products to my cart and manage cart contents
  So that I can purchase the items I need

  Scenario: Add a product to the cart
    Given I am viewing the product catalog
    And I see a product "SmartFeeder One"
    When I set the quantity to 2
    And I click "Add to Cart"
    Then the item is added to my cart
    And I see a confirmation message

  Scenario: Cannot add product with zero quantity
    Given I am viewing the product catalog
    And I see a product "SmartFeeder One"
    And the quantity is 0
    Then the "Add to Cart" button is disabled

  Scenario: Increase product quantity
    Given I am viewing the product catalog
    And I see a product "SmartFeeder One"
    And the quantity is 0
    When I click the increase quantity button
    Then the quantity is 1

  Scenario: Decrease product quantity
    Given I am viewing the product catalog
    And I see a product "SmartFeeder One"
    And the quantity is 2
    When I click the decrease quantity button
    Then the quantity is 1

  Scenario: Cannot decrease quantity below zero
    Given I am viewing the product catalog
    And I see a product "SmartFeeder One"
    And the quantity is 0
    When I click the decrease quantity button
    Then the quantity remains 0

  Scenario: Quantity resets after adding to cart
    Given I am viewing the product catalog
    And I see a product "SmartFeeder One"
    And I set the quantity to 3
    When I click "Add to Cart"
    Then the item is added to my cart
    And the quantity for that product resets to 0

  Scenario: Add multiple different products to the cart
    Given I am viewing the product catalog
    And I see a product "SmartFeeder One"
    And I set the quantity to 2
    And I click "Add to Cart"
    When I see a product "CatNap Pod"
    And I set the quantity to 1
    And I click "Add to Cart"
    Then both items are added to my cart

  Scenario: Add to cart button enabled only with valid quantity
    Given I am viewing the product catalog
    And I see a product "SmartFeeder One"
    And the quantity is 0
    Then the "Add to Cart" button is disabled
    When I set the quantity to 1
    Then the "Add to Cart" button is enabled
