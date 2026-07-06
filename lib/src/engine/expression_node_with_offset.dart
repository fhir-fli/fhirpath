// ignore_for_file: public_member_api_docs

import 'package:fhirpath/src/internal.dart';

class ExpressionNodeWithOffset {
  ExpressionNodeWithOffset(this.offset, this.node);

  int offset;
  ExpressionNode node;

  int getOffset() {
    return offset;
  }

  ExpressionNode getNode() {
    return node;
  }
}
