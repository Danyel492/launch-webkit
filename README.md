# WebKit Debug Launcher for Ubuntu 🐧🌐

[ 🇧🇷 Ler em Português ](#pt-br)

This repository contains a handy script to solve a classic web development problem on Linux: **how to inspect and debug applications in WebKit (Safari) engines when native browsers (like Epiphany) have broken or unstable DevTools.**

## 🚨 The Problem

During the development and interface adjustments for a platform, I needed to validate the layout specifically for WebKit-engine browsers. On Ubuntu, common alternatives fell short:
- The **Epiphany** browser runs WebKit natively, but its DevTools proved to be unstable or completely broken.
- Using **Chrome extensions** (device simulators) doesn't solve it, as they only spoof the *User-Agent* of the request, continuing to use the Blink engine for CSS/JS rendering.

## 💡 The Solution

This script (`launch-webkit.sh`) uses **Playwright**'s infrastructure to download the most stable version of the WebKit engine for Linux and opens a clean instance (`about:blank`) with 100% fully functional DevTools.

The script is designed to be efficient: it first checks if the engine is already in the local system cache, avoiding repeated downloads, and automatically installs it only on demand.

## 🛠️ Prerequisites

For the script to work, you need to have the Node.js package manager installed on your system:
- [Node.js](https://nodejs.org/) (version that includes `npm` and `npx`)

## 🚀 How to use

1. Clone this repository:
   ```bash
   git clone https://github.com/Danyel492/launch-webkit.git
   ```
   or download the `launch-webkit.sh` file.

2. Give execution permission to the file:
   ```bash
   chmod +x launch-webkit.sh
   ```
3. Run the script:
   ```bash
   ./launch-webkit.sh
   ```

> **Note:** A blank WebKit engine window will open. From there, simply type your target URL and inspect elements freely.

## 📌 Productivity Tip

If you frequently test in WebKit, add a global shortcut (alias) in your terminal configuration file (`~/.bashrc` or `~/.zshrc`) to call the script from any directory:

```bash
alias webkit-debug="/absolute/path/to/launch-webkit.sh"
```

---
<a id="pt-br"></a>
# 🇧🇷 Português (Brasil)

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

1. Clone este repositório:
   ```bash
   git clone https://github.com/Danyel492/launch-webkit.git
   ```
   ou baixe o arquivo `launch-webkit.sh`.
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