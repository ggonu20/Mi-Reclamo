// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mi_reclamo/features/domain/entities/ticket_entity.dart';
//
// class FilterWidget extends StatefulWidget {
//   final List<Ticket> allSolicitudes;
//   final Function(List<Ticket>) onFilterApplied;
//   // final Function(String?) onChange;
//
//   const FilterWidget({super.key, required this.allSolicitudes, required this.onFilterApplied});
//
//   @override
//   _FilterWidgetState createState() => _FilterWidgetState();
// }
//
// class _FilterWidgetState extends State<FilterWidget> {
//   String selectedFilter = 'Todas';
//   List<Ticket> filteredSolicitudes = [];
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     filteredSolicitudes = widget.allSolicitudes;
//   }
//
//   void _changeFilter(String filter) {
//     setState(() {
//       selectedFilter = filter;
//       if (filter == 'Todas') {
//         filteredSolicitudes = widget.allSolicitudes;
//       } else {
//         filteredSolicitudes = widget.allSolicitudes
//             .where((solicitud) => solicitud.category.name == filter)
//             .toList();
//       }
//       widget.onFilterApplied(filteredSolicitudes);
//     });
//   }
//
//   Widget _buildFilterButton(String label, Color color) {
//     return GestureDetector(
//       onTap: () {
//         _changeFilter(label);
//         if (_scrollController.hasClients) {
//           _scrollController.jumpTo(_scrollController.position.minScrollExtent);
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 4.0),
//         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
//         decoration: BoxDecoration(
//           color: selectedFilter == label
//               ? const Color.fromARGB(128, 7, 84, 98)
//               : color,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Text(
//           label,
//           style: GoogleFonts.poppins(
//             color: const Color(0xFF04347c),
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       controller: _scrollController,
//       child: Row(
//         children: [
//           _buildFilterButton('Todas', Colors.grey),
//           _buildFilterButton('CLAIM', Colors.red),
//           _buildFilterButton('SUGGESTION', Colors.green),
//           _buildFilterButton('INFORMATION', Colors.blue),
//           // Add more filter buttons as needed
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class FilterWidget extends StatelessWidget {
  final Function(String?) onCategoryChanged;
  final Logger _logger = Logger();

  FilterWidget({super.key, required this.onCategoryChanged});

  void _changeFilter(String filter) {
    onCategoryChanged(filter == 'Todas' ? null : filter);
    _logger.i('Filter changed to $filter');
  }

  Widget _buildFilterButton(String label, Color color) {
    return GestureDetector(
      onTap: () => _changeFilter(label),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            color: const Color(0xFF04347c),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterButton('Todas', Colors.grey),
          _buildFilterButton('CLAIM', Colors.red),
          _buildFilterButton('SUGGESTION', Colors.green),
          _buildFilterButton('INFORMATION', Colors.blue),
          // Add more filter buttons as needed
        ],
      ),
    );
  }
}