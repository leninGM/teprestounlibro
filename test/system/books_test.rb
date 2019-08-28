require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
    @user = users(:one)
  end

  test "visiting the index" do
    sign_in @user
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "creating a Book" do
    sign_in @user
    visit books_url
    click_on "New Book"

    fill_in "Description", with: @book.description
    fill_in "Name", with: @book.name
    fill_in "Status", with: @book.status
    check "Comedy"
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "can not create a Book with empty params" do
    sign_in @user
    visit books_url
    click_on "New Book"

    fill_in "Description", with: ''
    fill_in "Name", with: ''
    fill_in "Status", with: ''
    click_on "Create Book"

    assert_text "Name can't be blank, Description can't be blank, and Category ids can't be blank"
  end

  test "updating a Book" do
    sign_in @user
    visit books_url
    click_on "Edit", match: :first

    fill_in "Description", with: @book.description
    fill_in "Name", with: @book.name
    fill_in "Status", with: @book.status
    check "Comedy"
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "can not update a Book with empty params" do
    sign_in @user
    visit books_url
    click_on "Edit", match: :first

    fill_in "Description", with: ''
    fill_in "Name", with: ''
    fill_in "Status", with: ''
    click_on "Update Book"

    assert_text "Name can't be blank, Description can't be blank, and Category ids can't be blank"
  end

  test "destroying a Book" do
    sign_in @user
    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
