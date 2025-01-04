Return-Path: <linux-input+bounces-8882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B950A0142F
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 13:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA9716294B
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 12:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480C21B6541;
	Sat,  4 Jan 2025 12:01:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2921B6CE0;
	Sat,  4 Jan 2025 12:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735992101; cv=none; b=djK9vjUMuzOyYcUbsB1gMV9b2gXirpgr0N+U0qNHk7TuR+JipcWDQ3IS5KOwXyy92eMcplg8WyvfQaNKgQPbMCvnAz2dqJFd2PuIV6arfw0++/Keq/oW/KYR7HYRYVL+l9Yfu+cf5ugu/zyZEpTIad3yiRmtS46AxF0z9HiVeMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735992101; c=relaxed/simple;
	bh=f4PvymF/5UriyskTYjY82+0gpoUWXsUT28EmSpNgegs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sgt4JQukX4O5HH+zdmaiDjSP82+tMGpURdn9IvnkO2Mu2xV1wbawL734YA6fbxduZLnoPufTyjUfp0Z+wa4x05YQcAMG3jdAGSYEsn12fUKUmDB2cKQorYTd/0Z4wKHNLIJL4Or7cihPJ2Yk/yTBBd3ww5ve3jQKVLTt3G4qRWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id E919D40004;
	Sat,  4 Jan 2025 12:01:30 +0000 (UTC)
Message-ID: <da44f28f0f5b46fee9c8f1bdb8a71835157b8d60.camel@hadess.net>
Subject: Re: [PATCH 3/3] HID: steelseries: export model and manufacturer
From: Bastien Nocera <hadess@hadess.net>
To: Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Sat, 04 Jan 2025 13:01:30 +0100
In-Reply-To: <20250101151209.100072-4-git@mayer-bgk.de>
References: <20250101151209.100072-1-git@mayer-bgk.de>
	 <20250101151209.100072-4-git@mayer-bgk.de>
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
> Export model and manufacturer with the power supply properties.
> This helps identifing the device in the battery overview.
> In the case of the Arctis 9 headset, the manufacturer is prefixed
> twice in
> the device name.
>=20
> Signed-off-by: Christian Mayer <git@mayer-bgk.de>
> ---
> =C2=A0drivers/hid/hid-steelseries.c | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> steelseries.c
> index d11296bc0e1e..32e559376be4 100644
> --- a/drivers/hid/hid-steelseries.c
> +++ b/drivers/hid/hid-steelseries.c
> @@ -447,6 +447,14 @@ static int
> steelseries_headset_battery_get_property(struct power_supply *psy,
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	switch (psp) {
> +	case POWER_SUPPLY_PROP_MODEL_NAME:
> +		val->strval =3D sd->hdev->name;
> +		while (!strncmp(val->strval, "SteelSeries ", 12))
> +			val->strval +=3D 12;

Please use constants instead of magic numbers:

#define STEELSERIES_PREFIX "SteelSeries "
#define STEELSERIES_PREFIX_LEN strlen(STEELSERIES_PREFIX)


> +		break;
> +	case POWER_SUPPLY_PROP_MANUFACTURER:
> +		val->strval =3D "SteelSeries";
> +		break;
> =C2=A0	case POWER_SUPPLY_PROP_PRESENT:
> =C2=A0		val->intval =3D 1;
> =C2=A0		break;
> @@ -490,6 +498,8 @@ steelseries_headset_set_wireless_status(struct
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

