SELECT COUNT(*) FROM Other_Available_Features	real_estate_properties
SELECT rft.feature_type_name FROM Ref_Feature_Types AS rft JOIN Other_Available_Features AS oaf ON rft.feature_type_code = oaf.feature_type_code WHERE oaf.feature_name = 'AirCon'	real_estate_properties
SELECT T1.property_type_description FROM Ref_Property_Types AS T1 INNER JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code WHERE T2.property_type_code = 'House'	real_estate_properties
SELECT Properties.property_name FROM Properties JOIN Ref_Property_Types ON Properties.property_type_code = Ref_Property_Types.property_type_code WHERE Properties.room_count > 1 AND Ref_Property_Types.property_type_description IN ('House, Bungalow, etc.','Apartment, Flat, Condo, etc.')	real_estate_properties
