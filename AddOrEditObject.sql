--Create a new procedure
--a user enters a id (string) and attributes to that object
--if the id already excists then the object will be updated with new attributes
--if the id does not exists then a new object with that id will be added with the attributes that the user entered

CREATE PROCEDURE dbo.AddEditObject
(
	@id VARCHAR(128),
	@value1 VARCHAR(155),
	@value2 VARCHAR(155),
	@value3 INT
)
AS
IF EXISTS (SELECT * FROM dbo.tableName WHERE Id = @id)
	BEGIN
		UPDATE dbo.tableName 
		SET column1 = @value1, column2 = @value2, column3 = @value3 
		WHERE Id = @id
	END
ELSE
	BEGIN 
		INSERT INTO dbo.tableName (ID, column1, column2, column3) 
		VALUES(@id, @value1, @value2, @value3)
	END
