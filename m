Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D813431BBA4
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 15:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhBOO5h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 09:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhBOO5W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 09:57:22 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D364FC061756
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:57:05 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m1so9614921wml.2
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent:mime-version:content-transfer-encoding;
        bh=0FXcyKqgdj4n7KOOlo+wS8fVXQNjmdj8/Ri3WBVdePE=;
        b=SQ43NFpST28Ut0vyr27kEYm+iN/Kb9Hrpr3UGNvAQ3JeahuRe1iQK4HI3S3qluUoPU
         ww5CADdJyjkZYMJEFxD9WwjR/bmNorQoOqn/Rczg5SsehgG0VL5aEbi4UxTp/OzjpTxM
         rufxSx9ckpPwzEFwQjO60x/dTpL5XOlqiUYxVb3w/uzYk+N1vVq/qj/T4VbPLofec6dx
         3xmNdxTvzuPSUqH20igNaT/58QIXy1VchpHTQ0QcBonh34xWPdUEy7AhY2GN3UT3GANj
         XLvTE/KRYp4azumzYf5J0fRIRsyJHUtbV2r6cyR4JCKGbjs2a5HGbN2xcx62VrYwJR6v
         2y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent:mime-version:content-transfer-encoding;
        bh=0FXcyKqgdj4n7KOOlo+wS8fVXQNjmdj8/Ri3WBVdePE=;
        b=PAnGD3EGFiBDNOfk/T3b6yYRblgeRtBR1dSxDZrWodS/KjlJ9EcJGFpoG7R4n8vd4y
         U1Nhn7+ByyhOrG0+7UTQAXJsaYwy/ZZng27bZpusFPs3PJqKGeP9jEFLrkNffmQ4NGZr
         0RzrL/ikRNcH94aU1IgXs3mR5CtHzhfIifz8t8O7Q5XWc7vCoAcowRTFl0vEOqqr7pJe
         ZNP4WeZx2oiYYLa5WbnfFp0xGyPNTgZ5BYE6vpTKacFaTlsJJ16d/5EvWgrLOaf7fTLx
         Qw+lXZWGCCYU6IIRfkqv6UPTAMQShQa7r+XoSrKDscqzvy/b5eRRByPXy6g463S9gONr
         TITg==
X-Gm-Message-State: AOAM530VoScKZOcqHnWjK4VBVz4wCerNQAyGcVizHDSPkMreY3qk840P
        ha3csbjZNdvJYXSFaEdH3vo=
X-Google-Smtp-Source: ABdhPJxt71iyQmg3YTwCy+7Jy5Eoj7Naky1LNUZEispo5PAjzNNP6FtQHXDGgoJCvP6egYZo6i+RdQ==
X-Received: by 2002:a05:600c:4656:: with SMTP id n22mr14719841wmo.130.1613401024527;
        Mon, 15 Feb 2021 06:57:04 -0800 (PST)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id g1sm25357255wmh.9.2021.02.15.06.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:57:04 -0800 (PST)
Date:   Mon, 15 Feb 2021 15:25:12 +0100
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net
Subject: Re: [PATCH v12 03/14] HID: nintendo: add power supply support
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
 <20200823044157.339677-4-djogorchock@gmail.com>
In-Reply-To: <20200823044157.339677-4-djogorchock@gmail.com>
Message-Id: <2DDN5IY9N0T5F.25GA5IRWX53AX@homearch.localdomain>
User-Agent: mblaze/1.1-4-g36df5fe (2021-01-22)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel

Some comments below.

"Daniel J. Ogorchock" <djogorchock@gmail.com> wrote:
> This patch adds power_supply functionality to the switch controller
> driver for its battery.
>=20
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  drivers/hid/Kconfig        |   1 +
>  drivers/hid/hid-nintendo.c | 134 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
>=20
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index af4d543c0ff9..c05bfb6ac577 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -715,6 +715,7 @@ config HID_NINTENDO
>  	depends on HID
>  	depends on NEW_LEDS
>  	depends on LEDS_CLASS
> +	select POWER_SUPPLY
>  	help
>  	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
>  	All controllers support bluetooth, and the Pro Controller also supports=

> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index c3eec9b7c99c..adecd6790fe9 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -11,6 +11,7 @@
>   *   https://github.com/MTCKC/ProconXInput
>   *   hid-wiimote kernel hid driver
>   *   hid-logitech-hidpp driver
> + *   hid-sony driver
>   *
>   * This driver supports the Nintendo Switch Joy-Cons and Pro Controllers=
. The
>   * Pro Controllers can either be used over USB or Bluetooth.
> @@ -27,6 +28,7 @@
>  #include <linux/input.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> +#include <linux/power_supply.h>
>  #include <linux/spinlock.h>
> =20
>  /*
> @@ -192,6 +194,7 @@ struct joycon_ctlr {
>  	struct input_dev *input;
>  	struct led_classdev leds[JC_NUM_LEDS];
>  	enum joycon_ctlr_state ctlr_state;
> +	spinlock_t lock;
> =20
>  	/* The following members are used for synchronous sends/receives */
>  	enum joycon_msg_type msg_type;
> @@ -209,6 +212,12 @@ struct joycon_ctlr {
>  	struct joycon_stick_cal right_stick_cal_x;
>  	struct joycon_stick_cal right_stick_cal_y;
> =20
> +	/* power supply data */
> +	struct power_supply *battery;
> +	struct power_supply_desc battery_desc;
> +	u8 battery_capacity;
> +	bool battery_charging;
> +	bool host_powered;
>  };
> =20
>  static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t l=
en)
> @@ -439,9 +448,41 @@ static void joycon_parse_report(struct joycon_ctlr *=
ctlr,
>  				struct joycon_input_report *rep)
>  {
>  	struct input_dev *dev =3D ctlr->input;
> +	unsigned long flags;
> +	u8 tmp;
>  	u32 btns;
>  	u32 id =3D ctlr->hdev->product;
> =20
> +	/* Parse the battery status */
> +	tmp =3D rep->bat_con;
> +	spin_lock_irqsave(&ctlr->lock, flags);
> +	ctlr->host_powered =3D tmp & BIT(0);
> +	ctlr->battery_charging =3D tmp & BIT(4);
> +	tmp =3D tmp >> 5;
> +	switch (tmp) {
> +	case 0: /* empty */
> +		ctlr->battery_capacity =3D POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
> +		break;
> +	case 1: /* low */
> +		ctlr->battery_capacity =3D POWER_SUPPLY_CAPACITY_LEVEL_LOW;
> +		break;
> +	case 2: /* medium */
> +		ctlr->battery_capacity =3D POWER_SUPPLY_CAPACITY_LEVEL_NORMAL;
> +		break;
> +	case 3: /* high */
> +		ctlr->battery_capacity =3D POWER_SUPPLY_CAPACITY_LEVEL_HIGH;
> +		break;
> +	case 4: /* full */
> +		ctlr->battery_capacity =3D POWER_SUPPLY_CAPACITY_LEVEL_FULL;
> +		break;
> +	default:
> +		ctlr->battery_capacity =3D POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
> +		hid_warn(ctlr->hdev, "Invalid battery status\n");
> +		break;

This break is not needed but we seem to use a "break" in a lot of
"default:" cases, so it could be on purpose.


> +	}
> +	spin_unlock_irqrestore(&ctlr->lock, flags);
> +
> +	/* Parse the buttons and sticks */
>  	btns =3D hid_field_extract(ctlr->hdev, rep->button_status, 0, 24);
> =20
>  	if (id !=3D USB_DEVICE_ID_NINTENDO_JOYCONR) {
> @@ -741,6 +782,91 @@ static int joycon_player_leds_create(struct joycon_c=
tlr *ctlr)
>  	return 0;
>  }
> =20
> +static int joycon_battery_get_property(struct power_supply *supply,
> +				       enum power_supply_property prop,
> +				       union power_supply_propval *val)
> +{
> +	struct joycon_ctlr *ctlr =3D power_supply_get_drvdata(supply);
> +	unsigned long flags;
> +	int ret =3D 0;
> +	u8 capacity;
> +	bool charging;
> +	bool powered;
> +
> +	spin_lock_irqsave(&ctlr->lock, flags);
> +	capacity =3D ctlr->battery_capacity;
> +	charging =3D ctlr->battery_charging;
> +	powered =3D ctlr->host_powered;
> +	spin_unlock_irqrestore(&ctlr->lock, flags);
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval =3D 1;
> +		break;
> +	case POWER_SUPPLY_PROP_SCOPE:
> +		val->intval =3D POWER_SUPPLY_SCOPE_DEVICE;
> +		break;
> +	case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
> +		val->intval =3D capacity;
> +		break;
> +	case POWER_SUPPLY_PROP_STATUS:
> +		if (charging)
> +			val->intval =3D POWER_SUPPLY_STATUS_CHARGING;
> +		else if (capacity =3D=3D POWER_SUPPLY_CAPACITY_LEVEL_FULL &&
> +			 powered)
> +			val->intval =3D POWER_SUPPLY_STATUS_FULL;
> +		else
> +			val->intval =3D POWER_SUPPLY_STATUS_DISCHARGING;
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;

This break is not needed.


> +	}
> +	return ret;
> +}
> +
> +static enum power_supply_property joycon_battery_props[] =3D {
> +	POWER_SUPPLY_PROP_PRESENT,
> +	POWER_SUPPLY_PROP_CAPACITY_LEVEL,
> +	POWER_SUPPLY_PROP_SCOPE,
> +	POWER_SUPPLY_PROP_STATUS,
> +};
> +
> +static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
> +{
> +	struct hid_device *hdev =3D ctlr->hdev;
> +	struct power_supply_config supply_config =3D { .drv_data =3D ctlr, };
> +	const char * const name_fmt =3D "nintendo_switch_controller_battery_%s"=
;
> +	int ret =3D 0;
> +
> +	/* Set initially to unknown before receiving first input report */
> +	ctlr->battery_capacity =3D POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
> +
> +	/* Configure the battery's description */
> +	ctlr->battery_desc.properties =3D joycon_battery_props;
> +	ctlr->battery_desc.num_properties =3D
> +					ARRAY_SIZE(joycon_battery_props);
> +	ctlr->battery_desc.get_property =3D joycon_battery_get_property;
> +	ctlr->battery_desc.type =3D POWER_SUPPLY_TYPE_BATTERY;
> +	ctlr->battery_desc.use_for_apm =3D 0;
> +	ctlr->battery_desc.name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL,
> +						 name_fmt,
> +						 dev_name(&hdev->dev));
> +	if (!ctlr->battery_desc.name)
> +		return -ENOMEM;
> +
> +	ctlr->battery =3D devm_power_supply_register(&hdev->dev,
> +						   &ctlr->battery_desc,
> +						   &supply_config);
> +	if (IS_ERR(ctlr->battery)) {
> +		ret =3D PTR_ERR(ctlr->battery);
> +		hid_err(hdev, "Failed to register battery; ret=3D%d\n", ret);
> +		return ret;
> +	}
> +	power_supply_powers(ctlr->battery, &hdev->dev);

We should probably check the return value of this function.


Cheers,

Silvan
