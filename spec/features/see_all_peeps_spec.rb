feature "I can see what others are saying in reverse chronological order" do
scenario "see all peeps in reverse order" do

  visit '/peeps'
  expect(page.status_code).to eq 200
  Peep.create(peep: "My peep")
  Peep.create(peep: "Yay")
  Peep.create(peep: "Whoopee")

    expect("Whoopee").to appear_before "Yay"
    expect("Yay").to appear_before "My peep"
    expect("My peep").to_not appear_before("Whoopee")
    expect("Yay").to_not appear_before("Whoopee")
  end
end
