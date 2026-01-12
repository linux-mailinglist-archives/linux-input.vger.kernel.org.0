Return-Path: <linux-input+bounces-16975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C558AD12B46
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 14:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67E04306192F
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 13:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A743587BC;
	Mon, 12 Jan 2026 13:11:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3913587DE;
	Mon, 12 Jan 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223466; cv=none; b=Mu2rMjfSvMnE35/iSbnHjK1cJdNdaYpvtPBXJmzMU+l6ajcE//AmIedNxct2ZeM105Gd45lprS5fPdIZNMhgMJVKdQVX+1VZ0Ck2M8LfVtV57VVsKN82ylgMkhM1b5qrr/2gPb2DpLuDqrtKja+xu1dZIvgnWJkkh9zaADJD4RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223466; c=relaxed/simple;
	bh=629D5XnelFr+Gm0hDdptr29UguTJVcJpxKRuFX9lY5w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JcC2iU0U+gOXgCPcpGGQcYLA5ilefbPWSVmd4KHOHj9bT01x1Shicek3kv1k4Yb+9cq76DA3VYG3hKbLNvztg30t0LnrELHU3jObon4fXWAJLpcUaKaGwsc4C57+RhrKfIbqctoAP+90ZADe7V0V22yzhInTpN3vv0IrpSj6yeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 0F936580C9E;
	Mon, 12 Jan 2026 13:08:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92D8543895;
	Mon, 12 Jan 2026 13:08:01 +0000 (UTC)
Message-ID: <7e5573c900fdf4057bf8a599d85413ed94ea0e9f.camel@hadess.net>
Subject: Re: [PATCH v2 1/4] HID: hid-ids: Add SteelSeries Arctis headset
 device IDs
From: Bastien Nocera <hadess@hadess.net>
To: Sriman Achanta <srimanachanta@gmail.com>, Jiri Kosina
 <jikos@kernel.org>,  Benjamin Tissoires	 <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 12 Jan 2026 14:08:01 +0100
In-Reply-To: <20260112041941.40531-2-srimanachanta@gmail.com>
References: <20260112041941.40531-1-srimanachanta@gmail.com>
	 <20260112041941.40531-2-srimanachanta@gmail.com>
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
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeuveeivdetkeekgfefffeftefhjeeikeetffdvteejheefieeltedtvdeuleduleenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghloheplgfkrfhvieemvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefngdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeelvdffkeehgeefkeelhedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepshhrihhmrghnrggthhgrnhhtrgesghhmrghilhdrtghomhdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean

On Sun, 2026-01-11 at 23:19 -0500, Sriman Achanta wrote:
> Add USB device IDs for the complete SteelSeries Arctis headset
> lineup,
> including:
> - Arctis 1, 1 Wireless, 7, 7P, 7X variants
> - Arctis 7+ series (PS5, Xbox, Destiny editions)
> - Arctis 9 Wireless
> - Arctis Pro Wireless
> - Arctis Nova 3, 3P, 3X
> - Arctis Nova 5, 5X
> - Arctis Nova 7 series (multiple variants and special editions)
> - Arctis Nova Pro Wireless and Pro X
>=20
> This also fixes the existing ARCTIS_1 ID to use the correct product
> ID
> (0x12b3 instead of 0x12b6, which is actually the Arctis 1 Xbox
> variant).

"This also fixes" usually is a good way to tell you that this should
have been a separate patch.

It would be useful if you could change the indentation in a first
patch, "fix" the USB ID in a second patch, and add new IDs in a third
patch. Note that in your second patch, you'll need to change the source
code to use that new identifier otherwise you'll be breaking my headset
:)

Please make sure to CC: me on future patchsets you send.

>=20
> These IDs will be used by the updated hid-steelseries driver to
> provide
> battery monitoring, sidetone control, and other device-specific
> features
> for these wireless gaming headsets.
>=20
> Signed-off-by: Sriman Achanta <srimanachanta@gmail.com>
> ---
> =C2=A0drivers/hid/hid-ids.h | 33 +++++++++++++++++++++++++++++----
> =C2=A01 file changed, 29 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index d31711f1aaec..f4f91fb4c2b9 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1303,10 +1303,35 @@
> =C2=A0#define USB_DEVICE_ID_STEAM_CONTROLLER_WIRELESS	0x1142
> =C2=A0#define USB_DEVICE_ID_STEAM_DECK	0x1205
> =C2=A0
> -#define USB_VENDOR_ID_STEELSERIES	0x1038
> -#define USB_DEVICE_ID_STEELSERIES_SRWS1	0x1410
> -#define USB_DEVICE_ID_STEELSERIES_ARCTIS_1=C2=A0 0x12b6
> -#define USB_DEVICE_ID_STEELSERIES_ARCTIS_9=C2=A0 0x12c2
> +#define USB_VENDOR_ID_STEELSERIES			0x1038
> +#define
> USB_DEVICE_ID_STEELSERIES_SRWS1			0x1410
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_1		0x12b3
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X		0x12b6
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7		0x1260
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P		0x12d5
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X		0x12d7
> +#define
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2		0x12ad
> +#define
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS		0x220e
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P	0x2212
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X	0x2216
> +#define
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY	0x2236
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_9		0x12c2
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO		0x1290
> +#define
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3		0x12ec
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P	0x2269
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X	0x226d
> +#define
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5		0x2232
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X	0x2253
> +#define
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7		0x2202
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X	0x2206
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_P	0x220a
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_REV2	0x2258
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_DIABLO	0x223a
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_WOW	0x227a
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_GEN2	0x227e
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_GEN2	0x229e
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO	0x12e0
> +#define USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X	0x12e5
> =C2=A0
> =C2=A0#define USB_VENDOR_ID_SUN		0x0430
> =C2=A0#define USB_DEVICE_ID_RARITAN_KVM_DONGLE	0xcdab

