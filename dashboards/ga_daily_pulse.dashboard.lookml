- dashboard: daily_pulse_ga
  title: Daily Pulse (GA)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: XfUu8hQeyD0GEOmNYWYKGs
  embed_style:
    background_color: "#f6f8fa"
    show_title: false
    title_color: "#108366"
    show_filters_bar: true
    tile_text_color: "#3a3a3a"
    text_tile_text_color: ''
  elements:
  - title: New Tile
    name: New Tile
    model: ga
    explore: ga_events
    type: looker_line
    fields: [ga_events.number_of_new_users, ga_events.event_date, ga_events.number_of_users]
    fill_fields: [ga_events.event_date]
    sorts: [ga_events.event_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: default-color-collection
      palette_id: default-color-collection-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: ga_events.number_of_new_users,
            name: Number of New Users, axisId: ga_events.number_of_new_users}, {id: ga_events.number_of_users,
            name: Active Users, axisId: ga_events.number_of_users}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors: {}
    series_labels:
      ga_events.number_of_users: Active Users
      ga_events.number_of_new_users: New Installs
    swap_axes: false
    hidden_fields: []
    defaults_version: 1
    title_hidden: true
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 2
    col: 4
    width: 4
    height: 7
  - title: Daily Active Users
    name: Daily Active Users
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.number_of_users, ga_events.event_date]
    fill_fields: [ga_events.event_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: daily_active_users, label: Daily Active Users,
        expression: 'mean(${ga_events.number_of_users})', value_format: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";0',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: The average number of unique users per day who played at least one
      session in the selected time period
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 2
    col: 0
    width: 4
    height: 4
  - name: "<span class='fa fa-tachometer'> Topline KPIs</span>"
    type: text
    title_text: "<span class='fa fa-tachometer'> Topline KPIs</span>"
    subtitle_text: Are we headed in the right direction?
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-smile-o'> Retention </span>"
    type: text
    title_text: "<span class='fa fa-smile-o'> Retention </span>"
    subtitle_text: Are our games fun?
    row: 18
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-users'> User Acquisition </span>"
    type: text
    title_text: "<span class='fa fa-users'> User Acquisition </span>"
    subtitle_text: Are we acquiring players from the best places?
    body_text: ''
    row: 9
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-usd'> Monetization </span>"
    type: text
    title_text: "<span class='fa fa-usd'> Monetization </span>"
    subtitle_text: <p> Are we building a sustainable business? Go to <a href="/dashboards/7"
      target="_blank">monetization dashboard</a></p>
    row: 27
    col: 0
    width: 24
    height: 2
  - title: Revenue
    name: Revenue
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.total_revenue]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Total revenue (In-app Purhcases + Ad)
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 2
    col: 8
    width: 4
    height: 3
  - title: ARPPU
    name: ARPPU
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.average_revenue_per_spender]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: |-
      Average Revenue Per Paying User
      (Revenue / IAP Paying Users)
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 2
    col: 12
    width: 4
    height: 3
  - title: New Tile (copy)
    name: New Tile (copy)
    model: ga
    explore: ga_events
    type: looker_line
    fields: [ga_events.event_date, ga_events.total_revenue, ga_events.average_revenue_per_spender]
    fill_fields: [ga_events.event_date]
    sorts: [ga_events.event_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: default-color-collection
      palette_id: default-color-collection-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: ga_events.total_revenue,
            id: ga_events.total_revenue, name: Total Revenue}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: ga_events.average_revenue_per_spender,
            id: ga_events.average_revenue_per_spender, name: ARPPU (IAP)}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_types:
      ga_events.average_revenue_per_paying_user: column
      ga_events.average_revenue_per_spender: column
    series_colors: {}
    series_labels:
      ga_events.number_of_users: Active Users
    hidden_fields: []
    defaults_version: 1
    title_hidden: true
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 5
    col: 8
    width: 8
    height: 4
  - title: ROAS
    name: ROAS
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.return_on_ad_spend]
    filters:
      ga_events.install_group: paid
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: |-
      Return on Ad Spend (revenue/ad spend)

      NOTE: only counts revenue from paid users
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 2
    col: 20
    width: 4
    height: 3
  - title: Marketing Spend
    name: Marketing Spend
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.total_install_spend]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Return on Ad Spend (revenue/ad spend)
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 2
    col: 16
    width: 4
    height: 3
  - title: UA Overview
    name: UA Overview
    model: ga
    explore: ga_events
    type: looker_line
    fields: [ga_events.event_date, ga_events.total_install_spend, ga_events.return_on_ad_spend]
    fill_fields: [ga_events.event_date]
    filters:
      ga_events.install_group: paid
    sorts: [ga_events.event_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: default-color-collection
      palette_id: default-color-collection-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: ga_events.total_install_spend,
            name: Total Install Cost, axisId: ga_events.total_install_spend}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{id: ga_events.return_on_ad_spend,
            name: ROAS, axisId: ga_events.return_on_ad_spend}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_types:
      ga_events.average_revenue_per_paying_user: column
      ga_events.return_on_ad_spend: column
    series_colors: {}
    series_labels:
      ga_events.number_of_users: Active Users
    hidden_fields: []
    defaults_version: 1
    title_hidden: true
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 5
    col: 16
    width: 8
    height: 4
  - title: CPI (paid only)
    name: CPI (paid only)
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.cost_per_install]
    filters:
      ga_events.install_group: paid
    limit: 500
    column_limit: 50
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Cost per Install
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 16
    col: 0
    width: 4
    height: 2
  - title: Install Sources
    name: Install Sources
    model: ga
    explore: ga_events
    type: table
    fields: [ga_events.install_source, ga_events.return_on_ad_spend, ga_events.total_revenue,
      ga_events.total_install_spend, ga_events.number_of_new_users, ga_events.device_platform]
    pivots: [ga_events.device_platform]
    filters:
      ga_events.install_group: paid
    sorts: [ga_events.number_of_new_users desc 0, ga_events.device_platform]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: false
    series_labels:
      ga_events.number_of_users: Active Users
      ga_events.d7_revenue_per_retained_user: D7 Revenue
      ga_events.number_of_new_users: Installs
      ga_events.total_install_spend: Spend
    series_cell_visualizations:
      ga_events.return_on_ad_spend:
        is_active: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 611da387-0e33-4239-aef0-a187c149cf88,
          palette_id: 4f09bd77-8e34-41d6-a356-12c05cdb2de5, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: 611da387-0e33-4239-aef0-a187c149cf88, palette_id: 4f09bd77-8e34-41d6-a356-12c05cdb2de5},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    stacking: ''
    trellis: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    point_style: none
    series_colors: {}
    series_types: {}
    y_axes: [{label: '', orientation: left, series: [{id: ga_events.total_revenue,
            name: Total Revenue, axisId: ga_events.total_revenue}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{id: ga_events.average_revenue_per_paying_user,
            name: ARPPU (IAP), axisId: ga_events.average_revenue_per_paying_user}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    note_state: expanded
    note_display: above
    note_text: 'Recommended Action: Drill into Install Sources to see what campaigns
      are working'
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 11
    col: 10
    width: 14
    height: 7
  - title: Installs by Day
    name: Installs by Day
    model: ga
    explore: ga_events
    type: looker_line
    fields: [ga_events.install_group, ga_events.number_of_new_users, ga_events.event_date]
    pivots: [ga_events.install_group]
    fill_fields: [ga_events.event_date]
    sorts: [ga_events.number_of_new_users desc 0, ga_events.install_group]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: default-color-collection
      palette_id: default-color-collection-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: cross - ga_events.number_of_new_users,
            name: cross, axisId: ga_events.number_of_new_users}, {id: organic - ga_events.number_of_new_users,
            name: organic, axisId: ga_events.number_of_new_users}, {id: paid - ga_events.number_of_new_users,
            name: paid, axisId: ga_events.number_of_new_users}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    hidden_fields: []
    defaults_version: 1
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 11
    col: 4
    width: 6
    height: 7
  - title: Retention by Source
    name: Retention by Source
    model: ga
    explore: ga_events
    type: looker_line
    fields: [ga_events.retention_day, ga_events.number_of_new_users, ga_events.number_of_users,
      ga_events.install_source]
    pivots: [ga_events.install_source]
    filters:
      ga_events.retention_day: "<=30"
    sorts: [ga_events.retention_day, ga_events.install_source]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: still_active, label: "% still active", expression: "${ga_events.number_of_users}/max(${ga_events.number_of_new_users})",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: default-color-collection
      palette_id: default-color-collection-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: cross - still_active, name: cross,
            axisId: still_active}, {id: organic - still_active, name: organic, axisId: still_active},
          {id: paid - still_active, name: paid, axisId: still_active}], showLabels: true,
        showValues: true, maxValue: 0.6, unpinAxis: false, tickDensity: default, type: log}]
    x_axis_label: days since signup
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    series_types: {}
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    hidden_fields: [ga_events.number_of_new_users, ga_events.number_of_users]
    defaults_version: 1
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 20
    col: 12
    width: 12
    height: 7
  - title: D7 Retention
    name: D7 Retention
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.d7_retention_rate]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: D7 % = session on D7/ session on D0
    defaults_version: 1
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 23
    col: 0
    width: 4
    height: 2
  - title: D1 Retention
    name: D1 Retention
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.d1_retention_rate]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: D1 % = session on D1/ session on D0
    defaults_version: 1
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 20
    col: 0
    width: 4
    height: 3
  - title: D14 Retention
    name: D14 Retention
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.d14_retention_rate]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: D14 % = session on D14/ session on D0
    defaults_version: 1
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 25
    col: 0
    width: 4
    height: 2
  - title: "% New Paid Users"
    name: "% New Paid Users"
    model: ga
    explore: ga_events
    type: looker_donut_multiples
    fields: [ga_events.install_group, ga_events.number_of_new_users]
    pivots: [ga_events.install_group]
    sorts: [ga_events.install_group]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    color_application:
      collection_id: default-color-collection
      palette_id: default-color-collection-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: paid - ga_events.number_of_new_users,
            id: paid - ga_events.number_of_new_users, name: paid}, {axisId: organic
              - ga_events.number_of_new_users, id: organic - ga_events.number_of_new_users,
            name: organic}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    up_color: "#2196F3"
    down_color: "#03d7f4"
    total_color: "#00BCD4"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: What percentage of users did we pay for (vs organic)?
    title_hidden: true
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 11
    col: 0
    width: 4
    height: 5
  - title: D1& D7 Retention
    name: D1& D7 Retention
    model: ga
    explore: ga_events
    type: looker_line
    fields: [ga_events.d1_retention_rate, ga_events.d7_retention_rate, ga_events.event_date]
    fill_fields: [ga_events.event_date]
    filters: {}
    sorts: [ga_events.event_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: default-color-collection
      palette_id: default-color-collection-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: ga_events.d1_retention_rate,
            name: D1 Retention Rate, axisId: ga_events.d1_retention_rate}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#8BC34A",
        line_value: '0.45', label: d1 goal 45%}, {reference_type: line, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#ff3b3b", line_value: '0.16', label: d7 goal
          16%}]
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    hidden_fields: []
    defaults_version: 1
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 20
    col: 4
    width: 8
    height: 7
  - title: LTV (0-30 days)
    name: LTV (0-30 days)
    model: ga
    explore: ga_events
    type: looker_area
    fields: [ga_events.retention_day, ga_events.average_ad_revenue_per_user, ga_events.average_iap_revenue_per_user]
    filters:
      ga_events.retention_day: "<=30"
    sorts: [ga_events.retention_day]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: ltv_iap, label: LTV - IAP, expression: 'running_total(${events.average_iap_revenue_per_user})',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: ltv_ads, label: LTV - Ads, expression: 'running_total(${events.average_ad_revenue_per_user})',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: ltv_growth, label: ltv growth %, expression: "(${total}\
          \ - ${prev_day})/${prev_day}", value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, _type_hint: number}, {table_calculation: total, label: total,
        expression: "${ltv_ads}+ ${ltv_iap}", value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: prev_day, label: prev
          day, expression: 'offset(${total},-1)', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: default-color-collection
      palette_id: default-color-collection-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{id: ltv_iap, name: LTV - IAP,
            axisId: ltv_iap}, {id: ltv_ads, name: LTV - Ads, axisId: ltv_ads}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{id: ltv_growth, name: ltv growth
              %, axisId: ltv_growth}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    x_axis_label: Days since player start
    hidden_series: [ltv_total, ltv_growth]
    hide_legend: false
    trellis_rows: 5
    series_types:
      growth: column
      ltv_growth: column
    series_colors: {}
    series_labels:
      growth: ltv growth
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#8BC34A",
        line_value: '1'}]
    trend_lines: []
    ordering: none
    show_null_labels: false
    hidden_fields: [ga_events.average_iap_revenue_per_user, ga_events.average_ad_revenue_per_user,
      total, prev_day]
    defaults_version: 1
    note_state: expanded
    note_display: hover
    note_text: How long does it take to make $1? (for all users)
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 29
    col: 0
    width: 12
    height: 6
  - title: "% Spenders"
    name: "% Spenders"
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.percent_spenders]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    up_color: "#2196F3"
    down_color: "#03d7f4"
    total_color: "#00BCD4"
    hidden_fields: []
    y_axes: []
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 29
    col: 12
    width: 4
    height: 6
  - title: Revenue Breakdown
    name: Revenue Breakdown
    model: ga
    explore: ga_events
    type: looker_bar
    fields: [ga_events.total_iap_revenue, ga_events.total_ad_revenue]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: default-color-collection
      palette_id: default-color-collection-categorical-0
      options:
        steps: 5
    y_axes: []
    hide_legend: false
    font_size: '12'
    series_types: {}
    series_labels:
      ga_events.total_ad_revenue: Ad Revenue
      ga_events.total_iap_revenue: IAP revenue
    up_color: "#2196F3"
    down_color: "#03d7f4"
    total_color: "#00BCD4"
    hidden_fields: []
    defaults_version: 1
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 29
    col: 16
    width: 8
    height: 6
  - title: Daily Installs
    name: Daily Installs
    model: ga
    explore: ga_events
    type: single_value
    fields: [ga_events.event_date, ga_events.number_of_new_users]
    fill_fields: [ga_events.event_date]
    sorts: [ga_events.event_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: daily_installs, label: Daily Installs, expression: 'mean(${events.number_of_new_users})',
        value_format: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";0', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    hidden_fields: []
    y_axes: []
    note_state: expanded
    note_display: hover
    note_text: Average daily new players
    listen:
      Date Range: ga_events.event_date
      Drill Down: ga_events.drill_by
      Platform: ga_events.device_platform
      Install Source: ga_events.install_source
      Country: ga_events.country
      Game: ga_events.game_name
    row: 6
    col: 0
    width: 4
    height: 3
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 2020/12/01 to 2021/01/31
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ga
    explore: ga_events
    listens_to_filters: []
    field: ga_events.event_date
  - name: Drill Down
    title: Drill Down
    type: field_filter
    default_value: device^_platform
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ga
    explore: ga_events
    listens_to_filters: []
    field: ga_events.drill_by
  - name: Platform
    title: Platform
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ga
    explore: ga_events
    listens_to_filters: []
    field: ga_events.device_platform
  - name: Install Source
    title: Install Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ga
    explore: ga_events
    listens_to_filters: []
    field: ga_events.install_source
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ga
    explore: ga_events
    listens_to_filters: []
    field: ga_events.country
  - name: Game
    title: Game
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ga
    explore: ga_events
    listens_to_filters: []
    field: ga_events.game_name
