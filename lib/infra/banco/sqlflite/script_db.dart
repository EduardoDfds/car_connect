final criarBanco = [
  '''
    CREATE TABLE carro (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      placa TEXT NOT NULL
    )
  ''',
  '''CREATE TABLE cliente (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      cnh TEXT NOT NULL
      )
  ''',
  '''CREATE TABLE locacao (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      dataInicio TEXT NOT NULL,
      dataFim TEXT NOT NULL,
      carro_id INTEGER NOT NULL,
      cliente_id INTEGER NOT NULL,
      FOREIGN KEY(carro_id) REFERENCES carro(id),
      FOREIGN KEY(cliente_id) REFERENCES carro(id)
    )
  '''
];
