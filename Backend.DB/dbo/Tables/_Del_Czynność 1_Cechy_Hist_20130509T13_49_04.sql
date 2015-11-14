﻿CREATE TABLE [dbo].[_Del_Czynność 1_Cechy_Hist_20130509T13:49:04] (
    [Id]                    INT                                                                   IDENTITY (1, 1) NOT NULL,
    [IdArch]                INT                                                                   NULL,
    [IdArchLink]            INT                                                                   NULL,
    [ObiektId]              INT                                                                   NOT NULL,
    [CechaId]               INT                                                                   NOT NULL,
    [CalculatedByAlgorithm] SMALLINT SPARSE                                                       NULL,
    [VirtualTypeId]         SMALLINT SPARSE                                                       NULL,
    [IsValidForAlgorithm]   BIT SPARSE                                                            NULL,
    [AlgorithmRun]          INT SPARSE                                                            NULL,
    [ColumnsSet]            XML COLUMN_SET FOR ALL_SPARSE_COLUMNS                                ,
    [ValInt]                INT SPARSE                                                            NULL,
    [ValString]             NVARCHAR (MAX)                                                        NULL,
    [ValFloat]              FLOAT (53) SPARSE                                                     NULL,
    [ValBit]                BIT SPARSE                                                            NULL,
    [ValDecimal]            DECIMAL (12, 5) SPARSE                                                NULL,
    [ValDatetime]           DATETIME SPARSE                                                       NULL,
    [ValDictionary]         INT SPARSE                                                            NULL,
    [ValDate]               DATE SPARSE                                                           NULL,
    [ValTime]               TIME (7) SPARSE                                                       NULL,
    [ValXml]                XML(CONTENT [dbo].[Schema_CompositeArithmeticOperationColumn]) SPARSE NULL,
    [ValRef]                XML(CONTENT [dbo].[Schema_ValRef]) SPARSE                             NULL,
    [IsAlternativeHistory]  BIT                                                                   DEFAULT ((0)) NULL,
    [IsMainHistFlow]        BIT                                                                   DEFAULT ((1)) NULL,
    [IsStatus]              BIT                                                                   DEFAULT ((0)) NOT NULL,
    [StatusS]               INT SPARSE                                                            NULL,
    [StatusSFrom]           DATETIME SPARSE                                                       NULL,
    [StatusSTo]             DATETIME SPARSE                                                       NULL,
    [StatusSFromBy]         INT SPARSE                                                            NULL,
    [StatusSToBy]           INT SPARSE                                                            NULL,
    [StatusW]               INT SPARSE                                                            NULL,
    [StatusWFrom]           DATETIME SPARSE                                                       NULL,
    [StatusWTo]             DATETIME SPARSE                                                       NULL,
    [StatusWFromBy]         INT SPARSE                                                            NULL,
    [StatusWToBy]           INT SPARSE                                                            NULL,
    [StatusP]               INT SPARSE                                                            NULL,
    [StatusPFrom]           DATETIME SPARSE                                                       NULL,
    [StatusPTo]             DATETIME SPARSE                                                       NULL,
    [StatusPFromBy]         INT SPARSE                                                            NULL,
    [StatusPToBy]           INT SPARSE                                                            NULL,
    [ObowiazujeOd]          DATETIME                                                              NULL,
    [ObowiazujeDo]          DATETIME SPARSE                                                       NULL,
    [IsValid]               BIT                                                                   DEFAULT ((1)) NOT NULL,
    [ValidFrom]             DATETIME                                                              DEFAULT (getdate()) NOT NULL,
    [ValidTo]               DATETIME SPARSE                                                       NULL,
    [IsDeleted]             BIT                                                                   DEFAULT ((0)) NOT NULL,
    [DeletedFrom]           DATETIME SPARSE                                                       NULL,
    [DeletedBy]             INT SPARSE                                                            NULL,
    [CreatedOn]             DATETIME                                                              DEFAULT (getdate()) NOT NULL,
    [CreatedBy]             INT                                                                   NULL,
    [LastModifiedOn]        DATETIME SPARSE                                                       NULL,
    [LastModifiedBy]        INT SPARSE                                                            NULL,
    [Priority]              SMALLINT                                                              NOT NULL,
    [UIOrder]               SMALLINT                                                              NULL,
    [RealCreatedOn]         DATETIME                                                              DEFAULT (getdate()) NOT NULL,
    [RealLastModifiedOn]    DATETIME SPARSE                                                       NULL,
    [RealDeletedFrom]       DATETIME SPARSE                                                       NULL,
    CONSTRAINT [PK2_Del_Czynność 1_Cechy_Hist_20130509T13:49:04] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Del_Czynność 1_Cechy_Hist_20130509T13:49:04_CalculatedByAlgorithm] FOREIGN KEY ([CalculatedByAlgorithm]) REFERENCES [dbo].[Algorytmy] ([Id]),
    CONSTRAINT [FK_Del_Czynność 1_Cechy_Hist_20130509T13:49:04_CechaId] FOREIGN KEY ([CechaId]) REFERENCES [dbo].[Cechy] ([Cecha_ID]),
    CONSTRAINT [FK_Del_Czynność 1_Cechy_Hist_20130509T13:49:04_IdArch]]] FOREIGN KEY ([IdArch]) REFERENCES [dbo].[_Del_Czynność 1_Cechy_Hist_20130509T13:49:04] ([Id]),
    CONSTRAINT [FK_Del_Czynność 1_Cechy_Hist_20130509T13:49:04_IdArchLink] FOREIGN KEY ([IdArchLink]) REFERENCES [dbo].[_Del_Czynność 1_Cechy_Hist_20130509T13:49:04] ([Id]),
    CONSTRAINT [FK_Del_Czynność 1_Cechy_Hist_20130509T13:49:04_ObiektId] FOREIGN KEY ([ObiektId]) REFERENCES [dbo].[_Del_Czynność 1_20130509T13:49:04] ([Id])
);


GO
CREATE CLUSTERED INDEX [PK_Del_Czynność 1_Cechy_Hist_20130509T13:49:04]
    ON [dbo].[_Del_Czynność 1_Cechy_Hist_20130509T13:49:04]([ObiektId] ASC, [CechaId] ASC);


GO
			
				
CREATE TRIGGER [dbo].[WartoscZmiany_Del_Czynność 1_Cechy_Hist_20130509T13:49:04_INSERT]
   ON  [dbo].[_Del_Czynność 1_Cechy_Hist_20130509T13:49:04] 
   AFTER INSERT
AS 
BEGIN
	DECLARE @ID int, @Nazwa nvarchar(64)
	,@WaznyOd datetime, @UtworzonyPrzez int, @IdArchLink int,@Wersja int
	,@ObowiazujeOD datetime, @ObowiazujeDo datetime

	DECLARE @maxDt date = '9999-12-31'
	
	select @ID = ID, @IdArchLink = IdArchLink
	FROM inserted

	IF (@IdArchLink IS NULL)
	BEGIN
		IF EXISTS(
			SELECT S1.CechaID, S1.ObiektID,
			  S1.ID AS key1, S1.ObowiazujeOd AS start1, S1.ObowiazujeDo AS end1,
			  S2.ID AS key2, S2.ObowiazujeOd AS start2, S2.ObowiazujeDo AS end2
			FROM inserted AS S1
			  JOIN [dbo].[_Czynność 1_Cechy_Hist] AS S2
				ON  S2.CechaID = S1.CechaID
				AND S2.ObiektID = S1.ObiektID
				AND S2.VirtualTypeId = S1.VirtualTypeId
				AND (COALESCE(S2.ObowiazujeDo,@maxDt) >= COALESCE(S1.ObowiazujeOd,@maxDt)
					 AND COALESCE(S2.ObowiazujeOd, @maxDt) <= COALESCE(S1.ObowiazujeDo,@maxDt))
			WHERE S1.Id = @id AND S1.ID <> S2.ID AND S1.VirtualTypeId = S2.VirtualTypeId
		)	
		BEGIN
							
			UPDATE [dbo].[_Czynność 1_Cechy_Hist] 
			SET IsAlternativeHistory = 1
			, IsMainHistFlow = 0
			WHERE Id = @id
		
		END
	END
END	
GO
DISABLE TRIGGER [dbo].[WartoscZmiany_Del_Czynność 1_Cechy_Hist_20130509T13:49:04_INSERT]
    ON [dbo].[_Del_Czynność 1_Cechy_Hist_20130509T13:49:04];


GO
			
CREATE TRIGGER [dbo].[WartoscZmiany_Del_Czynność 1_Cechy_Hist_20130509T13:49:04_UPDATE]
   ON  [dbo].[_Del_Czynność 1_Cechy_Hist_20130509T13:49:04] 
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	
	IF(UPDATE(IsDeleted)) RETURN;

	DECLARE @ID int, @ObiektID int, @CechaID int, @ValInt int, @ValString nvarchar(max), @ValFloat float, @ValBit bit, @ValDecimal decimal(12,5)
	,@ValDatetime datetime, @ValDate date, @ValTime time, @WaznyOd datetime, @UtworzonyPrzez int, @IdArchLink int
	,@ObowiazujeOd datetime, @ObowiazujeDo datetime, @UIOrder smallint, @Priority smallint
	,@VirtualTypeId smallint, @IsValidForAlgorithm bit, @CalculatedByAlgorithm smallint, @AlgorithmRun int
	,@WaznyOdNEW datetime, @UtworzonyPrzezNEW int, @CzyWaznyNEW bit, @ValIntNEW int, @ValStringNEW nvarchar(max), @ValFloatNEW float
	,@ValBitNEW bit, @ValDecimalNEW decimal(12,5), @ValDatetimeNEW datetime, @ValDateNEW date, @ValTimeNEW time
	,@DataModyfikacjiApp datetime, @RealCreatedOn datetime, @RealLastModifiedOn datetime, @hist int
	,@PrzedzialCzasowyId int, @Sledzona bit, @MinDate datetime, @MaxDate datetime, @OldLastModifiedOn datetime 
	,@IsStatus bit, @StatusS int, @StatusW int, @StatusP int, @StatusSBy int, @StatusPBy int, @StatusWBy int 
	,@StatusSFrom datetime, @StatusPFrom datetime, @StatusWFrom datetime, @StatusPCechy int, @NewObowiazujeDo datetime, @MinDateObowiazuje datetime, @MaxDateObowiazuje datetime
	,@IsAlternativeHistory bit, @IsMainHistFlow bit, @NewObowiazujeOd datetime, @NewIsMainHistFlow bit, @ValDictionary int, @ValXml xml, @ValRef xml,
	@CreatedOn datetime, @LastModifiedOn datetime, @ZmienionyPrzez int
	
	DECLARE cur_ObiektInst_Cechy_UPDATE CURSOR FOR
		SELECT ID, ObiektID, CechaID, ValInt, ValString, ValFloat, ValBit ,ValDecimal, ValDatetime, ValDate, ValTime, ValDictionary, ValXml, ValRef,
			ValidFrom, CreatedBy, IdArchLink, ObowiazujeOd, ObowiazujeDo, UIOrder, [Priority], VirtualTypeId, IsValidForAlgorithm,
			CalculatedByAlgorithm, AlgorithmRun, ISNULL(LastModifiedOn, CreatedOn), IsStatus, StatusS, StatusP, StatusW, StatusSFromBy, StatusPFromBy, 
			StatusWFromBy, StatusSFrom, StatusPFrom, StatusWFrom, IsAlternativeHistory, IsMainHistFlow, CreatedOn, LastModifiedOn, LastModifiedBy
		FROM deleted
	OPEN cur_ObiektInst_Cechy_UPDATE	
	FETCH NEXT FROM cur_ObiektInst_Cechy_UPDATE INTO @ID, @ObiektID, @CechaID, @ValInt, @ValString, @ValFloat, @ValBit, @ValDecimal, @ValDatetime, @ValDate, @ValTime, 
		@ValDictionary, @ValXml, @ValRef, @WaznyOd, @UtworzonyPrzez, @IdArchLink, @ObowiazujeOD, @ObowiazujeDo, @UIOrder, @Priority, @VirtualTypeId, @IsValidForAlgorithm, 
		@CalculatedByAlgorithm, @AlgorithmRun, @OldLastModifiedOn, @IsStatus, @StatusS, @StatusP, @StatusW, @StatusSBy, @StatusPBy, @StatusWBy, @StatusSFrom, @StatusPFrom, 
		@StatusWFrom, @IsAlternativeHistory, @IsMainHistFlow, @CreatedOn, @LastModifiedOn, @ZmienionyPrzez
	WHILE @@fetch_status = 0
	BEGIN
	
		SELECT @WaznyodNEW = ValidFrom, @CzyWaznyNEW = IsValid, @UtworzonyPrzezNEW = LastModifiedBy, @NewObowiazujeOd = ObowiazujeOd, @NewIsMainHistFlow = IsMainHistFlow,
			@DataModyfikacjiApp = LastModifiedOn, @RealCreatedOn = RealCreatedOn, @RealLastModifiedOn = RealLastModifiedOn, @NewObowiazujeDo = ObowiazujeDo
		FROM inserted WHERE ID = @ID
		
		--pobranie przedzialu czasowego z danych cechy oraz jej charakteru chwilowego
		SELECT @PrzedzialCzasowyId = PrzedzialCzasowyId, @Sledzona = Sledzona, @StatusPCechy = StatusP
		FROM Cechy
		WHERE Cecha_ID = @CechaID;
	
		IF @CzyWaznyNEW = 1 
		BEGIN						
			--okreslamy granice przedzialu tylko jesli ustawiono typ przedzialu dla cechy
			IF @PrzedzialCzasowyId IS NOT NULL
			BEGIN
				--pobranie przedzialu czasowego dla przedzialu czasowego modyfikowanego typu cechy i daty aplikacji
				EXEC [THB].[PrepareTimePeriods]
					@AppDate = @DataModyfikacjiApp,
					@TimeIntervalId = @PrzedzialCzasowyId,
					@MinDate = @MinDate OUTPUT,
					@MaxDate = @MaxDate OUTPUT
			END
			ELSE
			BEGIN
				--brak jednostki czasu wiec zapisujemy kazda zmiane
				SET @Sledzona = 1;
			END
			
			--jesli ma byc zapisywana kazda zmiana wartosci cechy (charakter chwilowy) lub wartosc nie miesci sie w podanym przedziale czasowym
			IF @NewIsMainHistFlow <> @IsMainHistFlow OR @ObowiazujeOd <> @NewObowiazujeOd OR @Sledzona = 1 OR @StatusPCechy >= 5 
				OR @OldLastModifiedOn < @MinDate OR @OldLastModifiedOn > @MaxDate
			BEGIN
			
				--EXEC [THB].[PrepareTimeForPrevPeriod]
				--	@AppDate = @DataModyfikacjiApp,
				--	@TimeIntervalId = @PrzedzialCzasowyId,
				--	@MinDate = @MinDateObowiazuje OUTPUT,
				--	@MaxDate = @MaxDateObowiazuje OUTPUT
					
				--kolumna narazie nie uzywana	
				SET @MaxDateObowiazuje = NULL
				
				--podmiana wartosci daty ostatniej modyfikacji i osoby modyfikujacej
				IF @Sledzona = 1
				BEGIN
					SET @LastModifiedOn = @DataModyfikacjiApp;
					SET @ZmienionyPrzez = @UtworzonyPrzezNEW;
				END							
			
				INSERT INTO [dbo].[_Czynność 1_Cechy_Hist]
				   ([IdArch], IdArchLink, [ObiektId], [CechaID], [ValInt], [ValString], [ValFloat], [ValBit], [ValDecimal], [ValDatetime], [ValDate], [ValTime], [ValDictionary], [ValXml], [ValRef]
				   ,[IsValid], [ValidFrom], [ValidTo], [CreatedOn], [CreatedBy], [LastModifiedOn], [LastModifiedBy], ObowiazujeOd, ObowiazujeDo, 
				   UIOrder, [Priority], VirtualTypeId, IsValidForAlgorithm, CalculatedByAlgorithm, AlgorithmRun,
				   RealCreatedOn, RealLastModifiedOn, IsAlternativeHistory, IsMainHistFlow, IsStatus, StatusS, StatusP, StatusW, StatusSFromBy, StatusPFromBy, StatusWFromBy, StatusSFrom, StatusPFrom, 
				   StatusWFrom, StatusSTo, StatusPTo, StatusWTo, StatusSToBy, StatusPToBy, StatusWToBy)
				SELECT @Id, ISNULL(@IdArchLink, @ID), @ObiektID, @CechaID, @ValInt, @ValString, @ValFloat, @ValBit, @ValDecimal, @ValDatetime, @ValDate, @ValTime, @ValDictionary, @ValXml, @ValRef 
					, 0, @WaznyOd, @WaznyodNEW, @CreatedOn, @UtworzonyPrzez, @LastModifiedOn, @ZmienionyPrzez, @ObowiazujeOd, @MaxDateObowiazuje, --@ObowiazujeOd, @ObowiazujeDo, 
					@UIOrder, @Priority, @VirtualTypeId, @IsValidForAlgorithm, @CalculatedByAlgorithm, @AlgorithmRun,
					@RealCreatedOn, @RealLastModifiedOn, @IsAlternativeHistory, @IsMainHistFlow, @IsStatus, @StatusS, @StatusP, @StatusW, @StatusSBy, @StatusPBy, @StatusWBy, @StatusSFrom, @StatusPFrom, @StatusWFrom,
					CASE
						WHEN @StatusSFrom IS NOT NULL THEN @DataModyfikacjiApp
						ELSE NULL
					END,
					CASE
						WHEN @StatusPFrom IS NOT NULL THEN @DataModyfikacjiApp
						ELSE NULL
					END,
					CASE
						WHEN @StatusWFrom IS NOT NULL THEN @DataModyfikacjiApp
						ELSE NULL
					END,
					CASE
						WHEN @StatusSFrom IS NOT NULL THEN @UtworzonyPrzezNEW
						ELSE NULL
					END,
					CASE
						WHEN @StatusPFrom IS NOT NULL THEN @UtworzonyPrzezNEW
						ELSE NULL
					END,
					CASE
						WHEN @StatusWFrom IS NOT NULL THEN @UtworzonyPrzezNEW
						ELSE NULL
					END 

				SELECT @hist = @@IDENTITY								
	
				UPDATE [dbo].[_Czynność 1_Cechy_Hist]
				SET ValidFrom = @WaznyodNEW
				,[CreatedBy] = @UtworzonyPrzezNEW
				--,[ObowiazujeOd] = @MinDate
				--,[ObowiazujeDo] = @NewObowiazujeDo
				,LastModifiedOn = NULL
				,LastModifiedBy = NULL
				,CreatedOn = ISNULL(@DataModyfikacjiApp, @WaznyodNEW)
				,RealCreatedOn = ISNULL(@RealLastModifiedOn, @RealCreatedOn)
				,RealDeletedFrom = NULL
				,RealLastModifiedOn = NULL
				,IdArchLink = @hist
				,IdArch = NULL
				WHERE ID = @ID
			END
			ELSE IF (@ObowiazujeOd = @NewObowiazujeOd AND @OldLastModifiedOn >= @MinDate AND @OldLastModifiedOn <= @MaxDate) --zapis cech na podstawie przedzialow czasowych
			BEGIN
									
				--sprawdzenie czy data ostatniej modyfikacji miesci sie w przedziale czasowym wg nowej daty modyfikacji, jesli tak to tylko update rekordu
				--bez tworzenia wpisow historycznych
				UPDATE [dbo].[_Czynność 1_Cechy_Hist]
				SET ValidFrom = @DataModyfikacjiApp
				,[CreatedBy] = @UtworzonyPrzezNEW
				WHERE ID = @ID
			
			END
		END
	
		FETCH NEXT FROM cur_ObiektInst_Cechy_UPDATE INTO @ID, @ObiektID, @CechaID, @ValInt, @ValString, @ValFloat, @ValBit, @ValDecimal, @ValDatetime, @ValDate, @ValTime, 
			@ValDictionary, @ValXml, @ValRef, @WaznyOd, @UtworzonyPrzez, @IdArchLink, @ObowiazujeOD, @ObowiazujeDo, @UIOrder, @Priority, @VirtualTypeId, @IsValidForAlgorithm, 
			@CalculatedByAlgorithm, @AlgorithmRun, @OldLastModifiedOn, @IsStatus, @StatusS, @StatusP, @StatusW, @StatusSBy, @StatusPBy, @StatusWBy, @StatusSFrom, @StatusPFrom, 
			@StatusWFrom, @IsAlternativeHistory, @IsMainHistFlow, @CreatedOn, @LastModifiedOn, @ZmienionyPrzez
	END
	
	CLOSE cur_ObiektInst_Cechy_UPDATE
	DEALLOCATE cur_ObiektInst_Cechy_UPDATE	
END	
GO
DISABLE TRIGGER [dbo].[WartoscZmiany_Del_Czynność 1_Cechy_Hist_20130509T13:49:04_UPDATE]
    ON [dbo].[_Del_Czynność 1_Cechy_Hist_20130509T13:49:04];

