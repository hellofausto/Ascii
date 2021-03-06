CREATE FUNCTION [dbo].[udf_RemoveSpecialChars] (
   @p_String VARCHAR(1024))
RETURNS VARCHAR(1024)
AS
BEGIN
   DECLARE @NonAlphaNumChars AS VARCHAR(62);
   SET @NonAlphaNumChars = '%[^a-zA-Z0-9]%';
   WHILE PATINDEX(@NonAlphaNumChars, @p_String) > 0
      SET @p_String = STUFF(@p_String, PATINDEX(@NonAlphaNumChars, @p_String), 1, '');
   RETURN @p_String;
END;