Return-Path: <linux-input+bounces-17109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86491D24600
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 13:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25458302B77B
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 12:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8993933F9;
	Thu, 15 Jan 2026 12:03:09 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DF38E100;
	Thu, 15 Jan 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768478589; cv=none; b=KAuq/vtI2KjK/wgLQ5D6AfZDZhuhUCkSO9V8L5tVSBhBMWpUTqivVX7Q7qdaMq5Hpl/LHfk4BCqcjappARzluh/di4OiwrrbkId5ef7o/u5UH31RH4obhKjHVrEBGvyIapQ0XX2CW4pmrs6T3zUb1fPer4WaL+4eEjGakqwHG7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768478589; c=relaxed/simple;
	bh=aaF+v1EsbjujZ3u+9hINeHkz0Cc8zpGs01kpIRtMOFI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oPJjWBTrjKFo9DligWzD2FVbTfYUu8hNeU5pcKa0mfVPLsztv/IA7iV1JnS7H2s6xe6fzbwki7JLhltsLonSrMpp/6zCMF7OKsbNFBC2w22kaR97LwiCzMpBkqxeoapXc5OmIyEFXHjLV3xFLGUxqiOrKJXsQnHPW6s/bz1zuT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98B251FCEA;
	Thu, 15 Jan 2026 12:03:03 +0000 (UTC)
Message-ID: <09efd83ea70771f8ce1feaf7d7172b72970d8d55.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: fix NULL pointer dereference in
 hidpp_get_report_length()
From: Bastien Nocera <hadess@hadess.net>
To: =?UTF-8?Q?=E9=BD=90=E6=9F=AF=E5=AE=87?= <qikeyu2017@gmail.com>, 
	jikos@kernel.org, bentiss@kernel.org
Cc: lains@riseup.net, hansg@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 13:03:03 +0100
In-Reply-To: <CALEuBa=E1YSo1oVxd67rBf+6bC28zQZi5HBghMmcPFHKQn2+UA@mail.gmail.com>
References: 
	<CALEuBa=E1YSo1oVxd67rBf+6bC28zQZi5HBghMmcPFHKQn2+UA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeitdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffieeuudevuddtffeiheduteelgffgfeegueefheduueejhfdtuddvkefhvdekgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeglkffrvheimedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfegnpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepleekuedvheduhfevgfetpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepjedprhgtphhtthhopehqihhkvgihuhdvtddujeesghhmrghilhdrtghomhdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghinhhssehrihhsvghuphdrnhgvthdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhg

Hello,

Patch looks good, but you will need to resend it as plain text, as per
the submitting patches documentation:
https://www.kernel.org/doc/html/v6.17/process/submitting-patches.html#no-mi=
me-no-links-no-compression-no-attachments-just-plain-text

Regards

On Thu, 2026-01-15 at 01:48 +0800, =E9=BD=90=E6=9F=AF=E5=AE=87 wrote:
> Add validation for report->maxfield and report->field[0] before
> dereferencing to prevent NULL pointer dereference.
>=20
> The HID report descriptor is provided by the USB device firmware via
> USB control transfer (GET_DESCRIPTOR). A malicious device can craft
> a descriptor that defines an OUTPUT report without any usages
> (padding fields). When the HID subsystem parses such a descriptor:
>=20
> 1. hid_add_field() calls hid_register_report() to create the report
> =C2=A0 =C2=A0object and stores it in report_id_hash[id]
> 2. Since parser->local.usage_index is 0, hid_add_field() returns
> early
> =C2=A0 =C2=A0without calling hid_register_field() to add any fields
> 3. Result: report exists with maxfield=3D0 and field[0]=3DNULL
>=20
> When hidpp_probe() is called for a device matching this driver:
> =C2=A0 - hidpp_validate_device() calls hidpp_get_report_length()
> =C2=A0 - hidpp_get_report_length() retrieves the report from hash (not
> NULL)
> =C2=A0 - It then dereferences report->field[0]->report_count
> =C2=A0 - Since field[0] is NULL, this triggers a kernel NULL pointer
> =C2=A0 =C2=A0 dereference
>=20
> Data flow from attacker to crash:
> =C2=A0 Malicious USB Device
> =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0v (USB GET_DESCRIPTOR control transfer)
> =C2=A0 hid_get_class_descriptor() -- reads HID report descriptor from
> device
> =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0v
> =C2=A0 hid_parse_report() -- stores descriptor in hid->dev_rdesc
> =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0v
> =C2=A0 hid_open_report() -> hid_add_field()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0v
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0hid_register_report() -- creates report,
> maxfield=3D0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0v
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0returns early if usage_index=3D=3D0, no field added
> =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0v
> =C2=A0 hidpp_validate_device() -> hidpp_get_report_length()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0v
> =C2=A0 report->field[0]->report_count -- NULL pointer dereference!
>=20
> This is triggerable by an attacker with physical access using a
> malicious USB device (e.g., BadUSB, programmable USB development
> boards).
>=20
> Fixes: d71b18f7c7999 ("HID: logitech-hidpp: do not hardcode very long
> report length")
> Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
> ---
> =C2=A0drivers/hid/hid-logitech-hidpp.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index d5011a5d0890..02ddbd658e89 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4314,7 +4314,7 @@ static int hidpp_get_report_length(struct
> hid_device *hdev, int id)
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 re =3D &(hdev->report_enum[HID_OUTPUT_REPORT]=
);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 report =3D re->report_id_hash[id];
> - =C2=A0 =C2=A0 =C2=A0 if (!report)
> + =C2=A0 =C2=A0 =C2=A0 if (!report || report->maxfield < 1 || !report->fi=
eld[0])
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return report->field[0]->report_count + 1;
> --
> 2.34.1

