Return-Path: <linux-input+bounces-8883-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F26DA01431
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 13:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3631D18843BE
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 12:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D724116A959;
	Sat,  4 Jan 2025 12:02:15 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2599614B08C;
	Sat,  4 Jan 2025 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735992135; cv=none; b=lYmApGf20MgpMjsk04Hri2jex8E4TrAhmGtEYF5wefE0aPMyKGtjwg4jSJUGmihIzytMKi4vrzkar18B+SbYasngoirWcE6JJ+tRXfLAjyR7lARQp5o+7MoMbpciYLV/YCc7dG8DV21WAG4iHk4KOMhGEWKeQ/JgvYEL/OENBVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735992135; c=relaxed/simple;
	bh=cDAEPt/Jpn7bCJZr7oWi4nqBXlUceI6yjI6ANUeirTQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aIJec4+ZacvD0tOYcuvOTDQ7/ZLRlJw+FMjmZJtm+vTeT39UZS3WLBluKOh9Mp4O4pTKlUQwbQoCuEJ1+MKBybjDSIqSao08rSNwfDh8zjVH6mGBfrD6N1DhS3bHYTLnge4BdASjgp3W8CCPFrN4v8tfKZVEqYlq/GhHCs1Ih+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id B083E1BF203;
	Sat,  4 Jan 2025 12:02:10 +0000 (UTC)
Message-ID: <98d8c4f4c7661b82d0f2eafbf24ec627ff5d6c41.camel@hadess.net>
Subject: Re: [PATCH 2/3] HID: steelseries: export charging state for the
 SteelSeries Arctis 9 headset
From: Bastien Nocera <hadess@hadess.net>
To: Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Sat, 04 Jan 2025 13:02:10 +0100
In-Reply-To: <20250101151209.100072-3-git@mayer-bgk.de>
References: <20250101151209.100072-1-git@mayer-bgk.de>
	 <20250101151209.100072-3-git@mayer-bgk.de>
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

On Wed, 2025-01-01 at 15:11 +0000, Christian Mayer wrote:
> The Arctis 9 headset provides the information if
> the power cable is plugged in and charging via the battery report.
> This information can be exported.
>=20
> Signed-off-by: Christian Mayer <git@mayer-bgk.de>

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
> =C2=A0drivers/hid/hid-steelseries.c | 23 ++++++++++++++++++++---
> =C2=A01 file changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> steelseries.c
> index f102045a9b6b..d11296bc0e1e 100644
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
> @@ -650,6 +655,7 @@ static int steelseries_headset_raw_event(struct
> hid_device *hdev,
> =C2=A0	struct steelseries_device *sd =3D hid_get_drvdata(hdev);
> =C2=A0	int capacity =3D sd->battery_capacity;
> =C2=A0	bool connected =3D sd->headset_connected;
> +	bool charging =3D sd->battery_charging;
> =C2=A0	unsigned long flags;
> =C2=A0
> =C2=A0	/* Not a headset */
> @@ -685,6 +691,7 @@ static int steelseries_headset_raw_event(struct
> hid_device *hdev,
> =C2=A0
> =C2=A0		if (read_buf[0] =3D=3D 0xaa && read_buf[1] =3D=3D 0x01) {
> =C2=A0			connected =3D true;
> +			charging =3D read_buf[4] =3D=3D 0x01;
> =C2=A0
> =C2=A0			/*
> =C2=A0			 * Found no official documentation about min
> and max.
> @@ -697,6 +704,7 @@ static int steelseries_headset_raw_event(struct
> hid_device *hdev,
> =C2=A0			 * there is no known status of the device
> read_buf[0] =3D=3D 0x55
> =C2=A0			 */
> =C2=A0			connected =3D false;
> +			charging =3D false;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> @@ -717,6 +725,15 @@ static int steelseries_headset_raw_event(struct
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


