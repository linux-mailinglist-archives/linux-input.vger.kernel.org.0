Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A83931BB82
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 15:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhBOO4b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 09:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhBOO4Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 09:56:25 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EB8C061788
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:55:44 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id v1so9247128wrd.6
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent:mime-version:content-transfer-encoding;
        bh=3IwhbIIIdejbQGEdegGTxsSyNNv5FNjoiFZ4zuxpf6Q=;
        b=KZKzLqO8EDzJz0J8RdTDaob7XzmzOZ0QBZm+kyzne505fQUQIV2o08xU8l/lULOjfG
         r6TRISRtfAtpgEvJxcLIlH7Gfm603hyCuO4Wywk040GA8ORnlVpMp8MgMTfKa8WJLVAu
         OReHtP8+BK/zJP/+JcRjWr9cf0aQJUwQHVFSvuoM0GWgKWgh/D7V+KfLYZGlx6e9E2N5
         aFmByeUkJVwTXO7fBmmsZ4yadeJj4urcNABOp63f7fuG0ZsdjMEKyqAy49vyDqlCKd2l
         Kg0RaZiwntQ9W2XkhlZsH86If2ILD1FN9iFu8JOXd2oma2C4ThUe9GNhobW0lbTyIB6x
         XB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent:mime-version:content-transfer-encoding;
        bh=3IwhbIIIdejbQGEdegGTxsSyNNv5FNjoiFZ4zuxpf6Q=;
        b=EjwjAvvqny9Qc6JrxQYSs7weMI5o9RlZ3+76OZW6NAC4sMscs2sX+NjijaL3Wp36fl
         Ua0iRmMCWl4ZOBUM72GZRk21k8DeEWvYNbuqa5AN/HO02PZCZYtEYlajMRyyhAbR91Qk
         FzVOZ+C72pR6dlQClVG1KbCezNXFB0BEtvq/ExeLCn7CfV7gw04pBOlqg1PR0Rxu03iY
         dRaCG9rgJqqD2/QvrMtwTn33wZi89J7GZuwLIL9kMHKVzEFkcQJo2rWQzquJDr2UEklw
         on4qfbfHIn2HoGh33D3dnVp22yO8NPeMYOQizb3RDkqiFy6IH5crARETh2+Xmgr817nz
         BH2Q==
X-Gm-Message-State: AOAM5303DTf30VGj3QYXW9PqkzMHGFxuMLCWXX7jyDBuL3ClJvoD05Ss
        +r6qHNZWF3VK972kPY5cLpc=
X-Google-Smtp-Source: ABdhPJwpYU4PM8uKf5beCNRtnN/2xa0zV1q48L8f88wJo5UYT+cShHkS49al+wuzj5P/fL/eeZT71Q==
X-Received: by 2002:adf:b350:: with SMTP id k16mr19111033wrd.190.1613400943408;
        Mon, 15 Feb 2021 06:55:43 -0800 (PST)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id i8sm29982962wry.90.2021.02.15.06.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:55:43 -0800 (PST)
Date:   Mon, 15 Feb 2021 15:42:42 +0100
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net
Subject: Re: [PATCH v12 10/14] HID: nintendo: set controller uniq to MAC
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
 <20200823044157.339677-11-djogorchock@gmail.com>
In-Reply-To: <20200823044157.339677-11-djogorchock@gmail.com>
Message-Id: <3401O1XPEAHTM.22SVWJPNB6OUU@homearch.localdomain>
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
> This patch sets the input device's uniq identifier to the controller's
> MAC address. This is useful for future association between an IMU input
> device with the normal input device as well as associating the
> controller with any serial joy-con driver.
>=20
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 45 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index c2f7dc83d875..85870569cb49 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -319,6 +319,8 @@ struct joycon_ctlr {
>  	struct led_classdev home_led;
>  	enum joycon_ctlr_state ctlr_state;
>  	spinlock_t lock;
> +	u8 mac_addr[6];
> +	char *mac_addr_str;
> =20
>  	/* The following members are used for synchronous sends/receives */
>  	enum joycon_msg_type msg_type;
> @@ -1005,6 +1007,7 @@ static int joycon_input_create(struct joycon_ctlr *=
ctlr)
>  	ctlr->input->id.vendor =3D hdev->vendor;
>  	ctlr->input->id.product =3D hdev->product;
>  	ctlr->input->id.version =3D hdev->version;
> +	ctlr->input->uniq =3D ctlr->mac_addr_str;
>  	ctlr->input->name =3D name;
>  	input_set_drvdata(ctlr->input, ctlr);
> =20
> @@ -1317,6 +1320,41 @@ static int joycon_power_supply_create(struct joyco=
n_ctlr *ctlr)
>  	return 0;
>  }
> =20
> +static int joycon_read_mac(struct joycon_ctlr *ctlr)
> +{
> +	int ret;
> +	int i;
> +	int j;
> +	struct joycon_subcmd_request req =3D { 0 };
> +	struct joycon_input_report *report;
> +
> +	req.subcmd_id =3D JC_SUBCMD_REQ_DEV_INFO;
> +	ret =3D joycon_send_subcmd(ctlr, &req, 0, HZ);
> +	if (ret) {
> +		hid_err(ctlr->hdev, "Failed to get joycon info; ret=3D%d\n", ret);
> +		return ret;
> +	}
> +
> +	report =3D (struct joycon_input_report *)ctlr->input_buf;
> +
> +	for (i =3D 4, j =3D 0; j < 6; i++, j++)
> +		ctlr->mac_addr[j] =3D report->reply.data[i];
> +
> +	ctlr->mac_addr_str =3D devm_kasprintf(&ctlr->hdev->dev, GFP_KERNEL,
> +					    "%02X:%02X:%02X:%02X:%02X:%02X",
> +					    ctlr->mac_addr[0],
> +					    ctlr->mac_addr[1],
> +					    ctlr->mac_addr[2],
> +					    ctlr->mac_addr[3],
> +					    ctlr->mac_addr[4],
> +					    ctlr->mac_addr[5]);
> +	if (!ctlr->mac_addr_str)
> +		return -ENOMEM;
> +	hid_info(ctlr->hdev, "controller MAC =3D %s\n", ctlr->mac_addr_str);
> +
> +	return 0;
> +}
> +
>  /* Common handler for parsing inputs */
>  static int joycon_ctlr_read_handler(struct joycon_ctlr *ctlr, u8 *data,
>  							      int size)
> @@ -1495,6 +1533,13 @@ static int nintendo_hid_probe(struct hid_device *h=
dev,
>  		goto err_mutex;
>  	}
> =20
> +	ret =3D joycon_read_mac(ctlr);
> +	if (ret) {
> +		hid_err(hdev, "Failed to retrieve controller MAC; ret=3D%d\n",
> +			ret);
> +		goto err_close;

This should be err_mutex otherwise we don't unlock the mutex on
error. Note that a later patch changes the hid_err error format string
but the error is introduced here.


Cheers,

Silvan

> +	}
> +
>  	mutex_unlock(&ctlr->output_mutex);
> =20
>  	/* Initialize the leds */


