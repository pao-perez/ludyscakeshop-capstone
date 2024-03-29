/*
	Create Order
*/
CREATE PROCEDURE CreateOrder(@OrderID VARCHAR(36) = NULL,
							@OrderStatus VARCHAR(20) = NULL,
							@InvoiceNumber BIGINT = NULL,
							@CustomerName VARCHAR(40) = NULL,
							@CustomerAddress VARCHAR(50) = NULL,
							@CustomerEmail VARCHAR(30) = NULL,
							@CustomerContactNumber VARCHAR(20) =NULL,
							@Note VARCHAR(255) = NULL,
							@GST MONEY = NULL,
							@SubTotal MONEY = NULL,
							@SaleTotal MONEY = NULL)
AS
	DECLARE @ReturnCode INT
	SET @ReturnCode = -1
	
	IF @OrderID IS NULL
		RAISERROR('CreateOrder - required parameter: @OrderID',16,1)
	ELSE IF @CustomerName IS NULL
		RAISERROR('CreateOrder - required parameter: @CustomerName',16,1)
	ELSE IF @CustomerContactNumber IS NULL
		RAISERROR('CreateOrder - required parameter: @CustomerContactNumber',16,1)
	ELSE IF @OrderStatus IS NULL
		RAISERROR('CreateOrder - required parameter: @OrderStatus',16,1)
	ELSE IF @GST IS NULL
		RAISERROR('CreateOrder - required parameter: @GST',16,1)
	ELSE IF @SubTotal IS NULL
		RAISERROR('CreateOrder - required parameter: @SubTotal',16,1)
	ELSE IF @SaleTotal IS NULL
		RAISERROR('CreateOrder - required parameter: @SaleTotal',16,1)
	ELSE
		BEGIN
			INSERT INTO Orders(OrderID,CustomerName,CustomerAddress,CustomerEmail,CustomerContactNumber,OrderStatus,GST,SubTotal,SaleTotal,InvoiceNumber,Note)
			VALUES (@OrderID,@CustomerName,@CustomerAddress,@CustomerEmail,@CustomerContactNumber,@OrderStatus,@GST,@SubTotal,@SaleTotal,@InvoiceNumber,@Note)

			IF @@ERROR = 0
				SET @ReturnCode = 0
			ELSE
				RAISERROR('CreateOrder - INSERT ERROR : Orders Table',16,1)
		END

	Return @ReturnCode

GRANT EXECUTE ON CreateOrder TO aspnetcore
