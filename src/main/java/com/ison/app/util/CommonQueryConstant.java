package com.ison.app.util;

public class CommonQueryConstant {
	
	public static final String CLIENT_DET_QRY = "SELECT DISTINCT CASE WHEN B.INVENTORY_CLIENT_ID !='' THEN 'Y' ELSE 'N' END AS VALID, A.INVENTORY_CLIENT_ID, A.INVENTORY_CLIENT_NAME,B.EMAIL,B.MOBILE_NUMBER FROM INVENTORY_MAPPING A LEFT JOIN CLIENT_DETAILS B ON  A.INVENTORY_CLIENT_ID = B.INVENTORY_CLIENT_ID OR A.INVENTORY_CLIENT_ID != B.INVENTORY_CLIENT_ID AND B.INVENTORY_CLIENT_ID IS NULL AND A.STATUS='ACTIVE' ORDER BY INVENTORY_CLIENT_NAME"; 

	public static final String CLIENT_DET_REGION_QRY = "SELECT  DISTINCT CASE WHEN B.INVENTORY_REGION_ID !='' THEN 'Y' ELSE 'N' END AS VALID, A.INVENTORY_REGION_ID, A.INVENTORY_REGION_NAME FROM INVENTORY_MAPPING A LEFT JOIN CLIENT_DETAILS B  ON A.INVENTORY_REGION_ID = B.INVENTORY_REGION_ID OR A.INVENTORY_REGION_ID != B.INVENTORY_REGION_ID AND B.INVENTORY_REGION_ID IS NULL AND A.INVENTORY_CLIENT_ID=B.INVENTORY_CLIENT_ID WHERE A.INVENTORY_CLIENT_ID=:CLIENTID AND A.STATUS='ACTIVE' ORDER BY INVENTORY_REGION_NAME"; 

	public static final String CLIENT_DET_CENTER_QRY ="SELECT  DISTINCT  CASE WHEN B.INVENTORY_CENTER_ID !='' THEN 'Y' ELSE 'N' END AS VALID, B.AUTOGEN_CLIENT_DETAILS_ID, B.LOGO,A.INVENTORY_CENTER_ID, A.INVENTORY_CENTER_NAME" + 
			" FROM INVENTORY_MAPPING A LEFT JOIN CLIENT_DETAILS B  ON A.INVENTORY_CENTER_ID = B.INVENTORY_CENTER_ID OR" + 
			" A.INVENTORY_CENTER_ID != B.INVENTORY_CENTER_ID AND B.INVENTORY_CENTER_ID IS NULL AND A.INVENTORY_CLIENT_ID=B.INVENTORY_CLIENT_ID AND A.INVENTORY_REGION_ID =B.INVENTORY_REGION_ID"  + 
			" WHERE A.INVENTORY_CLIENT_ID =:CLIENTID AND A.INVENTORY_REGION_ID =:REGIONID AND A.STATUS='ACTIVE' ORDER BY INVENTORY_CENTER_NAME";
	
	public static final String CLIENT_DET_PROCESS_QRY = "SELECT DISTINCT INVENTORY_PROCESS_ID, INVENTORY_PROCESS_NAME FROM INVENTORY_MAPPING WHERE INVENTORY_CLIENT_ID=:CLIENTID AND INVENTORY_REGION_ID=:REGIONID AND INVENTORY_CENTER_ID =:CENTERID AND STATUS='ACTIVE' ORDER BY INVENTORY_PROCESS_NAME";

	public static final String CLIENT_DET_CONTACT_DET_QRY = "SELECT AUTOGEN_CONTACT_DETAILS_ID, PERSON_NAME, EMAIL, MOBILE_NUMBER, NOTIFICATION_STATUS FROM CONTACT_DETAILS WHERE STATUS='ACTIVE' AND AUTOGEN_CLIENT_DETAILS_ID=:CLIENTDETID ORDER BY PERSON_NAME";

	public static final String CLIENT_REPORT_MAP_QRY ="SELECT AUTOGEN_CLIENT_REPORT_MAP_ID, AUTOGEN_REPORT_MASTER_ID, REPORT_NAME, AUTOGEN_FREQUENCY_MASTER_ID, FREQUENCY_NAME,INVENTORY_PROCESS_ID,\r\n" + 
			"INVENTORY_PROCESS_NAME FROM CLIENT_REPORT_MAP WHERE AUTOGEN_CONTACT_DETAILS_ID=:CONTACTDETID ORDER BY REPORT_NAME";
}
