-- 1. Estou concentrando minha renda fixa em algum indexador específico?
-- Risco de concentração — ex: tudo em IPCA pode ser ruim se a inflação cair.
SELECT
    indexador,
    SUM(valor_atualizado_curva) AS valor_total,
    COUNT(*)                    AS qtd_titulos
FROM posicao_renda_fixa
WHERE year = '2025' AND month = '02'
GROUP BY indexador
ORDER BY valor_total DESC;

-- 2. Minha renda passiva de proventos está crescendo mês a mês?
-- Tendência de crescimento (ou queda) do valor da carteira.
SELECT
    year,
    month,
    SUM(valor_liquido) AS total_proventos
FROM proventos_recebidos
GROUP BY year, month
ORDER BY year, month;

-- 3. Tenho títulos do Tesouro com valor bruto muito acima do aplicado — onde está meu maior ganho?
-- Identifica qual posição está mais valorizada em termos absolutos.
SELECT
    produto,
    vencimento,
    valor_aplicado,
    valor_bruto,
    valor_bruto - valor_aplicado AS ganho_absoluto
FROM posicao_tesouro_direto
WHERE year = '2025' AND month = '02'
ORDER BY ganho_absoluto DESC;

-- 4. Em quais ativos estou pagando preço médio de compra acima do preço médio de venda?
-- Sinal de que possivelmente comprou caro e vendeu barato — trade desfavorável.
SELECT
    codigo_de_negociacao,
    preco_medio_compra,
    preco_medio_venda,
    preco_medio_compra - preco_medio_venda AS diferenca
FROM negociacoes
WHERE year = '2025'
  AND preco_medio_venda > 0
  AND preco_medio_compra > preco_medio_venda
ORDER BY diferenca DESC;