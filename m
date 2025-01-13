Return-Path: <linux-input+bounces-9198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2579CA0B86B
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 14:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4293A1886A1C
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F69F23A58B;
	Mon, 13 Jan 2025 13:42:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3208C22CF31;
	Mon, 13 Jan 2025 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736775759; cv=none; b=h4nC15OFn8JSxE/NxF9APk7hteeYNUhGy1ZYvI1T8CoUixNmHb0KDoVP2nb8X58NYZnf1d97PCUMpdhCguEqdPPk1DHm3ZyjoUOJGvIeltXbTgKHjrk+lwSikjtVym+pKz2j6fRlwENqvRp+wN12pwj/PflxZwvp2wiEN9NNKI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736775759; c=relaxed/simple;
	bh=xpY8FipgFoPsemeVZQ1ZFPYZFAxlI6ITk7g1Ekh6Hj8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kflQCY3SJP3Y1K5ZBtodkM03N8wYUTIg2S0kLp+whnHi6fYmHCdHAGO0OSHZ/uImuvKMrNo1cyIh5IEPn8M2kb7YgAVhPPj7EpmtY+5qKnm9T17aRbYhazz7oUUNSMCNjF8H7WQXsdZT6WqC/VL9dJl4rA6BcAbaJfrsMg/UJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B1DB240004;
	Mon, 13 Jan 2025 13:42:35 +0000 (UTC)
Message-ID: <d1cd2e0505e268375209b48cf9851c9d2d1501e3.camel@hadess.net>
Subject: Re: [PATCH v2 3/5] HID: steelseries: export charging state for the
 SteelSeries Arctis 9 headset
From: Bastien Nocera <hadess@hadess.net>
To: Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 13 Jan 2025 14:42:29 +0100
In-Reply-To: <20250112114438.2196-4-git@mayer-bgk.de>
References: <20250112114438.2196-1-git@mayer-bgk.de>
	 <20250112114438.2196-4-git@mayer-bgk.de>
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
> The Arctis 9 headset provides the information if
> the power cable is plugged in and charging via the battery report.
> This information can be exported.
>=20
> Signed-off-by: Christian Mayer <git@mayer-bgk.de>
> ---
> =C2=A0drivers/hid/hid-steelseries.c | 23 ++++++++++++++++++++---
> =C2=A01 file changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> steelseries.c
> index 2b98db7f8911..2ee1a6f01852 100644
> --- a/drivers/hid/hid-steelseries.c
> +++ b/drivers/hid/hid-steelseries.c
> @@ -33,6 +33,7 @@ struct steelseries_device {
> =C2=A0	struct power_supply *battery;
> =C2=A0	uint8_t battery_capacity;
> =C2=A0	bool headset_connected;
> +	bool battery_charging;
> =C2=A0};
> =C2=A0
> =C2=A0#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
> @@ -450,9 +451,12 @@ static int
> steelseries_headset_battery_get_property(struct power_supply *psy,
> =C2=A0		val->intval =3D 1;
> =C2=A0		break;
> =C2=A0	case POWER_SUPPLY_PROP_STATUS:
> -		val->intval =3D sd->headset_connected ?
> -			POWER_SUPPLY_STATUS_DISCHARGING :
> -			POWER_SUPPLY_STATUS_UNKNOWN;
> +		if (sd->headset_connected) {
> +			val->intval =3D sd->battery_charging ?
> +				POWER_SUPPLY_STATUS_CHARGING :
> +				POWER_SUPPLY_STATUS_DISCHARGING;
> +		} else
> +			val->intval =3D POWER_SUPPLY_STATUS_UNKNOWN;
> =C2=A0		break;
> =C2=A0	case POWER_SUPPLY_PROP_SCOPE:
> =C2=A0		val->intval =3D POWER_SUPPLY_SCOPE_DEVICE;
> @@ -514,6 +518,7 @@ static int
> steelseries_headset_battery_register(struct steelseries_device *sd)
> =C2=A0	/* avoid the warning of 0% battery while waiting for the
> first info */
> =C2=A0	steelseries_headset_set_wireless_status(sd->hdev, false);
> =C2=A0	sd->battery_capacity =3D 100;
> +	sd->battery_charging =3D false;
> =C2=A0
> =C2=A0	sd->battery =3D devm_power_supply_register(&sd->hdev->dev,
> =C2=A0			&sd->battery_desc, &battery_cfg);
> @@ -646,6 +651,7 @@ static int steelseries_headset_raw_event(struct
> hid_device *hdev,
> =C2=A0	struct steelseries_device *sd =3D hid_get_drvdata(hdev);
> =C2=A0	int capacity =3D sd->battery_capacity;
> =C2=A0	bool connected =3D sd->headset_connected;
> +	bool charging =3D sd->battery_charging;
> =C2=A0	unsigned long flags;
> =C2=A0
> =C2=A0	/* Not a headset */
> @@ -681,6 +687,7 @@ static int steelseries_headset_raw_event(struct
> hid_device *hdev,
> =C2=A0
> =C2=A0		if (read_buf[0] =3D=3D 0xaa && read_buf[1] =3D=3D 0x01) {
> =C2=A0			connected =3D true;
> +			charging =3D read_buf[4] =3D=3D 0x01;

I would prefer parenthesis around that, but feel free to ignore if it's
in the kernel coding style.

Feel free to add those signoffs once that's either fixed or verified:
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Tested-by: Bastien Nocera <hadess@hadess.net>

> =C2=A0
> =C2=A0			/*
> =C2=A0			 * Found no official documentation about min
> and max.
> @@ -693,6 +700,7 @@ static int steelseries_headset_raw_event(struct
> hid_device *hdev,
> =C2=A0			 * there is no known status of the device
> read_buf[0] =3D=3D 0x55
> =C2=A0			 */
> =C2=A0			connected =3D false;
> +			charging =3D false;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> @@ -713,6 +721,15 @@ static int steelseries_headset_raw_event(struct
> hid_device *hdev,
> =C2=A0		power_supply_changed(sd->battery);
> =C2=A0	}
> =C2=A0
> +	if (charging !=3D sd->battery_charging) {
> +		hid_dbg(sd->hdev,
> +			"Battery charging status changed from
> %scharging to %scharging\n",
> +			sd->battery_charging ? "" : "not ",
> +			charging ? "" : "not ");
> +		sd->battery_charging =3D charging;
> +		power_supply_changed(sd->battery);
> +	}
> +
> =C2=A0request_battery:
> =C2=A0	spin_lock_irqsave(&sd->lock, flags);
> =C2=A0	if (!sd->removed)


