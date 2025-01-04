Return-Path: <linux-input+bounces-8881-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC141A0142D
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 12:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A12023A3C16
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 11:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCBF14F125;
	Sat,  4 Jan 2025 11:58:10 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B356E2F5E;
	Sat,  4 Jan 2025 11:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735991890; cv=none; b=rYEugs6BF8K4dsdLz5gxgi6q74V+kqG8Ns+7pSTkw+DvIw8e02zkfEo6d6m6Cx9+3u0jWpPQ2DkSKKEQHfNHRUm4+5vxvcuobHNHIXZ6MEViKHZ6vzkh7lkEFp5EpjKg57DnPXe8dbKAEhf9SutpgkLvkooesAFlWyieg/9974Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735991890; c=relaxed/simple;
	bh=ZfTzeCAQXb5A3h9yW9WnUn0kAV5G20NjNxx7mwrCAmE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tT0A7nRAt1cVUOM1miUiOzD1eOJet6zHUlQfXy4DDwlqHazKfGLXLz5q8/lbacf6gzUlZcdzgOz/N/K8ngl9oExVlKtgF5DBMxjI5nesrL2YbittAJ/Y1ysinu6LfQ1YEJeoXH/utiiGpdCx+bSMjfwfNKMDyRoca3iW0vibvv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A3061C0002;
	Sat,  4 Jan 2025 11:58:05 +0000 (UTC)
Message-ID: <1a966d05a55e7d7252f8aa03857c390e3518f76d.camel@hadess.net>
Subject: Re: [PATCH 1/3] HID: steelseries: add SteelSeries Arctis 9 support
From: Bastien Nocera <hadess@hadess.net>
To: Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Sat, 04 Jan 2025 12:58:04 +0100
In-Reply-To: <20250101151209.100072-2-git@mayer-bgk.de>
References: <20250101151209.100072-1-git@mayer-bgk.de>
	 <20250101151209.100072-2-git@mayer-bgk.de>
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
> Add support for the SteelSeries Arctis 9 headset. This driver
> will export the battery information like it already does for
> the Arcits 1 headset.
>=20
> Signed-off-by: Christian Mayer <git@mayer-bgk.de>


Please remove all the whitespace changes, and split off the
steelseries_headset_request_battery() refactoring into its own commit.

Detailed review comments below.

> ---
> =C2=A0drivers/hid/hid-steelseries.c | 105 +++++++++++++++++++++++++++++--=
---
> =C2=A01 file changed, 90 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.=
c
> index f9ff5be94309..f102045a9b6b 100644
> --- a/drivers/hid/hid-steelseries.c
> +++ b/drivers/hid/hid-steelseries.c
> @@ -18,7 +18,8 @@
> =C2=A0#include "hid-ids.h"
> =C2=A0
> =C2=A0#define STEELSERIES_SRWS1		BIT(0)
> -#define STEELSERIES_ARCTIS_1		BIT(1)
> +#define STEELSERIES_ARCTIS_1	BIT(1)

Whitespace change

> +#define STEELSERIES_ARCTIS_9	BIT(2)
> =C2=A0
> =C2=A0struct steelseries_device {
> =C2=A0	struct hid_device *hdev;
> @@ -35,7 +36,7 @@ struct steelseries_device {
> =C2=A0};
> =C2=A0
> =C2=A0#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
> -=C2=A0=C2=A0=C2=A0 (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID=
_STEELSERIES))
> +	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))

Whitespace change

> =C2=A0#define SRWS1_NUMBER_LEDS 15
> =C2=A0struct steelseries_srws1_data {
> =C2=A0	__u16 led_state;
> @@ -95,7 +96,7 @@ static const __u8 steelseries_srws1_rdesc_fixed[] =3D {
> =C2=A00x29, 0x11,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Usage Maximum (11h),=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A00x95, 0x11,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Report Count (17),=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A00x81, 0x02,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input (Variable),=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=A0=C2=A0 ---- Dial patch s=
tarts here ----=C2=A0=C2=A0 */
> +					/*=C2=A0=C2=A0 ---- Dial patch starts here ----=C2=A0=C2=A0 */

Whitespace change

> =C2=A00x05, 0x01,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Usage Page (Desktop),=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A00x09, 0x33,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Usage (RX),=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */
> =C2=A00x75, 0x04,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Report Size (4),=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> @@ -108,7 +109,7 @@ static const __u8 steelseries_srws1_rdesc_fixed[] =3D=
 {
> =C2=A00x95, 0x01,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Report Count (1),=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A00x25, 0x03,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Logical Maximum (3),=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A00x81, 0x02,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Input (Variable),=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=A0=C2=A0=C2=A0 ---- Dial p=
atch ends here ----=C2=A0=C2=A0=C2=A0 */
> +					/*=C2=A0=C2=A0=C2=A0 ---- Dial patch ends here ----=C2=A0=C2=A0=C2=
=A0 */

Whitespace change

> =C2=A00x06, 0x00, 0xFF,=C2=A0=C2=A0 /*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Usage Page (FF00h),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
> =C2=A00x09, 0x01,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Usage (01h),=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 */
> =C2=A00x75, 0x04,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Chan=
ged=C2=A0 Report Size (4),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 */
> @@ -125,7 +126,7 @@ static const __u8 steelseries_srws1_rdesc_fixed[] =3D=
 {
> =C2=A0};
> =C2=A0
> =C2=A0#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
> -=C2=A0=C2=A0=C2=A0 (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID=
_STEELSERIES))
> +	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))

Whitespace change

> =C2=A0static void steelseries_srws1_set_leds(struct hid_device *hdev, __u=
16 leds)
> =C2=A0{
> =C2=A0	struct list_head *report_list =3D &hdev->report_enum[HID_OUTPUT_RE=
PORT].report_list;
> @@ -368,32 +369,36 @@ static void steelseries_srws1_remove(struct hid_dev=
ice *hdev)
> =C2=A0
> =C2=A0	hid_hw_stop(hdev);
> =C2=A0	kfree(drv_data);
> -	return;

Should be a separate commit.

> =C2=A0}
> =C2=A0#endif
> =C2=A0
> =C2=A0#define STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS	3000
> =C2=A0
> =C2=A0#define ARCTIS_1_BATTERY_RESPONSE_LEN		8
> +#define ARCTIS_9_BATTERY_RESPONSE_LEN		64
> =C2=A0static const char arctis_1_battery_request[] =3D { 0x06, 0x12 };
> +static const char arctis_9_battery_request[] =3D { 0x00, 0x20 };
> =C2=A0
> -static int steelseries_headset_arctis_1_fetch_battery(struct hid_device =
*hdev)
> +static int steelseries_headset_request_battery(struct hid_device *hdev,
> +	const char *request, size_t len)

This change should be a two-step process (so two separate commits),
first factor out the battery request function so it take the request
and len as you've done, then add support for that new device.

> =C2=A0{
> =C2=A0	u8 *write_buf;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	/* Request battery information */
> -	write_buf =3D kmemdup(arctis_1_battery_request, sizeof(arctis_1_battery=
_request), GFP_KERNEL);
> +	write_buf =3D kmemdup(request, len, GFP_KERNEL);
> =C2=A0	if (!write_buf)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	ret =3D hid_hw_raw_request(hdev, arctis_1_battery_request[0],
> -				 write_buf, sizeof(arctis_1_battery_request),
> +	hid_dbg(hdev, "Sending battery request report");
> +	ret =3D hid_hw_raw_request(hdev, request[0],
> +				 write_buf, len,
> =C2=A0				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> -	if (ret < (int)sizeof(arctis_1_battery_request)) {
> +	if (ret < (int)len) {
> =C2=A0		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
> =C2=A0		ret =3D -ENODATA;
> =C2=A0	}
> +
> =C2=A0	kfree(write_buf);
> =C2=A0	return ret;
> =C2=A0}
> @@ -404,7 +409,11 @@ static void steelseries_headset_fetch_battery(struct=
 hid_device *hdev)
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	if (sd->quirks & STEELSERIES_ARCTIS_1)
> -		ret =3D steelseries_headset_arctis_1_fetch_battery(hdev);
> +		ret =3D steelseries_headset_request_battery(hdev,
> +				arctis_1_battery_request, sizeof(arctis_1_battery_request));
> +	else if (sd->quirks & STEELSERIES_ARCTIS_9)
> +		ret =3D steelseries_headset_request_battery(hdev,
> +				arctis_9_battery_request, sizeof(arctis_9_battery_request));
> =C2=A0
> =C2=A0	if (ret < 0)
> =C2=A0		hid_dbg(hdev,
> @@ -520,9 +529,22 @@ static int steelseries_headset_battery_register(stru=
ct steelseries_device *sd)
> =C2=A0	INIT_DELAYED_WORK(&sd->battery_work, steelseries_headset_battery_t=
imer_tick);
> =C2=A0	steelseries_headset_fetch_battery(sd->hdev);
> =C2=A0
> +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
> +		// The first fetch_battery request can remain unanswered in some cases

No C++-style comments.

> +		schedule_delayed_work(&sd->battery_work,
> +				msecs_to_jiffies(STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS));
> +	}
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static bool steelseries_is_vendor_usage_page(struct hid_device *hdev, ui=
nt8_t usagePage)
> +{
> +	return hdev->rdesc[0] =3D=3D 0x06 &&
> +		hdev->rdesc[1] =3D=3D usagePage &&
> +		hdev->rdesc[2] =3D=3D 0xff;
> +}

Should probably be usage_page.

> +
> =C2=A0static int steelseries_probe(struct hid_device *hdev, const struct =
hid_device_id *id)
> =C2=A0{
> =C2=A0	struct steelseries_device *sd;
> @@ -537,7 +559,7 @@ static int steelseries_probe(struct hid_device *hdev,=
 const struct hid_device_id
> =C2=A0
> =C2=A0	if (sd->quirks & STEELSERIES_SRWS1) {
> =C2=A0#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
> -=C2=A0=C2=A0=C2=A0 (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID=
_STEELSERIES))
> +	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
> =C2=A0		return steelseries_srws1_probe(hdev, id);
> =C2=A0#else
> =C2=A0		return -ENODEV;
> @@ -548,12 +570,22 @@ static int steelseries_probe(struct hid_device *hde=
v, const struct hid_device_id
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> +	if (sd->quirks & STEELSERIES_ARCTIS_9 &&
> +			!steelseries_is_vendor_usage_page(hdev, 0xc0))
> +		return -ENODEV;
> +
> =C2=A0	spin_lock_init(&sd->lock);
> =C2=A0
> =C2=A0	ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
> +		ret =3D hid_hw_open(hdev);

Is this needed? If so, this probably needs to be added as a separate
commit, for all headsets rather than just this one.

> +		if (ret)
> +			return ret;
> +	}
> +
> =C2=A0	if (steelseries_headset_battery_register(sd) < 0)
> =C2=A0		hid_err(sd->hdev,
> =C2=A0			"Failed to register battery for headset\n");
> @@ -568,7 +600,7 @@ static void steelseries_remove(struct hid_device *hde=
v)
> =C2=A0
> =C2=A0	if (sd->quirks & STEELSERIES_SRWS1) {
> =C2=A0#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
> -=C2=A0=C2=A0=C2=A0 (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID=
_STEELSERIES))
> +	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
> =C2=A0		steelseries_srws1_remove(hdev);
> =C2=A0#endif
> =C2=A0		return;
> @@ -580,6 +612,9 @@ static void steelseries_remove(struct hid_device *hde=
v)
> =C2=A0
> =C2=A0	cancel_delayed_work_sync(&sd->battery_work);
> =C2=A0
> +	if (sd->quirks & STEELSERIES_ARCTIS_9)
> +		hid_hw_close(hdev);
> +
> =C2=A0	hid_hw_stop(hdev);
> =C2=A0}
> =C2=A0
> @@ -599,6 +634,15 @@ static const __u8 *steelseries_srws1_report_fixup(st=
ruct hid_device *hdev,
> =C2=A0	return rdesc;
> =C2=A0}
> =C2=A0
> +static uint8_t steelseries_headset_map_capacity(uint8_t capacity, uint8_=
t min_in, uint8_t max_in)
> +{
> +	if (capacity > max_in)
> +		return 100;
> +	if (capacity < min_in)
> +		return 0;
> +	return (capacity - min_in) * 100 / (max_in - min_in);
> +}
> +
> =C2=A0static int steelseries_headset_raw_event(struct hid_device *hdev,
> =C2=A0					struct hid_report *report, u8 *read_buf,
> =C2=A0					int size)
> @@ -630,6 +674,32 @@ static int steelseries_headset_raw_event(struct hid_=
device *hdev,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
> +		hid_dbg(sd->hdev,
> +			"Parsing raw event for Arctis 9 headset (%*ph)\n", size, read_buf);
> +		if (size < ARCTIS_9_BATTERY_RESPONSE_LEN) {
> +			if (!delayed_work_pending(&sd->battery_work))
> +				goto request_battery;
> +			return 0;
> +		}
> +
> +		if (read_buf[0] =3D=3D 0xaa && read_buf[1] =3D=3D 0x01) {
> +			connected =3D true;
> +
> +			/*
> +			 * Found no official documentation about min and max.
> +			 * Values defined by testing.
> +			 */
> +			capacity =3D steelseries_headset_map_capacity(read_buf[3], 0x68, 0x9d=
);
> +		} else {
> +			/*
> +			 * Device is off and sends the last known status read_buf[1] =3D=3D 0=
x03 or
> +			 * there is no known status of the device read_buf[0] =3D=3D 0x55
> +			 */
> +			connected =3D false;
> +		}
> +	}
> +
> =C2=A0	if (connected !=3D sd->headset_connected) {
> =C2=A0		hid_dbg(sd->hdev,
> =C2=A0			"Connected status changed from %sconnected to %sconnected\n",
> @@ -663,7 +733,11 @@ static const struct hid_device_id steelseries_device=
s[] =3D {
> =C2=A0
> =C2=A0	{ /* SteelSeries Arctis 1 Wireless for XBox */
> =C2=A0	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12b6),
> -	.driver_data =3D STEELSERIES_ARCTIS_1 },
> +	=C2=A0 .driver_data =3D STEELSERIES_ARCTIS_1 },

Whitespace change.

> +
> +	{ /* SteelSeries Arctis 9 Wireless for XBox */
> +	=C2=A0 HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12c2),
> +	=C2=A0 .driver_data =3D STEELSERIES_ARCTIS_9 },
> =C2=A0
> =C2=A0	{ }
> =C2=A0};
> @@ -683,3 +757,4 @@ MODULE_DESCRIPTION("HID driver for Steelseries device=
s");
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
> =C2=A0MODULE_AUTHOR("Simon Wood <simon@mungewell.org>");
> +MODULE_AUTHOR("Christian Mayer <git@mayer-bgk.de>");


