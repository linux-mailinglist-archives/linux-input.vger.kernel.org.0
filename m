Return-Path: <linux-input+bounces-16973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC219D12AE9
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 14:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B48DD300ACE8
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 13:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6531F357732;
	Mon, 12 Jan 2026 13:08:42 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63C8242D7C;
	Mon, 12 Jan 2026 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223322; cv=none; b=skzoXZzltEm1zwi9pCuDo9UgQwyyWxIRA8xR1e2F2uXD6AidOWgs8jnj+mhrmbIgiWp5EePmpyDLbW5kybnuRo3QxV1+30joKfRjkUNvfKGLYnPignehv+WfNmtJI+6NUY0qlxEW1gWVitUrH2maZR3rU5T8JCz9hg/aJvQ/EPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223322; c=relaxed/simple;
	bh=UV7AMRw0p6SJsThPTv0wuvzQorfKzVYvNLrPDEiMIl0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ebwr2QREAv493pNBx1CqqGFPzNTctp6a2Vx1Qa+V5yZnVwUUt2PTYr8zhYHrAh5NQ7z2mK8deXfcDC/HKWVtwNdAsm5+zN2cu6iQ9kaiV+ama1izaLJmP8tPDlEjr3EeuysxQjOyQ6DoNDeG1t5+nhGqEha7xyCdWcHmoNvfdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A64843FCA;
	Mon, 12 Jan 2026 13:08:37 +0000 (UTC)
Message-ID: <405b54108beb5ddc7f65c6d161c8f68204a1e5a0.camel@hadess.net>
Subject: Re: [PATCH v2 2/4] HID: quirks: Add INPUT_CONFIGURED quirk for
 SteelSeries Arctis headsets
From: Bastien Nocera <hadess@hadess.net>
To: Sriman Achanta <srimanachanta@gmail.com>, Jiri Kosina
 <jikos@kernel.org>,  Benjamin Tissoires	 <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 12 Jan 2026 14:08:37 +0100
In-Reply-To: <20260112041941.40531-3-srimanachanta@gmail.com>
References: <20260112041941.40531-1-srimanachanta@gmail.com>
	 <20260112041941.40531-3-srimanachanta@gmail.com>
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
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeuveeivdetkeekgfefffeftefhjeeikeetffdvteejheefieeltedtvdeuleduleenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghloheplgfkrfhvieemvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefngdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeelteeigeekgeefhfevtedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepshhrihhmrghnrggthhgrnhhtrgesghhmrghilhdrtghomhdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg

On Sun, 2026-01-11 at 23:19 -0500, Sriman Achanta wrote:
> Add HID_QUIRK_INPUT_CONFIGURED for all SteelSeries Arctis headsets
> that
> require the hid-steelseries driver. This quirk ensures proper device
> initialization and prevents conflicts with generic HID drivers.
>=20
> The quirk is necessary because these devices expose multiple HID
> interfaces, and the hid-steelseries driver needs to bind to specific
> interfaces based on the device capabilities. Without this quirk, the
> generic HID driver may interfere with device-specific functionality
> like
> battery monitoring and feature controls.

Only devices that need it should be added to this list.
USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X (which used to be called
USB_DEVICE_ID_STEELSERIES_ARCTIS_1 before patch 1 in the list) only has
one HID interface, so doesn't need this patch.

>=20
> Signed-off-by: Sriman Achanta <srimanachanta@gmail.com>
> ---
> =C2=A0drivers/hid/hid-quirks.c | 25 +++++++++++++++++++++++++
> =C2=A01 file changed, 25 insertions(+)
>=20
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index c89a015686c0..8a7c3f433040 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -699,7 +699,32 @@ static const struct hid_device_id
> hid_have_special_driver[] =3D {
> =C2=A0#if IS_ENABLED(CONFIG_HID_STEELSERIES)
> =C2=A0	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_SRWS1) },
> =C2=A0	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_1) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_1_X) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_P) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_X) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_GEN2) },
> =C2=A0	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_9) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_PRO) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_P) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_X) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_7_PLUS_DESTINY) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_P) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_3_X) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_5_X) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_P) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_REV2) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_DIABLO) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_WOW) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_GEN2) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_7_X_GEN2) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES,
> USB_DEVICE_ID_STEELSERIES_ARCTIS_NOVA_PRO_X) },
> =C2=A0#endif
> =C2=A0#if IS_ENABLED(CONFIG_HID_SUNPLUS)
> =C2=A0	{ HID_USB_DEVICE(USB_VENDOR_ID_SUNPLUS,
> USB_DEVICE_ID_SUNPLUS_WDESKTOP) },

