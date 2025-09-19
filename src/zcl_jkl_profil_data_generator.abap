CLASS zcl_jkl_profil_data_generator DEFINITION

  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS generate_guid
      RETURNING VALUE(rv_guid) TYPE uuid.

ENDCLASS.


CLASS zcl_jkl_profil_data_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_profiles TYPE TABLE OF zjkl_profile_h.
    DATA ls_profile  TYPE zjkl_profile_h.

    "1) Vorher alte Daten löschen (nur Demo!)
    DELETE FROM zjkl_profile_h.

    "2) Beispiel-Datensätze erzeugen
    DO 5 TIMES.
      CLEAR ls_profile.

      ls_profile-client          = sy-mandt.
      ls_profile-internal_id     = generate_guid( ).
      ls_profile-profile_id      = |PID_{ sy-index }|.
      ls_profile-status          = 'ACTIVE'.
      ls_profile-profile_name    = |Demo Profile { sy-index }|.
      ls_profile-profile_type    = 'STANDARD'.
      ls_profile-description     = |Generated demo profile { sy-index }|.
      ls_profile-customer_type   = 'B2C'.
      ls_profile-unit            = 'kWh'.
      ls_profile-region          = |Region { sy-index }|.
      ls_profile-data_source     = 'DEMO'.
      ls_profile-profile_version = '0001'.
      ls_profile-period_start    = sy-datum - 30.
      ls_profile-period_end      = sy-datum + 365.
      ls_profile-total_energy_amount = sy-index * 1000.

      " created_by / created_at etc. werden automatisch durch ABP gepflegt

      APPEND ls_profile TO lt_profiles.
    ENDDO.

    "3) Insert durchführen
    INSERT zjkl_profile_h FROM TABLE @lt_profiles.

    COMMIT WORK.

    out->write( |{ lines( lt_profiles ) } demo profiles inserted into ZJKL_PROFILE_H.| ).
  ENDMETHOD.


  METHOD generate_guid.
    TRY.
        rv_guid = cl_system_uuid=>create_uuid_x16_static( ).
      CATCH cx_uuid_error INTO DATA(lx_uuid).
        rv_guid = cl_abap_context_info=>get_user_alias( ). "fallback
    ENDTRY.
  ENDMETHOD.


ENDCLASS.