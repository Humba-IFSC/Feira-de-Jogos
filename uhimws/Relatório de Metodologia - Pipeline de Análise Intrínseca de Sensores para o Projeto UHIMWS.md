
## 1.0 Introdução

O projeto da Mini-Estação Meteorológica para Ilhas de Calor Urbano, ou UHIMWS (_Urban Heat Island Meteorological Weather Station_), tem como objetivo desenvolver um sistema robusto e preciso para monitoramento microclimático. O sucesso da versão de produção deste equipamento depende diretamente da seleção rigorosa de seus componentes, sendo o sensor de temperatura a peça mais crítica. A qualidade, estabilidade e confiabilidade deste componente impactam diretamente a validade de todos os dados coletados e, consequentemente, a credibilidade do projeto como um todo.

O objetivo primário deste documento é descrever formalmente a metodologia de **Análise de Dados Intrínsecos (ADI)** e o pipeline de software associado, que foram desenvolvidos para validar e ranquear um conjunto de 12 sensores candidatos. Esta abordagem sistemática foi concebida para assegurar um processo de validação robusto, auditável e reprodutível, estabelecendo uma base técnica sólida que pode ser utilizada para suportar uma futura aplicação de registro de patente do sistema UHIMWS.

A seguir, serão detalhados os princípios fundamentais que norteiam a metodologia de ADI e os componentes analíticos que a constituem.

## 2.0 Fundamentos da Metodologia de Análise de Dados Intrínsecos (ADI)

A decisão estratégica de adotar uma abordagem de análise "intrínseca primeiro" fundamenta-se na necessidade de estabelecer uma linha de base objetiva para a qualidade de cada sensor. Ao avaliar os componentes unicamente com base nos dados que eles próprios geram, eliminamos variáveis externas e focamos exclusivamente em suas características operacionais inerentes. Este método permite identificar falhas, instabilidades e ruídos que são próprios do hardware, antes de qualquer comparação com um padrão de referência externo. Essa avaliação inicial é crucial para garantir que apenas os sensores mais confiáveis e estáveis avancem para as fases subsequentes de validação.

A metodologia de ADI foi estruturada para responder a três perguntas críticas sobre o desempenho de cada sensor:

- **Qual sensor é mais estável e apresenta menos flutuações (ruído) em suas leituras?** (Análise de Precisão)
- **Qual sensor é mais suscetível a gerar leituras anômalas, como picos e vales absurdos?** (Análise de Ruído e Outliers)
- **Qual sensor opera de forma mais consistente, com menos falhas de leitura?** (Análise de Confiabilidade)

Para responder a estas questões de forma abrangente, a ADI é composta por quatro análises específicas e complementares, que juntas formam um framework de avaliação completo.

## 3.0 Componentes da Análise e Métricas de Avaliação

Esta seção detalha os quatro componentes analíticos que constituem a metodologia ADI. Cada componente foi projetado para investigar um aspecto específico da qualidade do sensor, empregando métricas e processos de execução distintos para garantir uma avaliação completa e multifacetada do desempenho de cada candidato.

### 3.1 Análise de Estabilidade (Precisão)

- **Objetivo:** Quantificar a precisão intrínseca de cada sensor, medindo a estabilidade de suas leituras para avaliar o nível de ruído eletrônico inerente.
- **Métrica:** **Desvio Padrão Médio (std)** das leituras de temperatura. Um valor mais baixo nesta métrica indica flutuações menores e, portanto, maior estabilidade e precisão.
- **Execução:** O processo consiste em agrupar os dados em janelas de tempo fixas (2, 3 e 5 minutos). Para cada janela, o desvio padrão das medições é calculado. A métrica final é a média de todos os desvios padrão calculados ao longo do período de análise.
- **Resultados:** A tabela abaixo apresenta os resultados consolidados, ordenados do sensor mais estável para o menos estável com base na janela de 2 minutos.

**Tabela 1: Resultados Consolidados de Estabilidade**

|   |   |   |   |
|---|---|---|---|
|Sensor|STD Médio (2min)|STD Médio (3min)|STD Médio (5min)|
|temp.bmp280|0.0058|0.0067|0.0082|
|temp.bmp388|0.0059|0.0071|0.0088|
|temp.bmp180|0.0060|0.0091|0.0124|
|temp.bme280|0.0063|0.0075|0.0093|
|temp.dht11|0.0076|0.0098|0.0149|
|temp.lm35dz|0.0085|0.0109|0.0146|
|temp.aht10|0.0131|0.0157|0.0208|
|temp.dht22|0.0132|0.0154|0.0186|
|temp.aht25|0.0141|0.0160|0.0187|
|temp.mcp9808|0.0216|0.0246|0.0275|
|temp.ds18b20|0.0216|0.0257|0.0300|
|temp.lm75|0.0675|0.0728|0.0767|

### 3.2 Análise de Disponibilidade (Confiabilidade)

- **Objetivo:** Medir a confiabilidade operacional de cada sensor, quantificando sua capacidade de fornecer dados de forma contínua e sem falhas ao longo do tempo.
- **Métrica:** **Taxa de Falha**, calculada como a porcentagem de pontos de dados ausentes (NaNs). Um valor mais baixo significa maior confiabilidade.
- **Execução:** O processo envolve a contagem de todas as leituras ausentes no conjunto de dados brutos (antes de qualquer limpeza) para cada sensor e o cálculo dessa contagem como uma porcentagem do número total de medições esperadas.

**Tabela 2: Resultados da Análise de Disponibilidade**

|   |   |
|---|---|
|Sensor|Taxa de Falha (%)|
|temp.bmp280|0.00%|
|temp.bmp388|0.00%|
|temp.bmp180|0.00%|
|temp.bme280|0.00%|
|temp.dht11|0.00%|
|temp.lm35dz|0.00%|
|temp.aht10|0.00%|
|temp.dht22|0.00%|
|temp.aht25|0.00%|
|temp.mcp9808|0.00%|
|temp.ds18b20|0.00%|
|temp.lm75|0.00%|

Para o período de análise, todos os 12 sensores demonstraram máxima confiabilidade operacional, sem registrar nenhuma falha de leitura.

### 3.3 Análise de Distribuição e Outliers

- **Objetivo:** Examinar a distribuição estatística geral das leituras de temperatura de cada sensor e identificar visualmente a presença e a frequência de _outliers_—leituras que se desviam significativamente do comportamento padrão.
- **Método:** **Gráficos de Boxplot**.
- **Execução e Interpretação:** Um gráfico de boxplot é gerado para cada sensor, ilustrando visualmente a mediana (linha central), o intervalo interquartil (a "caixa", representando 50% dos dados) e os pontos de dados considerados _outliers_. Sensores que apresentam uma "caixa" muito longa indicam alta variabilidade, enquanto um número excessivo de _outliers_ pode sugerir menor confiabilidade ou maior suscetibilidade a interferências.

### 3.4 Análise de Variação Súbita (Ruído Dinâmico)

- **Objetivo:** Identificar e quantificar a ocorrência de variações de temperatura irrealistas e abruptas que ocorrem em curtos intervalos de tempo. Esta análise dinâmica oferece uma avaliação de ruído mais robusta do que a detecção estática de _outliers_, pois considera o comportamento temporal dos dados.
- **Métrica:** **Contagem de Picos de Ruído**, que corresponde ao número de vezes que a variação entre medições consecutivas excede limiares pré-definidos.
- **Execução:** Utilizando a maior resolução de dados disponível (agregada em 2 minutos), a análise calcula a diferença entre cada medição consecutiva. Em seguida, é aplicado um **Teste Hierárquico de Limiares** para classificar a severidade do ruído detectado:
    - **Limiar Básico (0.1°C):** Projetado para capturar ruído eletrônico de baixa intensidade e flutuações mínimas.
    - **Limiar Robusto (0.5°C):** Identifica picos de interferência ou falhas operacionais. Uma variação de 0.5°C em um intervalo de 2 minutos é considerada ambientalmente improvável e, portanto, um forte indicador de anomalia.
    - **Limiar Extremo (1.0°C):** Sinaliza falhas críticas de hardware ou _glitches_ significativos no sensor.

A principal métrica de ranqueamento para esta análise é a contagem de picos que excedem o **Limiar Robusto (0.5°C)**. A execução automatizada e integrada dessas quatro análises é garantida pelo pipeline de software desenvolvido especificamente para este projeto.

## 4.0 Pipeline de Software: Automação e Evolução da Implementação

O pipeline de software, desenvolvido em Python, é o componente central que garante a robustez, escalabilidade e auditabilidade de toda a metodologia ADI. Seu desenvolvimento foi um processo iterativo, focado em transformar uma análise exploratória inicial em um processo de validação profissional e automatizado, culminando em relatórios de alta qualidade.

A evolução da implementação pode ser dividida nas seguintes etapas principais:

1. **Extração e Preparação Inicial:** A primeira versão do script estabeleceu a funcionalidade básica de se conectar ao banco de dados InfluxDB, executar uma consulta em linguagem Flux para extrair os dados brutos e utilizar a função `pivot()` para estruturar os dados, organizando as leituras de cada sensor em colunas separadas. Esta etapa foi fundamental para criar uma base de dados limpa e pronta para análise.
2. **Introdução da Análise Multi-Janela:** O pipeline foi aprimorado para executar a análise de estabilidade e a geração de boxplots de forma automática através de múltiplas janelas de tempo (2, 3 e 5 minutos). Esta funcionalidade aumentou a robustez dos resultados, permitindo testar a sensibilidade e a consistência das conclusões em diferentes resoluções temporais.
3. **Implementação da Análise de Variação Súbita:** Para aprofundar a investigação sobre ruído, foi criada a função `analisar_variacao_subita`, que implementa o Teste Hierárquico de Limiares. Esta adição sofisticou a análise, permitindo a contagem e a classificação de picos de ruído com base em sua severidade (0.1°C, 0.5°C e 1.0°C), fornecendo uma visão dinâmica e mais precisa da performance dos sensores.
4. **Geração de Relatórios Automatizados:** A fase final do desenvolvimento concentrou-se em transformar as saídas numéricas em relatórios profissionais e compartilháveis. O script foi equipado com a capacidade de gerar dinamicamente um relatório HTML completo e autônomo. Os gráficos são criados com a biblioteca Plotly e convertidos em imagens estáticas para serem embutidos diretamente no HTML, garantindo que o arquivo seja independente. Em seguida, a biblioteca WeasyPrint é utilizada para converter este relatório HTML em um documento PDF de alta fidelidade, com layout otimizado para comparação e legibilidade.

O pipeline totalmente desenvolvido oferece uma solução completa e _end-to-end_, transformando dados brutos do sensor em relatórios analíticos detalhados com mínima intervenção manual.

## 5.0 Conclusão e Próximos Passos

A conclusão da **Fase 1: Análise de Dados Intrínsecos (ADI)** foi bem-sucedida. A metodologia desenvolvida e o pipeline de software automatizado forneceram um framework objetivo, documentado e reprodutível para avaliar e ranquear os 12 sensores candidatos com base em suas características de qualidade intrínseca, como estabilidade, confiabilidade e suscetibilidade a ruído.

Os relatórios gerados fornecem à equipe de engenharia uma base de dados quantitativa para selecionar, com alta confiança, os sensores de melhor desempenho. Esses componentes, que demonstraram maior estabilidade e confiabilidade nesta fase rigorosa de testes, são agora considerados "pré-aprovados".

O próximo passo lógico no cronograma do projeto é avançar com esses sensores selecionados para a **Fase 2: Análise de Dados Extrínsecos**. Nesta nova fase, o desempenho dos sensores pré-aprovados será comparado com dados de fontes de referência externas para validar sua acurácia em condições reais de operação.