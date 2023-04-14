# The name of this view in Looker is "T Daily Test"
view: t_daily_test {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mocha.t_daily_test_v2`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ad Reward Count" in Explore.

  dimension: ad_reward__count {
    type: number
    sql: ${TABLE}.ad_reward__count ;;
  }

  dimension: app_clear_data__count {
    type: number
    sql: ${TABLE}.app_clear_data__count ;;
  }

  dimension: app_exception__count {
    type: number
    sql: ${TABLE}.app_exception__count ;;
  }

  dimension: app_installed__count {
    type: number
    sql: ${TABLE}.app_installed__count ;;
  }

  dimension: app_remove__count {
    type: number
    sql: ${TABLE}.app_remove__count ;;
  }

  dimension: bingo_button_highlighted__count {
    type: number
    sql: ${TABLE}.bingo_button_highlighted__count ;;
  }

  dimension: bingo_call_mistake_made__count {
    type: number
    sql: ${TABLE}.bingo_call_mistake_made__count ;;
  }

  dimension: buy_new_spin_dialog_accepted__count {
    type: number
    sql: ${TABLE}.buy_new_spin_dialog_accepted__count ;;
  }

  dimension: buy_new_spin_dialog_popped__count {
    type: number
    sql: ${TABLE}.buy_new_spin_dialog_popped__count ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: collect {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.collect_time ;;
  }

  dimension: collection_unlocked__count {
    type: number
    sql: ${TABLE}.collection_unlocked__count ;;
  }

  dimension: collections_page_viewed__count {
    type: number
    sql: ${TABLE}.collections_page_viewed__count ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: install_source {
    type: string
    map_layer_name: install_source
    sql: ${TABLE}.install_source ;;
  }

  dimension: display_admob_ad__count {
    type: number
    sql: ${TABLE}.display_admob_ad__count ;;
  }

  dimension: display_rewarded_ad__count {
    type: number
    sql: ${TABLE}.display_rewarded_ad__count ;;
  }

  dimension: error__count {
    type: number
    sql: ${TABLE}.error__count ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }

  dimension: facebook_login_dialog_canceled__count {
    type: number
    sql: ${TABLE}.facebook_login_dialog_canceled__count ;;
  }

  dimension: facebook_login_dialog_popped__count {
    type: number
    sql: ${TABLE}.facebook_login_dialog_popped__count ;;
  }

  dimension: firebase_campaign__count {
    type: number
    sql: ${TABLE}.firebase_campaign__count ;;
  }

  dimension: first_open__count {
    type: number
    sql: ${TABLE}.first_open__count ;;
  }

  dimension: first_square_highlighted__count {
    type: number
    sql: ${TABLE}.first_square_highlighted__count ;;
  }

  dimension: game_resigned__count {
    type: number
    sql: ${TABLE}.game_resigned__count ;;
  }

  dimension: initialized_rh_api__count {
    type: number
    sql: ${TABLE}.initialized_rh_api__count ;;
  }

  dimension_group: install {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.install_date ;;
  }

  dimension: item_purchased__coin_cost {
    type: number
    sql: ${TABLE}.item_purchased__coin_cost ;;
  }

  # Drill Selector
  parameter: drill_by {
    type: string
    default_value: "platform"
    allowed_value: { label: "Country" value: "country" }
    allowed_value: { label: "Platform" value: "platform" }
    allowed_value: { label: "Install Source" value: "install_source" }
  }

  dimension: drill_field {
    hidden: yes
    type: string
    label_from_parameter: drill_by
    sql:
      {% case  drill_by._parameter_value %}
        {% when "'country'" %}
          ${country}
        {% when "'platform'" %}
          ${platform}
        {% when "'install_source'" %}
          ${install_source}
        {% else %}
         null
      {% endcase %} ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_revenue {
    group_label: "Monetization"
    type: sum
    sql: ${item_purchased__coin_cost} ;;
    value_format_name: large_usd
    drill_fields: [drill_field,total_revenue]
  }

  measure: average_revenue {
    group_label: "Monetization"
    type: average
    sql: ${item_purchased__coin_cost} ;;
    value_format_name: large_usd
    drill_fields: [drill_field,total_revenue]
  }
  measure: average_revenue_per_spender {
    group_label: "Monetization"
    label: "ARPPU"
    description: " Total Revenue / Number of Paying Users"
    type: number
    sql: 1.0 * ${total_revenue} / NULLIF(${number_of_spenders},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field,average_revenue_per_spender]
  }

# User Counts
  measure: number_of_users {
    group_label: "User Counts"
    type: count_distinct
    sql: ${universal_user_id};;
    value_format_name: large_number
    drill_fields: [drill_field,number_of_users]
  }
  measure: number_of_new_users {
    group_label: "User Counts"
    type: count_distinct
    sql: ${universal_user_id};;
    filters: {
      field: first_open
      value: "1"
    }
    value_format_name: large_number
    drill_fields: [drill_field,number_of_new_users]
  }
  measure: number_of_spenders {
    group_label: "User Counts"
    description: "Number of users with purchases"
    type: count_distinct
    sql: ${universal_user_id} ;;
    filters: {
      field: pay_flag
      value: "1"
    }
    value_format_name: large_number
    drill_fields: [drill_field,number_of_spenders]
  }

  #Dimension
  dimension: install_group {
    description: "Where did the user originate? (organic or paid)"
    type: string
    sql: CASE
            WHEN ${install_source} = 'organic' then 'organic'
            ELSE 'paid'
          END ;;
    drill_fields: [install_source]
  }

  dimension: first_open {
    type: number
    sql: ${TABLE}.first_open__count ;;
  }


  dimension: level__count {
    type: number
    sql: ${TABLE}.level__count ;;
  }

  dimension: level_up__count {
    type: number
    sql: ${TABLE}.level_up__count ;;
  }

  dimension: local_notif_received_app_active__count {
    type: number
    sql: ${TABLE}.local_notif_received_app_active__count ;;
  }

  dimension: login_flag {
    type: number
    sql: ${TABLE}.login_flag ;;
  }

  dimension: next_ball_mistake_made__count {
    type: number
    sql: ${TABLE}.next_ball_mistake_made__count ;;
  }

  dimension: next_button_highlighted__count {
    type: number
    sql: ${TABLE}.next_button_highlighted__count ;;
  }

  dimension: notification_foreground__count {
    type: number
    sql: ${TABLE}.notification_foreground__count ;;
  }

  dimension: os_update__count {
    type: number
    sql: ${TABLE}.os_update__count ;;
  }

  dimension: out_of_chips_dialog_popped__count {
    type: number
    sql: ${TABLE}.out_of_chips_dialog_popped__count ;;
  }

  dimension: pay_flag {
    type: number
    sql: ${TABLE}.pay_flag ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: power_bar_highlighted__count {
    type: number
    sql: ${TABLE}.power_bar_highlighted__count ;;
  }

  dimension: push_notif_received_while_app_active__count {
    type: number
    sql: ${TABLE}.push_notif_received_while_app_active__count ;;
  }

  dimension: push_notif_sent__count {
    type: number
    sql: ${TABLE}.push_notif_sent__count ;;
  }

  dimension: random_rounds__count {
    type: number
    sql: ${TABLE}.random_rounds__count ;;
  }

  dimension: review_dialog_accepted__count {
    type: number
    sql: ${TABLE}.review_dialog_accepted__count ;;
  }

  dimension: review_dialog_popped__count {
    type: number
    sql: ${TABLE}.review_dialog_popped__count ;;
  }

  dimension: round_completed__count {
    type: number
    sql: ${TABLE}.round_completed__count ;;
  }

  dimension: screen_view__count {
    type: number
    sql: ${TABLE}.screen_view__count ;;
  }

  dimension: select_content__count {
    type: number
    sql: ${TABLE}.select_content__count ;;
  }

  dimension: server_error_fatal__count {
    type: number
    sql: ${TABLE}.server_error_fatal__count ;;
  }

  dimension: server_error_single__count {
    type: number
    sql: ${TABLE}.server_error_single__count ;;
  }

  dimension: session_start__count {
    type: number
    sql: ${TABLE}.session_start__count ;;
  }

  dimension: shop_page_viewed__count {
    type: number
    sql: ${TABLE}.shop_page_viewed__count ;;
  }

  dimension: slots_spun__count {
    type: number
    sql: ${TABLE}.slots_spun__count ;;
  }

  dimension: social_page_viewed__count {
    type: number
    sql: ${TABLE}.social_page_viewed__count ;;
  }

  dimension: spend_virtual_currency__count {
    type: number
    sql: ${TABLE}.spend_virtual_currency__count ;;
  }

  dimension: store_purchase_started__count {
    type: number
    sql: ${TABLE}.store_purchase_started__count ;;
  }

  dimension: tutorial_begin__count {
    type: number
    sql: ${TABLE}.tutorial_begin__count ;;
  }

  dimension: tutorial_complete__count {
    type: number
    sql: ${TABLE}.tutorial_complete__count ;;
  }

  dimension: universal_user_id {
    type: string
    sql: ${TABLE}.universal_user_id ;;
  }

  dimension: unlock_achievement__count {
    type: number
    sql: ${TABLE}.unlock_achievement__count ;;
  }

  dimension: use_time_extender__count {
    type: number
    sql: ${TABLE}.use_time_extender__count ;;
  }

  dimension: user_engagement__count {
    type: number
    sql: ${TABLE}.user_engagement__count ;;
  }

  dimension: user_logged_in__count {
    type: number
    sql: ${TABLE}.user_logged_in__count ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
