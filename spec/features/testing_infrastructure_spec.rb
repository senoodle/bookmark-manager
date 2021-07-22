feature "Testing infrastructure" do
  scenario 'homepage' do
    visit "/"

    expect(page).to have_text("Hello World!")
  end
end
