require 'rails_helper'

RSpec.describe Item, :type => :model do
  let(:item) { create :item }

  describe "with valid params" do
    it 'is valid' do
      expect(item).to be_valid
    end

    # Same issues as email for dealing with testing uniqueness
    xit 'has a unique name' do
      item2 = create :item
      expect(item2).to_not be_valid
    end

    it 'has categories' do
      expect(item.categories).to eq([])
    end

    it 'has an order' do
      expect(item).to respond_to(:orders)
    end

    it 'adds a category to an item' do
      category = create :category
      item.add_category(category)
      assert item.categories.include? category
    end

    it 'removes a category from an item' do
      category = create :category
      item.add_category(category)
      item.remove_category(category)
      refute item.categories.include? category
    end
  end

  describe "without valid params" do
    it 'is not valid without name' do
      item.title = nil
      expect(item).to_not be_valid
    end

    it 'is not valid without description' do
      item.description = nil
      expect(item).to_not be_valid
    end

    it 'is not valid without price' do
      item.price = nil
      expect(item).to_not be_valid
    end

    it 'has many orders' do
      order1 = create :order
      order2 = create :order

      order1.items << item
      order2.items << item

      assert order1.items.include?(item)
      assert order2.items.include?(item)
    end
  end
end
