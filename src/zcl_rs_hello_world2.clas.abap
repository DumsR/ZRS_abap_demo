class zcl_rs_hello_world2 definition
  public
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.
class zcl_rs_hello_world2 implementation.
**********************************************************************
method if_oo_adt_classrun~main.
    out->write( 'Hello World' ).
    out->write( '... by R.Staudacher' ).
endmethod.
**********************************************************************
endclass.
