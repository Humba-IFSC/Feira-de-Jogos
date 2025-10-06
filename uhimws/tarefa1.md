### **Tarefa: Análise Intrínseca de Sensores de Temperatura (V1) e Desenvolvimento de Dashboard de Resultados**

- **Para:** Beatriz e Germano - Bolsistas de Engenharia de Telecomunicações
- **De:** Humberto Luz Oliveira
- **Data de Emissão:** 07/10/2025
- **Prazo de Entrega:** 10/10/2025

---

### **1. Objetivo Geral**

Bem-vinda(o) ao projeto UHIMWS! Sua missão será realizar a **Fase 1: Análise de Dados Intrínsecos (ADI)** nos dados coletados pela primeira versão (V1) dos nossos sensores de temperatura. O objetivo é avaliar a performance individual de cada sensor, ranqueá-los com base em critérios de qualidade e apresentar os resultados de forma clara e interativa através de um dashboard.

Este trabalho é fundamental para a seleção dos componentes mais confiáveis para a versão de produção da nossa estação meteorológica.

### **2. Contexto do Projeto**

Conforme detalhado no **Relatório de Metodologia ADI**, a validação de um sensor não se baseia apenas em sua exatidão, mas também em sua estabilidade, confiabilidade e robustez a ruídos. A análise intrínseca é o primeiro e mais importante filtro do nosso processo de validação, pois nos permite identificar problemas inerentes ao hardware de cada sensor antes de compará-los com fontes externas.

Seu trabalho seguirá rigorosamente a metodologia descrita, respondendo às três perguntas críticas:
1.  **Estabilidade/Precisão:** Qual sensor é mais estável e apresenta menos ruído?
2.  **Ruído/Outliers:** Qual sensor é mais propenso a gerar leituras anômalas?
3.  **Confiabilidade:** Qual sensor opera de forma mais consistente e com menos falhas?

### **3. Fonte de Dados**

*   **Sistema:** Banco de Dados InfluxDB
*   **Bucket:** `uhimws_v1_data` (ou nome a ser confirmado)
*   **Measurement:** `temperature_sensors` (ou nome a ser confirmado)
*   **Período de Análise:** **21 de Agosto de 2025, 00:00:00** até **31 de Agosto de 2025, 23:59:59** (10 dias completos).
*   **Credenciais de Acesso:** Serão fornecidas separadamente.

### **4. Roteiro de Análise (Passo a Passo)**

Você tem liberdade para escolher a linguagem de programação que preferir (Python ou R são altamente recomendados devido às excelentes bibliotecas de análise de dados e visualização). O roteiro abaixo descreve as etapas lógicas da análise.

#### **Passo 0: Conexão e Preparação dos Dados**

1.  **Conexão:** Utilize a biblioteca cliente do InfluxDB para sua linguagem escolhida para se conectar ao banco de dados.
2.  **Extração:** Crie uma query (em Flux ou InfluxQL) para extrair todos os dados de temperatura do período especificado.
3.  **Estruturação:** Transforme os dados do formato "long" (típico de time-series) para o formato "wide". O objetivo é ter um DataFrame onde o índice é o timestamp e cada coluna representa um sensor diferente (ex: `temp_bmp280`, `temp_dht22`, etc.). A função `pivot()` em Flux é ideal para isso.

#### **Passo 1: Análise de Estabilidade (Precisão)**

*   **Objetivo:** Quantificar o ruído eletrônico inerente de cada sensor.
*   **Métrica Principal:** **Desvio Padrão Médio (std)**.
*   **Implementação:**
    1.  Para cada sensor (coluna), agrupe os dados em janelas de tempo. Recomendo seguir a metodologia e usar janelas de **2, 3 e 5 minutos**.
    2.  Calcule o desvio padrão das leituras de temperatura dentro de cada janela.
    3.  Calcule a média de todos os desvios padrão obtidos para cada sensor.
    4.  O resultado final será uma tabela, como a "Tabela 1" do relatório de metodologia, ranqueando os sensores do mais estável (menor std médio) para o menos estável.

#### **Passo 2: Análise de Disponibilidade (Confiabilidade)**

*   **Objetivo:** Medir a consistência operacional e a frequência de falhas de cada sensor.
*   **Métrica Principal:** **Taxa de Falha (%)**.
*   **Implementação:**
    1.  No DataFrame original (antes de qualquer limpeza), conte o número de valores ausentes (`NaN`, `null`, etc.) para cada sensor.
    2.  Calcule o número total de medições esperadas no período.
    3.  A Taxa de Falha é `(Número de Falhas / Total de Medições Esperadas) * 100`.
    4.  Apresente os resultados em uma tabela simples, como a "Tabela 2" do relatório.

#### **Passo 3: Análise de Distribuição e Outliers**

*   **Objetivo:** Visualizar a distribuição dos dados e identificar a presença de leituras anômalas.
*   **Método:** **Gráficos de Boxplot**.
*   **Implementação:**
    1.  Gere um boxplot para cada sensor, mostrando a distribuição completa das leituras de temperatura durante os 10 dias.
    2.  Organize os boxplots em um único gráfico comparativo para facilitar a visualização. Sensores com "caixas" (intervalo interquartil) muito longas ou com muitos pontos fora dos "bigodes" (outliers) são menos desejáveis.

#### **Passo 4: Análise de Variação Súbita (Ruído Dinâmico)**

*   **Objetivo:** Detectar picos de ruído e variações irrealistas que a análise de estabilidade pode não capturar.
*   **Métrica Principal:** **Contagem de Picos de Ruído** (acima do limiar robusto).
*   **Implementação:**
    1.  Para cada sensor, calcule a diferença absoluta entre cada medição consecutiva (`diff().abs()`).
    2.  Implemente o **Teste Hierárquico de Limiares**:
        *   Conte quantas vezes essa diferença excedeu **0.1°C** (Limiar Básico).
        *   Conte quantas vezes essa diferença excedeu **0.5°C** (Limiar Robusto).
        *   Conte quantas vezes essa diferença excedeu **1.0°C** (Limiar Extremo).
    3.  Crie uma tabela de resultados que mostre a contagem para cada limiar por sensor. O principal critério de ranqueamento aqui será a contagem no **Limiar Robusto (0.5°C)**.

### **5. Entregáveis**

1.  **Código-Fonte:** Um script ou notebook (ex: Jupyter Notebook) bem documentado e organizado, contendo todo o processo de extração, análise e geração de visualizações. O código deve ser claro o suficiente para que outra pessoa possa executá-lo e reproduzir seus resultados.
2.  **Dashboard Interativo:** Uma aplicação web simples ou um arquivo HTML autônomo que apresente os resultados de forma clara. Sugestões de ferramentas: **Streamlit** ou **Dash** (Python), **Shiny** (R). O dashboard deve conter:
    *   Um ranking geral dos sensores.
    *   As tabelas de resultados para as análises de Estabilidade, Disponibilidade e Variação Súbita.
    *   O gráfico comparativo de Boxplots.
    *   (Opcional, mas recomendado) Gráficos de série temporal que permitam selecionar e visualizar os dados brutos de um ou mais sensores.
3.  **Relatório Resumido (1-2 páginas):** Um breve documento em formato Markdown ou PDF resumindo:
    *   A metodologia aplicada (brevemente).
    *   Os principais resultados e o ranking final dos sensores.
    *   Suas conclusões e recomendações sobre quais sensores devem avançar para a Fase 2.
    *   Quaisquer desafios ou observações inesperadas durante a análise.

### **6. Ferramentas e Dicas**

*   **Linguagem:** Python é recomendado.
    *   **Bibliotecas Essenciais:** `pandas` (manipulação de dados), `influxdb_client` (conexão com o banco), `plotly` ou `matplotlib`/`seaborn` (visualização), `streamlit` ou `dash` (dashboard).
*   **Boas Práticas:**
    *   Comece explorando um pequeno subconjunto dos dados para agilizar o desenvolvimento.
    *   Escreva funções modulares para cada tipo de análise. Isso torna o código mais limpo e reutilizável.
    *   Comente seu código, explicando o "porquê" de cada etapa.
    *   Para um aprofundamento teórico, consulte o documento de **Fundamentação Científica** para entender melhor conceitos como ruído, estabilidade e a importância de cada métrica.

### **7. Resultados Desejáveis

- **Desejável um Dashboard que tenha uma apresentação de resultados no formato de tabelas e gráficos dos sensores que
que coletaram dados da mini-estação V.1.
- [Relatório de Análise Intrínseca de Sensores](https://humba-ifsc.github.io/Feira-de-Jogos/uhimws/analise-sensores.html)
- [Documentação de Apoio](https://github.com/Humba-IFSC/Feira-de-Jogos/tree/main/uhimws)
  
Estou à disposição para esclarecer qualquer dúvida. Bom trabalho
