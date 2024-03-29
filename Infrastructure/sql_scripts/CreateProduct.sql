/*
	Create Product
*/
CREATE PROCEDURE CreateProduct(@ProductID VARCHAR(36) = NULL,
							@ProductName VARCHAR(25) = NULL,
							@ProductDescription VARCHAR(200) = NULL,
							@QuantityAvailable INT = NULL,
							@UnitPrice MONEY =NULL,
							@Discontinued BIT = NULL,
							@QuantityPerUnit VARCHAR(30) = NULL,
							@CategoryID VARCHAR(36) = NULL,
							@ProductImage IMAGE = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = -1
	
	IF @ProductID IS NULL
		RAISERROR('ProductID is required parameter: @ProductID',16,1)
	ELSE IF @ProductName IS NULL
		RAISERROR('ProductName is required parameter: @ProductName',16,1)
	ELSE IF @QuantityAvailable IS NULL
		RAISERROR('QuantityAvailable is required parameter: @QuantityAvailable',16,1)
	ELSE IF @UnitPrice IS NULL
		RAISERROR('UnitPrice is required parameter: @UnitPrice',16,1)
	ELSE IF @CategoryID IS NULL
		RAISERROR('CategoryID is required parameter: @CategoryID',16,1)
	ELSE
		BEGIN
			INSERT INTO Product(ProductID,ProductName,ProductDescription,QuantityAvailable,UnitPrice,Discontinued,QuantityPerUnit,CategoryID,ProductImage)
			VALUES (@ProductID,@ProductName,@ProductDescription,@QuantityAvailable,@UnitPrice,@Discontinued,@QuantityPerUnit,@CategoryID,@ProductImage)

			IF @@ERROR = 0
				SET @ReturnCode = 0
			ELSE
				RAISERROR('CreateProduct - INSERT ERROR : Product Table',16,1)
		END

	Return @ReturnCode

GRANT EXECUTE ON CreateProduct TO aspnetcore
