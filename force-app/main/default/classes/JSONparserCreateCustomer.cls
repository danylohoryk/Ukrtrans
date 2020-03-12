public class JSONparserCreateCustomer {

	public String id {get;set;} 
	public String object_Z {get;set;} // in json: object
	public String email {get;set;} 
	public String name {get;set;} 

	public JSONparserCreateCustomer(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'id') {
						id = parser.getText();
					} else if (text == 'object') {
						object_Z = parser.getText();
					} else if (text == 'email') {
						email = parser.getText();
					} else if (text == 'name') {
						name = parser.getText();
					} else {
						System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public static JSONparserCreateCustomer parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new JSONparserCreateCustomer(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}

}