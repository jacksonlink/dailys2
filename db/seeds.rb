User.create!([
  {email: "u01@gmail.com", encrypted_password: "$2a$11$tJliVcN96lrPMyVqymwotOL0nxm2b0Ty7RdaNj3d0/JgZXt82OqzK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2018-07-25 19:42:16", last_sign_in_at: "2018-07-25 18:53:33", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", team_id: 1},
  {email: "u02@gmail.com", encrypted_password: "$2a$11$F1vDh1usN1Z27tTWLMoF.uMs.eb8xNQUztlw1sR7vGT9nFwf.LtQW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2018-07-25 19:50:18", last_sign_in_at: "2018-07-25 16:13:14", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", team_id: 2}
])
List.create!([
  {today: "Nada", yesterday: "Menos ainda", impediment: false, user_id: 1},
  {today: "nada", yesterday: "nada", impediment: false, user_id: nil}
])
Responsible.create!([
  {name: "Responsavel 01", email: "r01@gmail.com"},
  {name: "Responsavel 02", email: "r02@gmail.com"}
])
Team.create!([
  {name: "Team 01", responsible_id: 1},
  {name: "Team 02", responsible_id: 2}
])
