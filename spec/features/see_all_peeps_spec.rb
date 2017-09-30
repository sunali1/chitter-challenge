feature "I can see what others are saying in reverse order" do
before(:each) do
  Peep.create(peep: "My peep", created_at: "27 Sep 17 18.00")
  Peep.create(peep: "Hurrah", created_at: "23 Sep 17 17.00")
  Peep.create(peep: "Yipee", created_at: "4 Jan 17 08.00")
end
  scenario "see all peeps" do
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect("My peep").to appear_before("Hurrah")
    expect("Hurrah").to appear_before("Yipee")
  end
end
