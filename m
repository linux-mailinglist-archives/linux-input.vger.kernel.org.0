Return-Path: <linux-input+bounces-9199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1605BA0B86C
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 14:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3A823A6083
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC24223A592;
	Mon, 13 Jan 2025 13:42:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155F23A568;
	Mon, 13 Jan 2025 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736775759; cv=none; b=MRLtoU/5391R2fyKvL9xtZ0v2+kwHp5JXwaueiylmK0nlNPO0ZAl5pWRaYWvrAAjdrInUXUaVlTWTfwYTySUh8KFCKxOcwS+S8jyCxHeqek+35bclt/TGcmWRCdqWiQpXmLlx6u0o/lpy95C6i5Z0YnhPmeq7UHH1X8CrwUOmmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736775759; c=relaxed/simple;
	bh=cHxN3HEUoLouh51TZpMvRXPU0N2i04BGF50RVXAvHLc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U2m3fz70Jub1PLf94HUxAwBqqJo3+/bOzb04tDKu/RYeFQ/QZCiWyIki4s/3gH161YWvk0Km0mEAv0scD8jEs88GUGBQ0gftbnXgSp+U9rnTvkqAzvPvS/UTs2l395CzeHJtGP3/eYdagZa71Gg3YgVP093ILobW3/ULNKSDe88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF1BC60005;
	Mon, 13 Jan 2025 13:42:35 +0000 (UTC)
Message-ID: <8ad74c1736444f06cafb0e185abcbd9897b2905c.camel@hadess.net>
Subject: Re: [PATCH v2 4/5] HID: steelseries: export model and manufacturer
From: Bastien Nocera <hadess@hadess.net>
To: Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 13 Jan 2025 14:42:33 +0100
In-Reply-To: <20250112114438.2196-5-git@mayer-bgk.de>
References: <20250112114438.2196-1-git@mayer-bgk.de>
	 <20250112114438.2196-5-git@mayer-bgk.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net

On Sun, 2025-01-12 at 11:44 +0000, Christian Mayer wrote:
> Export model and manufacturer with the power supply properties.
> This helps identifing the device in the battery overview.
> In the case of the Arctis 9 headset, the manufacturer is prefixed
> twice in
> the device name.
>=20
> Signed-off-by: Christian Mayer <git@mayer-bgk.de>

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Tested-by: Bastien Nocera <hadess@hadess.net>

> ---
> =C2=A0drivers/hid/hid-steelseries.c | 13 +++++++++++++
> =C2=A01 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> steelseries.c
> index 2ee1a6f01852..1a935802880a 100644
> --- a/drivers/hid/hid-steelseries.c
> +++ b/drivers/hid/hid-steelseries.c
> @@ -439,6 +439,9 @@ static void
> steelseries_headset_battery_timer_tick(struct work_struct *work)
> =C2=A0	steelseries_headset_fetch_battery(hdev);
> =C2=A0}
> =C2=A0
> +#define STEELSERIES_PREFIX "SteelSeries "
> +#define STEELSERIES_PREFIX_LEN strlen(STEELSERIES_PREFIX)
> +
> =C2=A0static int steelseries_headset_battery_get_property(struct
> power_supply *psy,
> =C2=A0				enum power_supply_property psp,
> =C2=A0				union power_supply_propval *val)
> @@ -447,6 +450,14 @@ static int
> steelseries_headset_battery_get_property(struct power_supply *psy,
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	switch (psp) {
> +	case POWER_SUPPLY_PROP_MODEL_NAME:
> +		val->strval =3D sd->hdev->name;
> +		while (!strncmp(val->strval, STEELSERIES_PREFIX,
> STEELSERIES_PREFIX_LEN))
> +			val->strval +=3D STEELSERIES_PREFIX_LEN;
> +		break;
> +	case POWER_SUPPLY_PROP_MANUFACTURER:
> +		val->strval =3D "SteelSeries";
> +		break;
> =C2=A0	case POWER_SUPPLY_PROP_PRESENT:
> =C2=A0		val->intval =3D 1;
> =C2=A0		break;
> @@ -490,6 +501,8 @@ steelseries_headset_set_wireless_status(struct
> hid_device *hdev,
> =C2=A0}
> =C2=A0
> =C2=A0static enum power_supply_property
> steelseries_headset_battery_props[] =3D {
> +	POWER_SUPPLY_PROP_MODEL_NAME,
> +	POWER_SUPPLY_PROP_MANUFACTURER,
> =C2=A0	POWER_SUPPLY_PROP_PRESENT,
> =C2=A0	POWER_SUPPLY_PROP_STATUS,
> =C2=A0	POWER_SUPPLY_PROP_SCOPE,


