
# 🧪 Ansible Playbook: Understanding Tags

This playbook is a simple demonstration of **how to use tags in Ansible**. Tags allow you to **run specific tasks** in your playbook, without executing all tasks.

---

## 📋 Objective

This Ansible playbook is designed to:
- Help you understand how to **tag** tasks
- Show how tags can be used to **selectively execute** parts of your playbook
- Provide debug messages to demonstrate task flow

---

## ⚙️ Environment Setup

- **Hosts**: `localhost`
- **Gather Facts**: `false` (No system facts are collected)
- **Tool**: Ansible

---

## 📄 Full Playbook

```yaml
- name: This will show the Use of Tags
  hosts: localhost
  gather_facts: false

  tasks:
    - name: Operations using the Tags 1
      debug: 
        msg:
          - "Hi, This is Debug Message 1 "
      tags:
        - first

    - name: Operations using the Tags 2
      debug: 
        msg:
          - "Hi, This is Debug Message 2 "
      tags:
        - Second
        - Common

    - name: Operations using the Tags 3
      debug: 
        msg:
          - "Hi, This is Debug Message 3 "

    - name: Operations using the Tags 4
      debug: 
        msg:
          - "Hi, This is Debug Message 4 "

    - name: Operations using the Tags 5
      debug: 
        msg:
          - "Hi, This is Debug Message 5 "
      tags:
        - first

    - name: Operations using the Tags 6
      debug: 
        msg:
          - "Hi, This is Debug Message 6 "
```

---

## 🧠 Step-by-Step Task Breakdown

### ▶️ Task 1: `Operations using the Tags 1`

```yaml
tags:
  - first
```
Prints **"Debug Message 1"** — Executed only when the `first` tag is used.

---

### ▶️ Task 2: `Operations using the Tags 2`

```yaml
tags:
  - Second
  - Common
```
Prints **"Debug Message 2"** — Runs when either `Second` or `Common` tags are specified.

---

### ▶️ Task 3: `Operations using the Tags 3`

```yaml
(no tags)
```
Prints **"Debug Message 3"** — Always runs unless a specific tag is provided during execution.

---

### ▶️ Task 4: `Operations using the Tags 4`

```yaml
(no tags)
```
Prints **"Debug Message 4"** — Same behavior as Task 3.

---

### ▶️ Task 5: `Operations using the Tags 5`

```yaml
tags:
  - first
```
Prints **"Debug Message 5"** — Also runs when `first` tag is used.

---

### ▶️ Task 6: `Operations using the Tags 6`

```yaml
(no tags)
```
Prints **"Debug Message 6"** — Executes by default unless filtering with tags.

---

## 🚀 How to Run with Tags

### 🔸 Run All Tasks (Default)

```bash
ansible-playbook tags/tags-16.yml
```

### 🔹 Run Only Tasks with the `first` Tag

```bash
ansible-playbook tags/tags-16.yml --tags first
```

### 🔹 Run Tasks with Tag `Common`

```bash
ansible-playbook tags/tags-16.yml --tags Common
```

### 🔹 Skip Tasks with Tag `Second`

```bash
ansible-playbook tags/tags-16.yml --skip-tags Second
```

---


