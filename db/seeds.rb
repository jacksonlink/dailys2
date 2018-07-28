User.create!([
  {email: "admin@responsible", encrypted_password: "$2a$11$.qEpRbh23iZim.CPf5jV6.Nv8WwGzdIvCXPTD6Rekj7UBVFJNm7E2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-07-28 23:27:56", last_sign_in_at: "2018-07-28 23:27:56", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", team_id: 1, role: "responsible"}
])
Team.create!([
  {name: "Team 01", user_id: 1},
  {name: "Team 02", user_id: 2}
])
