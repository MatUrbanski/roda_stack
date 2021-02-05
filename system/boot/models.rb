# frozen_string_literal: true

# This file contains configuration for Sequel Models.

Application.boot(:models) do
  init do
    require 'sequel/model'
  end

  start do
    # Whether association metadata should be cached in the association reflection.
    # If not cached, it will be computed on demand.
    # In general you only want to set this to false when using code reloading.
    # When using code reloading, setting this will make sure that if an associated class is removed or modified,
    # this class will not have a reference to the previous class.
    Sequel::Model.cache_associations = false if Application.env == 'development'

    # The auto_validations plugin automatically sets up the following types of validations for your model columns:
    # type validations for all columns
    # not_null validations on NOT NULL columns (optionally, presence validations)
    # unique validations on columns or sets of columns with unique indexes
    # max length validations on string columns.
    Sequel::Model.plugin(:auto_validations)

    # The prepared_statements plugin modifies the model to use prepared statements for instance level inserts and updates.
    Sequel::Model.plugin(:prepared_statements)

    # The subclasses plugin keeps track of all subclasses of the current model class.
    # Direct subclasses are available via the subclasses method, and all descendent
    # classes are available via the descendents method.
    Sequel::Model.plugin(:subclasses) unless Application.env == 'development'

    # The timestamps plugin creates hooks that automatically set create and update timestamp fields.
    # Both field names used are configurable, and you can also set whether to overwrite existing
    # create timestamps (false by default), or whether to set the update timestamp when creating (also false by default).
    Sequel::Model.plugin(:timestamps)

    # Allows the use of named timezones via TZInfo (requires tzinfo).
    # Forces the use of DateTime as Sequel's datetime_class, since historically,
    # Ruby's Time class doesn't support timezones other than local and UTC
    Sequel.extension(:named_timezones)

    # Use UTC time zone for saving time inside database.
    Sequel.default_timezone = :utc

    # UTC time from database will be converted to CET timezone.
    Sequel.application_timezone = 'Europe/Warsaw'

    # Allow adding/removing/setting multiple associated objects in a single call
    # for all model subclass instances (called before loading subclasses):
    Sequel::Model.plugin(:association_multi_add_remove)

    # Freeze all descendent classes. This also finalizes the associations for those classes before freezing.
    Sequel::Model.freeze_descendents unless Application.env == 'development'
  end
end
