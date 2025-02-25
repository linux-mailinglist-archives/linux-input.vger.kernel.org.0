Return-Path: <linux-input+bounces-10375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEFBA45111
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 00:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC293AA678
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 23:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A06322156D;
	Tue, 25 Feb 2025 23:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="fxA4FG+8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qWGgwZpx"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D5920F070;
	Tue, 25 Feb 2025 23:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740527845; cv=none; b=ZLWlcFgAtX01Al0ef2ENk65ZsyJ7aNOgos5Vh98briwQAVeQdFwbw4itd9waSKj4xOodape6lPY9yhzjaH/ElnjNlRVzxIiFbczXSlWA2N3AICUYtEOX35rKevMMzK92PWNj+Qxmv/BR40b3PYmvi9MldTEjos+M05ol//oqTdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740527845; c=relaxed/simple;
	bh=iBkiRkY/iKEPcrbsCL1PnDdNQN0GumsHaJwIDlhylII=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SG+92jTg8Mq/xJryiYfkovfX8eVFcR2cGtwE0k3Tct0mmJmKNOlMgkUBkpHpUpRAnzM8pdQBzbGEoA2aJu5PtHjFfIh4StaaxShTMixNXMM9pHPfLPUIbVsAScw+Q2PNlIMbJw1cZgmL1JVwOlmQ1wZMRKRHOBLC/aqhA7tKnsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=fxA4FG+8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qWGgwZpx; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id F259F13808C2;
	Tue, 25 Feb 2025 18:57:21 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 25 Feb 2025 18:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1740527841;
	 x=1740614241; bh=nRJvU9hhxZu7LSova7KQJmtN7r+tg7oy0SqET6Q/GQA=; b=
	fxA4FG+8girQpCYt8bVztWGlayA0/wakO1NlH04+j+Nb92mEa7h/z9MNyHa4irwv
	L/JSjji/nGfB9dQzhfs6uEV5uYjBNBm43Dyk5TkyQU+6vE7oh/7JX0sha1Ni+YwA
	rEtruujmK9BJslteEaDlRHMwEIT7jZ4K4+qJiStwmhVHC1Yo91gzUKcrr30ZkLo6
	0najccUQUPHhI+bTt2O2Sd+fG2S5QIINtLkMAEFloNB7DUy5tT9chworGAqShbFp
	KTeF+T24HogJ5gU/+O6/yNsdfWoS6VWcvpGfAKU0DyxwM+nD/LXRux/wzo4BtsqP
	rz0yTK4x5ZHFBGij0pmBMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740527841; x=
	1740614241; bh=nRJvU9hhxZu7LSova7KQJmtN7r+tg7oy0SqET6Q/GQA=; b=q
	WGgwZpxp4ZENfJsMbakrGSYSZkvrzbZ3gybN02AaQNNQtM97CycVfq8mHHdpnkYg
	eJJmePidRr1U//iKJBY6ZCcCvUBzaKlNKPVNXkPuv+QTrc60aUk3eU1A5CcHycqq
	aghFac0yEpwrdTxoMF/c87zMxHtTd8zfpv2HahwAU8PUognen1qM/yHjPGB0ug6J
	JbeUI6oDz4lvZu3ROAqRQiYJLeaXUGe3+jrMiC47d5EAKEYPtwyEpnbbXowgjMz9
	E0J7KjMNh+B8SQNdpluaNUkos8dVY6jMbcaWMKfWPlpKZr9n3L7TDSoki6TfZn0h
	P2wzbXilTuthP4A8K4L8Q==
X-ME-Sender: <xms:4Vi-Z7Avi63sH_Zdvhjj2FFzMWd53GcZK9QLn5iyEZtdRSKEqqy_vQ>
    <xme:4Vi-ZxiKUc9Ba0bL12CuJWgg3AcppCCAD_uZj_3up5KCHEeDNIl4MkkczFz2CP-Dl
    ohjZn2sz-7Ts_5HRLg>
X-ME-Received: <xmr:4Vi-Z2m0SZ15lhhFiaAaUsIHLcB2YbZSmtTmlGkOQP9lVTG8g6xDy4siS7KWU-on5VrN_3pJlwaoEqF4FQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekfedtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttder
    jeenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvh
    eqnecuggftrfgrthhtvghrnhepkeefffeujeevueejueegleelhedtgedvledukedttdff
    hfeifeelvdduheefjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepkedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlh
    hlohesrghmugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrd
    gtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4Vi-Z9ySJ9T1Jdwq3cVQV6bCMPxgiYhGl-95EJDQOOj8I_rumX7QWQ>
    <xmx:4Vi-ZwT03klhiEhVh__PFWtED7EderiF6P9gKmX5S6oINE4fi2Yg_w>
    <xmx:4Vi-ZwYawK_c43G4QrWBsOgK4_lGDaMG6S9y-GneAvzzVqAwuNDjYQ>
    <xmx:4Vi-ZxQKUhD37sazhHZ4KTlu9d3fTCSEib7tQOVilRcU0yIqi7L6YQ>
    <xmx:4Vi-Z1TKEczhv41Chy1j-vgSM8iUMTbd03Nv9rOMJssFvvh1fvTe_ykj>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 18:57:18 -0500 (EST)
Message-ID: <372069199204564531353733f63c7a7f60fb75cb.camel@ljones.dev>
Subject: Re: [PATCH 1/2] hid-asus: check ROG Ally MCU version and warn
From: Luke Jones <luke@ljones.dev>
To: Mario Limonciello <mario.limonciello@amd.com>, 
	linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
	bentiss@kernel.org, jikos@kernel.org
Date: Wed, 26 Feb 2025 12:57:14 +1300
In-Reply-To: <e55711bb-5e5c-40a5-a2e1-a5a4aac9816c@amd.com>
References: <20250225081744.92841-1-luke@ljones.dev>
	 <20250225081744.92841-2-luke@ljones.dev>
	 <e55711bb-5e5c-40a5-a2e1-a5a4aac9816c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-02-25 at 07:16 -0800, Mario Limonciello wrote:
> On 2/25/2025 00:17, Luke Jones wrote:
> > From: "Luke D. Jones" <luke@ljones.dev>
> >=20
> > ASUS have fixed suspend issues arising from a flag not being
> > cleared in
> > the MCU FW in both the ROG Ally 1 and the ROG Ally X.
> >=20
> > Implement a check and a warning to encourage users to update the FW
> > to
> > a minimum supported version.
> >=20
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> > ---
> > =C2=A0 drivers/hid/hid-asus.c | 97
> > +++++++++++++++++++++++++++++++++++++++++-
> > =C2=A0 1 file changed, 95 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 46e3e42f9eb5..e1e60b80115a 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -52,6 +52,10 @@ MODULE_DESCRIPTION("Asus HID Keyboard and
> > TouchPad");
> > =C2=A0 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > =C2=A0 #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> > =C2=A0=20
> > +#define ROG_ALLY_REPORT_SIZE 64
> > +#define ROG_ALLY_X_MIN_MCU 313
> > +#define ROG_ALLY_MIN_MCU 319
> > +
> > =C2=A0 #define SUPPORT_KBD_BACKLIGHT BIT(0)
> > =C2=A0=20
> > =C2=A0 #define MAX_TOUCH_MAJOR 8
> > @@ -84,6 +88,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and
> > TouchPad");
> > =C2=A0 #define QUIRK_MEDION_E1239T		BIT(10)
> > =C2=A0 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
> > =C2=A0 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> > +#define QUIRK_ROG_ALLY_XPAD		BIT(13)
> > =C2=A0=20
> > =C2=A0 #define
> > I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
> > =C2=A0=C2=A0					=09
> > QUIRK_NO_INIT_REPORTS | \
> > @@ -534,9 +539,89 @@ static bool
> > asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> > =C2=A0=C2=A0	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
> > =C2=A0 }
> > =C2=A0=20
> > +/*
> > + * We don't care about any other part of the string except the
> > version section.
> > + * Example strings: FGA80100.RC72LA.312_T01,
> > FGA80100.RC71LS.318_T01
> > + */
> > +static int mcu_parse_version_string(const u8 *response, size_t
> > response_size)
> > +{
> > +	const u8 *end =3D response + response_size;
> > +	const u8 *p =3D response;
> > +	int dots, err;
> > +	long version;
> > +
> > +	dots =3D 0;
> > +	while (p < end && dots < 2) {
> > +		if (*p++ =3D=3D '.')
> > +			dots++;
> > +	}
> > +
>=20
> I think it would be good to use strsep() here.
>=20
> > +	if (dots !=3D 2 || p >=3D end)
> > +		return -EINVAL;
> > +
> > +	err =3D kstrtol((const char *)p, 10, &version);
> > +	if (err || version < 0)
> > +		return -EINVAL;
> > +
> > +	return version;
> > +}
> > +
> > +static int mcu_request_version(struct hid_device *hdev)
> > +{
> > +	const u8 request[] =3D { 0x5a, 0x05, 0x03, 0x31, 0x00, 0x20
> > };
> > +	u8 *response;
> > +	int ret;
> > +
> > +	response =3D kzalloc(ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
> > +	if (!response)
> > +		return -ENOMEM;
> > +
> > +	ret =3D asus_kbd_set_report(hdev, request, sizeof(request));
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	ret =3D hid_hw_raw_request(hdev, FEATURE_REPORT_ID,
> > response,
> > +				ROG_ALLY_REPORT_SIZE,
> > HID_FEATURE_REPORT,
> > +				HID_REQ_GET_REPORT);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	ret =3D mcu_parse_version_string(response,
> > ROG_ALLY_REPORT_SIZE);
> > +
> > +out:
> > +	if (ret < 0)
> > +		hid_err(hdev, "Failed to get MCU version: %d,
> > response: %*ph\n",
> > +					ret, ROG_ALLY_REPORT_SIZE,
> > response);
> > +	kfree(response);
> > +	return ret;
> > +}
> > +
> > +static void validate_mcu_fw_version(struct hid_device *hdev, int
> > idProduct)
> > +{
> > +	int min_version =3D ROG_ALLY_X_MIN_MCU;
> > +	int version;
> > +
> > +	version =3D mcu_request_version(hdev);
> > +	if (version < 0)
> > +		return;
> > +
> > +	if (idProduct =3D=3D USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY)
> > +		min_version =3D ROG_ALLY_MIN_MCU;
> > +
> > +	hid_info(hdev, "Ally device MCU version: %d\n", version);
> > +	if (version < min_version) {
> > +		hid_warn(hdev,
> > +			 "The MCU firmware version must be %d or
> > greater\n"
>=20
> What do you think about:
>=20
> "The MCU firmware version must be %d or greater to avoid issues with=20
> suspend.\n"
>=20

I wasn't sure if I should be as explicit. But since it is directly
related I guess that should be fine. Will do for V2.=20

> > +			 "Please update your MCU with official
> > ASUS firmware release\n",
> > +			 min_version);
> > +	}
> > +}
>=20
> Thinking forward to any future hypothetical devices that don't have a
> min MCU version type of bug I have a suggestion that you put the=20
> min_version into a lookup method of some sort.
>=20
> So the flow can be something like this:
>=20
> static void validate_mcu_fw_version(struct hid_device *hdev, int
> idProduct)
> {
>=20
> 	int min_version =3D get_min_version(idProduct);
>=20
> 	if (!min_version)
> 		return;
> 	.
> 	.
> 	.
> }
>=20
> Or you can do a switch/case instead of get_min_version().
>=20
> static void validate_mcu_fw_version(struct hid_device *hdev, int
> idProduct)
> {
>=20
> 	int min_version;
>=20
> 	switch(idProduct) {
> 	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY:
> 		min_version =3D ROG_ALLY_MIN_MCU;
> 		break;
> 	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLYX:
> 		min_version =3D ROG_ALLYX_MIN_MCU;
> 		break;
> 	default:
> 		return;
> 	}
>=20
> 	.
> 	.
> 	.
> }
>=20
> That way you have really straight forward logic that=20
> validate_mcu_version only runs on devices that you specify.
>=20

I actually had a switch/case to start with. Not sure why I changed it
now. I'll go back to that as it's very clear.

> > +
> > =C2=A0 static int asus_kbd_register_leds(struct hid_device *hdev)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct asus_drvdata *drvdata =3D hid_get_drvdata(hdev);
> > +	struct usb_interface *intf;
> > +	struct usb_device *udev;
> > =C2=A0=C2=A0	unsigned char kbd_func;
> > =C2=A0=C2=A0	int ret;
> > =C2=A0=20
> > @@ -560,6 +645,14 @@ static int asus_kbd_register_leds(struct
> > hid_device *hdev)
> > =C2=A0=C2=A0			if (ret < 0)
> > =C2=A0=C2=A0				return ret;
> > =C2=A0=C2=A0		}
> > +
> > +		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > +			intf =3D to_usb_interface(hdev->dev.parent);
> > +			udev =3D interface_to_usbdev(intf);
> > +			validate_mcu_fw_version(hdev,
> > +				le16_to_cpu(udev-
> > >descriptor.idProduct));
> > +		}
> > +
> > =C2=A0=C2=A0	} else {
> > =C2=A0=C2=A0		/* Initialize keyboard */
> > =C2=A0=C2=A0		ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > @@ -1280,10 +1373,10 @@ static const struct hid_device_id
> > asus_devices[] =3D {
> > =C2=A0=C2=A0	=C2=A0 QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD }=
,
> > =C2=A0=C2=A0	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> > -	=C2=A0 QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +	=C2=A0 QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD |
> > QUIRK_ROG_ALLY_XPAD},
> > =C2=A0=C2=A0	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> > -	=C2=A0 QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +	=C2=A0 QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD |
> > QUIRK_ROG_ALLY_XPAD },
> > =C2=A0=C2=A0	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_K=
EYBOARD),
> > =C2=A0=C2=A0	=C2=A0 QUIRK_ROG_CLAYMORE_II_KEYBOARD },
>=20


