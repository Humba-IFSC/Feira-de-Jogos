
## Guia Passo a Passo para o Download de Dados Meteorológicos Mensais do INMET
![[Mapa_INMET.png]]
- **Link**: [Dados Meteorológicos INMET](https://www.youtube.com/watch?v=8M1hZt-vT0E)
### 1. Acesso ao Portal e Início da Requisição

O primeiro passo é navegar até a área correta do portal do INMET:

1. **Acesse o Portal do INMET:** Use seu navegador para acessar o portal.
2. **Navegue até o Banco de Dados:** Dentro do site, procure e clique em "**dados meteorológicos**" e, em seguida, em "**banco de dados meteorológicos**".
3. **Prossiga:** O portal pode apresentar informações iniciais (como a opção de download imediato de pacotes anuais de estações automáticas), mas para a nossa requisição personalizada de dados mensais, você deve clicar em "**prosseguir**".

### 2. Configuração e Seleção do Tipo de Dados

Nesta etapa, você define onde e como deseja receber os dados:

1. **Forneça seu E-mail:** O INMET solicitará um e-mail. Este é o endereço onde você receberá os dados solicitados. Após digitar, clique em "**prosseguir**".
2. **Escolha o Tipo de Pontuação:** É importante definir o tipo de pontuação (ponto ou vírgula) que será usada como separador decimal. Essa escolha deve ser feita em função da configuração do seu computador ou do _software_ que você utilizará para trabalhar os dados, garantindo a compatibilidade (por exemplo, alguns _softwares_ exigem a configuração do computador para usar ponto como separador decimal).
3. **Selecione Dados Mensais:** Escolha "**dados mensais**". Esta opção é ótima, pois o INMET já fará o trabalho de sumarização para você, fornecendo a média dos dados (como temperatura e pressão) e o acumulado (como precipitação).

### 3. Definição da Estação e Período de Tempo

Agora, você refina a sua busca especificando a origem e a janela temporal dos dados:

1. **Escolha o Tipo de Estação:** Selecione se deseja estações "**convencionais**" ou "**automáticas**".
    - **Dica:** Você pode verificar a classificação das estações (convencional ou automática) no mapa disponível na página anterior, utilizando a legenda.
    - **Atenção:** A escolha do tipo de estação é crucial, pois ela determinará quais **variáveis** (tipos de medição) estarão disponíveis para seleção na próxima etapa.
2. **Defina a Abrangência:** Escolha o país ou a região (exemplo: Sudeste).
3. **Defina as Datas:** Indique a "**data de início**" e a "**data final**" do período que você deseja.
    - **Fique Tranquilo:** O INMET possui dados que variam de estação para estação (algumas desde 1906, outras mais recentes). Se você inserir uma data de início anterior ao funcionamento da estação, ele não enviará os dados que não possui, mas fornecerá os dados a partir do período em que a estação realmente começou a funcionar.

### 4. Seleção das Variáveis (O Coração da Sua Pesquisa)

Este é o momento de dizer ao INMET quais informações você realmente precisa:

1. **Revisão das Variáveis:** Dependendo do tipo de estação escolhida:
    - **Estações Automáticas:** Oferecem poucas variáveis, como precipitação total mensal, pressão atmosférica, temperatura média e velocidade do vento.
    - **Estações Convencionais:** Oferecem uma gama muito mais ampla de variáveis. Você pode selecionar todas ou apenas as necessárias.
    - **Exemplos de Variáveis Importantes:** Você pode selecionar insolação (horas de brilho solar por mês), nebulosidade, precipitação total mensal, pressão atmosférica (local ou corrigida ao nível do mar), temperaturas (máxima, média e mínima), umidade relativa do ar e velocidade média do vento.
2. **Selecione a Estação:** Você pode buscar a estação específica que deseja (por exemplo, Januária).
3. **Prossiga:** Ao terminar a seleção, clique em "**prosseguir**" no final da página.

### 5. Confirmação e Envio da Requisição

Você está quase lá!

1. **Confirme:** O sistema pedirá para você verificar se o intervalo de tempo, os dados e a estação estão corretos. Clique em "**confirmar**".
2. **Confirmação por E-mail:** O site informará que enviou um e-mail com as informações sobre como obter os dados.
3. **Valide sua Requisição:** Abra sua caixa de entrada. Você receberá um e-mail de confirmação. Você deve abri-lo e **clicar no link** fornecido para confirmar sua requisição.
4. **Aguarde (Mas não se preocupe!):** O INMET avisa que o processamento pode demorar até 24 horas, mas essa resposta é, muitas vezes, muito rápida.

### 6. Download e Interpretação Inicial da Planilha

O e-mail final chegará, contendo o seu tesouro de dados!

1. **Faça o Download:** Chegará um segundo e-mail informando que sua requisição está sendo processada e pedindo para você clicar em um _link_ para obter os dados.
    
2. **Arquivo Compactado:** O _link_ fará o download de uma pasta compactada. Dentro dela, você encontrará a planilha no formato **CSV**.
    
3. **Entenda a Planilha (A Chave para o Iniciante!):**
    
    - **Data:** Não se assuste se a coluna de data mostrar o último dia do mês (como 31 ou 28). Este dia é apenas uma **indicação do mês**.
    - **Interpretação Principal:** Como você solicitou dados mensais, os valores apresentados são:
        - **Média Mensal:** Variáveis como insolação (soma das horas de brilho solar), nebulosidade, pressão atmosférica, temperaturas (máxima, média, mínima) e velocidade do vento são apresentadas como **médias mensais**.
        - **Acumulado:** A precipitação é apresentada como a **soma acumulada** do mês.
    - **Metadados:** A planilha também traz informações cruciais sobre a estação utilizada, como código, latitude, longitude, altitude, e as datas inicial e final dos dados.
