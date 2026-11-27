# Changelog

## Unreleased

### Enhancements

* File extensions are registered as code block names, for example `lean`, `rs` or `py`.
  Syntax names take precedence over file extensions.
* Generic `entity.name` scopes, such as `entity.name.lean4`, are classified as `:name_entity` instead of `:name`.
* Type names (`entity.name.type`, `.struct`, `.enum`, `.union`, `.interface`, `.trait` and `.impl`) are classified as `:name_class` instead of `:name`.
* `entity.name.label` is classified as `:name_label` instead of `:name`.
* Text that matches no specific scope is classified as `:text` instead of `:name`.
* Documented how syntaxes from `:extra_syntax_folders` override bundled syntaxes.

### Notes

* v0.1.4 renamed the "Lean" syntax to "Lean 4" (code block name `lean_4`), so `lean` code blocks
  were no longer highlighted. With file extension names, `lean` works again.

## v0.1.5

* Updated two-face
* Allow `rustler_precompiled` 0.10

## v0.1.4

* Updated syntect and two-face dependencies.
  * Adds support for `debsources`, `GDScript`, `Idris`, `Odin`, `Typst`, `VHDL` syntaxes
  * Renames the `Lean` syntax to `Lean 4`. Its code block name changed from `lean` to `lean_4`.

## v0.1.3

Moved `makeup_syntect` to the [elixir-makeup](https://github.com/elixir-makeup) GitHub origanization.

## v0.1.2

### Bug fixes

* Ensure HTML id and class attributes are properly handled when empty for HEEx

## v0.1.1

### Bug fixes

* Properly classify HTML attributes as `:name_attribute` instead of `:name_entity`

### Enhancements

* Allow to configure extra syntaxes to load at compile time through the `:extra_syntax_folders` configuration option. These are also registered into Makeup.

## v0.1.0

Initial release.
