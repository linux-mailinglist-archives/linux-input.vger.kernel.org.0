Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3781D2EE841
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 23:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbhAGWSS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 17:18:18 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:30514 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbhAGWSS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 17:18:18 -0500
Date:   Thu, 07 Jan 2021 22:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610057855;
        bh=302rJ5HK1z1QnSbrmvjBU2smZE1Khx/tn/vqeZB8cnM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=sHUj1FP4ZoS7r0uXoyOTe+ka+1QgFfvott5E04WuJErjwxc/Gp5EWIIhBxY4ria4c
         wRKIMnAfvT+PDK04emzJEfZxazNAlpuXzvFmBhjSCLv40PPRFClJoR1H3h6ffTlHbU
         lPtM4dMeiz+zucT4JzQks9731zM+b5J8nfgdPIOk=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 11/13] HID: playstation: add DualSense player LEDs support.
Message-ID: <I-mPsiYl6UK2Pv00TjQu-X85mOLisznQUwrv_sFvWsijaUILSMLqNURJ1mlZ7DJ6_Ue_EvV6q_QDZWIrDm1VBMc8-ILr3zMnmShh8HV6R84=@protonmail.com>
In-Reply-To: <20210102223109.996781-12-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-12-roderick@gaikai.com>
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
> The DualSense features 5 player LEDs below its touchpad, which are
> meant as player id indications. This patch exposes the player LEDs
> as individual LEDs.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index ebf8a6550308..183f011f081b 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> [...]
> +static enum led_brightness dualsense_player_led_get_brightness(struct le=
d_classdev *led)
> +{
> +=09struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> +=09struct dualsense *ds =3D hid_get_drvdata(hdev);
> +
> +=09return !!(ds->player_leds_state & BIT(led - ds->player_leds));
> +}
> +
> +static void dualsense_player_led_set_brightness(struct led_classdev *led=
, enum led_brightness value)
> +{
> +=09struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> +=09struct dualsense *ds =3D hid_get_drvdata(hdev);
> +=09unsigned long flags;
> +=09unsigned int led_index;
> +
> +=09spin_lock_irqsave(&ds->base.lock, flags);
> +
> +=09led_index =3D led - ds->player_leds;
> +=09if (value =3D=3D LED_OFF)
> +=09=09ds->player_leds_state &=3D ~(1 << led_index);
> +=09else
> +=09=09ds->player_leds_state |=3D (1 << led_index);

A minor thing: I think `BIT(led_index)` should be used here.


> +
> +=09ds->update_player_leds =3D true;
> +=09spin_unlock_irqrestore(&ds->base.lock, flags);
> +
> +=09schedule_work(&ds->output_worker);
> +}
> +
>  static void dualsense_init_output_report(struct dualsense *ds, struct du=
alsense_output_report *rp,
>  =09=09void *buf)
>  {
> @@ -820,6 +855,13 @@  static void dualsense_output_worker(struct work_str=
uct *work)
>  =09=09ds->update_lightbar =3D false;
>  =09}
>
> +=09if (ds->update_player_leds) {
> +=09=09common->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CO=
NTROL_ENABLE;
> +=09=09common->player_leds =3D ds->player_leds_state;
> +
> +=09=09ds->update_player_leds =3D false;
> +=09}
> +
>  =09if (ds->update_mic_mute) {
>  =09=09if (ds->mic_muted) {
>  =09=09=09common->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CON=
TROL_ENABLE;
> @@ -1065,12 +1107,20 @@  static struct ps_device *dualsense_create(struct=
 hid_device *hdev)
>  =09struct dualsense *ds;
>  =09struct ps_device *ps_dev;
>  =09uint8_t max_output_report_size;
> -=09int ret;
> +=09int i, ret;
>
>  =09struct ps_led_info mute_led_info =3D {
>  =09=09"micmute", dualsense_mute_led_get_brightness, dualsense_mute_led_s=
et_brightness
>  =09};
>
> +=09struct ps_led_info player_leds_info[] =3D {
> +=09=09{ "led1", dualsense_player_led_get_brightness, dualsense_player_le=
d_set_brightness },
> +=09=09{ "led2", dualsense_player_led_get_brightness, dualsense_player_le=
d_set_brightness },
> +=09=09{ "led3", dualsense_player_led_get_brightness, dualsense_player_le=
d_set_brightness },
> +=09=09{ "led4", dualsense_player_led_get_brightness, dualsense_player_le=
d_set_brightness },
> +=09=09{ "led5", dualsense_player_led_get_brightness, dualsense_player_le=
d_set_brightness }
> +=09};

I think it would make sense to make `player_leds_info` and even `mute_led_i=
nfo`
`const` and `static`.


> +
>  =09ds =3D devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
>  =09if (!ds)
>  =09=09return ERR_PTR(-ENOMEM);
> @@ -1149,6 +1199,14 @@  static struct ps_device *dualsense_create(struct =
hid_device *hdev)
>  =09if (ret < 0)
>  =09=09goto err;
>
> +=09for (i =3D 0; i < ARRAY_SIZE(player_leds_info); i++) {
> +=09=09struct ps_led_info *led_info =3D &player_leds_info[i];
> +
> +=09=09ret =3D ps_led_register(ps_dev, &ds->player_leds[i], led_info);
> +=09=09if (ret < 0)
> +=09=09=09goto err;
> +=09}
> +
>  =09return &ds->base;
>
>  err:


Regards,
Barnab=C3=A1s P=C5=91cze
