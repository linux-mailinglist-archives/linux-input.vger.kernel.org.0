Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB57C670E5E
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 01:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjARAE6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Jan 2023 19:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjARAEZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Jan 2023 19:04:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCC380148
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 15:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673997406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ftgxTT89EEWP08Rjm894goTA3Flc5Mzd1HbSTyaLdP0=;
        b=Md4EKr4p44Y9Icv2z2QvosJnVisd1ojgNwGWqGhrLEN0Atr4+dxk9G7ndw8ED7sVUvcKcS
        TWX+FDRksCCIN3I4Hx4wSyBlUPurEbWKJNqpzBCg9epzCBKSkHIVeSHlf/vadFqgujIL8F
        chcSIbkK2xvtfuJNvNbQdzxtFUynMqU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-7BkOtiPJMOiQkCrV_azi0A-1; Tue, 17 Jan 2023 18:16:45 -0500
X-MC-Unique: 7BkOtiPJMOiQkCrV_azi0A-1
Received: by mail-qk1-f198.google.com with SMTP id bk14-20020a05620a1a0e00b00706774f14cbso4193042qkb.4
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 15:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftgxTT89EEWP08Rjm894goTA3Flc5Mzd1HbSTyaLdP0=;
        b=iU+h2BhV3HuHMLbNilfZtuEfu+cECyoUjDyHDgV7qWxvs8QPIGd0nKLi+1Br2LzLm1
         +c56VOpGTq9wZxz9cn3H7+revWeg1mWlf5rBw0KkCaLJd9Og7ua7cs1CK7b3Q3+P83BY
         K+z98pZGTVJMk2eXVFRwnXZoocKfcD31+O2zSAb2RUWFImDPlLOvWNgw8Nhhhegt3iGK
         9Fkx0NbQrLQRmwZYlAnz7SWm0onwMxoeWfw0RJMzPUiGCcP5Zrwgy1BFu7eDHnL//gr6
         KD+wwjApsSKaVwe/O9z3gsQ/rwmLb4DicLqxKvW7fv9JtERAJfchCk+PJ+bWyyTMMogA
         Fo9A==
X-Gm-Message-State: AFqh2kpa9o8syJjn7Mtz0luVqfIDNaT5r5qGdTaz8IhEHmm1YFxXtiec
        n9wUgbYvJ6ys/9FUOy7zFKDgnb5+F8UuFWyH7c0Rs1Ky7+URrUiO5WudhXX7M7iAXdbeP0lRYZG
        2+J3iXuzahEXyRod9y2iJuII=
X-Received: by 2002:a05:6214:16f:b0:534:d788:406b with SMTP id y15-20020a056214016f00b00534d788406bmr7209443qvs.40.1673997404293;
        Tue, 17 Jan 2023 15:16:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuLAxoXGuxbVfWW0xvsmKEdHBwT1wSXvuGjBkKQYMGLPBxB25neBH1ErJCosZedKhJ5zQfgvQ==
X-Received: by 2002:a05:6214:16f:b0:534:d788:406b with SMTP id y15-20020a056214016f00b00534d788406bmr7209425qvs.40.1673997404045;
        Tue, 17 Jan 2023 15:16:44 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
        by smtp.gmail.com with ESMTPSA id de19-20020a05620a371300b006fa16fe93bbsm21211840qkb.15.2023.01.17.15.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 15:16:43 -0800 (PST)
Message-ID: <c53fc0632b16a7b04bc59ffcd642f3bad4ee864a.camel@redhat.com>
Subject: Re: [PATCH 2/2] HID: hid-steam: Add rumble on Deck
From:   Lyude Paul <lyude@redhat.com>
To:     Vicki Pfau <vi@endrift.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Date:   Tue, 17 Jan 2023 18:16:42 -0500
In-Reply-To: <20230111012336.2915827-2-vi@endrift.com>
References: <20230111012336.2915827-1-vi@endrift.com>
         <20230111012336.2915827-2-vi@endrift.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2023-01-10 at 17:23 -0800, Vicki Pfau wrote:
> The Steam Deck includes a new report that allows for emulating XInput-sty=
le
> rumble motors with the Deck's actuators. This adds support for passing th=
ese
> values directly to the Deck.
>=20
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/hid/Kconfig     |  8 ++++++
>  drivers/hid/hid-steam.c | 55 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>=20
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index e2a5d30c8895..e9de0a2d3cd3 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1025,6 +1025,14 @@ config HID_STEAM
>  	without running the Steam Client. It supports both the wired and
>  	the wireless adaptor.
> =20
> +config STEAM_FF
> +	bool "Steam Deck force feedback support"
> +	depends on HID_STEAM
> +	select INPUT_FF_MEMLESS
> +	help
> +	Say Y here if you want to enable force feedback support for the Steam
> +	Deck.
> +
>  config HID_STEELSERIES
>  	tristate "Steelseries SRW-S1 steering wheel support"
>  	help
> diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
> index efd192d6c51a..788b5baaf145 100644
> --- a/drivers/hid/hid-steam.c
> +++ b/drivers/hid/hid-steam.c
> @@ -91,6 +91,7 @@ static LIST_HEAD(steam_devices);
>  #define STEAM_CMD_FORCEFEEDBAK		0x8f
>  #define STEAM_CMD_REQUEST_COMM_STATUS	0xb4
>  #define STEAM_CMD_GET_SERIAL		0xae
> +#define STEAM_CMD_HAPTIC_RUMBLE		0xeb
> =20
>  /* Some useful register ids */
>  #define STEAM_REG_LPAD_MODE		0x07
> @@ -134,6 +135,9 @@ struct steam_device {
>  	u8 battery_charge;
>  	u16 voltage;
>  	struct delayed_work heartbeat;
> +	struct work_struct rumble_work;
> +	u16 rumble_left;
> +	u16 rumble_right;
>  };
> =20
>  static int steam_recv_report(struct steam_device *steam,
> @@ -290,6 +294,45 @@ static inline int steam_request_conn_status(struct s=
team_device *steam)
>  	return steam_send_report_byte(steam, STEAM_CMD_REQUEST_COMM_STATUS);
>  }
> =20
> +static inline int steam_haptic_rumble(struct steam_device *steam,
> +				u16 intensity, u16 left_speed, u16 right_speed,
> +				u8 left_gain, u8 right_gain)
> +{
> +	u8 report[11] =3D {STEAM_CMD_HAPTIC_RUMBLE, 9};
> +
> +	report[3] =3D intensity & 0xFF;
> +	report[4] =3D intensity >> 8;
> +	report[5] =3D left_speed & 0xFF;
> +	report[6] =3D left_speed >> 8;
> +	report[7] =3D right_speed & 0xFF;
> +	report[8] =3D right_speed >> 8;
> +	report[9] =3D left_gain;
> +	report[10] =3D right_gain;
> +
> +	return steam_send_report(steam, report, sizeof(report));
> +}
> +
> +static void steam_haptic_rumble_cb(struct work_struct *work)
> +{
> +	struct steam_device *steam =3D container_of(work, struct steam_device,
> +							rumble_work);
> +	steam_haptic_rumble(steam, 0, steam->rumble_left,
> +		steam->rumble_right, 2, 0);
> +}
> +
> +#ifdef CONFIG_STEAM_FF
> +static int steam_play_effect(struct input_dev *dev, void *data,
> +				struct ff_effect *effect)
> +{
> +	struct steam_device *steam =3D input_get_drvdata(dev);
> +
> +	steam->rumble_left =3D effect->u.rumble.strong_magnitude;
> +	steam->rumble_right =3D effect->u.rumble.weak_magnitude;
> +
> +	return schedule_work(&steam->rumble_work);
> +}
> +#endif
> +
>  static void steam_set_lizard_mode(struct steam_device *steam, bool enabl=
e)
>  {
>  	if (enable) {
> @@ -541,6 +584,15 @@ static int steam_input_register(struct steam_device =
*steam)
>  	input_abs_set_res(input, ABS_HAT0X, STEAM_PAD_RESOLUTION);
>  	input_abs_set_res(input, ABS_HAT0Y, STEAM_PAD_RESOLUTION);
> =20
> +#ifdef CONFIG_STEAM_FF
> +	if (steam->quirks & STEAM_QUIRK_DECK) {
> +		input_set_capability(input, EV_FF, FF_RUMBLE);
> +		ret =3D input_ff_create_memless(input, NULL, steam_play_effect);
> +		if (ret)
> +			goto init_ff_fail;
> +	}
> +#endif
> +
>  	ret =3D input_register_device(input);
>  	if (ret)
>  		goto input_register_fail;
> @@ -549,6 +601,7 @@ static int steam_input_register(struct steam_device *=
steam)
>  	return 0;
> =20
>  input_register_fail:
> +init_ff_fail:

JFYI, this actually causes a compilation warning with CONFIG_STEAM_FF
disabled:

drivers/hid/hid-steam.c: In function =E2=80=98steam_input_register=E2=80=99=
:
drivers/hid/hid-steam.c:604:1: warning: label =E2=80=98init_ff_fail=E2=80=
=99 defined but not
used [-Wunused-label]
  604 | init_ff_fail:
      | ^~~~~~~~~~~~

TBH I think we should be fine just reusing the input_register_fail: jump la=
bel
for this instead of adding another label.

FWIW as well if you want: you could just drop the Kconfig option for this
entirely, which bentiss may or may not want. It would at least leave a litt=
le
less chance for compilation warnings like this, since the more Kconfig opti=
ons
you have for a module the higher the chance you'll leave a warning by mista=
ke
in some random kernel config.

If you end up deciding to leave the Kconfig in I'd at least update the comm=
it
message to mention explicitly you added it so people notice it even if they
don't look at the diff (e.g. maintainers just merging reviewed patches).

I have no hard opinion either way as long as we fix the compilation warning
:). With the issues mentioned here addressed, this patch is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

>  	input_free_device(input);
>  	return ret;
>  }
> @@ -842,6 +895,7 @@ static int steam_probe(struct hid_device *hdev,
>  	INIT_WORK(&steam->work_connect, steam_work_connect_cb);
>  	INIT_LIST_HEAD(&steam->list);
>  	INIT_DEFERRABLE_WORK(&steam->heartbeat, steam_lizard_mode_heartbeat);
> +	INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
> =20
>  	steam->client_hdev =3D steam_create_client_hid(hdev);
>  	if (IS_ERR(steam->client_hdev)) {
> @@ -898,6 +952,7 @@ static int steam_probe(struct hid_device *hdev,
>  client_hdev_fail:
>  	cancel_work_sync(&steam->work_connect);
>  	cancel_delayed_work_sync(&steam->heartbeat);
> +	cancel_work_sync(&steam->rumble_work);
>  steam_alloc_fail:
>  	hid_err(hdev, "%s: failed with error %d\n",
>  			__func__, ret);

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

