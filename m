Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF7A1C15E6
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2019 17:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfI2PND (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Sep 2019 11:13:03 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33875 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfI2PNC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Sep 2019 11:13:02 -0400
Received: by mail-ed1-f67.google.com with SMTP id p10so6379751edq.1
        for <linux-input@vger.kernel.org>; Sun, 29 Sep 2019 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent:mime-version:content-transfer-encoding;
        bh=t/trIoWwPzvaeeCT+eHaU+gKv0tlIrmbMB3GOxkn7OE=;
        b=koLS02nrDVyEez/ncOIViB5TTUGV/FVdUAL6PSI0JQ/o2xZr9IzxdsmBxY1yXN1qpA
         S69B7V7TngGrABwHKeq+wDtEDHpNanl0WIdq3d+0oa+MUuyBhvnr87Vdl0OcRKo7T4iU
         WDTmXQJDQRgRHnWrAe4FQJj6lh/PUU2zi8M256APFHwgA1ve3kokney+y3YUC6rxT2Tc
         TkCI21buZx4lzxFpavtEp1p4216Lqd10cs6KgI9byEVb/lI9QTLyK7Wwk4sy0Q9bY3te
         m/jHdstw3H+KyKjhaf/WRHNTEyY4HaDbQZCt5iDh85yPCMpaXocxlAtZtY4oVlyrdgpL
         WHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent:mime-version:content-transfer-encoding;
        bh=t/trIoWwPzvaeeCT+eHaU+gKv0tlIrmbMB3GOxkn7OE=;
        b=CHJKU85UCdnXQLraxisDz23iVuFdYJcK+6M9z3TFPcb4ZJ+vjCAhD2NGwPg5kKO3vN
         aRTSfHB1nOtuWD78Gun9QgMGfVzCJuyHJO3OfqgHS0GSPB5U24QkLRz7eSC8EVjZMW8d
         0izxLVZe4HC/wI0bNXFSCl5HWC/oNnOMb/xFwjI6GEfj3aTaPSEtngq7Jp4miZ+6MiZh
         /CnxGxRbt0QyIgF0UxrM+RBqUkjrKvSOvZM2pRdAfi7cyUdHa1V4QDwVRnlegEILWho3
         BQ7PJPKYW5Q6fN+XSVkL0opkW8ElmJ/2fr5qdkdq34KMIbEz8gjbj3lDMXdzF9p+d+FN
         EojQ==
X-Gm-Message-State: APjAAAWlBYQyeD69aydn6y7pCksoMnvT7sPjkMbwhVy/EbOXwlpP876d
        Bg4gXB1aX0NU4k+7y6CTEDU=
X-Google-Smtp-Source: APXvYqwOkuie3h5D29gHQXqTkcqBOTlLFth2F8dcBL1ZPWVegetau8CBvEQ2czahduH5kwbduAb7OQ==
X-Received: by 2002:a17:906:e0d1:: with SMTP id gl17mr15116358ejb.99.1569769980424;
        Sun, 29 Sep 2019 08:13:00 -0700 (PDT)
Received: from localhost ([2a02:169:ed::acc])
        by smtp.gmail.com with ESMTPSA id v22sm1895669edm.89.2019.09.29.08.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2019 08:12:59 -0700 (PDT)
Date:   Sun, 29 Sep 2019 17:12:59 +0200
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu0, svv@google.com
Subject: Re: [PATCH v6 4/6] HID: joycon: add home led support
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20190915233140.244347-1-djogorchock@gmail.com>
 <20190915233140.244347-5-djogorchock@gmail.com>
In-Reply-To: <20190915233140.244347-5-djogorchock@gmail.com>
Message-Id: <3HBDRVHFO0MTG.36K9LXIRCEA5H@homearch.localdomain>
User-Agent: mblaze/0.5.1-13-g1ed8a0a-dirty (2019-09-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel

One comment below.

"Daniel J. Ogorchock" <djogorchock@gmail.com> wrote:
> This patch adds the ability to set the intensity level of the home
> button's LED.
>=20
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  drivers/hid/hid-joycon.c | 72 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 67 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/hid/hid-joycon.c b/drivers/hid/hid-joycon.c
> index 45289cd97aba..920a1894b6ce 100644
> --- a/drivers/hid/hid-joycon.c
> +++ b/drivers/hid/hid-joycon.c
> @@ -187,7 +187,8 @@ struct joycon_input_report {
>  struct joycon_ctlr {
>  	struct hid_device *hdev;
>  	struct input_dev *input;
> -	struct led_classdev leds[JC_NUM_LEDS];
> +	struct led_classdev leds[JC_NUM_LEDS]; /* player leds */
> +	struct led_classdev home_led;
>  	enum joycon_ctlr_state ctlr_state;
>  	spinlock_t lock;
> =20
> @@ -668,6 +669,40 @@ static int joycon_player_led_brightness_set(struct l=
ed_classdev *led,
>  	return ret;
>  }
> =20
> +static int joycon_home_led_brightness_set(struct led_classdev *led,
> +					  enum led_brightness brightness)
> +{
> +	struct device *dev =3D led->dev->parent;
> +	struct hid_device *hdev =3D to_hid_device(dev);
> +	struct joycon_ctlr *ctlr;
> +	struct joycon_subcmd_request *req;
> +	u8 buffer[sizeof(*req) + 5] =3D { 0 };
> +	u8 *data;
> +	int ret;
> +
> +	ctlr =3D hid_get_drvdata(hdev);
> +	if (!ctlr) {
> +		hid_err(hdev, "No controller data\n");
> +		return -ENODEV;
> +	}
> +
> +	req =3D (struct joycon_subcmd_request *)buffer;
> +	req->subcmd_id =3D JC_SUBCMD_SET_HOME_LIGHT;
> +	data =3D req->data;
> +	data[0] =3D 0x01;
> +	data[1] =3D brightness << 4;
> +	data[2] =3D brightness | (brightness << 4);
> +	data[3] =3D 0x11;
> +	data[4] =3D 0x11;
> +
> +	hid_dbg(hdev, "setting home led brightness\n");
> +	mutex_lock(&ctlr->output_mutex);
> +	ret =3D joycon_send_subcmd(ctlr, req, 5);
> +	mutex_unlock(&ctlr->output_mutex);
> +
> +	return ret;
> +}
> +
>  static const char * const joycon_player_led_names[] =3D {
>  	"player1",
>  	"player2",
> @@ -676,7 +711,7 @@ static const char * const joycon_player_led_names[] =3D=
 {
>  };
> =20
>  static DEFINE_MUTEX(joycon_input_num_mutex);
> -static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
> +static int joycon_leds_create(struct joycon_ctlr *ctlr)
>  {
>  	struct hid_device *hdev =3D ctlr->hdev;
>  	struct device *dev =3D &hdev->dev;
> @@ -701,7 +736,7 @@ static int joycon_player_leds_create(struct joycon_ct=
lr *ctlr)
>  				      joycon_player_led_names[i]);
>  		if (!name) {
>  			ret =3D -ENOMEM;

In the joycon_leds_create function just returning the errors instead of
'goto err' would save two lines of code or so.


Cheers,

Silvan


> -			break;
> +			goto err;
>  		}
> =20
>  		led =3D &ctlr->leds[i];
> @@ -715,7 +750,7 @@ static int joycon_player_leds_create(struct joycon_ct=
lr *ctlr)
>  		ret =3D devm_led_classdev_register(&hdev->dev, led);
>  		if (ret) {
>  			hid_err(hdev, "Failed registering %s LED\n", led->name);
> -			break;
> +			goto err;
>  		}
>  	}
> =20
> @@ -723,6 +758,33 @@ static int joycon_player_leds_create(struct joycon_c=
tlr *ctlr)
>  		input_num =3D 1;
>  	mutex_unlock(&joycon_input_num_mutex);
> =20
> +	/* configure the home LED */
> +	if (ctlr->hdev->product !=3D USB_DEVICE_ID_NINTENDO_JOYCONL) {
> +		name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name, "home");
> +		if (!name) {
> +			ret =3D -ENOMEM;
> +			goto err;
> +		}
> +
> +		led =3D &ctlr->home_led;
> +		led->name =3D name;
> +		led->brightness =3D 0;
> +		led->max_brightness =3D 0xF;
> +		led->brightness_set_blocking =3D joycon_home_led_brightness_set;
> +		led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
> +		ret =3D devm_led_classdev_register(&hdev->dev, led);
> +		if (ret) {
> +			hid_err(hdev, "Failed registering home led\n");
> +			goto err;
> +		}
> +		/* Set the home LED to 0 as default state */
> +		ret =3D joycon_home_led_brightness_set(led, 0);
> +		if (ret)
> +			hid_err(hdev, "Failed to set home LED dflt; ret=3D%d\n",
> +									ret);
> +	}
> +
> +err:
>  	return ret;
>  }
> =20
> @@ -978,7 +1040,7 @@ static int joycon_hid_probe(struct hid_device *hdev,=

>  	}
> =20
>  	/* Initialize the leds */
> -	ret =3D joycon_player_leds_create(ctlr);
> +	ret =3D joycon_leds_create(ctlr);
>  	if (ret) {
>  		hid_err(hdev, "Failed to create leds; ret=3D%d\n", ret);
>  		goto err_close;


