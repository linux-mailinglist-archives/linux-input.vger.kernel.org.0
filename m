Return-Path: <linux-input+bounces-9197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D5A0B869
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 14:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33FC47A2BE9
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DBC22A4CA;
	Mon, 13 Jan 2025 13:42:37 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCDF1BEF8A;
	Mon, 13 Jan 2025 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736775757; cv=none; b=Lo3ihoD+i1elB5ouAEVf3sIn6Sd+EQ+bAJvsKIV5hTg5UmRz/jWtLt4s+BadqjTpTqX5TdBepiq+uDa2P0IIwhAgIwQfGe+PrsVPTNAyS5BJj1+5YMpwzRjQ0i5M1ClP63+NTWUfA8B9AIJHBLZ4XZrNqCOzDIYGFOwu2DfmzOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736775757; c=relaxed/simple;
	bh=W45sWKRyxLPlNcdcSTulZwCFlz4gGqGzIOKvz+gci80=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PMzVE+YwPEF3rpDGoQRBfUb/wdWv1UyBjTdUcCu5w00Q3MzUqKafgwfWQcEaJQRpQPigYcc3SQoXA1/SpJbzcEEp6rqwK38cSGcnAv1vHVJ58f1mQWpo6uIywdaqlG2dh1xNu8nunGXXllxYihlMugxnDFHzLh7YB7SRgVi4qAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D06520004;
	Mon, 13 Jan 2025 13:42:32 +0000 (UTC)
Message-ID: <773f8d09ad5e613ec044b268a677ff003e62909c.camel@hadess.net>
Subject: Re: [PATCH v2 2/5] HID: steelseries: add SteelSeries Arctis 9
 support
From: Bastien Nocera <hadess@hadess.net>
To: Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 13 Jan 2025 14:42:27 +0100
In-Reply-To: <20250112114438.2196-3-git@mayer-bgk.de>
References: <20250112114438.2196-1-git@mayer-bgk.de>
	 <20250112114438.2196-3-git@mayer-bgk.de>
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
> Add support for the SteelSeries Arctis 9 headset. This driver
> will export the battery information like it already does for
> the Arcits 1 headset.
>=20
> Signed-off-by: Christian Mayer <git@mayer-bgk.de>

Feel free to add my signoffs once you've remove the one unnecessary
whitespace change.
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Tested-by: Bastien Nocera <hadess@hadess.net>

> ---
> =C2=A0drivers/hid/hid-steelseries.c | 64
> +++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 64 insertions(+)
>=20
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> steelseries.c
> index dc4ab55d7c22..2b98db7f8911 100644
> --- a/drivers/hid/hid-steelseries.c
> +++ b/drivers/hid/hid-steelseries.c
> @@ -19,6 +19,7 @@
> =C2=A0
> =C2=A0#define STEELSERIES_SRWS1		BIT(0)
> =C2=A0#define STEELSERIES_ARCTIS_1		BIT(1)
> +#define STEELSERIES_ARCTIS_9		BIT(2)
> =C2=A0
> =C2=A0struct steelseries_device {
> =C2=A0	struct hid_device *hdev;
> @@ -375,7 +376,9 @@ static void steelseries_srws1_remove(struct
> hid_device *hdev)
> =C2=A0#define STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS	3000
> =C2=A0
> =C2=A0#define ARCTIS_1_BATTERY_RESPONSE_LEN		8
> +#define ARCTIS_9_BATTERY_RESPONSE_LEN		64
> =C2=A0static const char arctis_1_battery_request[] =3D { 0x06, 0x12 };
> +static const char arctis_9_battery_request[] =3D { 0x00, 0x20 };
> =C2=A0
> =C2=A0static int steelseries_headset_request_battery(struct hid_device
> *hdev,
> =C2=A0	const char *request, size_t len)
> @@ -395,6 +398,7 @@ static int
> steelseries_headset_request_battery(struct hid_device *hdev,
> =C2=A0		hid_err(hdev, "hid_hw_raw_request() failed with
> %d\n", ret);
> =C2=A0		ret =3D -ENODATA;
> =C2=A0	}
> +
> =C2=A0	kfree(write_buf);
> =C2=A0	return ret;
> =C2=A0}

Whitespace change.

> @@ -407,6 +411,9 @@ static void
> steelseries_headset_fetch_battery(struct hid_device *hdev)
> =C2=A0	if (sd->quirks & STEELSERIES_ARCTIS_1)
> =C2=A0		ret =3D steelseries_headset_request_battery(hdev,
> =C2=A0			arctis_1_battery_request,
> sizeof(arctis_1_battery_request));
> +	else if (sd->quirks & STEELSERIES_ARCTIS_9)
> +		ret =3D steelseries_headset_request_battery(hdev,
> +			arctis_9_battery_request,
> sizeof(arctis_9_battery_request));
> =C2=A0
> =C2=A0	if (ret < 0)
> =C2=A0		hid_dbg(hdev,
> @@ -522,9 +529,22 @@ static int
> steelseries_headset_battery_register(struct steelseries_device *sd)
> =C2=A0	INIT_DELAYED_WORK(&sd->battery_work,
> steelseries_headset_battery_timer_tick);
> =C2=A0	steelseries_headset_fetch_battery(sd->hdev);
> =C2=A0
> +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
> +		/* The first fetch_battery request can remain
> unanswered in some cases */
> +		schedule_delayed_work(&sd->battery_work,
> +				msecs_to_jiffies(STEELSERIES_HEADSET
> _BATTERY_TIMEOUT_MS));
> +	}
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static bool steelseries_is_vendor_usage_page(struct hid_device
> *hdev, uint8_t usage_page)
> +{
> +	return hdev->rdesc[0] =3D=3D 0x06 &&
> +		hdev->rdesc[1] =3D=3D usage_page &&
> +		hdev->rdesc[2] =3D=3D 0xff;
> +}
> +
> =C2=A0static int steelseries_probe(struct hid_device *hdev, const struct
> hid_device_id *id)
> =C2=A0{
> =C2=A0	struct steelseries_device *sd;
> @@ -550,6 +570,10 @@ static int steelseries_probe(struct hid_device
> *hdev, const struct hid_device_id
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> +	if (sd->quirks & STEELSERIES_ARCTIS_9 &&
> +			!steelseries_is_vendor_usage_page(hdev,
> 0xc0))
> +		return -ENODEV;
> +
> =C2=A0	spin_lock_init(&sd->lock);
> =C2=A0
> =C2=A0	ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> @@ -606,6 +630,15 @@ static const __u8
> *steelseries_srws1_report_fixup(struct hid_device *hdev,
> =C2=A0	return rdesc;
> =C2=A0}
> =C2=A0
> +static uint8_t steelseries_headset_map_capacity(uint8_t capacity,
> uint8_t min_in, uint8_t max_in)
> +{
> +	if (capacity >=3D max_in)
> +		return 100;
> +	if (capacity <=3D min_in)
> +		return 0;
> +	return (capacity - min_in) * 100 / (max_in - min_in);
> +}
> +
> =C2=A0static int steelseries_headset_raw_event(struct hid_device *hdev,
> =C2=A0					struct hid_report *report,
> u8 *read_buf,
> =C2=A0					int size)
> @@ -637,6 +670,32 @@ static int steelseries_headset_raw_event(struct
> hid_device *hdev,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
> +		hid_dbg(sd->hdev,
> +			"Parsing raw event for Arctis 9 headset
> (%*ph)\n", size, read_buf);
> +		if (size < ARCTIS_9_BATTERY_RESPONSE_LEN) {
> +			if (!delayed_work_pending(&sd-
> >battery_work))
> +				goto request_battery;
> +			return 0;
> +		}
> +
> +		if (read_buf[0] =3D=3D 0xaa && read_buf[1] =3D=3D 0x01) {
> +			connected =3D true;
> +
> +			/*
> +			 * Found no official documentation about min
> and max.
> +			 * Values defined by testing.
> +			 */
> +			capacity =3D
> steelseries_headset_map_capacity(read_buf[3], 0x68, 0x9d);
> +		} else {
> +			/*
> +			 * Device is off and sends the last known
> status read_buf[1] =3D=3D 0x03 or
> +			 * there is no known status of the device
> read_buf[0] =3D=3D 0x55
> +			 */
> +			connected =3D false;
> +		}
> +	}
> +
> =C2=A0	if (connected !=3D sd->headset_connected) {
> =C2=A0		hid_dbg(sd->hdev,
> =C2=A0			"Connected status changed from %sconnected
> to %sconnected\n",
> @@ -672,6 +731,10 @@ static const struct hid_device_id
> steelseries_devices[] =3D {
> =C2=A0	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12b6),
> =C2=A0	.driver_data =3D STEELSERIES_ARCTIS_1 },
> =C2=A0
> +	{ /* SteelSeries Arctis 9 Wireless for XBox */
> +	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12c2),
> +	=C2=A0 .driver_data =3D STEELSERIES_ARCTIS_9 },
> +
> =C2=A0	{ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(hid, steelseries_devices);
> @@ -690,3 +753,4 @@ MODULE_DESCRIPTION("HID driver for Steelseries
> devices");
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
> =C2=A0MODULE_AUTHOR("Simon Wood <simon@mungewell.org>");
> +MODULE_AUTHOR("Christian Mayer <git@mayer-bgk.de>");


