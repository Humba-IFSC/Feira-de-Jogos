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
- **Beatriz P. Abreu** - _Bolsista_
- **Germano D. Coelho** - _Bolsista_
