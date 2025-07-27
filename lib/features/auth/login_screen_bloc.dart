// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iti_project/features/auth/bloc/login_bloc.dart';

// class LoginScreen extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),

//       // builder
//       // listener
//       // consuer
//       body: BlocConsumer<LoginEvent, LoginState>(
//         listener: (context, state) {
//           if (state is LoginFaildState) {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text(state.msg)));
//           }
//         },
//         builder: (context, state) {
//           if (state is LoginLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (state is LoginSuccessState) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Welcome ${state.email}!'),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       context.read<AuthBloc>().add(LogoutEvent());
//                     },
//                     child: const Text('Logout'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 30),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       context.read<AuthBloc>().add(
//                         LoginEvent(
//                           email: _emailController.text.trim(),
//                           password: _passwordController.text.trim(),
//                         ),
//                       );
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('Login'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
