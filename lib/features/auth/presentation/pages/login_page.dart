import 'package:clean_architecture_app_2/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController(text: "");
    TextEditingController passController = TextEditingController(text: "");

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text("Username")),
                controller: usernameController,
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text("Password")
                  ),
                controller: passController,
              ),
              const SizedBox(
                height: 16,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSucces) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Login Berhasil"),
                      backgroundColor: Colors.green,));
                  } else if (state is LoginFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,));
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().login(username: usernameController.text, pass: passController.text);
                      }, 
                      child: const Text("Login"));
                  }
                  
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
