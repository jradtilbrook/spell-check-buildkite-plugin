# Spell Check Buildkite Plugin

This is a plugin to check spelling of input files.

You can provide a glob pattern to check against.

## Example

Add the following to you `pipeline.yml`:

```yml
steps:
  - command: ls
    plugins:
      - jradtilbrook/spell-check#1.0.0:
          pattern: ‘*.md’
```

## Configuration

### `pattern` (Required, string)

The pattern of files to check for spelling, for example `*.txt`. Supports any pattern supported by [find -name](http://man7.org/linux/man-pages/man1/find.1.html).

## Developing

To run the tests:

```shell
docker-compose run --rm tests
```

## Attribution

Thanks to [starefossen/aspell](starefossen/aspell) for use of the docker image to perform spell checking.
