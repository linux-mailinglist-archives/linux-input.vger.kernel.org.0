Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2A12EE80C
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 22:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbhAGV6o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 16:58:44 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:35993 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbhAGV6o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 16:58:44 -0500
Date:   Thu, 07 Jan 2021 21:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610056681;
        bh=uw1Sdp3mLmP6n92b66SQNY/47x6iE6b9SeilpY+fZAQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=DrzCd+sxz/dk34VEuroDitln5DEjL0rJsfxjl1xr8kFDEaPgs/sbdRxOkoB8oEsYb
         9u9bDpqv/CcXImdEKhIttxI/yl6QHRPMOxyJmVX54ga4UQe0Skfh5Z4wJDUkbvSsjl
         ObHS8B/yp5LjUfF652WKz7cI7bwDixB3r8GbY0I0=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 10/13] HID: playstation: add microphone mute support for DualSense.
Message-ID: <4yIVE2AxrwY_p2Y48xsx2F9ZDdgoZtQoNbjNKpPdM5U-OYomokG4hpc3KlFC6LYG6jFdHwwxASx8M4gn2sjlr8hNdc2kXi0FppcTYVAsFkY=@protonmail.com>
In-Reply-To: <20210102223109.996781-11-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-11-roderick@gaikai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi


2021. janu=C3=A1r 2., szombat 23:31 keltez=C3=A9ssel, Roderick Colenbrander=
 =C3=ADrta:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> The DualSense controller has a built-in microphone exposed as an
> audio device over USB (or HID using Bluetooth). A dedicated
> button on the controller handles mute, but software has to configure
> the device to mute the audio stream.
>
> This patch captures the mute button and schedules an output report
> to mute/unmute the audio stream as well as toggle the mute LED.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index c80c81916f4a..9b1803f8f935 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -857,6 +857,7 @@  config HID_PLAYSTATION
>  =09tristate "PlayStation HID Driver"
>  =09default !EXPERT
>  =09depends on HID

I think maybe "select NEW_LEDS" should be here as well?


> +=09select LEDS_CLASS
>  =09select LEDS_CLASS_MULTICOLOR
>  =09select POWER_SUPPLY
>  =09help
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 3b26445acbb9..ebf8a6550308 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> [...]
> +static int ps_led_register(struct ps_device *ps_dev, struct led_classdev=
 *led,
> +=09=09struct ps_led_info *led_info)
> +{
> +=09int ret;
> +
> +=09led->name =3D devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
> +=09=09=09"playstation::%pMR::%s", ps_dev->mac_address, led_info->name);
> +
> +=09if (!led->name)
> +=09=09return -ENOMEM;
> +
> +=09led->brightness =3D 0;
> +=09led->max_brightness =3D 1;
> +=09led->flags =3D LED_CORE_SUSPENDRESUME;
> +=09led->brightness_get =3D led_info->brightness_get;
> +=09led->brightness_set =3D led_info->brightness_set;
> +
> +=09ret =3D devm_led_classdev_register(&ps_dev->hdev->dev, led);
> +=09if (ret) {
> +=09=09hid_err(ps_dev->hdev, "Failed to register LED %s: %d\n", led_info-=
>name, ret);

Another inconsistency with log messages is that sometimes the error code is=
 printed,
sometimes it is not. I believe it would be preferable if there was no incos=
istency.


> +=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> [...]
> +static enum led_brightness dualsense_mute_led_get_brightness(struct led_=
classdev *led)
> +{
> +=09struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> +=09struct dualsense *ds =3D hid_get_drvdata(hdev);

I think these two lines could be replaced with:

```
struct dualsense *ds =3D container_of(led, struct dualsense, mute_led);
```


> +
> +=09return ds->mic_muted;
> +}
> [...]
>  static void dualsense_init_output_report(struct dualsense *ds, struct du=
alsense_output_report *rp,
>  =09=09void *buf)
>  {
> @@ -763,6 +820,26 @@  static void dualsense_output_worker(struct work_str=
uct *work)
>  =09=09ds->update_lightbar =3D false;
>  =09}
>
> +=09if (ds->update_mic_mute) {
> +=09=09if (ds->mic_muted) {
> +=09=09=09common->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CON=
TROL_ENABLE;
> +=09=09=09common->mute_button_led =3D 1; /* Enable mute LED. */
> +
> +=09=09=09/* Disable microphone */
> +=09=09=09common->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTR=
OL_ENABLE;
> +=09=09=09common->power_save_control |=3D DS_OUTPUT_POWER_SAVE_CONTROL_MI=
C_MUTE;
> +=09=09} else {
> +=09=09=09common->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CON=
TROL_ENABLE;
> +=09=09=09common->mute_button_led =3D 0; /* Disable mute LED. */
> +
> +=09=09=09/* Enable microphone */
> +=09=09=09common->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTR=
OL_ENABLE;
> +=09=09=09common->power_save_control &=3D ~DS_OUTPUT_POWER_SAVE_CONTROL_M=
IC_MUTE;
> +=09=09}
> +

I'd put the first two lines (or at least the first line) outside the condit=
ional.


> +=09=09ds->update_mic_mute =3D false;
> +=09}
> +
>  =09spin_unlock_irqrestore(&ds->base.lock, flags);
>
>  =09dualsense_send_output_report(ds, &report);
> @@ -777,6 +854,7 @@  static int dualsense_parse_report(struct ps_device *=
ps_dev, struct hid_report *r
>  =09uint8_t battery_data, battery_capacity, charging_status, value;
>  =09int battery_status;
>  =09uint16_t sensor_timestamp;
> +=09bool btn_mic_state;
>  =09unsigned long flags;
>  =09int i;
>
> @@ -829,6 +907,22 @@  static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
>  =09input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_=
BUTTONS2_PS_HOME);
>  =09input_sync(ds->gamepad);
>
> +=09/* The DualSense has an internal microphone, which can be muted throu=
gh a mute button
> +=09 * on the device. The driver expected to read the button state and pr=
ogram the device
> [...]

"The driver is expected" ?


Regards,
Barnab=C3=A1s P=C5=91cze
