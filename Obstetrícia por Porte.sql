WITH consulta as (
	SELECT 
	tabela_dimensao."GR_MODALIDADE",tabela_dimensao."PORTE_OPERADORA",
	tabela_dimensao."VIGENCIA_PLANO",tabela_dimensao."CONTRATACAO",
	tabela_dimensao."SGMT_ASSISTENCIAL",tabela_dimensao."TIPO_FINANCIAMENTO",
	tabela_dimensao."ABRANGENCIA_COBERTURA",tabela_dimensao."ACOMODACAO_HOSPITALAR",
	tabela_dimensao."FATOR_MODERADOR",tabela_dimensao."LIVRE_ESCOLHA",tabela_dimensao."OBSTETRICIA",
	tabela_fato."NM_MUNICIPIO_X",tabela_fato."SG_UF",
	tabela_fato."NM_REGIAO"

	FROM
		"pda-008-caracteristicas_produtos_saude_suplementar" as tabela_dimensao
	INNER JOIN
		pda_area_comer_plano_ntrp as tabela_fato
	ON
		tabela_dimensao."ID_PLANO" = tabela_fato."ID_PLANO"

)
SELECT
	"OBSTETRICIA","PORTE_OPERADORA",COUNT("OBSTETRICIA")
FROM
	consulta
WHERE
	"OBSTETRICIA" NOT IN ('Não Identificado','Não se Aplica')
	AND "PORTE_OPERADORA" != 'Sem beneficiários'
GROUP BY
	"PORTE_OPERADORA","OBSTETRICIA"