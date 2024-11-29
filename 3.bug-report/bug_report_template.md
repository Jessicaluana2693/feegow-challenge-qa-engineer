# Bug Report

## Título do Bug
Erro ao cancelar consulta criada nos últimos 5 minutos

---

## Descrição
**Resumo**: O sistema não permite o cancelamento de uma consulta se ela foi criada nos últimos 5 minutos. Esse comportamento está impedindo que os usuários cancelem consultas imediatamente após o agendamento, o que é um fluxo esperado pelo usuário.

**Impacto**: O bug afeta diretamente a experiência do usuário, especialmente quando ele tenta cancelar uma consulta recém-criada. Caso o usuário precise modificar seu agendamento por algum motivo (como erro ao selecionar o horário, urgência ou mudança de planos), ele não pode cancelar a consulta dentro do intervalo de tempo imediato. Isso pode causar frustração e confusão, pois o sistema não está proporcionando a flexibilidade esperada. Além disso, pode gerar um feedback negativo sobre a funcionalidade de cancelamento, comprometendo a confiança do usuário no sistema e gerando um reporte negativo por conta do usuário.

---

## Passos para Reproduzir
1. Acesse a página de agendamento de consultas no sistema;
2. Selecione um horário disponível e crie uma nova consulta para o mesmo dia;
3. Após a criação da consulta, imediatamente tente cancelar a consulta recém-criada (dentro de até 5 min);
4. Observe que o sistema não permite o cancelamento e exibe uma mensagem de erro ou bloqueio;
5. Verifique que a consulta não é removida da lista de agendamentos, como esperado.

---

## Comportamento Esperado
- O sistema deveria permitir que o usuário cancele uma consulta imediatamente após sua criação, incluindo dentro do intervalo de 5 minutos.
- Caso haja uma limitação de tempo para cancelamento (como não permitir cancelamento dentro de um intervalo de tempo muito curto), a mensagem exibida ao usuário deveria ser clara e informativa, explicando o motivo do bloqueio de cancelamento (ex: "Você não pode cancelar uma consulta criada nos últimos 5 minutos").
---

## Comportamento Atual
- O sistema impede que o usuário cancele uma consulta criada nos últimos 5 minutos e exibe uma mensagem genérica de erro, sem explicar a razão do bloqueio.
- A consulta não é removida da lista de agendamentos.
---

## Ambiente de Teste
- **Dispositivo**: Desktop
- **Sistema Operacional**: Windows 10
- **Navegador**: Google Chrome: 90.0 e Firefox: 128.3.1
- **Ambiente**: Staging

---

## Evidências
- Captura de tela 1: Exibição da mensagem de erro ao tentar cancelar uma consulta recém-criada (imagem).
- Captura de tela 2: Lista de consultas agendadas, mostrando que a consulta não foi removida após a tentativa de cancelamento (video).
- Logs de erro (se disponíveis): Logs do sistema indicando a falha ao tentar cancelar a consulta.

---

## Critérios de Aceitação
- Permitir o cancelamento imediato de consultas: O sistema deve permitir que uma consulta seja cancelada imediatamente após a sua criação, incluindo consultas criadas dentro de 5 minutos.

- Exibição de mensagem clara ao usuário: Se houver uma restrição de tempo para cancelamento (como um bloqueio para cancelamento em menos de 5 minutos), o sistema deve exibir uma mensagem clara e informativa, como "Você não pode cancelar uma consulta criada nos últimos 5 minutos", explicando o motivo da limitação.

- Atualização da lista de agendamentos: Após o cancelamento bem-sucedido de uma consulta, a lista de agendamentos deve ser atualizada corretamente e refletir a remoção da consulta cancelada.

- Testes em diferentes dispositivos e navegadores: Garantir que a funcionalidade de cancelamento funcione corretamente em todos os dispositivos e navegadores suportados pelo sistema, incluindo desktops e versões recentes de navegadores como Google Chrome, Firefox e Microsoft Edge.

- Comportamento consistente em diferentes cenários: O sistema deve ter o mesmo comportamento em todas as páginas de agendamento de consultas (independente do horário ou data selecionada), e deve lidar com o cancelamento de consultas de maneira consistente.


---

## Observações Adicionais
### Análise
Este bug compromete uma funcionalidade essencial para a experiência do usuário, o que é crítico em sistemas de agendamento onde a flexibilidade e a capacidade de modificar agendamentos é uma expectativa clara. A equipe de desenvolvimento deve investigar a lógica de restrição de cancelamento e verificar se há um prazo definido ou não para o cancelamento de uma consulta e as instruções-respostas devem ser claras e objetivas ao usuário.
