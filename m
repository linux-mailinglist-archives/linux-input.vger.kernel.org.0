Return-Path: <linux-input+bounces-15495-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13651BDE44A
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 13:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 522F419C4241
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 11:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED793054E7;
	Wed, 15 Oct 2025 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIiEm8qh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C002BCF5D;
	Wed, 15 Oct 2025 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760527821; cv=none; b=PX3E1WNBPfu67Zg8kMTo+M3s3zgv8RZL8z9lxHiYTvyMOBrzD4Lqn98UyozvJtAnv8G3h3y64UISQmjVwnJeN8lc/VVd/ueYaSKeUYShwuMtqZ9SnzLrEn10TCxHhuZziHJ/snx/wZ0fOB+nsYmUFeLqM9LkHPu0mvpowm9apO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760527821; c=relaxed/simple;
	bh=RqmRC24mDQdFrjhV8/X6TZziEuELpFoLVN0V5byaQ3E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=im/ZVgV433iVf1VD9eboMhtNnnARVF2cBCa6kwSJGSEjiYQ/IkRw8eyFcngcZI0WoZgC0+/G1TvnSGjQwW8QozHNTjOncDLbHv7hxk4tgNNWK2nMGfBGhW/aQtXZ9vZ1LtbSpDPDEjy++YhLYjoFtV96l70YHOKRweyDsPdjhTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIiEm8qh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760527820; x=1792063820;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RqmRC24mDQdFrjhV8/X6TZziEuELpFoLVN0V5byaQ3E=;
  b=dIiEm8qhS2Sxa1J6lEt2IOEv59VUlzgc3XM64l70Uh09HgxSFhHxQiKi
   /opyUpOn1b2QKBDGSfHhrKAWRO+vWjgBmwPAzrG4oDD31SO2lsFcE1Pxh
   WFO1Pevx9u/YGtV8sY1zaf4qlohsQ+iSTPEdex/ZRSk3wPLGcUQDnXnQn
   TecBcuNMstXdLcYH51lKCSaLXwvx0W5SG+rkxnFj3qKKTLdBWODJFZkFt
   4kveB73fIOrhwklZyCNgD/ZbWJWU5wu0ad2wM6cARmsppaVHghH1lDNYE
   Hhz4KYn/h2YSxW9PYELXWDgwcwLiBpOBwz1xFjD0RLXJPKeZA9qoeOblp
   w==;
X-CSE-ConnectionGUID: Q24W5PLUSTG+92SqSJWaiA==
X-CSE-MsgGUID: 6gIy9V+4T9qaDWAXYusoWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62596280"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62596280"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:30:19 -0700
X-CSE-ConnectionGUID: Rc1JZ9N6TcOBYE+H3D1zZA==
X-CSE-MsgGUID: VIEB4PSuRhetQYzYILY2Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="182100525"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:30:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 15 Oct 2025 14:30:11 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v6 1/7] HID: asus: refactor init sequence per spec
In-Reply-To: <CAGwozwF+LfL1AhR3PLJWLzF1iriohWFJRmRkHC6uwgfTnhZFaw@mail.gmail.com>
Message-ID: <259f412f-6467-6b83-9751-9cd36b76d37b@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev> <20251013201535.6737-2-lkml@antheas.dev> <3d59f42f-2e24-6011-23b5-369be7eb4b3b@linux.intel.com> <CAGwozwF+LfL1AhR3PLJWLzF1iriohWFJRmRkHC6uwgfTnhZFaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1711069739-1760527811=:957"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1711069739-1760527811=:957
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 15 Oct 2025, Antheas Kapenekakis wrote:

> On Wed, 15 Oct 2025 at 12:53, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:
> >
> > > Currently, asus_kbd_init() uses a reverse engineered init sequence
> > > from Windows, which contains the handshakes from multiple programs.
> > > Keep the main one, which is 0x5a (meant for brightness drivers).
> > >
> > > In addition, perform a get_response and check if the response is the
> > > same. To avoid regressions, print an error if the response does not
> > > match instead of rejecting device.
> >
> > I'm none the wiser on "why?" question after reading all this. Please
> > describe the change properly. **Besides, you do many thing changes whic=
h are
> > not mentioned here at all.**
>=20
> Changes in asus_kbd_register_leds look bigger than they are due to
> un-indenting and merging the if/else for non-nkey/nkey.
>
> I will update the text of the new patch to include the changes which
> are 1) applying asus_kbd_get_functions to NKEY devices to check for
> backlight, 2) removing 0x5d/0x5e initialization from NKEY devices
> (0x5d is for armoury crate/0x5e for an aura matrix creator studio
> thing), which then means that the if/else blocks are equivalent and
> can be merged.

Oh, I see it now. It was not at all obvious you wanted to consolidate the=
=20
init path because of all the other moving parts, to me it looked like you=
=20
just removed the if (<quirk>) check.

> These two changes should not affect functionality, other than reduce
> some init commands.
>=20
> > And what "spec" is the one you mention in the shortlog?
> >
> > > Then, refactor asus_kbd_get_functions() to use the same ID it is call=
ed
> > > with, instead of hardcoding it to 0x5a so that it may be used for 0x0=
d
> > > in the future.
> >
> > Can this be in own patch?
>=20
> I will spin this into three patches and reword. One for each paragraph
> in the current commit body.

3 patches already sounds much better! They'll surely be easier to review=20
and understand if somebody has to look at the commits years later from the=
=20
commit history.

Thanks.

--
 i.

> Ack on the rest.
>=20
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  drivers/hid/hid-asus.c | 91 ++++++++++++++++++++++------------------=
--
> > >  1 file changed, 48 insertions(+), 43 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > > index a444d41e53b6..d0c783df99bc 100644
> > > --- a/drivers/hid/hid-asus.c
> > > +++ b/drivers/hid/hid-asus.c
> > > @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad"=
);
> > >  #define FEATURE_REPORT_ID 0x0d
> > >  #define INPUT_REPORT_ID 0x5d
> > >  #define FEATURE_KBD_REPORT_ID 0x5a
> > > -#define FEATURE_KBD_REPORT_SIZE 16
> > > +#define FEATURE_KBD_REPORT_SIZE 64
> > >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > >  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> > >
> > > @@ -393,14 +393,37 @@ static int asus_kbd_set_report(struct hid_devic=
e *hdev, const u8 *buf, size_t bu
> > >
> > >  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> > >  {
> > > -     const u8 buf[] =3D { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0=
x54,
> > > -                  0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x=
00 };
> > > +     /*
> > > +      * The handshake is first sent as a set_report, then retrieved
> > > +      * from a get_report. They should be equal.
> > > +      */
> > > +     const u8 buf[] =3D { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,
> > > +             0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0=
x00 };
> >
> > Why was layout of this changed?
> >
> > > +     u8 *readbuf;
> > >       int ret;
> > >
> > >       ret =3D asus_kbd_set_report(hdev, buf, sizeof(buf));
> > > -     if (ret < 0)
> > > -             hid_err(hdev, "Asus failed to send init command: %d\n",=
 ret);
> > > +     if (ret < 0) {
> > > +             hid_err(hdev, "Asus failed to send handshake: %d\n", re=
t);
> > > +             return ret;
> > > +     }
> > > +
> > > +     readbuf =3D kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> > > +     if (!readbuf)
> > > +             return -ENOMEM;
> > > +
> > > +     ret =3D hid_hw_raw_request(hdev, report_id, readbuf,
> > > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_R=
EPORT,
> > > +                              HID_REQ_GET_REPORT);
> > > +     if (ret < 0) {
> > > +             hid_err(hdev, "Asus failed to receive handshake ack: %d=
\n", ret);
> > > +     } else if (memcmp(readbuf, buf, sizeof(buf)) !=3D 0) {
> > > +             hid_warn(hdev, "Asus handshake returned invalid respons=
e: %*ph\n",
> > > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > > +             // Do not return error if handshake is wrong to avoid r=
egressions
> >
> > This driver so far is using only /* */ comments.
> >
> > > +     }
> > >
> > > +     kfree(readbuf);
> > >       return ret;
> > >  }
> > >
> > > @@ -422,7 +445,7 @@ static int asus_kbd_get_functions(struct hid_devi=
ce *hdev,
> > >       if (!readbuf)
> > >               return -ENOMEM;
> > >
> > > -     ret =3D hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf=
,
> > > +     ret =3D hid_hw_raw_request(hdev, report_id, readbuf,
> > >                                FEATURE_KBD_REPORT_SIZE, HID_FEATURE_R=
EPORT,
> > >                                HID_REQ_GET_REPORT);
> > >       if (ret < 0) {
> > > @@ -638,50 +661,32 @@ static int asus_kbd_register_leds(struct hid_de=
vice *hdev)
> > >       unsigned char kbd_func;
> > >       int ret;
> > >
> > > -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > > -             /* Initialize keyboard */
> > > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > > -             if (ret < 0)
> > > -                     return ret;
> > > -
> > > -             /* The LED endpoint is initialised in two HID */
> > > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1)=
;
> > > -             if (ret < 0)
> > > -                     return ret;
> > > -
> > > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2)=
;
> > > -             if (ret < 0)
> > > -                     return ret;
> > > -
> > > -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > > -                     ret =3D asus_kbd_disable_oobe(hdev);
> > > -                     if (ret < 0)
> > > -                             return ret;
> > > -             }
> > > -
> > > -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > > -                     intf =3D to_usb_interface(hdev->dev.parent);
> > > -                     udev =3D interface_to_usbdev(intf);
> > > -                     validate_mcu_fw_version(hdev,
> > > -                             le16_to_cpu(udev->descriptor.idProduct)=
);
> > > -             }
> > > +     ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > > +     if (ret < 0)
> > > +             return ret;
> > >
> > > -     } else {
> > > -             /* Initialize keyboard */
> > > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > > -             if (ret < 0)
> > > -                     return ret;
> > > +     /* Get keyboard functions */
> > > +     ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REP=
ORT_ID);
> > > +     if (ret < 0)
> > > +             return ret;
> > >
> > > -             /* Get keyboard functions */
> > > -             ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE=
_KBD_REPORT_ID);
> > > +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > > +             ret =3D asus_kbd_disable_oobe(hdev);
> > >               if (ret < 0)
> > >                       return ret;
> > > +     }
> > >
> > > -             /* Check for backlight support */
> > > -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > > -                     return -ENODEV;
> > > +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > > +             intf =3D to_usb_interface(hdev->dev.parent);
> > > +             udev =3D interface_to_usbdev(intf);
> > > +             validate_mcu_fw_version(
> > > +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
> > >       }
> > >
> > > +     /* Check for backlight support */
> > > +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > > +             return -ENODEV;
> > > +
> > >       drvdata->kbd_backlight =3D devm_kzalloc(&hdev->dev,
> > >                                             sizeof(struct asus_kbd_le=
ds),
> > >                                             GFP_KERNEL);
> > >
> >
> > --
> >  i.
> >
> >
>=20
--8323328-1711069739-1760527811=:957--

