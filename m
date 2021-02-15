Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D4931BBAE
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 15:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhBOO6C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 09:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbhBOO5t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 09:57:49 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4420C0611C3
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:56:17 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id r21so9227778wrr.9
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent:mime-version:content-transfer-encoding;
        bh=P6tWCDxWCZHx0IJZl750l5sM0tMIt2B73xCZ9YGSYqs=;
        b=RiaJFoMG9dLoM4ILApggzM9dbRErvJ1kaYuwyiVK7p/6Pq/GEqvY07mAPEH8ZA4S8V
         Q7GRTTIjNMJG26WHTmjRcE+hSlrFBHIk0aNHylJJpnPBtwmCY5kFs+crBgAyPcQBNZwj
         hfvKdCqpMlF8ys8vUmzS0Wz6PcCnViQDqXcwsWLZi/6uU+dd7SsldIwrMZdY1e19pCV9
         pfxq+XRCpmlhAqtxm58NvwLJl5xIK+Wzd7yjF0BiqQeL01KksqzWiBKtpHiy7+/ygmjA
         ATUN/q70Tdj28Bt+FsiOAq0N9eFy/5LDRdu/DrQDEwhbrNcME6x/XzoPuEYPl2Ew5HPl
         qTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent:mime-version:content-transfer-encoding;
        bh=P6tWCDxWCZHx0IJZl750l5sM0tMIt2B73xCZ9YGSYqs=;
        b=ITfn8HtEHMylFqZ7PUwz4BUQVvwP3Lxc1HyKNjkidH/3actwIDxA5H08dF+6uxMouJ
         08+yafTT7jZKj7IstcrpZDPiJ8iKVnsAzDWfuisPh1VX7NvUlKjF0DA7/by8oxlEiglJ
         l9NetrYm+C0NQ6aLNZkJRM2I7eVLEvyfsvs3tgtx6fILtCqw4DxC92d75rAIEieZgV8T
         exseTK/hag/9vkwFVRTrfQZZ5m/GmZNVgIB6pTwtvN0ywkwT1XxqPBxX3pQflMDV02zf
         fgZYdaCEYYdzdml1YOB+yL3wzg3ri83U655Cj0pg3AnSt8EpMVkXMXvtXKYfqzqJRRVZ
         nl5A==
X-Gm-Message-State: AOAM532Ed3bRaset7IIBvndiaRZAPkyvf+bTJMn1BxJyGw1Zv3gKW6iN
        UgC0hj5fBfzW2LL+fWVgAZPKslTlFvW7EJoO
X-Google-Smtp-Source: ABdhPJyH5Xgcvixl2EMYVujU09YYePBJuyuZH9XdR1mfFwhv7pdadckFSHXNs9vIRwImo1kSKdTr4w==
X-Received: by 2002:adf:b60e:: with SMTP id f14mr19266589wre.99.1613400976666;
        Mon, 15 Feb 2021 06:56:16 -0800 (PST)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id o13sm9359776wro.15.2021.02.15.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:56:16 -0800 (PST)
Date:   Mon, 15 Feb 2021 15:29:18 +0100
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net
Subject: Re: [PATCH v12 04/14] HID: nintendo: add home led support
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
 <20200823044157.339677-5-djogorchock@gmail.com>
In-Reply-To: <20200823044157.339677-5-djogorchock@gmail.com>
Message-Id: <2NXFET9DBYW87.2RVEYXFR0Z9DD@homearch.localdomain>
User-Agent: mblaze/1.1-4-g36df5fe (2021-01-22)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
>  drivers/hid/hid-nintendo.c | 69 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 65 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index adecd6790fe9..e5afe360c676 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -192,7 +192,8 @@ struct joycon_input_report {
>  struct joycon_ctlr {
>  	struct hid_device *hdev;
>  	struct input_dev *input;
> -	struct led_classdev leds[JC_NUM_LEDS];
> +	struct led_classdev leds[JC_NUM_LEDS]; /* player leds */
> +	struct led_classdev home_led;
>  	enum joycon_ctlr_state ctlr_state;
>  	spinlock_t lock;
> =20
> @@ -726,6 +727,40 @@ static int joycon_player_led_brightness_set(struct l=
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
> @@ -734,7 +769,7 @@ static const char * const joycon_player_led_names[] =3D=
 {
>  };
> =20
>  static DEFINE_MUTEX(joycon_input_num_mutex);
> -static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
> +static int joycon_leds_create(struct joycon_ctlr *ctlr)
>  {
>  	struct hid_device *hdev =3D ctlr->hdev;
>  	struct device *dev =3D &hdev->dev;
> @@ -771,7 +806,7 @@ static int joycon_player_leds_create(struct joycon_ct=
lr *ctlr)
>  		ret =3D devm_led_classdev_register(&hdev->dev, led);
>  		if (ret) {
>  			hid_err(hdev, "Failed registering %s LED\n", led->name);
> -			break;
> +			return ret;
>  		}
>  	}
> =20
> @@ -779,6 +814,32 @@ static int joycon_player_leds_create(struct joycon_c=
tlr *ctlr)
>  		input_num =3D 1;
>  	mutex_unlock(&joycon_input_num_mutex);
> =20
> +	/* configure the home LED */
> +	if (ctlr->hdev->product !=3D USB_DEVICE_ID_NINTENDO_JOYCONL) {
> +		name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name, "home");
> +		if (!name)
> +			return ret;

This should probably return -ENOMEM.

Cheers,

Silvan
