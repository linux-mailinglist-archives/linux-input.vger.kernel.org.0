Return-Path: <linux-input+bounces-9138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DECCA093AC
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 15:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C044F1887420
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 14:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5908A211282;
	Fri, 10 Jan 2025 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StSnwqDF"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D1920E709;
	Fri, 10 Jan 2025 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736519947; cv=none; b=tmTFtvatMu9F9s6Fmyw8yRKngDGT0VLMRFdCUyw77HVxR5DLzlb4ZeDCrHF/J6+w0JSTgykWY86L347qBVpU/7CdfWgvPvm5xrxdtXgnGGuAb7XjQprnorWBAZNqLnpw/S7ZKx0I0A+gnlj5B3iIRL4nmcTrays7oZwV76dtVec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736519947; c=relaxed/simple;
	bh=0lIIG1l/qpKaduDBvmrPgvj86O7kwir3WU5YUcyIb7U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=A2cWEHKJ4BWpAkiYkVuU5owXZZbiTOjs6p6c0LHfjn9Uy3dB3xyE1RZYzf6nI4RKCYrrbTrui6sgCBgXblzVXCh8HKMfRcUMNbv35Ufbeq9D3oZp0qWbHVD4742C9q95Zyj24G29SMuclqKGYDvq9U8RcVfeRY0XfWfPnjE/Sj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StSnwqDF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736519945; x=1768055945;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0lIIG1l/qpKaduDBvmrPgvj86O7kwir3WU5YUcyIb7U=;
  b=StSnwqDFxD7TxgnDqwNJGUMw0D72r4WYp+3zyk9G/PUN2gurPIm505oD
   P6CYKAvMyM5xCfhWA54OOm6Mtss+YU4xKs3YZttzeqIacgI1TD9mGQDnv
   FHGuBtVNvuZoKvYGHTpLM1VJLQTvjh3aZ2QTXAylDhGSYh5WOABR14BPI
   mUNiXfJch/7WQYQRQQVtnLEz4XO5KcVG8fqNA4P9xdkoMgWySkajr5Gz1
   1Vmb38vjxTdlJLjRGm6GYRPw3VqTD6i53KimozZ4M9zEPi0Gsk74vmMvs
   crOg1X+xIW8FVx4M1YM3K7D4nA0n2e1OnzSyWSh+gePAo/TbU7hjj6dxT
   g==;
X-CSE-ConnectionGUID: BnB1NxgPQrOzTkrAO3Oqjw==
X-CSE-MsgGUID: MSU0nwSNRIazjJd/2KTzlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36031777"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36031777"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:39:04 -0800
X-CSE-ConnectionGUID: coH+or8jTz6B2HqNgNwnMw==
X-CSE-MsgGUID: I6pra4SLRnqyCVLoQZ/bJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104633306"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO localhost) ([10.245.244.158])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:39:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jan 2025 16:38:56 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: dmitry.torokhov@gmail.com, o2g.org.ru@gmail.com, 
    Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com, 
    luke@ljones.dev, mjg59@srcf.ucam.org, pali@kernel.org, 
    eric.piel@tremplin-utc.net, jlee@suse.com, kenneth.t.chan@gmail.com, 
    coproscefalo@gmail.com, linux-input@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    josh@joshuagrisham.com
Subject: Re: [PATCH v2] Input: i8042 - Add support for platform filter
 contexts
In-Reply-To: <b44f5e56-e05a-4f0e-a9e0-2b5fe5cefa1f@gmx.de>
Message-ID: <996ee62d-7a0e-5058-6ebe-0a9c51d3ea99@linux.intel.com>
References: <20241222215042.7709-1-W_Armin@gmx.de> <b44f5e56-e05a-4f0e-a9e0-2b5fe5cefa1f@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-409518992-1736519936=:1003"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-409518992-1736519936=:1003
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 2 Jan 2025, Armin Wolf wrote:

> Am 22.12.24 um 22:50 schrieb Armin Wolf:
>=20
> > Currently the platform filter cannot access any driver-specific state
> > which forces drivers installing a i8042 filter to have at least some
> > kind of global pointer for their filter.
> >=20
> > This however might cause issues should such a driver probe multiple
> > devices. Fix this by allowing callers of i8042_install_filter() to
> > submit a context pointer which is then passed to the i8042 filter.
> >=20
> > Also introduce a separate type for the i8042 filter (i8042_filter_t)
> > so that the function definitions can stay compact.
> >=20
> > Tested on a Dell Inspiron 3505.
>=20
> Any updates on this?

We haven't heard what Dimitry thinks of the reasonale you gave in v1.

I'd like to have this as it allows us clean up the globals on pdx86 side=20
even if i8042 is still limited to a single filter (and uses globals=20
itself).

--=20
 i.

> > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > ---
> > Changes since v1:
> > - add kerneldoc for new typedef
> > - add Reviewed-by tag
> > ---
> >   drivers/input/misc/ideapad_slidebar.c   |  4 ++--
> >   drivers/input/serio/i8042.c             | 17 ++++++++-------
> >   drivers/platform/x86/asus-nb-wmi.c      |  3 ++-
> >   drivers/platform/x86/asus-wmi.c         |  2 +-
> >   drivers/platform/x86/asus-wmi.h         |  3 +--
> >   drivers/platform/x86/dell/dell-laptop.c |  6 +++---
> >   drivers/platform/x86/hp/hp_accel.c      |  4 ++--
> >   drivers/platform/x86/msi-laptop.c       |  6 +++---
> >   drivers/platform/x86/panasonic-laptop.c |  4 ++--
> >   drivers/platform/x86/toshiba_acpi.c     |  4 ++--
> >   include/linux/i8042.h                   | 28 ++++++++++++++++++------=
-
> >   11 files changed, 48 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/drivers/input/misc/ideapad_slidebar.c
> > b/drivers/input/misc/ideapad_slidebar.c
> > index f6e5fc807b4d..ab2e0a401904 100644
> > --- a/drivers/input/misc/ideapad_slidebar.c
> > +++ b/drivers/input/misc/ideapad_slidebar.c
> > @@ -121,7 +121,7 @@ static void slidebar_mode_set(u8 mode)
> >   }
> >=20
> >   static bool slidebar_i8042_filter(unsigned char data, unsigned char s=
tr,
> > -=09=09=09=09  struct serio *port)
> > +=09=09=09=09  struct serio *port, void *context)
> >   {
> >   =09static bool extended =3D false;
> >=20
> > @@ -219,7 +219,7 @@ static int __init ideapad_probe(struct platform_dev=
ice*
> > pdev)
> >   =09input_set_capability(slidebar_input_dev, EV_ABS, ABS_X);
> >   =09input_set_abs_params(slidebar_input_dev, ABS_X, 0, 0xff, 0, 0);
> >=20
> > -=09err =3D i8042_install_filter(slidebar_i8042_filter);
> > +=09err =3D i8042_install_filter(slidebar_i8042_filter, NULL);
> >   =09if (err) {
> >   =09=09dev_err(&pdev->dev,
> >   =09=09=09"Failed to install i8042 filter: %d\n", err);
> > diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> > index 509330a27880..cab5a4c5baf5 100644
> > --- a/drivers/input/serio/i8042.c
> > +++ b/drivers/input/serio/i8042.c
> > @@ -179,8 +179,8 @@ static struct platform_device *i8042_platform_devic=
e;
> >   static struct notifier_block i8042_kbd_bind_notifier_block;
> >=20
> >   static bool i8042_handle_data(int irq);
> > -static bool (*i8042_platform_filter)(unsigned char data, unsigned char=
 str,
> > -=09=09=09=09     struct serio *serio);
> > +static i8042_filter_t i8042_platform_filter;
> > +static void *i8042_platform_filter_context;
> >=20
> >   void i8042_lock_chip(void)
> >   {
> > @@ -194,8 +194,7 @@ void i8042_unlock_chip(void)
> >   }
> >   EXPORT_SYMBOL(i8042_unlock_chip);
> >=20
> > -int i8042_install_filter(bool (*filter)(unsigned char data, unsigned c=
har
> > str,
> > -=09=09=09=09=09struct serio *serio))
> > +int i8042_install_filter(i8042_filter_t filter, void *context)
> >   {
> >   =09guard(spinlock_irqsave)(&i8042_lock);
> >=20
> > @@ -203,12 +202,12 @@ int i8042_install_filter(bool (*filter)(unsigned =
char
> > data, unsigned char str,
> >   =09=09return -EBUSY;
> >=20
> >   =09i8042_platform_filter =3D filter;
> > +=09i8042_platform_filter_context =3D context;
> >   =09return 0;
> >   }
> >   EXPORT_SYMBOL(i8042_install_filter);
> >=20
> > -int i8042_remove_filter(bool (*filter)(unsigned char data, unsigned ch=
ar
> > str,
> > -=09=09=09=09       struct serio *port))
> > +int i8042_remove_filter(i8042_filter_t filter)
> >   {
> >   =09guard(spinlock_irqsave)(&i8042_lock);
> >=20
> > @@ -216,6 +215,7 @@ int i8042_remove_filter(bool (*filter)(unsigned cha=
r
> > data, unsigned char str,
> >   =09=09return -EINVAL;
> >=20
> >   =09i8042_platform_filter =3D NULL;
> > +=09i8042_platform_filter_context =3D NULL;
> >   =09return 0;
> >   }
> >   EXPORT_SYMBOL(i8042_remove_filter);
> > @@ -480,7 +480,10 @@ static bool i8042_filter(unsigned char data, unsig=
ned
> > char str,
> >   =09=09}
> >   =09}
> >=20
> > -=09if (i8042_platform_filter && i8042_platform_filter(data, str, serio=
))
> > {
> > +=09if (!i8042_platform_filter)
> > +=09=09return false;
> > +
> > +=09if (i8042_platform_filter(data, str, serio,
> > i8042_platform_filter_context)) {
> >   =09=09dbg("Filtered out by platform filter\n");
> >   =09=09return true;
> >   =09}
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c
> > b/drivers/platform/x86/asus-nb-wmi.c
> > index ef04d396f61c..a3d4b98045f8 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -50,7 +50,8 @@ MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect:
> > -1:auto 0:disable 1:kbd-do
> >   static struct quirk_entry *quirks;
> >   static bool atkbd_reports_vol_keys;
> >=20
> > -static bool asus_i8042_filter(unsigned char data, unsigned char str, s=
truct
> > serio *port)
> > +static bool asus_i8042_filter(unsigned char data, unsigned char str, s=
truct
> > serio *port,
> > +=09=09=09      void *context)
> >   {
> >   =09static bool extended_e0;
> >   =09static bool extended_e1;
> > diff --git a/drivers/platform/x86/asus-wmi.c
> > b/drivers/platform/x86/asus-wmi.c
> > index fdeebab96fc0..6c674de60ec0 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -4824,7 +4824,7 @@ static int asus_wmi_add(struct platform_device *p=
dev)
> >   =09}
> >=20
> >   =09if (asus->driver->i8042_filter) {
> > -=09=09err =3D i8042_install_filter(asus->driver->i8042_filter);
> > +=09=09err =3D i8042_install_filter(asus->driver->i8042_filter, NULL);
> >   =09=09if (err)
> >   =09=09=09pr_warn("Unable to install key filter - %d\n", err);
> >   =09}
> > diff --git a/drivers/platform/x86/asus-wmi.h
> > b/drivers/platform/x86/asus-wmi.h
> > index d02f15fd3482..018dfde4025e 100644
> > --- a/drivers/platform/x86/asus-wmi.h
> > +++ b/drivers/platform/x86/asus-wmi.h
> > @@ -73,8 +73,7 @@ struct asus_wmi_driver {
> >   =09void (*key_filter) (struct asus_wmi_driver *driver, int *code,
> >   =09=09=09    unsigned int *value, bool *autorelease);
> >   =09/* Optional standard i8042 filter */
> > -=09bool (*i8042_filter)(unsigned char data, unsigned char str,
> > -=09=09=09     struct serio *serio);
> > +=09i8042_filter_t=09=09i8042_filter;
> >=20
> >   =09int (*probe) (struct platform_device *device);
> >   =09void (*detect_quirks) (struct asus_wmi_driver *driver);
> > diff --git a/drivers/platform/x86/dell/dell-laptop.c
> > b/drivers/platform/x86/dell/dell-laptop.c
> > index 5671bd0deee7..58b860b88fff 100644
> > --- a/drivers/platform/x86/dell/dell-laptop.c
> > +++ b/drivers/platform/x86/dell/dell-laptop.c
> > @@ -725,8 +725,8 @@ static void dell_update_rfkill(struct work_struct
> > *ignored)
> >   }
> >   static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
> >=20
> > -static bool dell_laptop_i8042_filter(unsigned char data, unsigned char=
 str,
> > -=09=09=09      struct serio *port)
> > +static bool dell_laptop_i8042_filter(unsigned char data, unsigned char=
 str,
> > struct serio *port,
> > +=09=09=09=09     void *context)
> >   {
> >   =09static bool extended;
> >=20
> > @@ -884,7 +884,7 @@ static int __init dell_setup_rfkill(void)
> >   =09=09pr_warn("Unable to register dell rbtn notifier\n");
> >   =09=09goto err_filter;
> >   =09} else {
> > -=09=09ret =3D i8042_install_filter(dell_laptop_i8042_filter);
> > +=09=09ret =3D i8042_install_filter(dell_laptop_i8042_filter, NULL);
> >   =09=09if (ret) {
> >   =09=09=09pr_warn("Unable to install key filter\n");
> >   =09=09=09goto err_filter;
> > diff --git a/drivers/platform/x86/hp/hp_accel.c
> > b/drivers/platform/x86/hp/hp_accel.c
> > index 39a6530f5072..10d5af18d639 100644
> > --- a/drivers/platform/x86/hp/hp_accel.c
> > +++ b/drivers/platform/x86/hp/hp_accel.c
> > @@ -267,7 +267,7 @@ static struct delayed_led_classdev hpled_led =3D {
> >   };
> >=20
> >   static bool hp_accel_i8042_filter(unsigned char data, unsigned char s=
tr,
> > -=09=09=09=09  struct serio *port)
> > +=09=09=09=09  struct serio *port, void *context)
> >   {
> >   =09static bool extended;
> >=20
> > @@ -326,7 +326,7 @@ static int lis3lv02d_probe(struct platform_device
> > *device)
> >   =09/* filter to remove HPQ6000 accelerometer data
> >   =09 * from keyboard bus stream */
> >   =09if (strstr(dev_name(&device->dev), "HPQ6000"))
> > -=09=09i8042_install_filter(hp_accel_i8042_filter);
> > +=09=09i8042_install_filter(hp_accel_i8042_filter, NULL);
> >=20
> >   =09INIT_WORK(&hpled_led.work, delayed_set_status_worker);
> >   =09ret =3D led_classdev_register(NULL, &hpled_led.led_classdev);
> > diff --git a/drivers/platform/x86/msi-laptop.c
> > b/drivers/platform/x86/msi-laptop.c
> > index e5391a37014d..c4b150fa093f 100644
> > --- a/drivers/platform/x86/msi-laptop.c
> > +++ b/drivers/platform/x86/msi-laptop.c
> > @@ -806,8 +806,8 @@ static void msi_send_touchpad_key(struct work_struc=
t
> > *ignored)
> >   }
> >   static DECLARE_DELAYED_WORK(msi_touchpad_dwork, msi_send_touchpad_key=
);
> >=20
> > -static bool msi_laptop_i8042_filter(unsigned char data, unsigned char =
str,
> > -=09=09=09=09struct serio *port)
> > +static bool msi_laptop_i8042_filter(unsigned char data, unsigned char =
str,
> > struct serio *port,
> > +=09=09=09=09    void *context)
> >   {
> >   =09static bool extended;
> >=20
> > @@ -996,7 +996,7 @@ static int __init load_scm_model_init(struct
> > platform_device *sdev)
> >   =09if (result)
> >   =09=09goto fail_input;
> >=20
> > -=09result =3D i8042_install_filter(msi_laptop_i8042_filter);
> > +=09result =3D i8042_install_filter(msi_laptop_i8042_filter, NULL);
> >   =09if (result) {
> >   =09=09pr_err("Unable to install key filter\n");
> >   =09=09goto fail_filter;
> > diff --git a/drivers/platform/x86/panasonic-laptop.c
> > b/drivers/platform/x86/panasonic-laptop.c
> > index 22ca70eb8227..2987b4db6009 100644
> > --- a/drivers/platform/x86/panasonic-laptop.c
> > +++ b/drivers/platform/x86/panasonic-laptop.c
> > @@ -260,7 +260,7 @@ struct pcc_acpi {
> >    * keypress events over the PS/2 kbd interface, filter these out.
> >    */
> >   static bool panasonic_i8042_filter(unsigned char data, unsigned char =
str,
> > -=09=09=09=09   struct serio *port)
> > +=09=09=09=09   struct serio *port, void *context)
> >   {
> >   =09static bool extended;
> >=20
> > @@ -1100,7 +1100,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device
> > *device)
> >   =09=09pcc->platform =3D NULL;
> >   =09}
> >=20
> > -=09i8042_install_filter(panasonic_i8042_filter);
> > +=09i8042_install_filter(panasonic_i8042_filter, NULL);
> >   =09return 0;
> >=20
> >   out_platform:
> > diff --git a/drivers/platform/x86/toshiba_acpi.c
> > b/drivers/platform/x86/toshiba_acpi.c
> > index 78a5aac2dcfd..5ad3a7183d33 100644
> > --- a/drivers/platform/x86/toshiba_acpi.c
> > +++ b/drivers/platform/x86/toshiba_acpi.c
> > @@ -2755,7 +2755,7 @@ static int toshiba_acpi_enable_hotkeys(struct
> > toshiba_acpi_dev *dev)
> >   }
> >=20
> >   static bool toshiba_acpi_i8042_filter(unsigned char data, unsigned ch=
ar
> > str,
> > -=09=09=09=09      struct serio *port)
> > +=09=09=09=09      struct serio *port, void *context)
> >   {
> >   =09if (str & I8042_STR_AUXDATA)
> >   =09=09return false;
> > @@ -2915,7 +2915,7 @@ static int toshiba_acpi_setup_keyboard(struct
> > toshiba_acpi_dev *dev)
> >   =09if (ec_handle && acpi_has_method(ec_handle, "NTFY")) {
> >   =09=09INIT_WORK(&dev->hotkey_work, toshiba_acpi_hotkey_work);
> >=20
> > -=09=09error =3D i8042_install_filter(toshiba_acpi_i8042_filter);
> > +=09=09error =3D i8042_install_filter(toshiba_acpi_i8042_filter, NULL);
> >   =09=09if (error) {
> >   =09=09=09pr_err("Error installing key filter\n");
> >   =09=09=09goto err_free_dev;
> > diff --git a/include/linux/i8042.h b/include/linux/i8042.h
> > index 95b07f8b77fe..00037c13abc8 100644
> > --- a/include/linux/i8042.h
> > +++ b/include/linux/i8042.h
> > @@ -54,15 +54,29 @@
> >=20
> >   struct serio;
> >=20
> > +/**
> > + * typedef i8042_filter_t - i8042 filter callback
> > + * @data: Data received by the i8042 controller
> > + * @str: Status register of the i8042 controller
> > + * @serio: Serio of the i8042 controller
> > + * @context: Context pointer associated with this callback
> > + *
> > + * This represents a i8042 filter callback which can be used with
> > i8042_install_filter()
> > + * and i8042_remove_filter() to filter the i8042 input for
> > platform-specific key codes.
> > + *
> > + * Context: Interrupt context.
> > + * Returns: true if the data should be filtered out, false if otherwis=
e.
> > + */
> > +typedef bool (*i8042_filter_t)(unsigned char data, unsigned char str,
> > struct serio *serio,
> > +=09=09=09       void *context);
> > +
> >   #if defined(CONFIG_SERIO_I8042) || defined(CONFIG_SERIO_I8042_MODULE)
> >=20
> >   void i8042_lock_chip(void);
> >   void i8042_unlock_chip(void);
> >   int i8042_command(unsigned char *param, int command);
> > -int i8042_install_filter(bool (*filter)(unsigned char data, unsigned c=
har
> > str,
> > -=09=09=09=09=09struct serio *serio));
> > -int i8042_remove_filter(bool (*filter)(unsigned char data, unsigned ch=
ar
> > str,
> > -=09=09=09=09       struct serio *serio));
> > +int i8042_install_filter(i8042_filter_t filter, void *context);
> > +int i8042_remove_filter(i8042_filter_t filter);
> >=20
> >   #else
> >=20
> > @@ -79,14 +93,12 @@ static inline int i8042_command(unsigned char *para=
m,
> > int command)
> >   =09return -ENODEV;
> >   }
> >=20
> > -static inline int i8042_install_filter(bool (*filter)(unsigned char da=
ta,
> > unsigned char str,
> > -=09=09=09=09=09struct serio *serio))
> > +static inline int i8042_install_filter(i8042_filter_t filter, void
> > *context)
> >   {
> >   =09return -ENODEV;
> >   }
> >=20
> > -static inline int i8042_remove_filter(bool (*filter)(unsigned char dat=
a,
> > unsigned char str,
> > -=09=09=09=09       struct serio *serio))
> > +static inline int i8042_remove_filter(i8042_filter_t filter)
> >   {
> >   =09return -ENODEV;
> >   }
> > --
> > 2.39.5
> >=20
> >=20
>=20
--8323328-409518992-1736519936=:1003--

