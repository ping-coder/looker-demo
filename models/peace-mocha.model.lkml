# Define the database connection to be used for this model.
connection: "peace-mocha"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: peace-mocha_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: peace-mocha_default_datagroup

named_value_format: large_usd { value_format: "[>=1000000]\"$\"0.00,,\"M\";[>=1000]\"$\"0.00,\"K\";\"$\"0.00" }
named_value_format: large_number { value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0" }

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Peace-mocha"

explore: events_20220628 {
  join: events_20220628__items {
    view_label: "Events 20220628: Items"
    sql: LEFT JOIN UNNEST(${events_20220628.items}) as events_20220628__items ;;
    relationship: one_to_many
  }

  join: events_20220628__event_params {
    view_label: "Events 20220628: Event Params"
    sql: LEFT JOIN UNNEST(${events_20220628.event_params}) as events_20220628__event_params ;;
    relationship: one_to_many
  }

  join: events_20220628__user_properties {
    view_label: "Events 20220628: User Properties"
    sql: LEFT JOIN UNNEST(${events_20220628.user_properties}) as events_20220628__user_properties ;;
    relationship: one_to_many
  }
}
