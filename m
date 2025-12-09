Return-Path: <linux-input+bounces-16501-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD285CAF6A6
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 10:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36A3A300AC0F
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 09:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15CB2D3A7B;
	Tue,  9 Dec 2025 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0ylXnOG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7824C19005E;
	Tue,  9 Dec 2025 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765271655; cv=none; b=EPEztNlAw1NiYg25xMm8zaNaXiMw6OKF2R6f2I26yhopo8/2VtkaULxZEA+alTvE6n/taa0z0hlctbRJ0a5IODWTQnMH24sLaEcvO8WmiL3c6Sw96ujjjdQzkp/YteuqDHxCRkvHao7UcXvyNJeOht1LIraKZDyI5xTiIhOMK6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765271655; c=relaxed/simple;
	bh=Ye91flLLQCp3cdsg5BhMjokmZ2hF8qhPAcdrJvZxViE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kVcOF5ReC8pUE5i3LlLKGcF9Bx62iWk3TFnDGNiWKEKroXYFSApJ17G/ax8L8vwN3VbF/rU8Vnrg9OIbQgxWX3LWqwMCKdHOSnHDESg1il9pmp92//BLcK1DGqNMM5vDafWcEd7UNwIEbLDKgjEWFSF2JCY1sBRyNjspx7FWtpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0ylXnOG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765271654; x=1796807654;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ye91flLLQCp3cdsg5BhMjokmZ2hF8qhPAcdrJvZxViE=;
  b=W0ylXnOGbOlaxj/uWtifCOwvzXN57ltb6Tr8QSnOPmm2CdegzI5TRrEX
   0m46UBDPIRAYjOXUVbq6pKjsaeibEKRpdY/ipCJ/mEW4Mj1I3/qOysqdL
   gsYB06eRGWgZu/MvZWFA9E3QJAELhJ+EfNbxQJOLtMcGIu4pAmTRzKamG
   RKJn7wX7EfH4m6JREbE6qwTLsTa4fnoFe6YH0T0C7toR/bOgnfoscUe7q
   mtuQLfjzx7ongR9j3LjSGqVNq8IqoNsJdq1VPc0x9wUR2nAG6hr87y1qc
   XN8JfLGX728W99u+p04dJHmFNx4EWxBUa9Z7UnTN4ugfLKXeSpcH2i24K
   w==;
X-CSE-ConnectionGUID: daYHMdUMTMKqMLjZXjLvmQ==
X-CSE-MsgGUID: +33vAYOcSGS/V2vFkDcG+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77841179"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="77841179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 01:14:13 -0800
X-CSE-ConnectionGUID: nPHNCy0+R7O5zZ+iGekYYw==
X-CSE-MsgGUID: L5rCBrPVTeO3S+oqKvFBnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="196467521"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.139])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 01:14:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Dec 2025 11:14:05 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 05/11] HID: asus: move vendor initialization to
 probe
In-Reply-To: <CAGwozwEN-Rzjk2nZ9mbROE2vbiQ4LUiTn5OB6mKSfArRwDgL7Q@mail.gmail.com>
Message-ID: <c2abcc55-8f85-4f46-8d9d-4cb74782942a@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev> <20251122110032.4274-6-lkml@antheas.dev> <8e3817f1-73e8-6f61-3eca-e45aa4d46af3@linux.intel.com> <CAGwozwEN-Rzjk2nZ9mbROE2vbiQ4LUiTn5OB6mKSfArRwDgL7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-967865929-1765271645=:1137"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-967865929-1765271645=:1137
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 9 Dec 2025, Antheas Kapenekakis wrote:
> On Mon, 8 Dec 2025 at 18:11, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Sat, 22 Nov 2025, Antheas Kapenekakis wrote:
> >
> > > ROG NKEY devices have multiple HID endpoints, around 3-4. One of thos=
e
> > > endpoints has a usage page of 0xff31, and is the one that emits keybo=
ard
> > > shortcuts and controls RGB/backlight. Currently, this driver places
> > > the usage page check under asus_input_mapping and then inits backligh=
t
> > > in asus_input_configured which is unnecessarily complicated and preve=
nts
> > > probe from performing customizations on the vendor endpoint.
> > >
> > > Simplify the logic by introducing an is_vendor variable into probe th=
at
> > > checks for usage page 0xff31. Then, use this variable to move backlig=
ht
> > > initialization into probe instead of asus_input_configured, and remov=
e
> > > the backlight check from asus_input_mapping.
> >
> > In the changelogs, please add () after any name that refers to a C
> > function so the reader immediately knows you're talking about a functio=
n.
>=20
> Sure. What should be my timeline for fixing this?
>=20
> I assume we missed the merge window. If not, I can tweak the series
> and send it later today

This is 6.20 material so no big hurry.

--
 i.

> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  drivers/hid/hid-asus.c | 35 ++++++++++++++++++-----------------
> > >  1 file changed, 18 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > > index 2a412e10f916..faac971794c0 100644
> > > --- a/drivers/hid/hid-asus.c
> > > +++ b/drivers/hid/hid-asus.c
> > > @@ -48,6 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad"=
);
> > >  #define T100CHI_MOUSE_REPORT_ID 0x06
> > >  #define FEATURE_REPORT_ID 0x0d
> > >  #define INPUT_REPORT_ID 0x5d
> > > +#define HID_USAGE_PAGE_VENDOR 0xff310000
> > >  #define FEATURE_KBD_REPORT_ID 0x5a
> > >  #define FEATURE_KBD_REPORT_SIZE 64
> > >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > > @@ -127,7 +128,6 @@ struct asus_drvdata {
> > >       struct input_dev *tp_kbd_input;
> > >       struct asus_kbd_leds *kbd_backlight;
> > >       const struct asus_touchpad_info *tp;
> > > -     bool enable_backlight;
> > >       struct power_supply *battery;
> > >       struct power_supply_desc battery_desc;
> > >       int battery_capacity;
> > > @@ -318,7 +318,7 @@ static int asus_e1239t_event(struct asus_drvdata =
*drvdat, u8 *data, int size)
> > >  static int asus_event(struct hid_device *hdev, struct hid_field *fie=
ld,
> > >                     struct hid_usage *usage, __s32 value)
> > >  {
> > > -     if ((usage->hid & HID_USAGE_PAGE) =3D=3D 0xff310000 &&
> > > +     if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_USAGE_PAGE_VENDOR =
&&
> > >           (usage->hid & HID_USAGE) !=3D 0x00 &&
> > >           (usage->hid & HID_USAGE) !=3D 0xff && !usage->type) {
> > >               hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%=
02x\n",
> > > @@ -941,11 +941,6 @@ static int asus_input_configured(struct hid_devi=
ce *hdev, struct hid_input *hi)
> > >
> > >       drvdata->input =3D input;
> > >
> > > -     if (drvdata->enable_backlight &&
> > > -         !asus_kbd_wmi_led_control_present(hdev) &&
> > > -         asus_kbd_register_leds(hdev))
> > > -             hid_warn(hdev, "Failed to initialize backlight.\n");
> > > -
> > >       return 0;
> > >  }
> > >
> > > @@ -1018,15 +1013,6 @@ static int asus_input_mapping(struct hid_devic=
e *hdev,
> > >                       return -1;
> > >               }
> > >
> > > -             /*
> > > -              * Check and enable backlight only on devices with Usag=
ePage =3D=3D
> > > -              * 0xff31 to avoid initializing the keyboard firmware m=
ultiple
> > > -              * times on devices with multiple HID descriptors but s=
ame
> > > -              * PID/VID.
> > > -              */
> > > -             if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
> > > -                     drvdata->enable_backlight =3D true;
> > > -
> > >               set_bit(EV_REP, hi->input->evbit);
> > >               return 1;
> > >       }
> > > @@ -1143,8 +1129,11 @@ static int __maybe_unused asus_reset_resume(st=
ruct hid_device *hdev)
> > >
> > >  static int asus_probe(struct hid_device *hdev, const struct hid_devi=
ce_id *id)
> > >  {
> > > -     int ret;
> > > +     struct hid_report_enum *rep_enum;
> > >       struct asus_drvdata *drvdata;
> > > +     struct hid_report *rep;
> > > +     bool is_vendor =3D false;
> > > +     int ret;
> > >
> > >       drvdata =3D devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERN=
EL);
> > >       if (drvdata =3D=3D NULL) {
> > > @@ -1228,12 +1217,24 @@ static int asus_probe(struct hid_device *hdev=
, const struct hid_device_id *id)
> > >               return ret;
> > >       }
> > >
> > > +     /* Check for vendor for RGB init and handle generic devices pro=
perly. */
> > > +     rep_enum =3D &hdev->report_enum[HID_INPUT_REPORT];
> > > +     list_for_each_entry(rep, &rep_enum->report_list, list) {
> > > +             if ((rep->application & HID_USAGE_PAGE) =3D=3D HID_USAG=
E_PAGE_VENDOR)
> > > +                     is_vendor =3D true;
> > > +     }
> > > +
> > >       ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> > >       if (ret) {
> > >               hid_err(hdev, "Asus hw start failed: %d\n", ret);
> > >               return ret;
> > >       }
> > >
> > > +     if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> > > +         !asus_kbd_wmi_led_control_present(hdev) &&
> > > +         asus_kbd_register_leds(hdev))
> > > +             hid_warn(hdev, "Failed to initialize backlight.\n");
> > > +
> > >       /*
> > >        * Check that input registration succeeded. Checking that
> > >        * HID_CLAIMED_INPUT is set prevents a UAF when all input devic=
es
> > >
> >
> > --
> >  i.
> >
> >
>=20
--8323328-967865929-1765271645=:1137--

