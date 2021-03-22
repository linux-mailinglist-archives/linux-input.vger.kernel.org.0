Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF1434456A
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 14:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhCVNSm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 09:18:42 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47329 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230299AbhCVNQr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 09:16:47 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 29B1B5C013A;
        Mon, 22 Mar 2021 09:16:47 -0400 (EDT)
Received: from imap8 ([10.202.2.58])
  by compute1.internal (MEProxy); Mon, 22 Mar 2021 09:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm3; bh=Q3lhQzUVNRpT0WVcy0osqEdXHCEu
        JqKRN3r8YPhYJwc=; b=dy2RzWeAsdsTMUAAyE0U2TQJGAPMmJ6EYS6gxLJje1ZN
        SGb0LZsJlhzlp3SUVYyKfMlkuj68Ku3hxlHE+LgShM9RihaZc0TJedgs3aeJmfzm
        imkx9Er02ypDqLOsUdorkZd81jDcomO+RLO0jqxRKp0iIUjxg8mFxWCUaoKkOVnY
        34Uu3s4d2OoAKxUcxeSYIufaIAO01SBbR+wR6qhG90MBCTxogx5mKUejdpzAPpaU
        hzdErJ8fksUS9BQOs2JgvlHySkB6zAC3sY7N7jyLYyU0/3aDy6ZGyismYPf9R4Fc
        Hrsr35HojCg6YYe6AzKMb+7a6/GGfK4E6knM6usrGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Q3lhQz
        UVNRpT0WVcy0osqEdXHCEuJqKRN3r8YPhYJwc=; b=LRkKODN2PtIs7T5fZkLaTR
        UhcjcjjgvJzvF5LaKsFfz8uP6CLh5uQaGhjbztgkFhr2fJmg8R0/WUpD79Y8OTBd
        DDSR/YHL3GmNK9SsYlqY/BOsK3G+UgFQ9Bl+ZhThpilrPkxVRezPBzr0MtCf9NRC
        YIdwAEIQepcL2CartsR1hRlYw8cBmEbR5pwTIFnMGTe9vPxcan7rUfxBe0Vqt450
        m0ZCafiZQ3ZUvMqGm0BgXOcCgXWiZPh6IrUGrBddwb0kUu7Rhk0/5WH5z0QFH4X4
        n1ATk5XFKuUepeq+B3f9/z7kiUhhkqbqdHA8LK6u8GjFGYHq33z6eWtO0amAogtA
        ==
X-ME-Sender: <xms:v5hYYE6DkQijIz-Dwfdy0cgnHas_zhzux5zy1lllhyIpCIYtyqNmtg>
    <xme:v5hYYF4Yy1k3okQf_lWeC-Ez2BjxbLuCpqm-RyaiELNKyaVo_pt1u-JlGbf_wfd2H
    5HKDGfZ1s8cRpT29is>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomheptehlihhs
    thgrihhruceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrg
    htthgvrhhnpeeuffekveehjeeltdeuveeikeelkeejhfejheduhfdtgfdtgfejjeekvdev
    jeevueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:v5hYYDcsZqWFTTn_L1DDlbVqjXAk1SXi6T4OjYHd1zk0blm71BDgcw>
    <xmx:v5hYYJKp0fGdQFaCHmpx3i8CQZh7Ds9gGWTeH_NEJ1Db_J2vtLwKHw>
    <xmx:v5hYYIIjen-oZNxwc7k5QONKIV_coVOBRLDt6vMWYPGRdAYUOmpeZA>
    <xmx:v5hYYPm4qg73hz__KM-NawU9I5V8ntqS8NkjL-uL1e78GCefkUbFJA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 01DB13A0721; Mon, 22 Mar 2021 09:16:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-271-g88286cf463-fm-20210318.001-g88286cf4
Mime-Version: 1.0
Message-Id: <efb0d63c-3d4a-4571-a988-e981f21a6628@www.fastmail.com>
In-Reply-To: <20210321220043.318239-2-dmitry.torokhov@gmail.com>
References: <20210321220043.318239-1-dmitry.torokhov@gmail.com>
 <20210321220043.318239-2-dmitry.torokhov@gmail.com>
Date:   Mon, 22 Mar 2021 09:14:57 -0400
From:   Alistair <alistair@alistair23.me>
To:     "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] Input: wacom_i2c - switch to using managed resources
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 21, 2021, at 6:00 PM, Dmitry Torokhov wrote:
> This simplifies error unwinding path and allows us to get rid of
> remove() method.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com <mailto:dmitry.torokhov%40gmail.com>>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
> drivers/input/touchscreen/wacom_i2c.c | 55 +++++++++------------------
> 1 file changed, 17 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 609ff84e7693..22826c387da5 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -145,15 +145,16 @@ static void wacom_i2c_close(struct input_dev *dev)
> }
>  
> static int wacom_i2c_probe(struct i2c_client *client,
> -      const struct i2c_device_id *id)
> +    const struct i2c_device_id *id)
> {
> + struct device *dev = &client->dev;
> struct wacom_i2c *wac_i2c;
> struct input_dev *input;
> struct wacom_features features = { 0 };
> int error;
>  
> if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> - dev_err(&client->dev, "i2c_check_functionality error\n");
> + dev_err(dev, "i2c_check_functionality error\n");
> return -EIO;
> }
>  
> @@ -161,21 +162,22 @@ static int wacom_i2c_probe(struct i2c_client *client,
> if (error)
> return error;
>  
> - wac_i2c = kzalloc(sizeof(*wac_i2c), GFP_KERNEL);
> - input = input_allocate_device();
> - if (!wac_i2c || !input) {
> - error = -ENOMEM;
> - goto err_free_mem;
> - }
> + wac_i2c = devm_kzalloc(dev, sizeof(*wac_i2c), GFP_KERNEL);
> + if (!wac_i2c)
> + return -ENOMEM;
>  
> wac_i2c->client = client;
> +
> + input = devm_input_allocate_device(dev);
> + if (!input)
> + return -ENOMEM;
> +
> wac_i2c->input = input;
>  
> input->name = "Wacom I2C Digitizer";
> input->id.bustype = BUS_I2C;
> input->id.vendor = 0x56a;
> input->id.version = features.fw_version;
> - input->dev.parent = &client->dev;
> input->open = wacom_i2c_open;
> input->close = wacom_i2c_close;
>  
> @@ -194,12 +196,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  
> input_set_drvdata(input, wac_i2c);
>  
> - error = request_threaded_irq(client->irq, NULL, wacom_i2c_irq,
> -      IRQF_ONESHOT, "wacom_i2c", wac_i2c);
> + error = devm_request_threaded_irq(dev, client->irq, NULL, wacom_i2c_irq,
> +   IRQF_ONESHOT, "wacom_i2c", wac_i2c);
> if (error) {
> - dev_err(&client->dev,
> - "Failed to enable IRQ, error: %d\n", error);
> - goto err_free_mem;
> + dev_err(dev, "Failed to request IRQ: %d\n", error);
> + return error;
> }
>  
> /* Disable the IRQ, we'll enable it in wac_i2c_open() */
> @@ -207,31 +208,10 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  
> error = input_register_device(wac_i2c->input);
> if (error) {
> - dev_err(&client->dev,
> - "Failed to register input device, error: %d\n", error);
> - goto err_free_irq;
> + dev_err(dev, "Failed to register input device: %d\n", error);
> + return error;
> }
>  
> - i2c_set_clientdata(client, wac_i2c);
> - return 0;
> -
> -err_free_irq:
> - free_irq(client->irq, wac_i2c);
> -err_free_mem:
> - input_free_device(input);
> - kfree(wac_i2c);
> -
> - return error;
> -}
> -
> -static int wacom_i2c_remove(struct i2c_client *client)
> -{
> - struct wacom_i2c *wac_i2c = i2c_get_clientdata(client);
> -
> - free_irq(client->irq, wac_i2c);
> - input_unregister_device(wac_i2c->input);
> - kfree(wac_i2c);
> -
> return 0;
> }
>  
> @@ -268,7 +248,6 @@ static struct i2c_driver wacom_i2c_driver = {
> },
>  
> .probe = wacom_i2c_probe,
> - .remove = wacom_i2c_remove,
> .id_table = wacom_i2c_id,
> };
> module_i2c_driver(wacom_i2c_driver);
> -- 
> 2.31.0.rc2.261.g7f71774620-goog
> 
> 
