Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C152EE75A
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 22:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbhAGVCQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 16:02:16 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:25346 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbhAGVCP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 16:02:15 -0500
Date:   Thu, 07 Jan 2021 21:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610053291;
        bh=GLrm7GTrx/uDlFp7P6MUjPhIy+aH0QVTG0Sgtodw+Ys=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Fb7lDVYKVII7L7lI/EGSUfWAMLEE3+Hv/rn3dhTpM2OS91sZkYuheWucu+BQ1gN/S
         XNJsHLXi3XzcsIyGgBHdyXS0cTD7Mall5GtW2zK4z4GRAU9fVldmmd7IQBvIHwL/az
         /xtizLeYWvg4zGCr9MGjquw+/VsRUgufnXjqYVXw=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 09/13] HID: playstation: add DualSense lightbar support
Message-ID: <ALCENkx-A9Ev61S-COD8OEepdiT-CJWxze7GbpoOgZfU7C3z0h4IL0MAPUt3QizapD_4WVhpH6oFVbpQfl_Vf9ekkCvjOn_v68haPJDTTQM=@protonmail.com>
In-Reply-To: <20210102223109.996781-10-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-10-roderick@gaikai.com>
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

2021. janu=C3=A1r 2., szombat 23:31 keltez=C3=A9ssel, Roderick Colenbrander=
 =C3=ADrta:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Expose the DualSense its RGB lightbar using the new multicolor LED
> framework.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> [...]
> +/* Register a DualSense/DualShock4 RGB lightbar represented by a multico=
lor LED. */
> +static int ps_lightbar_register(struct ps_device *ps_dev, struct led_cla=
ssdev_mc *lightbar_mc_dev,
> +=09int (*brightness_set)(struct led_classdev *, enum led_brightness))
> +{
> +=09struct hid_device *hdev =3D ps_dev->hdev;
> +=09struct mc_subled *mc_led_info;
> +=09struct led_classdev *led_cdev;
> +=09int ret;
> +
> +=09mc_led_info =3D devm_kzalloc(&hdev->dev, 3*sizeof(*mc_led_info), GFP_=
KERNEL);

I believe `devm_kmalloc_array()` would be more appropriate. Have you looked=
 at it?


> +=09if (!mc_led_info)
> +=09=09return -ENOMEM;
> +
> +=09mc_led_info[0].color_index =3D LED_COLOR_ID_RED;
> +=09mc_led_info[0].channel =3D 0;
> +=09mc_led_info[1].color_index =3D LED_COLOR_ID_GREEN;
> +=09mc_led_info[1].channel =3D 1;
> +=09mc_led_info[2].color_index =3D LED_COLOR_ID_BLUE;
> +=09mc_led_info[2].channel =3D 2;

Just a small note, as far as I'm aware, the `channel` member is not used by
multicolor LED functions, and it's not even used in this module as far as I=
 see.


> +
> +=09lightbar_mc_dev->subled_info =3D mc_led_info;
> +=09lightbar_mc_dev->num_colors =3D 3;
> +
> +=09led_cdev =3D &lightbar_mc_dev->led_cdev;
> +=09led_cdev->name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL, "playstatio=
n::%pMR::rgb",
> +=09=09=09ps_dev->mac_address);
> +=09led_cdev->brightness =3D 255;
> +=09led_cdev->max_brightness =3D 255;
> +=09led_cdev->brightness_set_blocking =3D brightness_set;
> +
> +=09ret =3D devm_led_classdev_multicolor_register(&hdev->dev, lightbar_mc=
_dev);
> +=09if (ret < 0) {
> +=09=09hid_err(hdev, "Cannot register multicolor LED device\n");
> +=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +
>  static struct input_dev *ps_sensors_create(struct hid_device *hdev, int =
accel_range, int accel_res,
>  =09=09int gyro_range, int gyro_res)
>  {
> @@ -601,6 +652,27 @@  static int dualsense_get_mac_address(struct dualsen=
se *ds)
>  =09return ret;
>  }
>
> +static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
> +=09enum led_brightness brightness)
> +{
> +=09struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +=09struct hid_device *hdev =3D to_hid_device(cdev->dev->parent);
> +=09struct dualsense *ds =3D hid_get_drvdata(hdev);

I think the previous two lines could be replaced with

```
struct dualsense *ds =3D container_of(mc_cdev, struct dualsense, lightbar);
```


> +=09unsigned long flags;
> +
> +=09led_mc_calc_color_components(mc_cdev, brightness);
> +
> +=09spin_lock_irqsave(&ds->base.lock, flags);
> +=09ds->update_lightbar =3D true;
> +=09ds->lightbar_red =3D mc_cdev->subled_info[0].brightness;
> +=09ds->lightbar_green =3D mc_cdev->subled_info[1].brightness;
> +=09ds->lightbar_blue =3D mc_cdev->subled_info[2].brightness;
> +=09spin_unlock_irqrestore(&ds->base.lock, flags);
> +
> +=09schedule_work(&ds->output_worker);
> +=09return 0;
> +}
> +
>  static void dualsense_init_output_report(struct dualsense *ds, struct du=
alsense_output_report *rp,
>  =09=09void *buf)
>  {
> @@ -682,6 +754,15 @@  static void dualsense_output_worker(struct work_str=
uct *work)
>  =09=09ds->update_rumble =3D false;
>  =09}
>
> +=09if (ds->update_lightbar) {
> +=09=09common->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_EN=
ABLE;
> +=09=09common->lightbar_red =3D ds->lightbar_red;
> +=09=09common->lightbar_green =3D ds->lightbar_green;
> +=09=09common->lightbar_blue =3D ds->lightbar_blue;
> +
> +=09=09ds->update_lightbar =3D false;
> +=09}
> +
>  =09spin_unlock_irqrestore(&ds->base.lock, flags);
>
>  =09dualsense_send_output_report(ds, &report);
> @@ -861,6 +942,30 @@  static int dualsense_play_effect(struct input_dev *=
dev, void *data, struct ff_ef
>  =09return 0;
>  }
> [...]
>  static struct ps_device *dualsense_create(struct hid_device *hdev)
>  {
>  =09struct dualsense *ds;
> @@ -930,6 +1035,18 @@  static struct ps_device *dualsense_create(struct h=
id_device *hdev)
>  =09if (ret < 0)
>  =09=09goto err;
>
> +=09/* The hardware may have control over the LEDs (e.g. in Bluetooth on =
startup).
> +=09 * Reset the LEDs (lightbar, mute, player leds), so we can control th=
em
> +=09 * from software.
> +=09 */
> +=09ret =3D dualsense_reset_leds(ds);
> +=09if (ret < 0)

I believe if `dualsense_reset_leds()` can only return 0 on success, or an e=
rrno,
then `if (ret)` would be better.


> +=09=09goto err;
> +
> +=09ret =3D ps_lightbar_register(ps_dev, &ds->lightbar, dualsense_lightba=
r_set_brightness);
> +=09if (ret < 0)
> [...]

Same here.


Regards,
Barnab=C3=A1s P=C5=91cze
