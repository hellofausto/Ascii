SELECT at.AsciiTestId
      ,at.TestData
	  , CleanTestData = dbo.udf_RemoveSpecialChars(at.TestData)
FROM dbo.AsciiTest at
