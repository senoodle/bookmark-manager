RSpec.feature "Testing infrastructure" do
  scenario 'homepage opening' do
    visit "/"

    expect(page).to have_text("Testing infrastructure working!")
  end
end
