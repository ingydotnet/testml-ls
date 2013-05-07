modules = [
  'TestML/Runtime/Unit.js'
]

for module in modules
  test "Can require #{module}", ->
    ok require "../lib/#{module}"
