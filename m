Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007992EE713
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 21:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbhAGUly (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 15:41:54 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:37943 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbhAGUlx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 15:41:53 -0500
Date:   Thu, 07 Jan 2021 20:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610052069;
        bh=c8oo/XZobFv1goiuzoiqw9qw9+mcu7zxWSuClwo2k3w=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=K/reagan13j7k9YXIy4slqFkrPm0sEI8d59t2BF4KMJ3Qgiz4/sM5D3ESXcwZCdu2
         vrnUVhnEdjEK5JG2QGNIZwV6HdP/uz+WaW5lmgBKcuhMtN5q4NstMFNpWqWBzO7zF6
         yWAad3pRBbpynCon6I7zv4W8oYNl2WboWcW+yniM=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 08/13] HID: playstation: add DualSense classic rumble support.
Message-ID: <kRzBWmooFAQ_eFPgUsxxgSR1NkdOsH3sH-ucu6OrxCuPoA7_mMP4enx4EhNNq-Rnl1jYzoPzk1P8UJY-r_W2w84B1rSJa1Nwd_aKL9SLjg8=@protonmail.com>
In-Reply-To: <20210102223109.996781-9-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-9-roderick@gaikai.com>
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
> The DualSense features a haptics system based on voicecoil motors,
> which requires PCM data (or special HID packets using Bluetooth). There
> is no appropriate API yet in the Linux kernel to expose these. The
> controller also provides a classic rumble feature for backwards
> compatibility. Expose this classic rumble feature using the FF framework.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index ef175c1cb15c..e6c67aaa1a1a 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -863,6 +863,14 @@  config HID_PLAYSTATION
>  =09  its special functionalities e.g. touchpad, lights and motion
>  =09  sensors.
>
> +config PLAYSTATION_FF

I'm wondering if HID_PLAYSTATION_FF would be a better name?


> +=09bool "PlayStation force feedback support"
> +=09depends on HID_PLAYSTATION
> +=09select INPUT_FF_MEMLESS
> +=09help
> +=09  Say Y here if you would like to enable force feedback support for
> +=09  PlayStation game controllers.
> +
>  config HID_PRIMAX
>  =09tristate "Primax non-fully HID-compliant devices"
>  =09depends on HID
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 552a52a50b78..36a904b2f93f 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> [...]
> @@ -136,6 +151,63 @@  struct dualsense_input_report {
>  =09uint8_t reserved4[11];
>  } __packed;
>
> +/* Common data between DualSense BT/USB main output report. */
> +struct dualsense_output_report_common {
> +=09uint8_t valid_flag0;
> +=09uint8_t valid_flag1;
> +
> +=09/* For DualShock 4 compatibility mode. */
> +=09uint8_t motor_right;
> +=09uint8_t motor_left;
> +
> +=09/* Audio controls */
> +=09uint8_t reserved[4];
> +=09uint8_t mute_button_led;
> +
> +=09uint8_t power_save_control;
> +=09uint8_t reserved2[28];
> +
> +=09/* LEDs and lightbar */
> +=09uint8_t valid_flag2;
> +=09uint8_t reserved3[2];
> +=09uint8_t lightbar_setup;
> +=09uint8_t led_brightness;
> +=09uint8_t player_leds;
> +=09uint8_t lightbar_red;
> +=09uint8_t lightbar_green;
> +=09uint8_t lightbar_blue;
> +} __packed;
> +
> +struct dualsense_output_report_bt {
> +=09uint8_t report_id; /* 0x31 */
> +=09uint8_t seq_tag;
> +=09uint8_t tag;
> +=09struct dualsense_output_report_common common;
> +=09uint8_t reserved[24];
> +=09__le32 crc32;
> +} __packed;
> +
> +struct dualsense_output_report_usb {
> +=09uint8_t report_id; /* 0x02 */
> +=09struct dualsense_output_report_common common;
> +} __packed;
> +

I think it'd be good if you could add static_asserts to check the sizes of
the __packed structs at compile time.


> +/* The DualSense has a main output report used to control most features.=
 It is
> + * largely the same between Bluetooth and USB except for different heade=
rs and CRC.
> + * This structure hide the differences between the two to simplify sendi=
ng output reports.
> + */
> +struct dualsense_output_report {
> +=09uint8_t *data; /* Start of data */
> +=09uint8_t len; /* Size of output report */
> +
> +=09/* Points to Bluetooth data payload in case for a Bluetooth report el=
se NULL. */
> +=09struct dualsense_output_report_bt *bt;
> +=09/* Points to USB data payload in case for a USB report else NULL. */
> +=09struct dualsense_output_report_usb *usb;
> +=09/* Points to common section of report, so past any headers */
> +=09struct dualsense_output_report_common *common;
> +};
> [...]
> +static void dualsense_init_output_report(struct dualsense *ds, struct du=
alsense_output_report *rp,
> +=09=09void *buf)

If the dualsense struct is already passed in, couldn't this function use
`ds->output_report_dmabuf` directly?


> +{
> +=09struct hid_device *hdev =3D ds->base.hdev;
> +
> +=09if (hdev->bus =3D=3D BUS_BLUETOOTH) {
> +=09=09struct dualsense_output_report_bt *bt =3D buf;
> +
> +=09=09memset(bt, 0, sizeof(*bt));
> +=09=09bt->report_id =3D DS_OUTPUT_REPORT_BT;
> +=09=09bt->tag =3D 0x10; /* Magic number must be set to 0x10 */

I think it would be preferable if that 0x10 were named.


> +
> +=09=09/* Highest 4-bit is a sequence number, which needs to be increased
> +=09=09 * every report. Lowest 4-bit is tag and can be zero for now.
> +=09=09 */
> +=09=09bt->seq_tag =3D (ds->output_seq << 4) | 0x0;
> +=09=09if (++ds->output_seq =3D=3D 15)
> +=09=09=09ds->output_seq =3D 0;

If I see it correctly, the maximum sequence number is 14; is that intention=
al?
Or am I missing something?


> +
> +=09=09rp->data =3D buf;
> +=09=09rp->len =3D sizeof(*bt);
> +=09=09rp->bt =3D bt;
> +=09=09rp->usb =3D NULL;
> +=09=09rp->common =3D &bt->common;
> +=09} else { /* USB */
> +=09=09struct dualsense_output_report_usb *usb =3D buf;
> +
> +=09=09memset(usb, 0, sizeof(*usb));
> +=09=09usb->report_id =3D DS_OUTPUT_REPORT_USB;
> +
> +=09=09rp->data =3D buf;
> +=09=09rp->len =3D sizeof(*usb);
> +=09=09rp->bt =3D NULL;
> +=09=09rp->usb =3D usb;
> +=09=09rp->common =3D &usb->common;
> +=09}
> +}
> +
> +/* Helper function to send DualSense output reports. Applies a CRC at th=
e end of a report
> + * for Bluetooth reports.
> + */
> +static void dualsense_send_output_report(struct dualsense *ds,
> +=09=09struct dualsense_output_report *report)
> +{
> +=09struct hid_device *hdev =3D ds->base.hdev;
> +
> +=09/* Bluetooth packets need to be signed with a CRC in the last 4 bytes=
. */
> +=09if (report->bt) {
> +=09=09uint32_t crc;
> +=09=09uint8_t seed =3D 0xA2;

Maybe this '0xA2' could be named as well? And I think it would be better if
all hexadecimal constants would either be lowercase or uppercase.


> +
> +=09=09crc =3D crc32_le(0xFFFFFFFF, &seed, 1);
> +=09=09crc =3D ~crc32_le(crc, report->data, report->len - 4);
> +
> +=09=09report->bt->crc32 =3D cpu_to_le32(crc);
> +=09}
> +
> +=09hid_hw_output_report(hdev, report->data, report->len);
> +}
> [...]
>  static struct ps_device *dualsense_create(struct hid_device *hdev)
>  {
>  =09struct dualsense *ds;
>  =09struct ps_device *ps_dev;
> +=09uint8_t max_output_report_size;
>  =09int ret;
>
>  =09ds =3D devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
> @@ -696,8 +882,14 @@  static struct ps_device *dualsense_create(struct hi=
d_device *hdev)
>  =09ps_dev->battery_capacity =3D 100; /* initial value until parse_report=
. */
>  =09ps_dev->battery_status =3D POWER_SUPPLY_STATUS_UNKNOWN;
>  =09ps_dev->parse_report =3D dualsense_parse_report;
> +=09INIT_WORK(&ds->output_worker, dualsense_output_worker);
>  =09hid_set_drvdata(hdev, ds);
>
> +=09max_output_report_size =3D sizeof(struct dualsense_output_report_bt);

I think `max(sizeof(..._bt), sizeof(..._usb))` (linux/minmax.h) would be
more expressive?


> +=09ds->output_report_dmabuf =3D devm_kzalloc(&hdev->dev, max_output_repo=
rt_size, GFP_KERNEL);
> +=09if (!ds->output_report_dmabuf)
> +=09=09return ERR_PTR(-ENOMEM);
> +
>  =09ret =3D dualsense_get_mac_address(ds);
>  =09if (ret < 0) {
>  =09=09hid_err(hdev, "Failed to get MAC address from DualSense\n");
> @@ -715,7 +907,7 @@  static struct ps_device *dualsense_create(struct hid=
_device *hdev)
>  =09=09goto err;
>  =09}
>
> -=09ds->gamepad =3D ps_gamepad_create(hdev);
> +=09ds->gamepad =3D ps_gamepad_create(hdev, dualsense_play_effect);
>  =09if (IS_ERR(ds->gamepad)) {
>  =09=09ret =3D PTR_ERR(ds->gamepad);
>  =09=09goto err;
>
>


Regards,
Barnab=C3=A1s P=C5=91cze
