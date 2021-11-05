Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E2C446561
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 16:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbhKEPEg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 11:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbhKEPEg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 11:04:36 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59ECC061714;
        Fri,  5 Nov 2021 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HEBvWRg9S4l41qj5CuJ9xd8WUMjF45Gsh7boop/TI/8=; b=exjT7KNvOAVNQofMTz4xN+rh/+
        rghIpP6ikdGyFT05k2paeUz32XPxNsFZP5Um9+H1tYYr8q6EeyW+i9y/gHZuursjvbc9L5qFvwj/4
        dCTgxw8CD9KnvLvp0IUf5mCj+sAcNNGFtzOjYZrRzK8QLagQCyrl7DwGKNAI272patCA=;
Received: from p200300ccff0899001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff08:9900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mj0j2-0004v0-Kt; Fri, 05 Nov 2021 16:01:52 +0100
Date:   Fri, 5 Nov 2021 16:01:51 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mylene.josserand@free-electrons.com, linus.walleij@linaro.org,
        rydberg@bitmath.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        alistair23@gmail.com,
        =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 1/4] Input: Add driver for Cypress Generation 5
 touchscreen
Message-ID: <20211105160151.4d97d587@aktux>
In-Reply-To: <20211103114830.62711-2-alistair@alistair23.me>
References: <20211103114830.62711-1-alistair@alistair23.me>
        <20211103114830.62711-2-alistair@alistair23.me>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed,  3 Nov 2021 21:48:27 +1000
Alistair Francis <alistair@alistair23.me> wrote:

[...]
> +static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
> +			 const char *name)
> +{
> +	struct cyttsp5 *ts;
> +	struct cyttsp5_sysinfo *si;
> +	int rc = 0, i;
> +
> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return -ENOMEM;
> +
> +	/* Initialize device info */
> +	ts->regmap = regmap;
> +	ts->dev = dev;
> +	si = &ts->sysinfo;
> +	dev_set_drvdata(dev, ts);
> +
> +	/* Initialize mutexes and spinlocks */
> +	mutex_init(&ts->system_lock);
> +
> +	/* Initialize wait queue */
> +	init_waitqueue_head(&ts->wait_q);
> +
> +	/* Power up the device */
> +	ts->vdd = regulator_get(dev, "vdd");
> +	if (IS_ERR(ts->vdd)) {
> +		rc = PTR_ERR(ts->vdd);
> +		dev_set_drvdata(dev, NULL);
> +		kfree(ts);
> +		return rc;
> +	}
> +
> +	rc = regulator_enable(ts->vdd);
> +	if (rc) {
> +		regulator_put(ts->vdd);
> +		dev_set_drvdata(dev, NULL);
> +		kfree(ts);
> +		return rc;
> +	}
> +
> +	/* Reset the gpio to be in a reset state */
> +	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

        so we deassert reset for

> +	if (IS_ERR(ts->reset_gpio)) {
> +		rc = PTR_ERR(ts->reset_gpio);	
> +		dev_err(dev, "Failed to request reset gpio, error %d\n", rc);
> +		return rc;
> +	}
	
	almost no time 
> +	gpiod_set_value(ts->reset_gpio, 1);

        and then assert it, keeping the chip in reset
> +
> +	/* Need a delay to have device up */
> +	msleep(20);
> +
	and why it should wake up?

	I reversed the logic here to test. I have 

        reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;

	in my tests.

> +	rc = devm_request_threaded_irq(dev, irq, NULL, cyttsp5_handle_irq,
> +				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +				       name, ts);
        falling or level low (according to the example in the
        dt schema)?	

Regards,
Andreas
