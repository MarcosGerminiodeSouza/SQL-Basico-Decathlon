1.Quais são os nomes dos produtos vendidos?
	select  distinct pr.id_produto,pr.nom_produto 
	from 	produto_nota_fiscal as pnf,
			produto as pr
	where	pnf.id_produto = pr.id_produto
	order by pr.nom_produto 

2.Qual o nome dos clientes que compram na loja?
	select nf.id_nota_fiscal, c.nom_cliente
	from	nota_fiscal as nf,
			cliente as c
	where nf.id_cliente=c.id_cliente
	order by c.nom_cliente
3.Qual a cidade vende mais?
	select	ci.nom_cidade,
			sum(pf.qnt_produto_nota_fiscal*pf.vlr_unt_produto_nota_fiscal) as ValorTotal
	from	nota_fiscal as nf,
			cliente as cli,
			cidade as ci,
			produto_nota_fiscal as pf
	where	ci.id_cidade = cli.id_cidade and
			nf.id_cliente = cli.id_cliente and 
			nf.id_nota_fiscal = pf.id_nota_fiscal
	order by ValorTotal desc
4.Quais os nomes dos produtos em estoque?
	select	p.nom_produto, es.qnt_estoque
	from	produto as p,
			estoque as es
	where p.id_produto=es.id_produto
	order by p.nom_produto
5.Quais os nomes das categorias de produtos de entrada?
	select  distinct nom_categoria
	from	categoria as cat,
			produto as p,
			produto_entrada as pe
	where	p.id_categoria=cat.id_categoria and
			p.id_produto=pe.id_produto
6.Quais os nomes dos fornecedores e nomes das categoria de entrada?
	select	nom_fornecedor,
			nom_categoria
	from	fornecedor as f,
			entrada as en,        
			produto_entrada as pen,
			produto as p,
			categoria as c
	where	en.id_fornecedor = f.id_fornecedor	and
			en.id_entrada = pen.id_entrada		and
			pen.id_produto = p.id_produto		and
			p.id_categoria = c.id_categoria
			
7.Qual o valor total de venda por cliente?
	select  cli.nom_cliente,	
			sum(pnf.qnt_produto_nota_fiscal*pnf.vlr_unt_produto_nota_fiscal) as ValorVenda
	from 	cliente as cli,
			nota_fiscal as nf,
			produto_nota_fiscal as pnf
	where 	nf.id_cliente = cli.id_cliente and
			nf.id_nota_fiscal = pnf.id_nota_fiscal
	group by cli.nom_cliente        
	order by ValorVenda desc        

------------Básico----------------
--JOIN(INNER, LEFT, RIGHT e FULL)
Premissas:
	Tabela produto tem todos os produtos

8.Listar produto NF e estoque que tem nas duas tabelas	(inner join..on)
	select pnf.id_produto, es.qnt_estoque
	from 		estoque es
	inner join 	produto_nota_fiscal as pnf
	on pnf.id_produto = es.id_produto
	
9.Listar produto NF e estoque que tem na tabela estoque (left join..on)		
	select pnf.id_produto, es.qnt_estoque
	from 		estoque es
	left join 	produto_nota_fiscal as pnf
	on pnf.id_produto = es.id_produto	
9.Listar produto NF e estoque que tem na tabela PNF (left join..on - com is not null)		
	select pnf.id_produto, es.qnt_estoque
	from 		estoque es
	left join 	produto_nota_fiscal as pnf
	on pnf.id_produto = es.id_produto
	where pnf.id_produto is not null
10.Listar produto NF e estoque que TEM na tabela PNF (right join..on)		
	select pnf.id_produto, es.qnt_estoque
	from 		estoque es
	right join 	produto_nota_fiscal as pnf
	on pnf.id_produto = es.id_produto
10.Listar produto NF e estoque que TEM nas duas tabelas (cross join..on)		
	select pnf.id_produto, es.qnt_estoque
	from 		estoque es
	cross join 	produto_nota_fiscal as pnf
	on pnf.id_produto = es.id_produto
