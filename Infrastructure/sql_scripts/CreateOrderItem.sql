/*
	Create Order Item
*/
CREATE PROCEDURE CreateOrderItem(
							@OrderID VARCHAR(36) = NULL,
							@ProductID VARCHAR(36) = NULL,
							@ItemQuantity INT = NULL,
							@ItemTotal MONEY = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = -1
	
	IF @OrderID IS NULL
		RAISERROR('CreateOrderItem - required parameter: @OrderID',16,1)
	ELSE IF @ProductID IS NULL
		RAISERROR('CreateOrderItem - required parameter: @ProductID',16,1)
	ELSE IF @ItemQuantity IS NULL
		RAISERROR('CreateOrderItem - required parameter: @ItemQuantity',16,1)
	ELSE IF @ItemTotal IS NULL
		RAISERROR('CreateOrderItem - required parameter: @ItemTotal',16,1)

		BEGIN
			INSERT INTO OrderItem(OrderID,ProductID,ItemQuantity,ItemTotal)
			VALUES (@OrderID,@ProductID,@ItemQuantity,@ItemTotal)

			IF @@ERROR = 0
				SET @ReturnCode = 0
			ELSE
				RAISERROR('CreateOrderItem - INSERT ERROR : OrderItem Table',16,1)
		END

	Return @ReturnCode

GRANT EXECUTE ON CreateOrderItem TO aspnetcore
