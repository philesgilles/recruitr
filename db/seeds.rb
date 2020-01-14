skill_list = [
  [ "Frontend engineer", 0 ],
  [ "Backend engineer", 0 ],
  [ "Ruby", 1 ],
  [ "NodeJS", 1 ],
  [ "Team leader", 2 ],
  [ "French", 3 ],
  [ "English", 3 ],
]

skill_list.each do |name, skill_type|
  Skill.create( name: name, skill_type: skill_type )
end