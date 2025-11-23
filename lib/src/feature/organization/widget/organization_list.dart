import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/feature/organization/provider/organization_list_provider.dart';

class OrganizationListView extends ConsumerWidget {
  const OrganizationListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncOrganizations = ref.watch(organizationListProvider);

    return asyncOrganizations.when(
      loading: () => const SizedBox.shrink(),
      error: (e, _) => Text('$e', style: TextStyle(color: Colors.white)),
      data: (items) {
        //  return ListView(scrollDirection: Axis.horizontal, chil);
        return ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Image.network(
              'https://${items[index].banner} $items',
              errorBuilder: (context, error, stackTrace) => Placeholder(),
            );
          },
        );
      },
    );
  }
}
