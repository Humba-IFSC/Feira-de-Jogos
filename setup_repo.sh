#!/bin/bash

# --- Configuração ---
PROJECT_NAME="uhimws-project"
GITHUB_USER="seu-usuario-github" # Substitua pelo seu usuário ou organização
LICENSE_YEAR=$(date +%Y)
LICENSE_OWNER="Humberto Luz Oliveira e Colaboradores" # Substitua se necessário

# --- Início do Script ---
echo "🚀 Iniciando a criação da estrutura para o projeto: $PROJECT_NAME"

# 1. Cria o diretório principal do projeto e entra nele
if [ -d "$PROJECT_NAME" ]; then
    echo "⚠️  O diretório '$PROJECT_NAME' já existe. Abortando para evitar sobrescrever."
    exit 1
fi
mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME"

# 2. Cria a estrutura de pastas
echo "📂 Criando a estrutura de diretórios..."
mkdir -p analysis/{notebooks,scripts} \
         dashboard \
         data/{external,processed,raw} \
         docs/{assets,methodology,reports,scientific_basis} \
         firmware/{lib,src} \
         hardware \
         data_pipeline

# 3. Cria arquivos .gitkeep para que o Git rastreie pastas vazias
echo "✨ Adicionando arquivos .gitkeep para rastreamento de pastas vazias..."
touch analysis/notebooks/.gitkeep \
      analysis/scripts/.gitkeep \
      dashboard/.gitkeep \
      data/external/.gitkeep \
      data/processed/.gitkeep \
      data/raw/.gitkeep \
      docs/assets/.gitkeep \
      docs/methodology/.gitkeep \
      docs/reports/.gitkeep \
      docs/scientific_basis/.gitkeep \
      firmware/lib/.gitkeep \
      firmware/src/.gitkeep \
      hardware/.gitkeep \
      data_pipeline/.gitkeep

# 4. Cria o arquivo .gitignore
echo "📄 Criando o arquivo .gitignore..."
cat << EOF > .gitignore
# Ambientes virtuais e dependências do Python
__pycache__/
*.pyc
venv/
.env
env/

# Arquivos de dados (não devem ser versionados)
data/raw/
data/external/
data/processed/
*.csv
*.xlsx
*.parquet

# Configurações de IDEs e editores
.vscode/
.idea/

# Dependências e builds do PlatformIO/Arduino
.pio/
.ionide/
firmware/.pio/
firmware/build/
*.o
*.a
*.bin
*.elf
*.hex

# Arquivos de sistema operacional
.DS_Store
Thumbs.db
EOF

# 5. Cria o arquivo README.md
echo "📄 Criando o arquivo README.md..."
cat << EOF > README.md
# UHIMWS - Estação Meteorológica para Ilhas de Calor Urbano

![Status do Projeto](https://img.shields.io/badge/status-em--desenvolvimento-yellowgreen)
![Licença](https://img.shields.io/badge/license-MIT-blue)

Repositório oficial do projeto UHIMWS, uma estação meteorológica de baixo custo baseada em ESP32, projetada para o monitoramento de microclimas e o estudo de ilhas de calor urbanas.

## 🎯 Sobre o Projeto

Este projeto visa desenvolver um sistema robusto e preciso para coleta de dados meteorológicos. A fase atual foca na validação e seleção rigorosa de sensores para garantir a qualidade dos dados, um requisito fundamental para futuras publicações científicas e um potencial registro de patente.

- **Hardware:** ESP32, múltiplos sensores de temperatura, umidade, pressão, etc.
- **Pipeline de Dados:** MQTT → InfluxDB → Grafana
- **Metodologia:** Análise de Dados Intrínseca (ADI) e Extrínseca (ADE) para validação de componentes.

## 📂 Estrutura do Repositório

- **/analysis**: Scripts e notebooks para análise de dados (Python/R).
- **/dashboard**: Código-fonte do dashboard de visualização de resultados.
- **/data**: Datasets (gerenciados via .gitignore).
- **/docs**: Documentação completa do projeto.
- **/firmware**: Código-fonte do firmware para o ESP32.
- **/hardware**: Esquemas elétricos, design de PCB e lista de materiais (BOM).
- **/data_pipeline**: Arquivos de configuração para a infraestrutura de dados (Docker, etc.).

## 🚀 Como Começar

Clone o repositório e siga as instruções específicas em cada pasta.

## 🤝 Contribuição

Por favor, crie uma nova branch para cada funcionalidade e envie um Pull Request para revisão.

## 👥 Autores

- **Humberto Luz Oliveira** - _Líder do Projeto_
- [Adicionar outros membros da equipe aqui]
EOF

# 6. Cria o arquivo de Licença (MIT)
echo "📄 Criando o arquivo LICENSE..."
cat << EOF > LICENSE
MIT License

Copyright (c) $LICENSE_YEAR $LICENSE_OWNER

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# 7. Inicializa o repositório Git e faz o primeiro commit
echo "⚙️  Inicializando o repositório Git e realizando o primeiro commit..."
git init
git add .
git commit -m "feat: ✨ Initial project structure and documentation"

echo ""
echo "✅ Sucesso! O repositório local '$PROJECT_NAME' foi criado e configurado."
echo "➡️  Próximos passos:"
echo "   1. Crie um novo repositório VAZIO no GitHub chamado '$PROJECT_NAME'."
echo "   2. No diretório '$PROJECT_NAME', execute os seguintes comandos:"
echo "      git remote add origin https://github.com/$GITHUB_USER/$PROJECT_NAME.git"
echo "      git branch -M main"
echo "      git push -u origin main"
