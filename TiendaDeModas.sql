CREATE TABLE TipoVestido(
IdTipoVestido INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Descripcion VARCHAR(50)
);
CREATE TABLE Vestidos(
IdVestido INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Imagen VARCHAR(500),
NombreVestido VARCHAR(50),
Descripcion VARCHAR(500),
ValorAlQ VARCHAR(8),
ValorVest VARCHAR(8),
IdTipoVestido INT NOT NULL,
CONSTRAINT FK_TipoVestido FOREIGN KEY (IdTipoVestido) REFERENCES TipoVestido (IdTipoVestido)
);

CREATE TABLE Clientes(
IdCliente INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(25),
CorreoElectronico VARCHAR(50),
Telefono VARCHAR(12)
);

CREATE TABLE TipoPedido(
IdTipoPedido INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Descripcion VARCHAR(20)
);

CREATE TABLE Pedido(
IdPedido INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
IdVestido INT NOT NULL,
IdTipoVestido INT NOT NULL,
IdCliente INT NOT NULL,
IdTipoPedido INT NOT NULL,
Fecha VARCHAR(15),
Estado INT NOT NULL,
Mensaje VARCHAR(500),
ValorContraOferta VARCHAR(8) NULL,
CONSTRAINT FK_Vestido FOREIGN KEY (IdVestido) REFERENCES Vestidos (IdVestido),
CONSTRAINT FK_TpVestido FOREIGN KEY (IdTipoVestido) REFERENCES TipoVestido (IdTipoVestido),
CONSTRAINT FK_Cliente FOREIGN KEY (IdCliente) REFERENCES Clientes (IdCliente),
CONSTRAINT FK_TipoPedido FOREIGN KEY (IdTipoPedido) REFERENCES TipoPedido (IdTipoPedido)
);