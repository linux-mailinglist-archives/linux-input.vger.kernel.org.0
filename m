Return-Path: <linux-input+bounces-14172-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D22FB2D6F2
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 10:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31C5F18834A0
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 08:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8462D6E73;
	Wed, 20 Aug 2025 08:43:12 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2A231826;
	Wed, 20 Aug 2025 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755679392; cv=none; b=tqF7+rq2vFAJXXswa7Zn55/K8SmD5cvc68AH3oOvHdzCcT91lgMcOQZeEo67XxHiXm+yIZIPgGTpVZQXRy8lg9Xtr7r7785XzgRaSB0tnRkveBi0DlBnq0W8PcgWIjuRCSb8yG3pB8nNpbfZZvQhhSIIK2pvEBShgEOvqbJo9vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755679392; c=relaxed/simple;
	bh=OTNDXWm2istqtQ1ghENtJQH4veoUvRR5tM4m9KE1Yw8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jOydSIPueX3ExzicY0hwSmi9sL00Cg72G1QZZYYNIOtbbHEJ6MEja6kIbf8rTZG/dBinQamVYjUJpnJwuKVapfKHMMTSvYvIxflkIoaw7rlYYVciQmwboVbtMpyOrEadIjxvsly4ieXJ42d7Cy9cO+uTsQeo4KvuSvuzrWnWLsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5CBD41B5F;
	Wed, 20 Aug 2025 08:43:07 +0000 (UTC)
Message-ID: <fda10472aeb6d7c1155b804959f3dfa3bd0a4979.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech: Add ids for G PRO 2 LIGHTSPEED
From: Bastien Nocera <hadess@hadess.net>
To: Matt Coffin <mcoffin13@gmail.com>, linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
  Filipe =?ISO-8859-1?Q?La=EDns?=	 <lains@riseup.net>,
 linux-kernel@vger.kernel.org
Date: Wed, 20 Aug 2025 10:43:06 +0200
In-Reply-To: <20250820074951.1120397-1-mcoffin13@gmail.com>
References: <20250820074951.1120397-1-mcoffin13@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheejledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuegrshhtihgvnhcupfhotggvrhgruceohhgruggvshhssehhrgguvghsshdrnhgvtheqnecuggftrfgrthhtvghrnhepieffgfehtedtgefgjeeggfffgeeuvdegveekveejfeekkedujeehteffueefffeunecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemjeduuggrmeefsggumedvtdgrleemudeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemjeduuggrmeefsggumedvtdgrleemudeffedphhgvlhhopeglkffrvheimedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemjeduuggrmeefsggumedvtdgrleemudeffegnpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpnhgspghrtghpthhtohepiedprhgtphhtthhopehmtghofhhfihhnudefsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghinhhssehrihhsvghuphdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: hadess@hadess.net

On Wed, 2025-08-20 at 01:49 -0600, Matt Coffin wrote:
> Adds support for the G PRO 2 LIGHTSPEED Wireless via it's nano receiver

"its"

> or directly. This nano receiver appears to work identically to the 1_1
> receiver for the case I've verified, which is the battery status through
> lg-hidpp.
>=20
> The same appears to be the case wired, sharing much with the Pro X
> Superlight 2; differences seemed to lie in userland configuration rather
> than in interfaces used by hid_logitech_hidpp on the kernel side.
>=20
> I verified the sysfs interface for battery charge/discharge status, and
> capacity read to be working on my 910-007290 device (white).
>=20
> Signed-off-by: Matt Coffin <mcoffin13@gmail.com>

Otherwise LGTM

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
> =C2=A0drivers/hid/hid-ids.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/hid/hid-logitech-dj.c=C2=A0=C2=A0=C2=A0 | 4 ++++
> =C2=A0drivers/hid/hid-logitech-hidpp.c | 2 ++
> =C2=A03 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 5a1096283855..37dc42380373 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -907,6 +907,7 @@
> =C2=A0#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2		0xc534
> =C2=A0#define
> USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
> =C2=A0#define
> USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
> +#define
> USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2	0xc543
> =C2=A0#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
> =C2=A0#define USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER	0xc548
> =C2=A0#define USB_DEVICE_ID_SPACETRAVELLER	0xc623
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-
> logitech-dj.c
> index 34fa71ceec2b..cce54dd9884a 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -1983,6 +1983,10 @@ static const struct hid_device_id
> logi_dj_receivers[] =3D {
> =C2=A0	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> =C2=A0		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1)
> ,
> =C2=A0	 .driver_data =3D recvr_type_gaming_hidpp},
> +	{ /* Logitech lightspeed receiver (0xc543) */
> +	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2)
> ,
> +	 .driver_data =3D recvr_type_gaming_hidpp},
> =C2=A0
> =C2=A0	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
> =C2=A0	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> USB_DEVICE_ID_MX3000_RECEIVER),
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> logitech-hidpp.c
> index 10a3bc5f931b..aaef405a717e 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4596,6 +4596,8 @@ static const struct hid_device_id
> hidpp_devices[] =3D {
> =C2=A0	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC094) },
> =C2=A0	{ /* Logitech G Pro X Superlight 2 Gaming Mouse over USB */
> =C2=A0	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC09b) },
> +	{ /* Logitech G PRO 2 LIGHTSPEED Wireless Mouse over USB */
> +	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xc09a) },
> =C2=A0
> =C2=A0	{ /* G935 Gaming Headset */
> =C2=A0	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0x0a87),

