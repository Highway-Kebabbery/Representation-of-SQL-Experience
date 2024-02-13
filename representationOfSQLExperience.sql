SELECT
--Fields requiring direct comparison to gLIMS, in the order of appearance in functional specs
    ps.rule_type, ps.product, ps.version, ps.sampling_point, ps.grade, ps.stage, ps.analysis, ps.component, ps.units, ps.round, ps.places, ps.order_number,
    ps.spec_rule, ps.min_value, ps.max_value, ps.text_value, ps.lsl, ps.usl, ps.nominal_value, ps.show_chart, ps.chart_type, ps.subgroup_size, ps.formula,
    ps.partial, ps.spec_type, ps.required, ps.num_result_reps, ps.class, ps.specific_analysis, ps.hi_control_1, ps.hi_control_2, ps.lo_control_1,
    ps.lo_control_2, ps.reported_name, ps.alias_name, ps.description, ps.num_history_pts, ps.order_number, ps.w_aql_type, ps.w_atypical_status,
    ps.w_centerline_process, ps.w_8row_check, ps.w_8row_delta_post, ps.w_8row_numdays_post, ps.w_8row_3sigma_post, ps.w_6incdec_check, ps.w_atyp_3_in_30,
    
--These fields appear out of order from the functional specs because these three fields correspond to one field in gLIMS, so I separated them to keep
--the section above easier to review.
    pgs.w_coa_reportable, c.w_reportable1, ps.w_reportable2

--Fields not requiring direct comparison to gLIMS, in the order of appearance on functional specs
    --N/A. This section kept for structural consistency with multiple other queries.

FROM product_spec ps
    INNER JOIN prod_grade_stage pgs
        ON ps.product = pgs.product
        AND ps.sampling_point = pgs.sampling_point
        AND ps.grade = pgs.grade
        AND ps.stage = pgs.stage
        AND ps.spec_type = pgs.spec_type
        AND ps.version = pgs.version
    INNER JOIN component c
        ON ps.component = c.name
        AND ps.analysis = c.analysis
    INNER JOIN versions V                --Retrieve latest version of object in ps table
        ON v.table_name = 'PRODUCT'
        AND ps.product =V.name
        AND ps.version = v.version
    INNER JOIN versions v2               --Retrieve latest version of object in component table. Aliased differently to allow multiple joins.
        ON v2.table_name = 'ANALYSIS'
        AND v2.NAME = c.analysis
        AND v2.version c.version

WHERE ps.product like '%PROPRIETARY_ANALYSIS_NAME_REDACTED'

ORDER BY ps.order_number, ps.spec_type