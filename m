Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055592E3195
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 15:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgL0Olu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 09:41:50 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:35670 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgL0Olu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 09:41:50 -0500
Date:   Sun, 27 Dec 2020 14:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609080066;
        bh=o25TG1yfrECvQPETg5CLo+XrA3FPqBUg41g7nz7MyS0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=kA1LsLrcq9BLpxKRLRj0HOW7z/WFa1pI6sWSTdnFaK1lJ3Uqyyg9jlAIQemqZBx/s
         jqVYPQLkVGhnxR4BfuzUQ66INE/F+h19jMS30M0EHbARbap+LIanL/cxylbaVetup1
         NHo399/OZUSJ0KSQVfG9zxYlUShZJ7SonmahJ1Rg=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 09/13] HID: playstation: add DualSense lightbar support
Message-ID: <_n_Seien29lcWzPT6LHN7MEtqlVZpJOBRKw-qe01hEhSGbKKL7cffbmSGPjZZIN8Q4B8fInhwChsV0JB70F-wqj44ZQILevS6y3FXYaDtw8=@protonmail.com>
In-Reply-To: <20201219062336.72568-10-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-10-roderick@gaikai.com>
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


2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:

> [...]
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 0b62bcb28d8a..f8cf82a27d43 100644
> [...]
> +/* Create a DualSense/DualShock4 RGB lightbar represented by a multicolo=
r LED. */
> +static struct led_classdev_mc *ps_lightbar_create(struct ps_device *ps_d=
ev,
> +=09int (*brightness_set)(struct led_classdev *, enum led_brightness))
> +{
> +=09struct hid_device *hdev =3D ps_dev->hdev;
> +=09struct led_classdev_mc *lightbar_mc_dev;
> +=09struct mc_subled *mc_led_info;
> +=09struct led_classdev *led_cdev;
> +=09int ret;
> +
> +=09lightbar_mc_dev =3D devm_kzalloc(&hdev->dev, sizeof(*lightbar_mc_dev)=
, GFP_KERNEL);
> +=09if (!lightbar_mc_dev)
> +=09=09return ERR_PTR(-ENOMEM);
> +
> +=09mc_led_info =3D devm_kzalloc(&hdev->dev, 3*sizeof(*mc_led_info), GFP_=
KERNEL);
> +=09if (!mc_led_info)
> +=09=09return ERR_PTR(-ENOMEM);
> +

Is there any reason why these are dynamically allocated?


> +=09mc_led_info[0].color_index =3D LED_COLOR_ID_RED;
> +=09mc_led_info[0].channel =3D 0;
> +=09mc_led_info[1].color_index =3D LED_COLOR_ID_GREEN;
> +=09mc_led_info[1].channel =3D 1;
> +=09mc_led_info[2].color_index =3D LED_COLOR_ID_BLUE;
> +=09mc_led_info[2].channel =3D 2;
> +
> +=09lightbar_mc_dev->subled_info =3D mc_led_info;
> +=09lightbar_mc_dev->num_colors =3D 3;
> +
> +=09led_cdev =3D &lightbar_mc_dev->led_cdev;
> +=09led_cdev->name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL, "playstatio=
n::%pMR::rgb",
> +=09=09=09ps_dev->mac_address);

I guess the double colons are used because the MAC address has ':' in it; b=
ut
as far as I know this doesn't follow the naming scheme for LED devices, so =
I'm
not sure if this is the best way to go about it.


> +=09led_cdev->brightness =3D 255;
> +=09led_cdev->max_brightness =3D 255;
> +=09led_cdev->brightness_set_blocking =3D brightness_set;
> +
> +=09ret =3D devm_led_classdev_multicolor_register(&hdev->dev, lightbar_mc=
_dev);
> +=09if (ret < 0) {
> +=09=09hid_err(hdev, "Cannot register multicolor LED device\n");
> +=09=09return ERR_PTR(ret);
> +=09}
> +
> +=09return lightbar_mc_dev;
> +}
> [...]
> +static int dualsense_reset_leds(struct dualsense *ds)
> +{
> +=09struct dualsense_output_report report;
> +=09uint8_t *buf;
> +
> +=09buf =3D kzalloc(sizeof(struct dualsense_output_report_bt), GFP_KERNEL=
);
> +=09if (!buf)
> +=09=09return -ENOMEM;
> +
> +=09dualsense_init_output_report(ds, &report, buf);
> +=09/* On Bluetooth the DualSense outputs an animation on the lightbar
> +=09 * during startup and maintains a color afterwards. We need to explic=
itly
> +=09 * reconfigure the lightbar before we can do any programming later on=
.
> +=09 * In USB the lightbar is not on by default, but redoing the setup th=
ere
> +=09 * doesn't hurt.
> +=09 */
> +=09report.common->valid_flag2 =3D DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_C=
ONTROL_ENABLE;
> +=09report.common->lightbar_setup =3D 2; /* Fade light out. */

Maybe it'd be better to name that '2'?


> +=09dualsense_send_output_report(ds, &report);
> +
> +=09kfree(buf);
> +=09return 0;
> +}
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
