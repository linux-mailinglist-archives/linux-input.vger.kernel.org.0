Return-Path: <linux-input+bounces-15474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C59BD8C0C
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 12:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97BF919247D2
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 10:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BAE72E3715;
	Tue, 14 Oct 2025 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVSMVPkO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73EB239562;
	Tue, 14 Oct 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437528; cv=none; b=k2/SF7/OQnpSmhS+ZyiM5aqQSvJTAxQ6EAE/itwlshmjC85mdr4b9G7OIo4X9q+JB3NIWU5Wc2db38RTqVw1nMaoJHsFhMIl8MAWpXrGPdqnQ3Dl/cHnFZe94YNav3iGKi6Q8FbmrBwVWm90rVeTK45cieCO2NwNOgLSPkCbYUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437528; c=relaxed/simple;
	bh=ZpoQrSfuQP8h9b3hV3ueq96PbCj741asi9e4ABj02RI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aOnRw4WbrJ0HE/Gn1RJRaUxNOdiJ5Zg1V4JRlseVEZL9mxFZtW68IjnKmWX4aVblppT8yr+w+aryHRfZRKG/8s9sqKL6QGUBmvACcoCvRxQ5Z1vNfzQYPT9c5kRWgj1mibUjV+Ki090zs9QFXcn8cP8SZSGwa0GQSwe85UCufGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVSMVPkO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A7FC4CEE7;
	Tue, 14 Oct 2025 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760437528;
	bh=ZpoQrSfuQP8h9b3hV3ueq96PbCj741asi9e4ABj02RI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dVSMVPkO6QGhwrAJNNpHfcN/dK343leQ3/KHjZS6iXI3L6lL4ayujMOjhr2YNJ0w/
	 ffr4jAeSAw6EYhuuA+6NzYd5PQ0ubYJr0PH9bqSxzKRvmbo4v35IM8jzSj31i/rU/S
	 QciKv9VD+OdYhsYLshOdd7WMkZ+KuB8I1kL1hMnURC3r5myknKOmLWyI4jIHMTm32x
	 Dz/n/x8yPX/WYSd9zw1/+7iBGRbiBNwZFEuS+iAveEA3+Ycio4xj6gOhxGrUdms3DY
	 6iEfA32zoeq3cbrMvTH25YhfMmwZCwibxoK5I7txySyBk+ZDB1gH8Oi4U1razE3qlZ
	 7IfsBYFtUHjoQ==
Date: Tue, 14 Oct 2025 12:25:25 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    =?GB2312?B?wqy5+rrq?= <luguohong@xiaomi.com>, kenalba@google.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-input: only ignore 0 battery events for
 digitizers
In-Reply-To: <of5qjeij72wduee3zyf26drfcwhpsl4sjs3v6tfjv3tgl3xsol@sss7zcyawwaz>
Message-ID: <r20q42n6-n65r-3151-s194-10222o3o6s6s@xreary.bet>
References: <of5qjeij72wduee3zyf26drfcwhpsl4sjs3v6tfjv3tgl3xsol@sss7zcyawwaz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 9 Oct 2025, Dmitry Torokhov wrote:

> Commit 581c4484769e ("HID: input: map digitizer battery usage") added
> handling of battery events for digitizers (typically for batteries
> presented in styli). Digitizers typically report correct battery levels
> only when stylus is actively touching the surface, and in other cases
> they may report battery level of 0. To avoid confusing consumers of the
> battery information the code was added to filer out reports with 0
> battery levels.
>=20
> However there exist other kinds of devices that may legitimately report
> 0 battery levels. Fix this by filtering out 0-level reports only for
> digitizer usages, and continue reporting them for other kinds of devices
> (Smart Batteries, etc).
>=20
> Reported-by: =E5=8D=A2=E5=9B=BD=E5=AE=8F <luguohong@xiaomi.com>
> Tested-by: =E5=8D=A2=E5=9B=BD=E5=AE=8F <luguohong@xiaomi.com>
> Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/hid-input.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index ff1784b5c2a4..ba3f6655af9e 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -595,14 +595,18 @@ static void hidinput_cleanup_battery(struct hid_dev=
ice *dev)
>  =09dev->battery =3D NULL;
>  }
> =20
> -static void hidinput_update_battery(struct hid_device *dev, int value)
> +static void hidinput_update_battery(struct hid_device *dev,
> +=09=09=09=09    unsigned int usage, int value)
>  {
>  =09int capacity;
> =20
>  =09if (!dev->battery)
>  =09=09return;
> =20
> -=09if (value =3D=3D 0 || value < dev->battery_min || value > dev->batter=
y_max)
> +=09if ((usage & HID_USAGE_PAGE) =3D=3D HID_UP_DIGITIZER && value =3D=3D =
0)
> +=09=09return;
> +
> +=09if (value < dev->battery_min || value > dev->battery_max)
>  =09=09return;
> =20
>  =09capacity =3D hidinput_scale_battery_capacity(dev, value);
> @@ -1518,7 +1522,7 @@ void hidinput_hid_event(struct hid_device *hid, str=
uct hid_field *field, struct
>  =09=09bool handled =3D hidinput_set_battery_charge_status(hid, usage->hi=
d, value);
> =20
>  =09=09if (!handled)
> -=09=09=09hidinput_update_battery(hid, value);
> +=09=09=09hidinput_update_battery(hid, usage->hid, value);
> =20
>  =09=09return;

Hi Dmitry,

thanks for the fix. It doesn't apply cleanly on a reasonably recent tree=20
though, as since e94536e1d1818b09 we're already propagating usage to=20
hidinput_update_battery(), and we're issuing explicit call to=20
power_supply_changed() as well.

Could you please refresh on a more recent codebase and resubmit? I could=20
do that myself, but I guess you also have a way to test the patch with=20
your use-case ... ?

Thanks,

--=20
Jiri Kosina
SUSE Labs


