select tc.id,tc.expected_output,tc.application_id,tc.expected_response_code, tc.method,
tca.test_case_id,REPLACE(tca.value,'\r\n',''),
tcat.name,app.name
from test_case tc, test_case_attribute tca  ,test_case_attribute_type tcat,application app
where tca.test_case_id = tc.id and tcat.id = tca.attribute_type_id and tc.environment_id =9
and tc.method is not null and app.id=tc.application_id and tc.is_enabled =1
order by tc.id,tcat.id;

