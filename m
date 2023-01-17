Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F01E670E0E
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 00:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjAQXue (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Jan 2023 18:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjAQXuM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Jan 2023 18:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6BF4392B
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 14:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673996333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e+eRHNszZSmFL4SWJNoBhkfbjEtmgcyxtNguRuUMUwk=;
        b=CN5Nu3oQYROnVPDl0aGPB2oUAoFBMUrmAT4Vt/pzm4hrE1x6HGHZ0pI5xZtuImr2nEn4XB
        HUYREjTjF6+lXIVpQKkv+OUHBWkt/qcM3WaZ0KW9TGg/sxuDfJNPiHt5hp+bcqsnBZSU6q
        mqv3MZE7LPWr1nz2vdOHTQpqj+43R2w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-6gR3P5aNPVSe8ayHIb7N4Q-1; Tue, 17 Jan 2023 17:58:51 -0500
X-MC-Unique: 6gR3P5aNPVSe8ayHIb7N4Q-1
Received: by mail-qv1-f69.google.com with SMTP id mi16-20020a056214559000b005346c5c1f81so7215831qvb.15
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 14:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+eRHNszZSmFL4SWJNoBhkfbjEtmgcyxtNguRuUMUwk=;
        b=wy3i/qQz+eQpiqgT5NbsrJvEcJyA1lzXQuc+qYSlsSSHnuzwmpfFUOCNCAHIswYCx4
         43zjJzKrjikxPiw/ckyRcJp1kpLobdrlKRWi7gUi3/44Dx8qCawXv0QpPqxFE+XBELXJ
         rHz5JOo2PZTrP9MKhfxYJY8WK1XoklEpxTPtr+cc1sg6szUN7NN79QlgALAdmcZUVUdC
         6MLo3UcLo/4TmWIXzBOZjU+ygFyX+tWi4g6hbwBfuz8BJSa588fCps3ARVnE5y3Ubh/0
         dSl1P4j4aN3AAzBnSXTnRWLntcuu+J0J1pHTGEX8SDB19QlPrL9nnFNr3MUJYXliLDQ8
         tXLw==
X-Gm-Message-State: AFqh2kr0fYFqdloxSsv+SXK3whEmUTOCaKzYcGibndbN8cQMf0E35rVL
        rUlbG0hbeyusHIZwp7bsLGfDh5por8hlopBi+Tq91ZZDNdFx69yCrHRxbpXmtciGy0Ck36hNiJF
        9eG637XduGYhFCnWNAorTPtU=
X-Received: by 2002:ac8:5548:0:b0:3b6:3c01:a8e with SMTP id o8-20020ac85548000000b003b63c010a8emr5682980qtr.26.1673996331143;
        Tue, 17 Jan 2023 14:58:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXttyyBzfobk/X1S8QVbpg87khdrwlz+Kn3Z+ER92o5QeqjKyvS2hxEiNH4x6jeTg6FXrzirew==
X-Received: by 2002:ac8:5548:0:b0:3b6:3c01:a8e with SMTP id o8-20020ac85548000000b003b63c010a8emr5682957qtr.26.1673996330802;
        Tue, 17 Jan 2023 14:58:50 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
        by smtp.gmail.com with ESMTPSA id s18-20020a05620a255200b006eeb3165565sm21186386qko.80.2023.01.17.14.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:50 -0800 (PST)
Message-ID: <aa57c7dc5f0af49293f031acfff787e5e6c169d1.camel@redhat.com>
Subject: Re: [PATCH 1/2] HID: hid-steam: Add Steam Deck support
From:   Lyude Paul <lyude@redhat.com>
To:     Vicki Pfau <vi@endrift.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Date:   Tue, 17 Jan 2023 17:58:49 -0500
In-Reply-To: <20230111012336.2915827-1-vi@endrift.com>
References: <20230111012336.2915827-1-vi@endrift.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_PDS_OTHER_BAD_TLD
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Honestly this looks mostly fine! There's at least one thing we probably wan=
t
to fix: now that this driver supports both the steam controller and steam
deck, we should rename the config option from:

"Steam controller support" to
"Steam controller/Deck support"

Or something along those lines, along with updating the config description.=
 I
mainly just mention this since otherwise, you actually can't tell that this
enables the steam deck from menuconfig unless you set the option to M or Y
first. A couple of bikesheds below:

On Tue, 2023-01-10 at 17:23 -0800, Vicki Pfau wrote:
> Add preliminary support for the Steam Deck's controller interface. Curren=
tly,
> this only supports the controller inputs and toggling lizard mode. It doe=
s not
> support any of the advanced features, such as the motion sensors or
> force-feedback.
>=20
> The Steam Deck also includes a heartbeat for lizard mode that switches it=
 back
> on if no reports have been received within a few milliseconds. The offici=
al
> Steam client handles this by sending a handful of configuration reports e=
very
> few ms, so we copy this behavior by sending configuration reports to disa=
ble
> the mouse and reset the digital mappings every 5ms. As this isn't needed =
for
> the older Steam Controller, this is only done on the Steam Deck.
>=20
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/hid/hid-ids.h   |   1 +
>  drivers/hid/hid-steam.c | 335 ++++++++++++++++++++++++++++++++++++----
>  2 files changed, 306 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 82713ef3aaa6..33269113acc7 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1183,6 +1183,7 @@
>  #define USB_VENDOR_ID_VALVE			0x28de
>  #define USB_DEVICE_ID_STEAM_CONTROLLER		0x1102
>  #define USB_DEVICE_ID_STEAM_CONTROLLER_WIRELESS	0x1142
> +#define USB_DEVICE_ID_STEAM_DECK	0x1205
> =20
>  #define USB_VENDOR_ID_STEELSERIES	0x1038
>  #define USB_DEVICE_ID_STEELSERIES_SRWS1	0x1410
> diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
> index 8ee43cb225fc..efd192d6c51a 100644
> --- a/drivers/hid/hid-steam.c
> +++ b/drivers/hid/hid-steam.c
> @@ -3,6 +3,7 @@
>   * HID driver for Valve Steam Controller
>   *
>   * Copyright (c) 2018 Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
> + * Copyright (c) 2022 Valve Software
>   *
>   * Supports both the wired and wireless interfaces.
>   *
> @@ -53,6 +54,7 @@ static DEFINE_MUTEX(steam_devices_lock);
>  static LIST_HEAD(steam_devices);
> =20
>  #define STEAM_QUIRK_WIRELESS		BIT(0)
> +#define STEAM_QUIRK_DECK		BIT(1)
> =20
>  /* Touch pads are 40 mm in diameter and 65535 units */
>  #define STEAM_PAD_RESOLUTION 1638
> @@ -60,6 +62,10 @@ static LIST_HEAD(steam_devices);
>  #define STEAM_TRIGGER_RESOLUTION 51
>  /* Joystick runs are about 5 mm and 256 units */
>  #define STEAM_JOYSTICK_RESOLUTION 51
> +/* Trigger runs are about 6 mm and 32768 units */
> +#define STEAM_DECK_TRIGGER_RESOLUTION 5461
> +/* Joystick runs are about 5 mm and 32768 units */
> +#define STEAM_DECK_JOYSTICK_RESOLUTION 6553
> =20
>  #define STEAM_PAD_FUZZ 256
> =20
> @@ -92,11 +98,14 @@ static LIST_HEAD(steam_devices);
>  #define STEAM_REG_RPAD_MARGIN		0x18
>  #define STEAM_REG_LED			0x2d
>  #define STEAM_REG_GYRO_MODE		0x30
> +#define STEAM_REG_LPAD_CLICK_PRESSURE	0x34
> +#define STEAM_REG_RPAD_CLICK_PRESSURE	0x35
> =20
>  /* Raw event identifiers */
>  #define STEAM_EV_INPUT_DATA		0x01
>  #define STEAM_EV_CONNECT		0x03
>  #define STEAM_EV_BATTERY		0x04
> +#define STEAM_EV_DECK_INPUT_DATA	0x09
> =20
>  /* Values for GYRO_MODE (bitmask) */
>  #define STEAM_GYRO_MODE_OFF		0x0000
> @@ -124,6 +133,7 @@ struct steam_device {
>  	struct power_supply __rcu *battery;
>  	u8 battery_charge;
>  	u16 voltage;
> +	struct delayed_work heartbeat;
>  };
> =20
>  static int steam_recv_report(struct steam_device *steam,
> @@ -193,7 +203,7 @@ static int steam_send_report(struct steam_device *ste=
am,
>  	 */
>  	do {
>  		ret =3D hid_hw_raw_request(steam->hdev, 0,
> -				buf, size + 1,
> +				buf, max(size, 64) + 1,
>  				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
>  		if (ret !=3D -EPIPE)
>  			break;
> @@ -219,6 +229,7 @@ static int steam_write_registers(struct steam_device =
*steam,
>  	u8 reg;
>  	u16 val;
>  	u8 cmd[64] =3D {STEAM_CMD_WRITE_REGISTER, 0x00};
> +	int ret;
>  	va_list args;
> =20
>  	va_start(args, steam);
> @@ -234,7 +245,16 @@ static int steam_write_registers(struct steam_device=
 *steam,
>  	}
>  	va_end(args);
> =20
> -	return steam_send_report(steam, cmd, 2 + cmd[1]);
> +	ret =3D steam_send_report(steam, cmd, 2 + cmd[1]);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Sometimes a lingering report for this command can
> +	 * get read back instead of the last set report if
> +	 * this isn't explicitly queried
> +	 */
> +	return steam_recv_report(steam, cmd, 2 + cmd[1]);
>  }
> =20
>  static int steam_get_serial(struct steam_device *steam)
> @@ -280,13 +300,32 @@ static void steam_set_lizard_mode(struct steam_devi=
ce *steam, bool enable)
>  		steam_write_registers(steam,
>  			STEAM_REG_RPAD_MARGIN, 0x01, /* enable margin */
>  			0);
> +
> +		cancel_delayed_work_sync(&steam->heartbeat);
>  	} else {
>  		/* disable esc, enter, cursor */
>  		steam_send_report_byte(steam, STEAM_CMD_CLEAR_MAPPINGS);
> -		steam_write_registers(steam,
> -			STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
> -			STEAM_REG_RPAD_MARGIN, 0x00, /* disable margin */
> -			0);
> +
> +		if (steam->quirks & STEAM_QUIRK_DECK) {
> +			steam_write_registers(steam,
> +				STEAM_REG_RPAD_MARGIN, 0x00, /* disable margin */
> +				STEAM_REG_LPAD_MODE, 0x07, /* disable mouse */
> +				STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
> +				STEAM_REG_LPAD_CLICK_PRESSURE, 0xFFFF, /* disable clicky pad */
> +				STEAM_REG_RPAD_CLICK_PRESSURE, 0xFFFF, /* disable clicky pad */
> +				0);
> +			/*
> +			 * The Steam Deck has a watchdog that automatically enables
> +			 * lizard mode if it doesn't see any traffic for too long
> +			 */
> +			schedule_delayed_work(&steam->heartbeat, 5 * HZ);
> +		} else {
> +			steam_write_registers(steam,
> +				STEAM_REG_RPAD_MARGIN, 0x00, /* disable margin */
> +				STEAM_REG_LPAD_MODE, 0x07, /* disable mouse */
> +				STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
> +				0);
> +		}
>  	}
>  }
> =20
> @@ -413,8 +452,8 @@ static int steam_input_register(struct steam_device *=
steam)
>  	input->open =3D steam_input_open;
>  	input->close =3D steam_input_close;
> =20
> -	input->name =3D (steam->quirks & STEAM_QUIRK_WIRELESS) ?
> -		"Wireless Steam Controller" :
> +	input->name =3D (steam->quirks & STEAM_QUIRK_WIRELESS) ? "Wireless Stea=
m Controller" :
> +		(steam->quirks & STEAM_QUIRK_DECK) ? "Steam Deck" :
>  		"Steam Controller";
>  	input->phys =3D hdev->phys;
>  	input->uniq =3D steam->serial_no;
> @@ -438,33 +477,69 @@ static int steam_input_register(struct steam_device=
 *steam)
>  	input_set_capability(input, EV_KEY, BTN_SELECT);
>  	input_set_capability(input, EV_KEY, BTN_MODE);
>  	input_set_capability(input, EV_KEY, BTN_START);
> -	input_set_capability(input, EV_KEY, BTN_GEAR_DOWN);
> -	input_set_capability(input, EV_KEY, BTN_GEAR_UP);
>  	input_set_capability(input, EV_KEY, BTN_THUMBR);
>  	input_set_capability(input, EV_KEY, BTN_THUMBL);
>  	input_set_capability(input, EV_KEY, BTN_THUMB);
>  	input_set_capability(input, EV_KEY, BTN_THUMB2);
> +	if (steam->quirks & STEAM_QUIRK_DECK) {
> +		input_set_capability(input, EV_KEY, BTN_BASE);
> +		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY1);
> +		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY2);
> +		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY3);
> +		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY4);
> +	} else {
> +		input_set_capability(input, EV_KEY, BTN_GEAR_DOWN);
> +		input_set_capability(input, EV_KEY, BTN_GEAR_UP);
> +	}
> =20
> -	input_set_abs_params(input, ABS_HAT2Y, 0, 255, 0, 0);
> -	input_set_abs_params(input, ABS_HAT2X, 0, 255, 0, 0);
>  	input_set_abs_params(input, ABS_X, -32767, 32767, 0, 0);
>  	input_set_abs_params(input, ABS_Y, -32767, 32767, 0, 0);
> -	input_set_abs_params(input, ABS_RX, -32767, 32767,
> -			STEAM_PAD_FUZZ, 0);
> -	input_set_abs_params(input, ABS_RY, -32767, 32767,
> -			STEAM_PAD_FUZZ, 0);
> -	input_set_abs_params(input, ABS_HAT0X, -32767, 32767,
> -			STEAM_PAD_FUZZ, 0);
> -	input_set_abs_params(input, ABS_HAT0Y, -32767, 32767,
> -			STEAM_PAD_FUZZ, 0);
> -	input_abs_set_res(input, ABS_X, STEAM_JOYSTICK_RESOLUTION);
> -	input_abs_set_res(input, ABS_Y, STEAM_JOYSTICK_RESOLUTION);
> -	input_abs_set_res(input, ABS_RX, STEAM_PAD_RESOLUTION);
> -	input_abs_set_res(input, ABS_RY, STEAM_PAD_RESOLUTION);
> +	if (steam->quirks & STEAM_QUIRK_DECK) {
> +		input_set_abs_params(input, ABS_HAT2Y, 0, 32767, 0, 0);
> +		input_set_abs_params(input, ABS_HAT2X, 0, 32767, 0, 0);
> +
> +		input_set_abs_params(input, ABS_RX, -32767, 32767, 0, 0);
> +		input_set_abs_params(input, ABS_RY, -32767, 32767, 0, 0);
> +
> +		input_set_abs_params(input, ABS_HAT0X, -32767, 32767,
> +				STEAM_PAD_FUZZ, 0);
> +		input_set_abs_params(input, ABS_HAT0Y, -32767, 32767,
> +				STEAM_PAD_FUZZ, 0);
> +		input_set_abs_params(input, ABS_HAT1X, -32767, 32767,
> +				STEAM_PAD_FUZZ, 0);
> +		input_set_abs_params(input, ABS_HAT1Y, -32767, 32767,
> +				STEAM_PAD_FUZZ, 0);
> +
> +		input_abs_set_res(input, ABS_X, STEAM_DECK_JOYSTICK_RESOLUTION);
> +		input_abs_set_res(input, ABS_Y, STEAM_DECK_JOYSTICK_RESOLUTION);
> +		input_abs_set_res(input, ABS_RX, STEAM_DECK_JOYSTICK_RESOLUTION);
> +		input_abs_set_res(input, ABS_RY, STEAM_DECK_JOYSTICK_RESOLUTION);
> +		input_abs_set_res(input, ABS_HAT1X, STEAM_PAD_RESOLUTION);
> +		input_abs_set_res(input, ABS_HAT1Y, STEAM_PAD_RESOLUTION);
> +		input_abs_set_res(input, ABS_HAT2Y, STEAM_DECK_TRIGGER_RESOLUTION);
> +		input_abs_set_res(input, ABS_HAT2X, STEAM_DECK_TRIGGER_RESOLUTION);
> +	} else {
> +		input_set_abs_params(input, ABS_HAT2Y, 0, 255, 0, 0);
> +		input_set_abs_params(input, ABS_HAT2X, 0, 255, 0, 0);
> +
> +		input_set_abs_params(input, ABS_RX, -32767, 32767,
> +				STEAM_PAD_FUZZ, 0);
> +		input_set_abs_params(input, ABS_RY, -32767, 32767,
> +				STEAM_PAD_FUZZ, 0);
> +		input_set_abs_params(input, ABS_HAT0X, -32767, 32767,
> +				STEAM_PAD_FUZZ, 0);
> +		input_set_abs_params(input, ABS_HAT0Y, -32767, 32767,
> +				STEAM_PAD_FUZZ, 0);

Any reason we don't keep the abs_params for ABS_HAT0X/ABS_HAT0Y above the i=
f?
seems like they're identical between the controller and steam deck. Feel fr=
ee
to leave it be if you think it's clearer to read like this though.

> +
> +		input_abs_set_res(input, ABS_X, STEAM_JOYSTICK_RESOLUTION);
> +		input_abs_set_res(input, ABS_Y, STEAM_JOYSTICK_RESOLUTION);
> +		input_abs_set_res(input, ABS_RX, STEAM_PAD_RESOLUTION);
> +		input_abs_set_res(input, ABS_RY, STEAM_PAD_RESOLUTION);
> +		input_abs_set_res(input, ABS_HAT2Y, STEAM_TRIGGER_RESOLUTION);
> +		input_abs_set_res(input, ABS_HAT2X, STEAM_TRIGGER_RESOLUTION);
> +	}
>  	input_abs_set_res(input, ABS_HAT0X, STEAM_PAD_RESOLUTION);
>  	input_abs_set_res(input, ABS_HAT0Y, STEAM_PAD_RESOLUTION);
> -	input_abs_set_res(input, ABS_HAT2Y, STEAM_TRIGGER_RESOLUTION);
> -	input_abs_set_res(input, ABS_HAT2X, STEAM_TRIGGER_RESOLUTION);
> =20
>  	ret =3D input_register_device(input);
>  	if (ret)
> @@ -612,6 +687,22 @@ static bool steam_is_valve_interface(struct hid_devi=
ce *hdev)
>  	return !list_empty(&rep_enum->report_list);
>  }
> =20
> +static void steam_lizard_mode_heartbeat(struct work_struct *work)
> +{
> +	struct steam_device *steam =3D container_of(work, struct steam_device,
> +							heartbeat.work);

I'd probably align the start of heartbeat.work to start at the column
immediately after container_of() so it looks like this:

container_of(work, struct steam_device,
             heartbeat.work)

That's basically it for this patch though, everything else looks fine to me
:). With the indenting issue fixed and kernel config description clarified
this is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

> +
> +	mutex_lock(&steam->mutex);
> +	if (!steam->client_opened) {
> +		steam_send_report_byte(steam, STEAM_CMD_CLEAR_MAPPINGS);
> +		steam_write_registers(steam,
> +			STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
> +			0);
> +		schedule_delayed_work(&steam->heartbeat, 5 * HZ);
> +	}
> +	mutex_unlock(&steam->mutex);
> +}
> +
>  static int steam_client_ll_parse(struct hid_device *hdev)
>  {
>  	struct steam_device *steam =3D hdev->driver_data;
> @@ -750,6 +841,7 @@ static int steam_probe(struct hid_device *hdev,
>  	steam->quirks =3D id->driver_data;
>  	INIT_WORK(&steam->work_connect, steam_work_connect_cb);
>  	INIT_LIST_HEAD(&steam->list);
> +	INIT_DEFERRABLE_WORK(&steam->heartbeat, steam_lizard_mode_heartbeat);
> =20
>  	steam->client_hdev =3D steam_create_client_hid(hdev);
>  	if (IS_ERR(steam->client_hdev)) {
> @@ -805,6 +897,7 @@ static int steam_probe(struct hid_device *hdev,
>  	hid_destroy_device(steam->client_hdev);
>  client_hdev_fail:
>  	cancel_work_sync(&steam->work_connect);
> +	cancel_delayed_work_sync(&steam->heartbeat);
>  steam_alloc_fail:
>  	hid_err(hdev, "%s: failed with error %d\n",
>  			__func__, ret);
> @@ -823,6 +916,7 @@ static void steam_remove(struct hid_device *hdev)
>  	hid_destroy_device(steam->client_hdev);
>  	steam->client_opened =3D false;
>  	cancel_work_sync(&steam->work_connect);
> +	cancel_delayed_work_sync(&steam->heartbeat);
>  	if (steam->quirks & STEAM_QUIRK_WIRELESS) {
>  		hid_info(hdev, "Steam wireless receiver disconnected");
>  	}
> @@ -906,10 +1000,10 @@ static inline s16 steam_le16(u8 *data)
>   *  8.5  | BTN_B      | button B
>   *  8.6  | BTN_X      | button X
>   *  8.7  | BTN_A      | button A
> - *  9.0  | BTN_DPAD_UP    | lef-pad up
> - *  9.1  | BTN_DPAD_RIGHT | lef-pad right
> - *  9.2  | BTN_DPAD_LEFT  | lef-pad left
> - *  9.3  | BTN_DPAD_DOWN  | lef-pad down
> + *  9.0  | BTN_DPAD_UP    | left-pad up
> + *  9.1  | BTN_DPAD_RIGHT | left-pad right
> + *  9.2  | BTN_DPAD_LEFT  | left-pad left
> + *  9.3  | BTN_DPAD_DOWN  | left-pad down
>   *  9.4  | BTN_SELECT | menu left
>   *  9.5  | BTN_MODE   | steam logo
>   *  9.6  | BTN_START  | menu right
> @@ -993,6 +1087,172 @@ static void steam_do_input_event(struct steam_devi=
ce *steam,
>  	input_sync(input);
>  }
> =20
> +/*
> + * The size for this message payload is 56.
> + * The known values are:
> + *  Offset| Type  | Mapped to |Meaning
> + * -------+-------+-----------+--------------------------
> + *  4-7   | u32   | --        | sequence number
> + *  8-15  | u64   | see below | buttons
> + *  16-17 | s16   | ABS_HAT0X | left-pad X value
> + *  18-19 | s16   | ABS_HAT0Y | left-pad Y value
> + *  20-21 | s16   | ABS_HAT1X | right-pad X value
> + *  22-23 | s16   | ABS_HAT1Y | right-pad Y value
> + *  24-25 | s16   | --        | accelerometer X value
> + *  26-27 | s16   | --        | accelerometer Y value
> + *  28-29 | s16   | --        | accelerometer Z value
> + *  30-31 | s16   | --        | gyro X value
> + *  32-33 | s16   | --        | gyro Y value
> + *  34-35 | s16   | --        | gyro Z value
> + *  36-37 | s16   | --        | quaternion W value
> + *  38-39 | s16   | --        | quaternion X value
> + *  40-41 | s16   | --        | quaternion Y value
> + *  42-43 | s16   | --        | quaternion Z value
> + *  44-45 | u16   | ABS_HAT2Y | left trigger (uncalibrated)
> + *  46-47 | u16   | ABS_HAT2X | right trigger (uncalibrated)
> + *  48-49 | s16   | ABS_X     | left joystick X
> + *  50-51 | s16   | ABS_Y     | left joystick Y
> + *  52-53 | s16   | ABS_RX    | right joystick X
> + *  54-55 | s16   | ABS_RY    | right joystick Y
> + *  56-57 | u16   | --        | left pad pressure
> + *  58-59 | u16   | --        | right pad pressure
> + *
> + * The buttons are:
> + *  Bit  | Mapped to  | Description
> + * ------+------------+--------------------------------
> + *  8.0  | BTN_TR2    | right trigger fully pressed
> + *  8.1  | BTN_TL2    | left trigger fully pressed
> + *  8.2  | BTN_TR     | right shoulder
> + *  8.3  | BTN_TL     | left shoulder
> + *  8.4  | BTN_Y      | button Y
> + *  8.5  | BTN_B      | button B
> + *  8.6  | BTN_X      | button X
> + *  8.7  | BTN_A      | button A
> + *  9.0  | BTN_DPAD_UP    | left-pad up
> + *  9.1  | BTN_DPAD_RIGHT | left-pad right
> + *  9.2  | BTN_DPAD_LEFT  | left-pad left
> + *  9.3  | BTN_DPAD_DOWN  | left-pad down
> + *  9.4  | BTN_SELECT | menu left
> + *  9.5  | BTN_MODE   | steam logo
> + *  9.6  | BTN_START  | menu right
> + *  9.7  | BTN_TRIGGER_HAPPY3 | left bottom grip button
> + *  10.0 | BTN_TRIGGER_HAPPY4 | right bottom grip button
> + *  10.1 | BTN_THUMB  | left pad pressed
> + *  10.2 | BTN_THUMB2 | right pad pressed
> + *  10.3 | --         | left pad touched
> + *  10.4 | --         | right pad touched
> + *  10.5 | --         | unknown
> + *  10.6 | BTN_THUMBL | left joystick clicked
> + *  10.7 | --         | unknown
> + *  11.0 | --         | unknown
> + *  11.1 | --         | unknown
> + *  11.2 | BTN_THUMBR | right joystick clicked
> + *  11.3 | --         | unknown
> + *  11.4 | --         | unknown
> + *  11.5 | --         | unknown
> + *  11.6 | --         | unknown
> + *  11.7 | --         | unknown
> + *  12.0 | --         | unknown
> + *  12.1 | --         | unknown
> + *  12.2 | --         | unknown
> + *  12.3 | --         | unknown
> + *  12.4 | --         | unknown
> + *  12.5 | --         | unknown
> + *  12.6 | --         | unknown
> + *  12.7 | --         | unknown
> + *  13.0 | --         | unknown
> + *  13.1 | BTN_TRIGGER_HAPPY1 | left top grip button
> + *  13.2 | BTN_TRIGGER_HAPPY2 | right top grip button
> + *  13.3 | --         | unknown
> + *  13.4 | --         | unknown
> + *  13.5 | --         | unknown
> + *  13.6 | --         | left joystick touched
> + *  13.7 | --         | right joystick touched
> + *  14.0 | --         | unknown
> + *  14.1 | --         | unknown
> + *  14.2 | BTN_BASE   | quick access button
> + *  14.3 | --         | unknown
> + *  14.4 | --         | unknown
> + *  14.5 | --         | unknown
> + *  14.6 | --         | unknown
> + *  14.7 | --         | unknown
> + *  15.0 | --         | unknown
> + *  15.1 | --         | unknown
> + *  15.2 | --         | unknown
> + *  15.3 | --         | unknown
> + *  15.4 | --         | unknown
> + *  15.5 | --         | unknown
> + *  15.6 | --         | unknown
> + *  15.7 | --         | unknown
> + */
> +static void steam_do_deck_input_event(struct steam_device *steam,
> +		struct input_dev *input, u8 *data)
> +{
> +	u8 b8, b9, b10, b11, b13, b14;
> +	bool lpad_touched, rpad_touched;
> +
> +	b8 =3D data[8];
> +	b9 =3D data[9];
> +	b10 =3D data[10];
> +	b11 =3D data[11];
> +	b13 =3D data[13];
> +	b14 =3D data[14];
> +
> +	lpad_touched =3D b10 & BIT(3);
> +	rpad_touched =3D b10 & BIT(4);
> +
> +	if (lpad_touched) {
> +		input_report_abs(input, ABS_HAT0X, steam_le16(data + 16));
> +		input_report_abs(input, ABS_HAT0Y, steam_le16(data + 18));
> +	} else {
> +		input_report_abs(input, ABS_HAT0X, 0);
> +		input_report_abs(input, ABS_HAT0Y, 0);
> +	}
> +
> +	if (rpad_touched) {
> +		input_report_abs(input, ABS_HAT1X, steam_le16(data + 20));
> +		input_report_abs(input, ABS_HAT1Y, steam_le16(data + 22));
> +	} else {
> +		input_report_abs(input, ABS_HAT1X, 0);
> +		input_report_abs(input, ABS_HAT1Y, 0);
> +	}
> +
> +	input_report_abs(input, ABS_X, steam_le16(data + 48));
> +	input_report_abs(input, ABS_Y, -steam_le16(data + 50));
> +	input_report_abs(input, ABS_RX, steam_le16(data + 52));
> +	input_report_abs(input, ABS_RY, -steam_le16(data + 54));
> +
> +	input_report_abs(input, ABS_HAT2Y, steam_le16(data + 44));
> +	input_report_abs(input, ABS_HAT2X, steam_le16(data + 46));
> +
> +	input_event(input, EV_KEY, BTN_TR2, !!(b8 & BIT(0)));
> +	input_event(input, EV_KEY, BTN_TL2, !!(b8 & BIT(1)));
> +	input_event(input, EV_KEY, BTN_TR, !!(b8 & BIT(2)));
> +	input_event(input, EV_KEY, BTN_TL, !!(b8 & BIT(3)));
> +	input_event(input, EV_KEY, BTN_Y, !!(b8 & BIT(4)));
> +	input_event(input, EV_KEY, BTN_B, !!(b8 & BIT(5)));
> +	input_event(input, EV_KEY, BTN_X, !!(b8 & BIT(6)));
> +	input_event(input, EV_KEY, BTN_A, !!(b8 & BIT(7)));
> +	input_event(input, EV_KEY, BTN_SELECT, !!(b9 & BIT(4)));
> +	input_event(input, EV_KEY, BTN_MODE, !!(b9 & BIT(5)));
> +	input_event(input, EV_KEY, BTN_START, !!(b9 & BIT(6)));
> +	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY3, !!(b9 & BIT(7)));
> +	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY4, !!(b10 & BIT(0)));
> +	input_event(input, EV_KEY, BTN_THUMBL, !!(b10 & BIT(6)));
> +	input_event(input, EV_KEY, BTN_THUMBR, !!(b11 & BIT(2)));
> +	input_event(input, EV_KEY, BTN_DPAD_UP, !!(b9 & BIT(0)));
> +	input_event(input, EV_KEY, BTN_DPAD_RIGHT, !!(b9 & BIT(1)));
> +	input_event(input, EV_KEY, BTN_DPAD_LEFT, !!(b9 & BIT(2)));
> +	input_event(input, EV_KEY, BTN_DPAD_DOWN, !!(b9 & BIT(3)));
> +	input_event(input, EV_KEY, BTN_THUMB, !!(b10 & BIT(1)));
> +	input_event(input, EV_KEY, BTN_THUMB2, !!(b10 & BIT(2)));
> +	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY1, !!(b13 & BIT(1)));
> +	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY2, !!(b13 & BIT(2)));
> +	input_event(input, EV_KEY, BTN_BASE, !!(b14 & BIT(2)));
> +
> +	input_sync(input);
> +}
> +
>  /*
>   * The size for this message payload is 11.
>   * The known values are:
> @@ -1052,6 +1312,7 @@ static int steam_raw_event(struct hid_device *hdev,
>  	 *  0x01: input data (60 bytes)
>  	 *  0x03: wireless connect/disconnect (1 byte)
>  	 *  0x04: battery status (11 bytes)
> +	 *  0x09: Steam Deck input data (56 bytes)
>  	 */
> =20
>  	if (size !=3D 64 || data[0] !=3D 1 || data[1] !=3D 0)
> @@ -1067,6 +1328,15 @@ static int steam_raw_event(struct hid_device *hdev=
,
>  			steam_do_input_event(steam, input, data);
>  		rcu_read_unlock();
>  		break;
> +	case STEAM_EV_DECK_INPUT_DATA:
> +		if (steam->client_opened)
> +			return 0;
> +		rcu_read_lock();
> +		input =3D rcu_dereference(steam->input);
> +		if (likely(input))
> +			steam_do_deck_input_event(steam, input, data);
> +		rcu_read_unlock();
> +		break;
>  	case STEAM_EV_CONNECT:
>  		/*
>  		 * The payload of this event is a single byte:
> @@ -1141,6 +1411,11 @@ static const struct hid_device_id steam_controller=
s[] =3D {
>  		USB_DEVICE_ID_STEAM_CONTROLLER_WIRELESS),
>  	  .driver_data =3D STEAM_QUIRK_WIRELESS
>  	},
> +	{ /* Steam Deck */
> +	  HID_USB_DEVICE(USB_VENDOR_ID_VALVE,
> +		USB_DEVICE_ID_STEAM_DECK),
> +	  .driver_data =3D STEAM_QUIRK_DECK
> +	},
>  	{}
>  };
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

