Return-Path: <linux-input+bounces-3923-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 305698D297E
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 02:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAF2C1F223A7
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 00:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE2715A48B;
	Wed, 29 May 2024 00:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="U5G2+ryE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iz2ctrKz"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74A17E8E4;
	Wed, 29 May 2024 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943096; cv=none; b=LmdBXpomhEOh9uxmOOvRByIlpfZ712iwJPy/26J9+bcJa2WoubYBek+87yuYA77WzJN35sh9PtZNgAFcmUB5LpVOCLyV2VIBACthqtHIWd5dRp7LSNljjTTIyFN/FZ1c4B0W9uSEh7qMxlJ8a62q6B4OPSg8SH4K+6M/sV/LyUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943096; c=relaxed/simple;
	bh=6e5LyDX4ws9lAD5qNZ6NI7Us1d194wOLh7n8KUxOZFM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=M2VYRw1L5WPwCAbl3RhTZNUZNPVisXyVdGxyZGFMoph3OlDFSxMrZLqzstD/Qts1/7qw1nzOttJCWUf2IiO2FzqDZkLtGJ1qNI4+nCexfQm82vdSuDom6BJrThowfuSvjSL9cNqCjnxQWvqbY39BXDCX56AQvixHZxD9NHeQSPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=U5G2+ryE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iz2ctrKz; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 843E418000E8;
	Tue, 28 May 2024 20:38:13 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute2.internal (MEProxy); Tue, 28 May 2024 20:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1716943093;
	 x=1717029493; bh=yOSdYu9TZvyv91nLknKSw3S/vqamkIsje7Xm5pDqaOQ=; b=
	U5G2+ryEBe8iQutVtk6Z/Te6TMhJ51uE024SWqrYYSdfGY29n6URgPyiwn/dYxsT
	WL+0bvJtgR37Dk1NLKxJJ8l3UPhYkEjlnSuxv4XKGFlbRu+qxtz5PlJ2Ol7tKkNe
	2imFCjpXN/u25NIuzTRWiFkbzOQneLTp7n4Si49kgppagVowwuyTJtvSzn3H3fvX
	p22CK5klINEbPhptKDZYQ/HkCHTUNesI/ikB3eT+HpdtQqB3/95dq8OUQcSIK/QM
	yAaJOhdVeOtSkoGNmX8hEpvT9feKEXYKH+mKrQe150UvdPnWooGLk5Qn4Jb9wPYM
	t4xu8TaJLDK2Y2w3jAG+Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716943093; x=
	1717029493; bh=yOSdYu9TZvyv91nLknKSw3S/vqamkIsje7Xm5pDqaOQ=; b=i
	z2ctrKzOgsrShWAtpUrw+klhdksI9TS47vqzbKlyLNhs67siwtDBPHGexMX/BZhW
	kF2dcvaMin9wkAzGyPXLyfYiUQPvi3Ycp3cXLPh5ZGheXtNStJMW3JlqdXGVY5c0
	XMsqjb57ofEfsXva5enbTnnKX6xtIPODw+itKw8AkvRiSLJMxABGgBpJTsEidRe0
	DJmvHwx4bfuGjac+Rf75n7LaxMZpwpmSl5gY8rcLwzLF0F7H1yOfRJOYfgNm7tWk
	OzLjcAkPvUDMGclrJk/sR8PwGE7JjlZsYpjW8pKAAhfZPf8fRYeKh0mnev4ySuHe
	AGA+bLqI4YHAKV+LvEN5A==
X-ME-Sender: <xms:9HhWZkniop2zYrmTALttKKB2NVoQZeaZAfb1Frk_fFBSE3cWkkYrVg>
    <xme:9HhWZj0L6qZGbICV2ykJ1FrTyBUlt0jdjJCrIam7xwTRRGkl3JZ4ZM1H6QEi-nXNI
    oM3bWgiUtGLt6HS1nk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejledgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfn
    uhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrth
    htvghrnhepfeeugffhvdeufeehieelvdegfeffveegleehtddvheegkeetueegtdegueeh
    vdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplh
    hukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:9HhWZirvW5Fe4hUG7eZ07r7kR6JR_hF3Qq2CssapME1e4OOTZ43kFw>
    <xmx:9HhWZgn9n6hlmVKVARNOweUCD12qSZi0N2fbAUhJ1tigq-P-jbx7rg>
    <xmx:9HhWZi2XBNiQNu2ypnQgr9ZnbDx4kj5zTrWozhpODHoiXxg8AtYrpQ>
    <xmx:9HhWZntoKf4yUdldq1gyv49kjx-TWYlcSRdgSmeMcRIn1f7_biQVGw>
    <xmx:9XhWZsproeA7V0mXt1xo9Kr-xBMWOywiUgVPbBEya22JeZsTmfXgi_KR>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D49C52340080; Tue, 28 May 2024 20:38:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <80aacd65-d5e1-40ac-9d8d-3bb9582d1687@app.fastmail.com>
In-Reply-To: <17aa68e2-4af6-68ad-e81a-abc714517f6b@linux.intel.com>
References: <20240528013959.14661-1-luke@ljones.dev>
 <17aa68e2-4af6-68ad-e81a-abc714517f6b@linux.intel.com>
Date: Wed, 29 May 2024 12:37:47 +1200
From: "Luke Jones" <luke@ljones.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Jiri Kosina" <jikos@kernel.org>, "Hans de Goede" <hdegoede@redhat.com>,
 corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
 bentiss@kernel.org
Subject: Re: [PATCH] hid-asus: use hid for brightness control on keyboard
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, 28 May 2024, at 8:36 PM, Ilpo J=C3=A4rvinen wrote:
> On Tue, 28 May 2024, Luke D. Jones wrote:
>=20
> > On almost all ASUS ROG series laptops the MCU used for the USB keybo=
ard
> > also has a HID packet used for setting the brightness. This is usual=
ly
> > the same as the WMI method. But in some laptops the WMI method either
> > is missing or doesn't work, so we should default to the HID control.
> >=20
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> > ---
> >  drivers/hid/hid-asus.c                     | 19 ++++++++++++-
> >  drivers/platform/x86/asus-wmi.c            |  3 ++-
> >  include/linux/platform_data/x86/asus-wmi.h | 31 +++++++++++++++++++=
+++
> >  3 files changed, 51 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 02de2bf4f790..9389a3e733e3 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -101,6 +101,7 @@ struct asus_kbd_leds {
> >  unsigned int brightness;
> >  spinlock_t lock;
> >  bool removed;
> > + int report_id;
> >  };
> > =20
> >  struct asus_touchpad_info {
> > @@ -473,7 +474,7 @@ static enum led_brightness asus_kbd_backlight_ge=
t(struct led_classdev *led_cdev)
> >  static void asus_kbd_backlight_work(struct work_struct *work)
> >  {
> >  struct asus_kbd_leds *led =3D container_of(work, struct asus_kbd_le=
ds, work);
> > - u8 buf[] =3D { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> > + u8 buf[] =3D { led->report_id, 0xba, 0xc5, 0xc4, 0x00 };
> >  int ret;
> >  unsigned long flags;
> > =20
> > @@ -492,12 +493,18 @@ static void asus_kbd_backlight_work(struct wor=
k_struct *work)
> >   */
> >  static bool asus_kbd_wmi_led_control_present(struct hid_device *hde=
v)
> >  {
> > + struct asus_drvdata *drvdata =3D hid_get_drvdata(hdev);
> >  u32 value;
> >  int ret;
> > =20
> >  if (!IS_ENABLED(CONFIG_ASUS_WMI))
> >  return false;
> > =20
> > + if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_use_hidraw_l=
ed()) {
> > + hid_info(hdev, "using hidraw for asus::kbd_backlight\n");
> > + return false;
> > + }
> > +
> >  ret =3D asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
> >         ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
> >  hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> > @@ -507,6 +514,12 @@ static bool asus_kbd_wmi_led_control_present(st=
ruct hid_device *hdev)
> >  return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
> >  }
> > =20
> > +static bool asus_kbd_is_input_led(void)
> > +{
> > + return dmi_match(DMI_PRODUCT_NAME, "GU605")
> > +     || dmi_match(DMI_PRODUCT_NAME, "GA403");
> > +}
> > +
> >  static int asus_kbd_register_leds(struct hid_device *hdev)
> >  {
> >  struct asus_drvdata *drvdata =3D hid_get_drvdata(hdev);
> > @@ -549,6 +562,10 @@ static int asus_kbd_register_leds(struct hid_de=
vice *hdev)
> >  if (!drvdata->kbd_backlight)
> >  return -ENOMEM;
> > =20
> > + drvdata->kbd_backlight->report_id =3D FEATURE_KBD_REPORT_ID;
> > + if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_kbd_is_input=
_led())
> > + drvdata->kbd_backlight->report_id =3D FEATURE_KBD_LED_REPORT_ID1;
> > +
> >  drvdata->kbd_backlight->removed =3D false;
> >  drvdata->kbd_backlight->brightness =3D 0;
> >  drvdata->kbd_backlight->hdev =3D hdev;
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/=
asus-wmi.c
> > index 3f9b6285c9a6..a58df18a70ad 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -1681,7 +1681,8 @@ static int asus_wmi_led_init(struct asus_wmi *=
asus)
> >  goto error;
> >  }
> > =20
> > - if (!kbd_led_read(asus, &led_val, NULL)) {
> > + if (!kbd_led_read(asus, &led_val, NULL) && !asus_use_hidraw_led())=
 {
> > + pr_info("using asus-wmi for asus::kbd_backlight\n");
> >  asus->kbd_led_wk =3D led_val;
> >  asus->kbd_led.name =3D "asus::kbd_backlight";
> >  asus->kbd_led.flags =3D LED_BRIGHT_HW_CHANGED;
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/li=
nux/platform_data/x86/asus-wmi.h
> > index 3eb5cd6773ad..79a50102440d 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -160,4 +160,35 @@ static inline int asus_wmi_evaluate_method(u32 =
method_id, u32 arg0, u32 arg1,
> >  }
> >  #endif
> > =20
> > +/* To be used by both hid-asus and asus-wmi to determine which cont=
rols kbd_brightness */
> > +#if IS_REACHABLE(CONFIG_ASUS_WMI)
> > +static bool asus_use_hidraw_led(void)
>=20
> Since it's in a header, it's missing inline. However, this function lo=
oks=20
> quite complicated so putting it into a header file is questionable to=20
> begin with so I'd prefer it to be in a .c file.

Thanks for the review y'all. All recommendations implemented including t=
his and splitting to two commits.

> > +{
> > + const char *product, *board;
> > +
> > + product =3D dmi_get_system_info(DMI_PRODUCT_FAMILY);
> > + if (!product)
> > + return false;
> > +
> > + /* These product ranges should all be using HID for keyboard LED */
> > + if (strstr(product, "ROG Zephyrus")
> > + || strstr(product, "ROG Strix")
> > + || strstr(product, "ROG Flow")
> > + || strstr(product, "GA403")
> > + || strstr(product, "GU605"))
>=20
> Please align these properly but consider using array and loop.
>=20
> > + return true;
> > +
> > + board =3D dmi_get_system_info(DMI_BOARD_NAME);
> > + if (!board)
> > + return false;
> > +
> > + return strstr(board, "RC71L"); /* ROG Ally specific */
> > +}
> > +#else
> > +static inline bool asus_use_hidraw_led(void)
> > +{
> > + return true;
> > +}
> > +#endif
> > +
> >  #endif /* __PLATFORM_DATA_X86_ASUS_WMI_H */
> >=20
>=20
> --=20
> i.
>=20
>=20

