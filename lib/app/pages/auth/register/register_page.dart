import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/base_state/base_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            register: () => showLoader(),
            error: () {
              hideLoader();
              showError('erro ao registrar usuario');
            },
            success: () {
              hideLoader();
              showSuccess('cadastro realizado');
              Navigator.of(context).pop();
            });
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('Cadastro', style: context.textStyles.textTitle),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: Validatorless.required('nome obrigat??rio'),
                    controller: _nameController,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    controller: _emailController,
                    validator: Validatorless.multiple([
                      Validatorless.required('email obrigat??rio'),
                      Validatorless.email('email inv??lido')
                    ]),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Senha'),
                    controller: _passwordController,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('senha obrigat??rio'),
                      Validatorless.min(6, 'senha precisa ter 6 caracteres')
                    ]),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Confirma senha'),
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('confirma senha obrigat??rio'),
                      Validatorless.compare(
                          _passwordController, 'senhas est??o diferentes')
                    ]),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: DeliveryButton(
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                            _nameController.text,
                            _emailController.text,
                            _passwordController.text,
                          );
                        }
                      },
                      label: 'Cadastrar',
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
