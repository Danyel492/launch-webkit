# WebKit Debug Launcher para Ubuntu 🐧🌐

Este repositório contém um script prático para resolver um problema clássico de desenvolvimento web no Linux: **como inspecionar e debugar aplicações em motores WebKit (Safari) quando os navegadores nativos (como o Epiphany) apresentam DevTools quebrado ou instável.**

## 🚨 O Problema

Durante o desenvolvimento e ajustes de interface para uma plataforma, precisei homologar o layout especificamente para navegadores com motor WebKit. No Ubuntu, as alternativas comuns não atenderam:
- O navegador **Epiphany** roda WebKit nativamente, mas seu DevTools se mostrou instável ou completamente quebrado.
- O uso de **extensões no Chrome** (simuladores de dispositivo) não resolve, pois elas apenas mascaram o *User-Agent* da requisição, continuando a utilizar o motor Blink para a renderização do CSS/JS.

## 💡 A Solução

Este script (`launch-webkit.sh`) utiliza a infraestrutura do **Playwright** para fazer o download da versão mais estável do motor WebKit para Linux e abre uma instância limpa (`about:blank`) com o DevTools 100% funcional. 

O script foi projetado para ser eficiente: ele verifica primeiro se o motor já está no cache local do sistema, evitando downloads repetidos, e faz a instalação automática apenas sob demanda.

## 🛠️ Pré-requisitos

Para que o script funcione, é necessário ter o gerenciador de pacotes do Node.js instalado no sistema:
- [Node.js](https://nodejs.org/) (versão que inclua `npm` e `npx`)

## 🚀 Como usar

1. Clone este repositório ou baixe o arquivo `launch-webkit.sh`.
2. Dê permissão de execução ao arquivo:
   ```bash
   chmod +x launch-webkit.sh
   ```
3. Execute o script:
   ```bash
   ./launch-webkit.sh
   ```

> **Nota:** Uma janela em branco do motor WebKit será aberta. A partir daí, basta digitar a URL do seu `localhost` (ou o ambiente que desejar) e inspecionar os elementos livremente.

## 📌 Sugestão de Produtividade

Se você realiza testes em WebKit com frequência, adicione um atalho (alias) no seu arquivo de configuração do terminal (`~/.bashrc` ou `~/.zshrc`) para chamar o script de qualquer diretório:

```bash
alias webkit-debug="/caminho/absoluto/para/o/launch-webkit.sh"
```
