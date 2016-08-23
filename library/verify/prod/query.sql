select tc.*, tca.*,tcat.* from test_case tc, test_case_attribute tca  ,test_case_attribute_type tcat
where tca.test_case_id = tc.id and tcat.id = tca.attribute_type_id and tc.environment_id =9
order by tc.id
