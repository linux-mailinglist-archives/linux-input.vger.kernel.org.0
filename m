Return-Path: <linux-input+bounces-9474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B8A19315
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 14:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DEF83A086E
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 13:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8852139BC;
	Wed, 22 Jan 2025 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jungkamp.dev header.i=@jungkamp.dev header.b="iYSDuVRf"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-201.mailbox.org (unknown [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07F0212D6F;
	Wed, 22 Jan 2025 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554123; cv=none; b=rRlgw1oVv55YnR4VFyn+dOFjIvmnYpfoq7tHSGbbq+Et3l4O55ksr269hg92SeiDId0WogznMH/yRTU1ZBWNU/gn3Xqre57quolkJP/mQZMKQaJ3ALTfkaxzr2jXMjikOfTQfiAdRnxDZqzgD3WG185tM948AsrhZBEmYP4Eyoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554123; c=relaxed/simple;
	bh=y1/FYdXdrAp5cjDp93dDJgqax913gZ06QBjAkHs9Vzc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YAwzKj6UeXvz4QMuyYVCJXrxC38m3D1P22Sqa+q+t8S5614LiUyynvbjl4WRkR07GMcR4T+FoEz7yiFLIWx6Wef7VpX+1Mb88zD0KavUnuOEBC8Si9QbylZNnsauKslStd1BXdXhiCSHxjTtdPVo2U0iz4/bgSS/O2x1om1aLrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jungkamp.dev; spf=pass smtp.mailfrom=jungkamp.dev; dkim=pass (2048-bit key) header.d=jungkamp.dev header.i=@jungkamp.dev header.b=iYSDuVRf; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jungkamp.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jungkamp.dev
Received: from smtp1.mailbox.org (unknown [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YdQZ71mhnz9tPg;
	Wed, 22 Jan 2025 14:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jungkamp.dev;
	s=MBO0001; t=1737554111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1/FYdXdrAp5cjDp93dDJgqax913gZ06QBjAkHs9Vzc=;
	b=iYSDuVRfrOa8rIQuqDgC7oSmNcyZs/xaJ9w4dTv7q94nGIzhJH8vxz0cQOpP2tlb20CP6m
	UVETpeYgaOIRwdEZkSOzmGwZUv0nQXDCYVcf4HBgJEODTsYASoDKGmuqG6b5dDakqqcmQ3
	R77Whw8SbAghCZxjbYkNI9mMfhzk955zzkbP2BnUwGIbGztBQo3Cpyc9yOW8G0uizrd0n4
	d0aDp79hvcTePiIMAkwAcT2g2O4MHa93CyNnkXLjWoYqlCxUInQvbVlP7JEHruKmamTYEX
	U9N4iNaJX0/+uj8PvXR2PaRsIvOkjMWSwrMI+b/gmY2/jX1pF8XZg41m67wIwA==
Message-ID: <8a77584accb194c2bb1553cf07611211ea864c67.camel@jungkamp.dev>
Subject: Re: [PATCH v2] iio: hid-sensor-prox: Split difference from multiple
 channels
From: Philipp Jungkamp <philipp@jungkamp.dev>
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>, 
 "ribalda@chromium.org"	 <ribalda@chromium.org>, "mpearson-lenovo@squebb.ca"
 <mpearson-lenovo@squebb.ca>,  "jic23@kernel.org"	 <jic23@kernel.org>
Cc: "jikos@kernel.org" <jikos@kernel.org>, "linux-input@vger.kernel.org"
	 <linux-input@vger.kernel.org>, "Jonathan.Cameron@huawei.com"
	 <Jonathan.Cameron@huawei.com>, "lars@metafoo.de" <lars@metafoo.de>, 
 "linux-iio@vger.kernel.org"
	 <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 22 Jan 2025 14:55:07 +0100
In-Reply-To: <ae3c8b20a3de94e67a9679ff4bf2b672f8c9b66a.camel@intel.com>
References: <20241216-fix-hid-sensor-v2-1-ff8c1959ec4a@chromium.org>
		 <20241219171718.2af17d6d@jic23-huawei>
		 <CANiDSCvkKX68UqSuKiGiys8nwm5BX-FbKmHPtxJK=Hh=B4RqZQ@mail.gmail.com>
		 <45ae61a978e7d4ea34502604a6d508f14c29303b.camel@intel.com>
		 <TYZPR03MB599406F8035E6322E6B66CBFBD1F2@TYZPR03MB5994.apcprd03.prod.outlook.com>
		 <8fed2747-c419-454a-bb72-43f158b4f081@app.fastmail.com>
	 <ae3c8b20a3de94e67a9679ff4bf2b672f8c9b66a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello,

that LISS sensor was from a patch that I had introduced. It's not
connected officially to Lenovo.

It's a HPD HID sensor on the Lenovo Yoga 9 14IAP7 that exports binary
values on the human presence HID usage that is monitored by
hid-sensor-prox.

I had tried to get it working with iio-sensor-proxy to expose it over
dbus and use it in e.g. a GNOME shell extension to lock the screen when
there is no human presence detected. But my MRs were never merged and
due to private struggles I lost interest in pushing them further.

https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/-/merge_requests/364
https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/-/merge_requests/364

Regards,
Philipp Jungkamp


On Mon, 2025-01-13 at 20:03 +0000, Pandruvada, Srinivas wrote:
> On Mon, 2025-01-13 at 14:49 -0500, Mark Pearson wrote:
> > Note - switched to my open-source friendly email account (avoid the
> > Lenovo address, especially for mailing lists, it's Outlook based
> > and
> > can't cope).
> >=20
> > On Mon, Jan 13, 2025, at 2:19 PM, Mark Pearson wrote:
> > > Subject: [External] Re: [PATCH v2] iio: hid-sensor-prox: Split=20
> > > difference from multiple channels
> > >=20
> > > On Sat, 2025-01-11 at 10:17 +0100, Ricardo Ribalda wrote:
> > > > Hi Jonathan
> > > >=20
> > > > Happy new year!
> > > >=20
> > > > Friendly ping about this patch so we can change the ABI before
> > > > the
> > > > kernel release happens
> > > >=20
> > > > On Thu, 19 Dec 2024 at 18:17, Jonathan Cameron
> > > > <jic23@kernel.org>
> > > > wrote:
> > > > >=20
> > > > > On Mon, 16 Dec 2024 10:05:53 +0000
> > > > > Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > > >=20
> > > > > > When the driver was originally created, it was decided that
> > > > > > sampling_frequency and hysteresis would be shared_per_type
> > > > > > instead
> > > > > > of shared_by_all (even though it is internally shared by
> > > > > > all).
> > > > > > Eg:
> > > > > > in_proximity_raw
> > > > > > in_proximity_sampling_frequency
> > > > > >=20
> > > > > > When we introduced support for more channels, we continued
> > > > > > with
> > > > > > shared_by_type which. Eg:
> > > > > > in_proximity0_raw
> > > > > > in_proximity1_raw
> > > > > > in_proximity_sampling_frequency
> > > > > > in_attention_raw
> > > > > > in_attention_sampling_frequency
> > > > > >=20
> > > > > > Ideally we should change to shared_by_all, but it is not an
> > > > > > option,
> > > > > > because the current naming has been a stablished ABI by
> > > > > > now.
> > > > > > Luckily we
> > > > > > can use separate instead. That will be more consistent:
> > > > > > in_proximity0_raw
> > > > > > in_proximity0_sampling_frequency
> > > > > > in_proximity1_raw
> > > > > > in_proximity1_sampling_frequency
> > > > > > in_attention_raw
> > > > > > in_attention_sampling_frequency
> > > > > >=20
> > > > > > Fixes: 596ef5cf654b ("iio: hid-sensor-prox: Add support for
> > > > > > more
> > > > > > channels")
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > >=20
> > > > > I got lost somewhere in the discussion.=C2=A0 This is still an AB=
I
> > > > > change compared
> > > > > to original interface at the top (which is the one that has
> > > > > been
> > > > > there
> > > > > quite some time).
> > > > >=20
> > > > > However we already had to make one of those to add the index
> > > > > that
> > > > > wasn't there
> > > > > for _raw. (I'd missed that in earlier discussion - thanks for
> > > > > laying out the
> > > > > steps here!)
> > >=20
> > > Didn't realize this. I don't see proximity sensor use in the
> > > mainline
> > > Linux distro user space, so it will affect only some private user
> > > space
> > > programs.
> > > Adding Mark to see if it affects Lenovo Sensing solution as there
> > > was
> > > specific custom sensor added to this driver for Lenovo.
> > >=20
> >=20
> > Can I get some pointers to what sensor that is please?
> > We've been asking for the HID support drivers, but it isn't
> > available
> > yet to my knowledge. Would the MIPI camera work tie into this?
> No.
>=20
> >=20
> > If I can get details on what the sensor is I'll go and check what
> > is
> > impacted.
> >=20
> This is a custom sensor exported via Intel ISH
>=20
> =C2=A0/*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Lenovo Intelligent Sen=
sing Solution (LISS)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>=20
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* human presence */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .tag =3D "LISS",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .luid =3D "0226000171AC0081",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .model =3D "VL53L1_HOD Sensor",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .manufacturer =3D "ST_MICRO",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .check_dmi =3D true,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .dmi.matches =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_MATC=
H(DMI_SYS_VENDOR, "LENOVO"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>=20
> Question is what Lenovo user space is using this sensor?
>=20
> Thanks,
> Srinivas
>=20
> > Thanks
> > Mark
>=20


