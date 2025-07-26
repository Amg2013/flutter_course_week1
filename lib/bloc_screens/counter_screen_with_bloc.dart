import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/bloc_screens/bloc/counter_bloc.dart';

class CounterScreenWithBloc extends StatelessWidget {
  const CounterScreenWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lifecycle Example')),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<CounterBloc, CounterStates>(
              builder: (context, state) {
                if (state is InitialCounterStates) {
                  return Column(
                    children: [
                      Text(
                        'Initial Count: ${state.count}',
                        // style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Ready to start counting!',
                        // style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  );
                } else if (state is CounterStateInc) {
                  return Column(
                    children: [
                      Text(
                        'Initial Count: ${state.count}',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Ready to start counting!',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  );
                } else if (state is CounterStatesDec) {
                  return Column(
                    children: [
                      Text(
                        'Initial Count: ${state.count}',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Ready to start counting!',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  );
                }

                return Text(
                  '>>>>>>>>        >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>',
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:
                  // event
                  () {
                    context.read<CounterBloc>().add(
                      IncermenButtonPressdEvent(amount: 20),
                    );
                  },

                  child: Text(' add '),
                ),

                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(
                      DecermenButtonPressdEvent(amount: 20),
                    );
                  },
                  child: Text(' DecermenButtonPressdEv'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
