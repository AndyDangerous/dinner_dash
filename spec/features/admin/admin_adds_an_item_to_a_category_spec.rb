require_relative '../feature_spec_helper'

describe 'admin', type: :feature do
  xit 'adds a category to an item' do
    item = Item.create(title: "hi", description: "mom", price: 10)
    category = Category.new(name: "Dinner")
    item.categories.create(name: "Lunch")

    visit '/admin_dashboard'
    click_link 'View Menu Items'
    first(:link, "View Item").click

    expect(page).to have_content "Lunch"
    click_link 'Add Category'
    expect(current_url).to eq "http://www.example.com/admin/items/1/add_category"
    click_link 'Dinner'
    expect(current_url).to eq "http://www.example.com/admin/items/1"
    expect(page).to have_content "Dinner"
  end
end