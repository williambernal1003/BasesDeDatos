USE UmbitanaDeLechesOC
CREATE TABLE Ruta(
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Descripcion VARCHAR(50)
);
CREATE TABLE Vereda(
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Descripcion VARCHAR(50)
);

CREATE TABLE TipoProductor(
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Descripcion VARCHAR(100) NOT NULL,
ValorLitro DECIMAL(6,2)
);

CREATE TABLE Productores(
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Apellido VARCHAR(20) NOT NULL,
NumDocumento VARCHAR(200) NOT NULL,/*Va encriptado*/
FechaExpedicion VARCHAR(200) NOT NULL,/*Va encriptado*/
Coordenadas VARCHAR(80) NOT NULL,
IdVereda INT NOT NULL,
IdTipoProd INT NOT NULL,
Orden INT,
CONSTRAINT FK_Vereda FOREIGN KEY (IdVereda) REFERENCES Vereda (Id),
CONSTRAINT FK_TipoProd FOREIGN KEY (IdTipoProd) REFERENCES TipoProductor (Id)
);

CREATE TABLE Transportador(
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Apellido VARCHAR(20) NOT NULL,
NumDocumento VARCHAR(200) NOT NULL,/*Va encriptado*/
FechaExpedicion VARCHAR(200) NOT NULL,/*Va encriptado*/
PlacaVehiculo VARCHAR(10) NOT NULL,
Coordenadas VARCHAR(80) NOT NULL,
IdRuta INT NOT NULL
CONSTRAINT FK_Ruta FOREIGN KEY (IdRuta) REFERENCES Ruta (Id)
);

CREATE TABLE ProduccionL(
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Cantidad INT,
FechaEntrega VARCHAR(20) NOT NULL,/*DD/MM/AA*/
IdProductor INT NOT NULL,
IdTrans INT NOT NULL,
Estado INT NOT NULL, /*1 Pagado. 0 Sin pagar*/
CONSTRAINT FK_Productor FOREIGN KEY (IdProductor) REFERENCES Productores (Id),
CONSTRAINT FK_Trans FOREIGN KEY (IdTrans) REFERENCES Transportador (Id)
);


CREATE TABLE Menu(
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Icono VARCHAR(20) NOT NULL,
Descripcion VARCHAR(20) NOT NULL,
PathMenu VARCHAR(300),
IdTipoPersona INT NOT NULL
);

CREATE TABLE Reporte(
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FechaSolicitaReporte VARCHAR(15) NOT NULL,
FechaIncidencia VARCHAR(15) NOT NULL,
Observacion VARCHAR(400),
Respuesta VARCHAR(400) NULL,
IdProductor INT NOT NULL,
IdProduccion INT NOT NULL, /*fORANEA haciendo referencia a el i9d de la emtrega produccion litros*/
IdTransportador INT NOT NULL,
CONSTRAINT FK_PRODUCTOR FOREIGN KEY (IdProductor) REFERENCES Productores(Id),
CONSTRAINT FK_Produccion FOREIGN KEY (IdProduccion) REFERENCES ProduccionL (Id),
CONSTRAINT FK_Transportador FOREIGN KEY (IdTransportador) REFERENCES Transportador (Id)
);


/*
DECLARE @Tale TABLE(Id INT, Cantidad INT);
INSERT INTO @Tale(Id,Cantidad) SELECT pl.Id, pl.Cantidad FROM ProduccionL pl WHERE pl.IdProductor = 3
DECLARE @Count INT = (SELECT COUNT(*) FROM @Tale);
WHILE @Count > 0
BEGIN
DECLARE @CANT INT = (SELECT TOP(1) Cantidad FROM @Tale ORDER BY Id);
DECLARE @Id INT = (SELECT TOP(1) Id FROM @Tale ORDER BY Id);
PRINT  @CANT
DELETE @Tale WHERE @Id = Id
SET @Count = (SELECT COUNT(*) FROM @Tale);
END
*/

