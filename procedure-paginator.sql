DELIMITER //
CREATE PROCEDURE prc_pearpage(tabela VARCHAR(12), coluna VARCHAR(120), ordem CHAR(4), porpagina INT, pagina INT)
BEGIN
    DECLARE de INT;
    DECLARE ate INT;
    SET ate = porpagina * pagina;
    SET de = (ate - pagina)+1;

	SET @sqlStatement = concat("SELECT * FROM ",tabela," ORDER BY ",coluna," ",ordem," LIMIT ",de,",",ate);
	PREPARE stmt FROM @sqlStatement;
	EXECUTE stmt;
END; //
DELIMITER ;

/*
Para utilizar a PROCEDURE, basta digitar o comando
CALL prc_pearpage(<<tabela>>, <<coluna_para_ordenar>>,<<tipo: 'DESC' ou 'ASC'>>, <<pagina>>, <<quantidade_por_pagina>>);
*/
#Exemplo:
CALL prc_pearpage('usuarios', 'nome', 'DESC', 3, 10);
