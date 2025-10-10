uhimws-project/
├── 📂 analysis/          # Scripts e notebooks para análise de dados (ADI, ADE)
│   ├── 📂 notebooks/      # Análises exploratórias (Jupyter, R Markdown)
│   └── 📂 scripts/        # Código Python/R reutilizável para as análises
│
├── 📂 dashboard/          # Código da aplicação do dashboard (Streamlit, Dash) e saídas HTML
│
├── 📂 data/               # Datasets (importante usar .gitignore aqui)
│   ├── 📂 external/       # Dados de fontes externas (INMET, EPAGRI)
│   ├── 📂 processed/      # Dados limpos e transformados
│   └── 📂 raw/            # Dados brutos extraídos do InfluxDB
│
├── 📂 docs/               # Documentação geral do projeto (o que você chamou de "documentação")
│   ├── 📂 assets/         # Imagens, diagramas e outros recursos para a documentação
│   ├── 📂 methodology/    # Documentos que descrevem a metodologia (como o ADI e ADE)
│   ├── 📂 reports/        # Relatórios finais, artigos e apresentações
│   └── 📂 scientific_basis/ # Revisões de literatura, artigos de referência
│
├── 📂 firmware/           # Código fonte do ESP32 (Arduino/PlatformIO)
│   ├── 📂 lib/            # Bibliotecas customizadas ou de terceiros
│   └── 📄 src/            # O código principal do firmware
│
├── 📂 hardware/           # Esquemas elétricos, design de PCB, lista de materiais (BOM)
│
├── 📂 data_pipeline/      # Configurações da infraestrutura (Docker, InfluxDB, Grafana)
│
├── 📄 .gitignore         # Arquivo para ignorar arquivos e pastas (essencial!)
├── 📄 LICENSE            # Licença do projeto (ex: MIT)
└── 📄 README.md          # O cartão de visitas do seu projeto (o mais importante!)
