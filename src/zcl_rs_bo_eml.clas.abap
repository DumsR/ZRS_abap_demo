class zcl_rs_bo_eml definition
  public
  create public .

public section.
    interfaces if_oo_adt_classrun.


protected section.
private section.
endclass.
class zcl_rs_bo_eml implementation.
**********************************************************************
method if_oo_adt_classrun~main.
    data agencies_upd type table for update /DMO/I_AgencyTP\\/DMO/Agency.

    agencies_upd = VALUE #( ( agencyID = '070050' name = 'R.Staudacher Travel' ) ).
    out->write( agencies_upd ).

    modify entities
        of /DMO/I_AgencyTP
        entity /DMO/Agency
        update fields (  name )
        with agencies_upd.
    commit entities.

    field-symbols <ag> like line of agencies_upd.
    assign agencies_upd[ 1 ] to <ag>.
    data(info) = |Agency updated: { <ag>-AgencyID } - { <ag>-Name }|.
    out->write( info ).

    select * from /DMO/I_AGENCYTP
        where agencyID between '070045' and '070100'
        order by agencyID
        into table @data(lt_agency).

    data(cnt) = lines( lt_agency ).
    out->write( 'Agency read:' && cnt ).
    out->write( lt_agency ).

endmethod.
**********************************************************************
endclass.
