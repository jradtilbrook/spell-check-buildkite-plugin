#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

@test "Creates an annotation with spelling errors" {
  export BUILDKITE_PLUGIN_SPELL_CHECK_PATTERN="*.md"

  stub docker 'run : echo errors.md foxx qick'
  stub buildkite-agent 'annotate --style 'warning' "The following errors have been found in these files: errors.md foxx qick" : echo Annotation created'

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Annotation created"

  unstub buildkite-agent
  unstub docker
}

@test "Creates success annotation when no spelling errors" {
  export BUILDKITE_PLUGIN_SPELL_CHECK_PATTERN="*.md"

  stub docker 'run : echo ""'
  stub buildkite-agent 'annotate --style 'success' "No spelling errors found" : echo Annotation created'

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Annotation created"

  unstub buildkite-agent
  unstub docker
}

