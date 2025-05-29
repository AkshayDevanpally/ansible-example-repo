# Ansible Error Handling Playbooks

This repository showcases various techniques for error handling in Ansible playbooks. Proper error handling ensures that automation scripts are robust, reliable, and can gracefully handle unexpected issues during execution.

## 📁 Repository Structure

* `error-handling-177.yml`: Demonstrates the use of `ignore_errors` and `failed_when` directives.
* `block-module-178.yml`: Illustrates grouping tasks using `block` and handling errors within the block.
* `rescue-block-always-178.yml`: Shows structured error handling using `block`, `rescue`, and `always`.
* `demo-block-rescue-179.yml`: A practical example of configuring the vsftpd service with error handling and rollback mechanisms.

## 📘 Playbook Descriptions

### 1. `error-handling-177.yml`

This playbook demonstrates:

* **`ignore_errors`**: Allows the playbook to continue execution even if a task fails.
* **`failed_when`**: Defines custom conditions under which a task should be considered failed.

*Use Case*: Useful when certain tasks are non-critical, and their failure shouldn't halt the entire playbook.

### 2. `block-module-178.yml`

This playbook illustrates:

* **`block`**: Groups multiple tasks together, allowing common directives like `become` or `ignore_errors` to be applied collectively.
* **Error Handling**: Continues execution of subsequent tasks within the block even if one fails, due to the use of `ignore_errors`.

*Use Case*: Ideal for scenarios where multiple related tasks need to be executed, and failure of one shouldn't prevent the others from running.

### 3. `rescue-block-always-178.yml`

This playbook showcases structured error handling using:

* **`block`**: Defines the main set of tasks to attempt.
* **`rescue`**: Specifies tasks to execute if any task within the `block` fails.
* **`always`**: Contains tasks that should run regardless of the success or failure of the `block`.

*Use Case*: Provides a robust mechanism to handle failures gracefully and ensure certain tasks (like cleanup) always run.

### 4. `demo-block-rescue-179.yml`

This playbook is a practical example that:

* Installs and configures the vsftpd FTP server using a Jinja2 template.
* Implements error handling to restore the original configuration if the deployment fails.
* Ensures the vsftpd service is restarted regardless of the success or failure of the configuration tasks.

*Use Case*: Demonstrates real-world application of error handling to maintain system stability during configuration changes.

## 🛠️ Prerequisites

* Ansible installed on the control node.
* Target hosts defined in the Ansible inventory.
* SSH access to target hosts with appropriate permissions.

## 🚀 Running the Playbooks

To execute any of the playbooks:

```bash
ansible-playbook -i inventory_file playbook_name.yml
```

Replace `inventory_file` with your inventory file and `playbook_name.yml` with the desired playbook.

## 📚 Additional Resources

* [Ansible Error Handling Documentation](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_error_handling.html)
* [Ansible Blocks Documentation](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_blocks.html)
