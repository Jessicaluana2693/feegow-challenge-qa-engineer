# Documentação de Testes para o Fluxo de Agendamento de Consultas

## Objetivo do Teste
Esta documentação descreve os cenários de teste principais para o fluxo de agendamento de consultas em um sistema de saúde. Cada cenário será avaliado com base em probabilidade de ocorrência de falha e no impacto que tal falha causaria no sistema ou na experiência do usuário. Usaremos uma matriz de risco para priorizar os cenários de teste.

---

## Cenários de Teste
### 1. Agendamento de uma nova consulta para um horário disponível
#### Descrição: O usuário deve ser capaz de agendar uma consulta em um horário disponível. O sistema deve exibir corretamente os horários disponíveis e permitir que o usuário selecione um horário.
Entrada Esperada: Horários disponíveis listados corretamente.
Ação Esperada: O usuário seleciona um horário disponível e confirma o agendamento.
Saída Esperada: A consulta é agendada com sucesso e a confirmação é exibida.

### 2. Cancelamento de uma consulta existente
#### Descrição: O usuário deve ser capaz de cancelar uma consulta previamente agendada. O sistema deve permitir o cancelamento e remover a consulta da lista de agendamentos.
Entrada Esperada: Consulta previamente agendada.
Ação Esperada: O usuário clica no botão "Cancelar" para remover a consulta.
Saída Esperada: A consulta é cancelada e removida da lista de agendamentos.

### 3. Exibição correta de horários disponíveis
#### Descrição: O sistema deve exibir apenas horários válidos e disponíveis para agendamento. Horários já ocupados não devem ser apresentados como opção.
Entrada Esperada: Lista de horários disponíveis com base na agenda da clínica.
Ação Esperada: O usuário consulta os horários e visualiza apenas os horários válidos e disponíveis.
Saída Esperada: Horários já ocupados não são apresentados.

### 4. Tentativa de agendamento em um horário já ocupado
#### Descrição: O sistema deve impedir que o usuário agende uma consulta em um horário já ocupado e exibir uma mensagem de erro apropriada.
Entrada Esperada: O usuário tenta agendar uma consulta em um horário já ocupado.
Ação Esperada: O usuário seleciona um horário que já está ocupado e tenta confirmar o agendamento.
Saída Esperada: O sistema exibe uma mensagem de erro indicando que o horário está indisponível.

### 5. Restrição de cancelamento de consulta criada recentemente
#### Descrição: O sistema deve restringir o cancelamento de consultas agendadas recentemente (por exemplo, no mesmo dia ou dentro de um intervalo de tempo restrito).
**Entrada Esperada:** Uma consulta agendada recentemente (ex: no mesmo dia).
Ação Esperada: O usuário tenta cancelar a consulta dentro do prazo restrito.
Saída Esperada: O sistema bloqueia o cancelamento e exibe uma mensagem explicando a restrição.

---

## Matriz de Risco (Probabilidade vs. Impacto)
A matriz de risco ajuda a priorizar os cenários de teste com base em probabilidade de ocorrência e impacto que um defeito pode causar. Os cenários são avaliados em uma escala de 1 a 5, onde:

**Probabilidade:**

1: Muito improvável
2: Pouco provável
3: Moderado
4: Provável
5: Muito provável

**Impacto:**

1: Baixo impacto (impacto limitado, erro não crítico)
2: Moderado (impacto razoável, mas não impede o uso do sistema)
3: Alto impacto (afeta significativamente a experiência do usuário)
4: Muito alto impacto (impede o uso do sistema ou causa grandes problemas)


---

## Priorização dos Testes - Matriz de Risco

| ID   | Cenário de Teste                                                | Probabilidade (1-5) | Impacto (1-5) | Pontuação de Risco      | Prioridade |
|------|------------------------------------------                       |---------------------|---------------|-------------------------|------------|
| TC01 | Agendamento de uma nova consulta para um horário disponível     | 4                   | 3             | 12                      | Alta       |
| TC02 | Cancelamento de uma consulta existente                          | 3                   | 3             | 09                      | Média      |
| TC03 | Exibição correta de horários disponíveis                        | 3                   | 4             | 12                      | Alta       |
| TC04 | Tentativa de agendamento em um horário já ocupado               | 4                   | 4             | 16                      | Crítico    |
| TC05 | Restrição de cancelamento para consultas recentes               | 2                   | 5             | 10                      | Média      |

> **Notas**: A matriz de risco ajuda a priorizar os casos de teste com base na probabilidade de falha e no impacto dessa falha. A prioridade dos testes é definida conforme o nível de risco, com testes de alta prioridade executados primeiro para reduzir o risco de problemas críticos no sistema.

---
## Análise e Priorização
1. Tentativa de agendamento em um horário já ocupado
Probabilidade: Alta (4)
Impacto: Muito alto (4)
Pontuação de Risco: 16
Este é o cenário mais crítico, pois impacta diretamente a integridade do agendamento e pode causar frustração no usuário. A probabilidade de erro é alta, pois é uma falha comum em sistemas de agendamento.
2. Agendamento de uma nova consulta para um horário disponível
Probabilidade: Alta (4)
Impacto: Alto (3)
Pontuação de Risco: 12
Este é outro cenário prioritário, pois a falha no agendamento pode bloquear o principal fluxo de trabalho do sistema. Embora a probabilidade de erro seja alta, a gravidade não é tão intensa quanto o caso anterior.
3. Exibição correta de horários disponíveis
Probabilidade: Moderada (3)
Impacto: Muito alto (4)
Pontuação de Risco: 12
A exibição incorreta de horários disponíveis pode causar grande frustração ao usuário, que pode acabar agendando um horário incorreto, embora não seja um erro de alta probabilidade.
4. Cancelamento de uma consulta existente
Probabilidade: Moderada (3)
Impacto: Alto (3)
Pontuação de Risco: 9
Embora o cancelamento seja uma funcionalidade importante, o impacto da falha aqui seria limitado ao cancelamento de uma consulta. A probabilidade de erro é moderada, pois o cancelamento é um processo mais simples em comparação com o agendamento.
5. Restrição de cancelamento de consulta criada recentemente
Probabilidade: Baixa (2)
Impacto: Muito alto (5)
Pontuação de Risco: 10
Embora a probabilidade de falha seja baixa, se o cancelamento não for restrito corretamente, pode causar grandes problemas, como usuários cancelando consultas com muito pouco tempo de antecedência, afetando a organização da clínica.

---
## Conclusão e Recomendação
Com base na matriz de risco, as prioridades para os testes devem ser:

1. Tentativa de agendamento em um horário já ocupado (pontuação de risco 16)
2. Agendamento de uma nova consulta para um horário disponível (pontuação de risco 12)
3. Exibição correta de horários disponíveis (pontuação de risco 12)
4. Restrição de cancelamento de consulta criada recentemente (pontuação de risco 10)
5. Cancelamento de uma consulta existente (pontuação de risco 9)

---

## Observações Adicionais
Este plano de teste serve como uma diretriz para assegurar a funcionalidade crítica do sistema de agendamento de consultas. A priorização baseada em risco permite um foco maior em áreas que podem afetar a experiência do usuário de forma significativa.