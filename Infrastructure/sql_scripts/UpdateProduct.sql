/*
	Update Product
*/
CREATE PROCEDURE UpdateProduct(
							@ProductID VARCHAR(36) = NULL,
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
	ELSE
		BEGIN
			UPDATE Product
			SET ProductName = @ProductName,
				ProductDescription = @ProductDescription,
				QuantityAvailable = @QuantityAvailable,
				UnitPrice = @UnitPrice,
				Discontinued=@Discontinued,
				QuantityPerUnit=@QuantityPerUnit,
				CategoryID=@CategoryID,
				ProductImage=@ProductImage
			WHERE ProductID = @ProductID

			IF @@ERROR = 0
				SET @ReturnCode = 0
			ELSE
				RAISERROR('UpdateProduct - UPDATE error: Product table.',16,1)
		END

	Return @ReturnCode

GRANT EXECUTE ON UpdateProduct TO aspnetcore
