Return-Path: <linux-input+bounces-13032-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A89F6AE825B
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 14:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 340381BC7DF2
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 12:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D585125BF06;
	Wed, 25 Jun 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPWSP0lt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2210254AF0;
	Wed, 25 Jun 2025 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853254; cv=none; b=kNiK8vtu4PHt+73wJWArXvW/lN8/rfdhO3DnR9EFdO6Ql/ERV9KvKmuBSt/nV27PBDgkQ4nWVSpK4anme+kNIyaofg33+4evHavtHT/IKqJLpkqc+eMsg4zbRfjLc42O4mqgEeTzkSvxz5NmtwtkNHE8OLmQJKu2eyCQ2mTKBSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853254; c=relaxed/simple;
	bh=EmfrlwTk1mBr9z4gnvtKtm97PKsInD9aRsPqpPoTQdk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lnZsaaiPzXZYBZUyAYjNR0+PtG4k6VV1XYilujlZusey8kD+iavfPQICv3joiMOwZMyKRjAm6UP1f0Ar+IGDgrFH1jdsD0ocBFGCqplPAOHfQnj0wZAYsaKoy1w59ghUXseKb35hZRLXstSMNiTaAQSWKR/xIB9HieF69XVR4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPWSP0lt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750853253; x=1782389253;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=EmfrlwTk1mBr9z4gnvtKtm97PKsInD9aRsPqpPoTQdk=;
  b=LPWSP0ltNUWBOxrdEjemMuyqcPAcMMUuEyFgnfFfu2n8XssV1AeegD54
   sgNzKsCOyYnr3EmA2tqaAR0lSq4moJmK86g6m9rMt4jYDH5xb34bsSvWO
   VA83zRKfFsYSkBbsnvnc2Pgk88ZWmzopoEcxVCZV/E4sHYj22bAPkwEAh
   lqY2fZfKTy+r9Db0KbTB4SBaENkCMAs3TWomes8UYJ78KMsHliMP2Rb9O
   LycvXhu+FqcdEO1AnInWg9GbQqHo3c89Z1mhOXToT6HPRel7U9IqqmW06
   in7fwxVFzdIHdyo3KZ9BulvAttyaejtknG9KgXnoOuU9CkISH9eqQphBJ
   A==;
X-CSE-ConnectionGUID: HQ/LVn1BT2aDCZctLxx4Ug==
X-CSE-MsgGUID: mJ9R4RuSSS++WeZeKKP2yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52839387"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52839387"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:07:31 -0700
X-CSE-ConnectionGUID: WyCMT39FRvG6OAESsDTxRw==
X-CSE-MsgGUID: pGKBh87UQFS+ElJgRpThpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="157699678"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:07:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Jun 2025 15:07:22 +0300 (EEST)
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: pali@kernel.org, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
    hansg@kernel.org, tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, 
    jay_lee@pixart.com, zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
    platform-driver-x86@vger.kernel.org, vsankar@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint Doubletap
 handling
In-Reply-To: <20250620004209.28250-1-vishnuocv@gmail.com>
Message-ID: <c7eb2d82-a487-1baa-dd89-4276551974ec@linux.intel.com>
References: <20250620004209.28250-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1819655843-1750851990=:944"
Content-ID: <3ae3fbab-0a9c-4ad2-8777-542cfe6fd6dc@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1819655843-1750851990=:944
Content-Type: text/plain; CHARSET=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <f918524e-32c6-3ac6-05dd-cd768f36dfca@linux.intel.com>

On Fri, 20 Jun 2025, Vishnu Sankar wrote:

I don't like the shortlog prefixes (in the subject), please don't make=20
confusing prefixes up like that.

> Newer ThinkPads have a doubletap feature that needs to be turned
> ON/OFF via the trackpoint registers.

Don't leave lines short mid-paragraph. Either reflow the paragraph or add=
=20
an empty line in between paragraphs.

> Systems released from 2023 have doubletap disabled by default and
> need the feature enabling to be useful.
>=20
> This patch introduces support for exposing and controlling the
> trackpoint doubletap feature via a sysfs attribute.
> /sys/devices/platform/thinkpad_acpi/tp_doubletap
> This can be toggled by an "enable" or a "disable".

This too has too short lines.

>=20
> With this implemented we can remove the masking of events, and rely on

"With this implemented" is way too vague wording.

> HW control instead, when the feature is disabled.
>=20
> Note - Early Thinkpads (pre 2015) used the same register for hysteris

hysteresis ?

> control, Check the FW IDs to make sure these are not affected.

This Note feels very much disconnected from the rest. Should be properly=20
described and perhaps in own patch (I don't know)?

> trackpoint.h is moved to linux/input/.

This patch doesn't look minimal and seems to be combining many changes=20
into one. Please make a patch series out of changes that can be separated=
=20
instead of putting all together.

> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/input/mouse/alps.c                    |   2 +-
>  drivers/input/mouse/psmouse-base.c            |   2 +-
>  drivers/input/mouse/trackpoint.c              | 115 ++++++++++++-
>  drivers/platform/x86/thinkpad_acpi.c          | 153 ++++++++++++++++--
>  .../linux/input}/trackpoint.h                 |  16 ++
>  5 files changed, 276 insertions(+), 12 deletions(-)
>  rename {drivers/input/mouse =3D> include/linux/input}/trackpoint.h (90%)
>=20
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index be734d65ea72..2abf338e8f1b 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -18,10 +18,10 @@
>  #include <linux/serio.h>
>  #include <linux/libps2.h>
>  #include <linux/dmi.h>
> +#include <linux/input/trackpoint.h>
> =20
>  #include "psmouse.h"
>  #include "alps.h"
> -#include "trackpoint.h"
> =20
>  /*
>   * Definitions for ALPS version 3 and 4 command mode protocol
> diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psm=
ouse-base.c
> index a2c9f7144864..6bc515254403 100644
> --- a/drivers/input/mouse/psmouse-base.c
> +++ b/drivers/input/mouse/psmouse-base.c
> @@ -21,6 +21,7 @@
>  #include <linux/libps2.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> +#include <linux/input/trackpoint.h>
> =20
>  #include "psmouse.h"
>  #include "synaptics.h"
> @@ -28,7 +29,6 @@
>  #include "alps.h"
>  #include "hgpk.h"
>  #include "lifebook.h"
> -#include "trackpoint.h"
>  #include "touchkit_ps2.h"
>  #include "elantech.h"
>  #include "sentelic.h"
> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/track=
point.c
> index 5f6643b69a2c..53d06d72968a 100644
> --- a/drivers/input/mouse/trackpoint.c
> +++ b/drivers/input/mouse/trackpoint.c
> @@ -13,8 +13,10 @@
>  #include <linux/libps2.h>
>  #include <linux/proc_fs.h>
>  #include <linux/uaccess.h>
> +#include <linux/input/trackpoint.h>
>  #include "psmouse.h"
> -#include "trackpoint.h"
> +
> +static struct trackpoint_data *trackpoint_dev;
> =20
>  static const char * const trackpoint_variants[] =3D {
>  =09[TP_VARIANT_IBM]=09=09=3D "IBM",
> @@ -63,6 +65,21 @@ static int trackpoint_write(struct ps2dev *ps2dev, u8 =
loc, u8 val)
>  =09return ps2_command(ps2dev, param, MAKE_PS2_CMD(3, 0, TP_COMMAND));
>  }
> =20
> +/* Read function for TrackPoint extended registers */
> +static int trackpoint_extended_read(struct ps2dev *ps2dev, u8 loc, u8 *v=
al)
> +{
> +=09u8 ext_param[2] =3D {TP_READ_MEM, loc};
> +=09int error;
> +
> +=09error =3D ps2_command(ps2dev,
> +=09=09=09    ext_param, MAKE_PS2_CMD(2, 1, TP_COMMAND));
> +
> +=09if (!error)
> +=09=09*val =3D ext_param[0];
> +
> +=09return error;
> +}
> +
>  static int trackpoint_toggle_bit(struct ps2dev *ps2dev, u8 loc, u8 mask)
>  {
>  =09u8 param[3] =3D { TP_TOGGLE, loc, mask };
> @@ -393,6 +410,96 @@ static int trackpoint_reconnect(struct psmouse *psmo=
use)
>  =09return 0;
>  }
> =20
> +/* List of known incapable device PNP IDs */
> +static const char * const dt_incompatible_devices[] =3D {
> +=09"LEN0304",
> +=09"LEN0306",
> +=09"LEN0317",
> +=09"LEN031A",
> +=09"LEN031B",
> +=09"LEN031C",
> +=09"LEN031D",
> +};
> +
> +/*
> + * checks if it=A2s a doubletap capable device
> + * The PNP ID format eg: is "PNP: LEN030d PNP0f13".
> + */
> +bool is_trackpoint_dt_capable(const char *pnp_id)
> +{
> +=09char id[16];
> +
> +=09/* Make sure string starts with "PNP: " */
> +=09if (strncmp(pnp_id, "PNP: LEN03", 10) !=3D 0)

We seem to have strstarts().

> +=09=09return false;
> +
> +=09/* Extract the first word after "PNP: " */
> +=09if (sscanf(pnp_id + 5, "%15s", id) !=3D 1)
> +=09=09return false;
> +
> +=09/* Check if it's blacklisted */
> +=09for (size_t i =3D 0; i < ARRAY_SIZE(dt_incompatible_devices); ++i) {
> +=09=09if (strcmp(pnp_id, dt_incompatible_devices[i]) =3D=3D 0)

Isn't this buggy wrt. the PNP: prefix??

Perhaps it would have been better to just do pnp_id +=3D 5 before sscanf()=
=20
as you don't care about the prefix after that.

> +=09=09=09return false;
> +=09}
> +
> +=09return true;
> +}
> +
> +/* Trackpoint doubletap status function */
> +int trackpoint_doubletap_status(bool *status)
> +{
> +=09struct trackpoint_data *tp =3D trackpoint_dev;
> +=09struct ps2dev *ps2dev =3D &tp->psmouse->ps2dev;
> +=09u8 reg_val;
> +=09int rc;
> +
> +=09/* Reading the Doubletap register using extended read */
> +=09rc =3D trackpoint_extended_read(ps2dev, TP_DOUBLETAP, &reg_val);
> +=09if (!rc)

Reverse the logic by returning the error first.

> +=09=09*status =3D reg_val & BIT(TP_DOUBLETAP_STATUS_BIT) ?

Please remove the _BIT suffix, move BIT() into the define + make sure=20
you've the necessary #include for BIT().

> +=09=09=09=09true : false;
> +
> +=09return rc;
> +}
> +EXPORT_SYMBOL(trackpoint_doubletap_status);
> +
> +/* Trackpoint doubletap enable/disable function */
> +int trackpoint_set_doubletap(bool enable)
> +{
> +=09struct trackpoint_data *tp =3D trackpoint_dev;
> +=09struct ps2dev *ps2dev =3D &tp->psmouse->ps2dev;
> +=09static u8 doubletap_status;
> +=09u8 new_val;
> +
> +=09if (!tp)
> +=09=09return -ENODEV;
> +
> +=09new_val =3D enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE;
> +
> +=09/* Comparing the new value paased with the existing value */
> +=09if (doubletap_status =3D=3D new_val) {
> +=09=09pr_info("TrackPoint: Doubletap is already %s\n",
> +=09=09=09enable ? "enabled" : "disabled");

Why this needs to be logged on info level?

> +=09=09return 0;
> +=09}
> +
> +=09doubletap_status =3D new_val;
> +
> +=09return trackpoint_write(ps2dev, TP_DOUBLETAP, new_val);
> +}
> +EXPORT_SYMBOL(trackpoint_set_doubletap);
> +
> +/*
> + * Doubletap capability check
> + * We use PNP ID to check the capability of the device.
> + */
> +bool trackpoint_doubletap_support(void)
> +{
> +=09return trackpoint_dev->doubletap_capable;
> +}
> +EXPORT_SYMBOL(trackpoint_doubletap_support);

Please write proper kerneldoc documentation for anything you EXPORT.

> +
>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
>  {
>  =09struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> @@ -425,6 +532,9 @@ int trackpoint_detect(struct psmouse *psmouse, bool s=
et_properties)
>  =09psmouse->reconnect =3D trackpoint_reconnect;
>  =09psmouse->disconnect =3D trackpoint_disconnect;
> =20
> +=09trackpoint_dev =3D psmouse->private;
> +=09trackpoint_dev->psmouse =3D psmouse;  /* Set parent reference */

So why the member variable is not called parent then if you need a=20
comment to tell that?

> +
>  =09if (variant_id !=3D TP_VARIANT_IBM) {
>  =09=09/* Newer variants do not support extended button query. */
>  =09=09button_info =3D 0x33;
> @@ -470,6 +580,9 @@ int trackpoint_detect(struct psmouse *psmouse, bool s=
et_properties)
>  =09=09     psmouse->vendor, firmware_id,
>  =09=09     (button_info & 0xf0) >> 4, button_info & 0x0f);
> =20
> +=09/* Checking the doubletap Capability */

Drop too obvious comments, this is readily readable from the code itself.

> +=09tp->doubletap_capable =3D is_trackpoint_dt_capable(ps2dev->serio->fir=
mware_id);
> +
>  =09return 0;
>  }
> =20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index e7350c9fa3aa..241c1dd5e1f4 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c

What's you plan for merging this as we've moved this file under lenovo/=20
subdir in this cycle?

> @@ -71,6 +71,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/units.h>
>  #include <linux/workqueue.h>
> +#include <linux/input/trackpoint.h>
> =20
>  #include <acpi/battery.h>
>  #include <acpi/video.h>
> @@ -373,7 +374,8 @@ static struct {
>  =09u32 hotkey_poll_active:1;
>  =09u32 has_adaptive_kbd:1;
>  =09u32 kbd_lang:1;
> -=09u32 trackpoint_doubletap:1;
> +=09u32 trackpoint_doubletap_state:1;
> +=09u32 trackpoint_doubletap_capable:1;
>  =09struct quirk_entry *quirks;
>  } tp_features;
> =20
> @@ -3325,6 +3327,8 @@ static int __init hotkey_init(struct ibm_init_struc=
t *iibm)
>  =09bool radiosw_state  =3D false;
>  =09bool tabletsw_state =3D false;
>  =09int hkeyv, res, status, camera_shutter_state;
> +=09bool dt_state;
> +=09int rc;
> =20
>  =09vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>  =09=09=09"initializing hotkey subdriver\n");
> @@ -3556,8 +3560,19 @@ static int __init hotkey_init(struct ibm_init_stru=
ct *iibm)
> =20
>  =09hotkey_poll_setup_safe(true);
> =20
> -=09/* Enable doubletap by default */
> -=09tp_features.trackpoint_doubletap =3D 1;
> +=09/* Checking doubletap status by default */
> +=09tp_features.trackpoint_doubletap_capable =3D trackpoint_doubletap_sup=
port();
> +
> +=09if (tp_features.trackpoint_doubletap_capable) {
> +=09=09rc =3D trackpoint_doubletap_status(&dt_state);
> +=09=09if (rc) {
> +=09=09=09/* Disable if access to register fails */
> +=09=09=09tp_features.trackpoint_doubletap_state =3D false;
> +=09=09=09pr_info("ThinkPad ACPI: Doubletap failed to check status\n");
> +=09=09} else {
> +=09=09=09tp_features.trackpoint_doubletap_state =3D dt_state;
> +=09=09}
> +=09}
> =20
>  =09return 0;
>  }
> @@ -3862,9 +3877,7 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool=
 *send_acpi_ev)
>  {
>  =09switch (hkey) {
>  =09case TP_HKEY_EV_TRACK_DOUBLETAP:
> -=09=09if (tp_features.trackpoint_doubletap)
> -=09=09=09tpacpi_input_send_key(hkey, send_acpi_ev);
> -
> +=09=09*send_acpi_ev =3D true;
>  =09=09return true;
>  =09default:
>  =09=09return false;
> @@ -10738,6 +10751,101 @@ static struct ibm_struct  dytc_profile_driver_d=
ata =3D {
>  =09.exit =3D dytc_profile_exit,
>  };
> =20
> +/***********************************************************************=
*
> + * Trackpoint Doubletap Interface
> + *
> + * Control/Monitoring of Trackpoint Doubletap from
> + * /sys/devices/platform/thinkpad_acpi/tp_doubletap
> + */
> +
> +static ssize_t tp_doubletap_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
> +{
> +=09bool status;
> +
> +=09if (!trackpoint_doubletap_status(&status))
> +=09=09return sysfs_emit(buf, "access error\n");

This should return error code instead I think.

> +
> +=09return sysfs_emit(buf, "%s\n", status ? "enabled" : "disabled");

I'm sure there's an existing helper for this bool -> "enabled"/"disabled"
conversion (make sure you add the #include if not yet there when you use=20
the helper).

> +}
> +
> +static ssize_t tp_doubletap_store(struct device *dev, struct device_attr=
ibute *attr, const char *buf, size_t count)
> +{
> +=09if (sysfs_streq(buf, "enable")) {

Hmm, should this attribute be named doubletap_enabled and follow the usual=
=20
boolean convention instead?

> +=09=09/* enabling the doubletap here */
> +=09=09if (!trackpoint_set_doubletap(true))
> +=09=09=09tp_features.trackpoint_doubletap_state =3D true;
> +=09} else if (sysfs_streq(buf, "disable")) {
> +=09=09/* disabling the doubletap here */
> +=09=09if (!trackpoint_set_doubletap(false))
> +=09=09=09tp_features.trackpoint_doubletap_state =3D false;
> +=09} else {
> +=09=09pr_err("ThinkPad ACPI: thinkpad_acpi: Invalid value '%s' for tp_do=
ubletap\n", buf);

No, sysfs store function should not spam log like this, returning -EINVAL=
=20
tells the very same thing already.

> +=09=09return -EINVAL;
> +=09}
> +
> +=09return count;
> +}
> +
> +static umode_t tp_doubletap_is_visible(struct kobject *kobj, struct attr=
ibute *attr, int index);
> +
> +static DEVICE_ATTR_RW(tp_doubletap);
> +
> +static struct attribute *tp_doubletap_attrs[] =3D {
> +=09&dev_attr_tp_doubletap.attr,
> +=09NULL
> +};
> +
> +static const struct attribute_group tp_doubletap_attr_group =3D {
> +=09.attrs =3D tp_doubletap_attrs,
> +=09.is_visible =3D tp_doubletap_is_visible,
> +};
> +
> +static umode_t tp_doubletap_is_visible(struct kobject *kobj, struct attr=
ibute *attr, int index)
> +{
> +=09/* Only show the attribute if the TrackPoint doubletap is supported *=
/
> +=09tp_features.trackpoint_doubletap_capable =3D trackpoint_doubletap_sup=
port();
> +=09if (!tp_features.trackpoint_doubletap_capable)
> +=09=09return 0;
> +
> +=09pr_info("ThinkPad ACPI: TrackPoint doubletap sysfs is visible\n");

???

In case any pr_*() printing remains after you've addressed my comments=20
(this one shouldn't remain). You should use dev_*() functions for=20
printing.

> +=09return attr->mode;
> +}
> +
> +static struct delayed_work tp_doubletap_work;
> +
> +static void tp_doubletap_work_func(struct work_struct *work)
> +{
> +=09if (!trackpoint_doubletap_support()) {
> +=09=09pr_info("TrackPoint doubletap not supported yet, rechecking later\=
n");

dev_dbg()

> +=09=09schedule_delayed_work(&tp_doubletap_work, msecs_to_jiffies(2000));
> +=09=09return;
> +=09}
> +
> +=09if (sysfs_create_group(&tpacpi_pdev->dev.kobj, &tp_doubletap_attr_gro=
up) =3D=3D 0)
> +=09=09pr_info("TrackPoint doubletap sysfs group created\n");

dev_dbg()

> +=09else
> +=09=09pr_err("Failed to create TrackPoint doubletap sysfs group\n");

So this is effectively doing probe/init related code in a work function??
Should be very well justified in the changelog if there's no better way to=
=20
do this.

> +}
> +
> +static int __init tp_doubletap_init(struct ibm_init_struct *iibm)
> +{
> +=09INIT_DELAYED_WORK(&tp_doubletap_work, tp_doubletap_work_func);
> +=09schedule_delayed_work(&tp_doubletap_work, msecs_to_jiffies(1000));
> +
> +=09return 0;
> +}
> +
> +static void tp_doubletap_exit(void)
> +{
> +=09device_remove_file(&tpacpi_pdev->dev, &dev_attr_tp_doubletap);
> +}
> +
> +static struct ibm_struct tp_doubletap_driver_data =3D {
> +=09.name =3D "tp_doubletap",
> +=09.exit =3D  tp_doubletap_exit,
> +};
> +
>  /***********************************************************************=
**
>   * Keyboard language interface
>   */
> @@ -11192,7 +11300,7 @@ static struct platform_driver tpacpi_hwmon_pdrive=
r =3D {
>   */
>  static bool tpacpi_driver_event(const unsigned int hkey_event)
>  {
> -=09int camera_shutter_state;
> +=09int camera_shutter_state, rc;
> =20
>  =09switch (hkey_event) {
>  =09case TP_HKEY_EV_BRGHT_UP:
> @@ -11284,8 +11392,30 @@ static bool tpacpi_driver_event(const unsigned i=
nt hkey_event)
>  =09=09mutex_unlock(&tpacpi_inputdev_send_mutex);
>  =09=09return true;
>  =09case TP_HKEY_EV_DOUBLETAP_TOGGLE:
> -=09=09tp_features.trackpoint_doubletap =3D !tp_features.trackpoint_doubl=
etap;
> -=09=09return true;
> +=09=09if (tp_features.trackpoint_doubletap_capable) {

Can't you reverse the logic and return false right away?

> +=09=09=09/* Togging the register value */
> +=09=09=09rc =3D trackpoint_set_doubletap(!tp_features.trackpoint_doublet=
ap_state);
> +
> +=09=09=09if (rc) {
> +=09=09=09=09pr_err("ThinkPad ACPI: Trackpoint doubletap toggle failed\n"=
);

return false

> +=09=09=09} else {
> +=09=09=09=09/* Toggling the Doubletap Enable/Disable */
> +=09=09=09=09tp_features.trackpoint_doubletap_state =3D
> +=09=09=09=09=09!tp_features.trackpoint_doubletap_state;
> +=09=09=09=09pr_info("ThinkPad ACPI: Trackpoint doubletap is %s\n",
> +=09=09=09=09=09tp_features.trackpoint_doubletap_state ?
> +=09=09=09=09=09"enabled" : "disabled");

Use a string helper.

Looks another case for dev_dbg().

> +
> +=09=09=09=09return true;
> +=09=09=09}

This block becomes much lower in indentation after you reverse all the=20
logic above. :-)

> +=09=09}
> +
> +=09=09/*
> +=09=09 * Suppress the event if Doubletap is not supported
> +=09=09 * or if the trackpoint_set_doubletap() is failing
> +=09=09 */
> +=09=09return false;
> +
>  =09case TP_HKEY_EV_PROFILE_TOGGLE:
>  =09case TP_HKEY_EV_PROFILE_TOGGLE2:
>  =09=09platform_profile_cycle();
> @@ -11751,6 +11881,11 @@ static struct ibm_init_struct ibms_init[] __init=
data =3D {
>  =09=09.init =3D auxmac_init,
>  =09=09.data =3D &auxmac_data,
>  =09},
> +=09{
> +=09=09.init =3D tp_doubletap_init,
> +=09=09.data =3D &tp_doubletap_driver_data
> +=09},
> +
>  };
> =20
>  static int __init set_ibm_param(const char *val, const struct kernel_par=
am *kp)
> diff --git a/drivers/input/mouse/trackpoint.h b/include/linux/input/track=
point.h
> similarity index 90%
> rename from drivers/input/mouse/trackpoint.h
> rename to include/linux/input/trackpoint.h
> index eb5412904fe0..a8165becabe6 100644
> --- a/drivers/input/mouse/trackpoint.h
> +++ b/include/linux/input/trackpoint.h
> @@ -69,6 +69,8 @@
>  =09=09=09=09=09/* (how hard it is to drag */
>  =09=09=09=09=09/* with Z-axis pressed) */
> =20
> +#define TP_DOUBLETAP=09=090x58=09/* TrackPoint doubletap register */
> +
>  #define TP_MINDRAG=09=090x59=09/* Minimum amount of force needed */
>  =09=09=09=09=09/* to trigger dragging */
> =20
> @@ -139,6 +141,12 @@
>  #define TP_DEF_TWOHAND=09=090x00
>  #define TP_DEF_SOURCE_TAG=090x00
> =20
> +/* Doubletap register values */
> +#define TP_DOUBLETAP_ENABLE=090xFF=09/* Enable value */
> +#define TP_DOUBLETAP_DISABLE=090xFE=09/* Disable value */

So is the actual enable bit the lowest and we should not touch the other=20
bits? Or does the entire value have this meaning?

> +
> +#define TP_DOUBLETAP_STATUS_BIT 0=09/* 0th bit defines enable/disable */
> +
>  #define MAKE_PS2_CMD(params, results, cmd) ((params<<12) | (results<<8) =
| (cmd))
> =20
>  struct trackpoint_data {
> @@ -150,13 +158,21 @@ struct trackpoint_data {
>  =09u8 thresh, upthresh;
>  =09u8 ztime, jenks;
>  =09u8 drift_time;
> +=09bool doubletap_capable;
> =20
>  =09/* toggles */
>  =09bool press_to_select;
>  =09bool skipback;
>  =09bool ext_dev;
> +
> +=09struct psmouse *psmouse;  /* Parent device */

parent_mouse and drop the comment?

>  };
> =20
>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
> =20
> +int trackpoint_doubletap_status(bool *status);
> +int trackpoint_set_doubletap(bool enable);
> +bool trackpoint_doubletap_support(void);
> +bool is_trackpoint_dt_capable(const char *device_id);
> +
>  #endif /* _TRACKPOINT_H */
>=20

--=20
 i.
--8323328-1819655843-1750851990=:944--

