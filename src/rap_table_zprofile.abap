@EndUserText.label : 'Energy Profile'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zprofile {

  key client          : abap.clnt not null;
  key internal_id     : abap.char(40) not null;
  profile_id          : abap.char(40) not null;
  status              : abap.char(20);
  profile_name        : abap.char(80);
  profile_type        : abap.char(40);
  description         : abap.char(120);
  customer_type       : abap.char(20);
  unit                : abap.char(10);
  region              : abap.char(40);
  data_source         : abap.char(40);
  profile_version     : abap.char(10);
  period_start        : abap.dats;
  period_end          : abap.dats;
  total_energy_amount : abap.dec(15,2);
  created_by          : abp_creation_user;
  created_at          : tzntstmpl;
  lastchangedby       : abp_lastchange_user;
  lastchangedat       : abp_lastchange_tstmpl;
  locallastchanged    : abp_locinst_lastchange_tstmpl;

}