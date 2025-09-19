managed implementation in class ZBP_R_JKL_PROFILE_H unique;
strict ( 2 );
with draft;
extensible;
define behavior for ZR_JKL_PROFILE_H alias ProfileH
persistent table zjkl_profile_h
extensible
draft table zjkl_profile_h_d
etag master Locallastchanged
lock master total etag Lastchangedat
authorization master ( global )
{

  // field ( mandatory : create ) InternalID;

  field ( readonly )
  CreatedBy,
  Lastchangedby,
  Lastchangedat,
  Locallastchanged;

  field ( numbering : managed, readonly ) InternalID;

  create;
  update;
  delete;

  determination CreateKeys on modify { create; }

  draft action Activate optimized;
  draft action Discard;
  draft action Edit;
  draft action Resume;
  draft determine action Prepare;

  mapping for zjkl_profile_h corresponding extensible
    {
      InternalID        = internal_id;
      ProfileID         = profile_id;
      Status            = status;
      ProfileName       = profile_name;
      ProfileType       = profile_type;
      Description       = description;
      CustomerType      = customer_type;
      Unit              = unit;
      Region            = region;
      DataSource        = data_source;
      ProfileVersion    = profile_version;
      PeriodStart       = period_start;
      PeriodEnd         = period_end;
      TotalEnergyAmount = total_energy_amount;
      CreatedBy         = created_by;
      CreatedAt         = created_at;
      Lastchangedby     = lastchangedby;
      Lastchangedat     = lastchangedat;
      Locallastchanged  = locallastchanged;
    }

}