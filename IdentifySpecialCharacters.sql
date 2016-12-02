SELECT
   X.AsciiTestId
  ,X.TestData
  ,X.CharPosition
  ,X.Chars
  ,ac.DecimalCode
  ,ac.CodeDescription
  ,ac.CharacterGroup
FROM (SELECT
         a.AsciiTestId
        ,a.TestData
        ,CharPosition = ROW_NUMBER() OVER (PARTITION BY a.AsciiTestId ORDER BY a.AsciiTestId)
        ,Chars = SUBSTRING(TestData, n, 1)
      FROM dbo.AsciiTest AS a
      INNER JOIN dbo.Numbers AS n
         ON n BETWEEN 1 AND LEN(a.TestData)
) X
INNER JOIN
   dbo.AsciiCode AS ac
   ON ac.DecimalCode = ASCII(X.Chars)
WHERE X.TestData LIKE '%[^a-zA-Z0-9]%'
