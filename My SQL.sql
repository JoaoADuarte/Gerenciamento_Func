create database newdb;
use newdb;


 /*
 Criação da tabela de funcionários, cada funcionário é identificado
 por um código único, tem um nome e uma função na empresa. 
 */

-- Tabela Funcionários
CREATE TABLE Funcionarios (
    funcionarioID INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    funcao VARCHAR(50) NOT NULL
);

/*
Cada tarefa tem um identificador único, uma descrição, uma data de início,
uma data de conclusão prevista e um status (pendente, em andamento, concluída).
*/

-- Tabela Tarefas
CREATE TABLE Tarefas (
    tarefaID INT PRIMARY KEY,
    descricao TEXT NOT NULL,
    data_inicio DATE NOT NULL,
    data_inclusao_prevista DATE NOT NULL,
        status ENUM('Pendente', 'Em andamento', 'Concluída') DEFAULT 'Pendente'
);


/*
Atribuimos uma ou mais tarefas a um funcionário
*/
-- Tabela de Atribuição de Tarefas
CREATE TABLE AtribuiçaoTarefas (
    atribuicaoID INT PRIMARY KEY,
    funcionarioID INT,
    tarefaID INT,
        FOREIGN KEY (funcionarioID) REFERENCES Funcionarios(funcionarioID),
    FOREIGN KEY (tarefaID) REFERENCES Tarefas(tarefaID)
);

/*
Deveremos tornar possível atualizar o status de uma tarefa para indicar se ela está em andamento ou concluída.
 Algumas tarefas podem depender do término de outras. Portanto, isso deve ser registrado.
*/

-- Tabela de Dependências de Tarefas
CREATE TABLE DependenciasTarefas (
    dependenciaID INT PRIMARY KEY,
    tarefaID_dependente INT,
    tarefaID_dependencia INT,
        FOREIGN KEY (tarefaID_dependente) REFERENCES Tarefas(tarefaID),
		FOREIGN KEY (tarefaID_dependencia) REFERENCES Tarefas(tarefaID)
);
