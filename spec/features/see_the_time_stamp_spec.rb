feature "See the time peep was made" do
  scenario "see the time of the peep" do
  visit '/peeps'
  expect(page.status_code).to eq 200
  Peep.create(peep: "My peep")
  Peep.create(peep: "Yay")
  Peep.create(peep: "Whoopee")
    expect(page).to have_content(Peep.peep.created_at)
  end
end
