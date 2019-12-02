Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C0010EED3
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 18:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbfLBR66 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 12:58:58 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45938 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfLBR66 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 12:58:58 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so5226pfg.12;
        Mon, 02 Dec 2019 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I2r9GGwhu0ecjN/iGQeTtiEKpNfDAuaVRlA5BO+emlQ=;
        b=JiBmkwct6vqGo1tZ6PvRfHIUM9iZAYv0wmmR873Ab/HW1ySx9nA7frGg30O38OMpr/
         hRcJ3gIhMtqBpgpTRNpB61+qIgSwqpvgpvTC+7MSg1hU5MJYzWHqWNDa82butmz+68JW
         XwRdKYiWK9sx2rSakst1Nich26O20N9K0kndQYIoGhigVxnTmtUmYJcPumnyOmyQVT8s
         CC25pfA69DsppCXynw68JWhk3GW1n+DbwuY+eYTzhnlZf6ZHNQ4GXGk86gCIc5zzCLq5
         3sunc/W33gBm1N2kLRVOFYdQQWu16stSZxOFTsCun3w0fkBBQ9rSlgyFWYnhPp66LgbO
         7Wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I2r9GGwhu0ecjN/iGQeTtiEKpNfDAuaVRlA5BO+emlQ=;
        b=kZZseGqEqpkBPVcnMf2MSqtjje2mrSwOKK4eiuBypmC5yPJVkr5WfEVbgKmHvzP4eB
         PcqjMAaGRHfmvhEKXxh/CZfeC0Op6LJuAHqf3tCx599qJq6BzVs4oXYidbKN3pAmioFy
         zrSdhdfmUmlvkp7W2UbjcC4mcSIF2jvOphTbPtP1dTEDCkA4gdLpoT67hexncul6Fz7N
         F6U/7T4VMEi38GHy9NyQ9tte7HIoXNc9f4qLAtQO0DNGTp1IwS8KkxNwI5HSMXjB3IpR
         yQeCKoDpYiswN4SUTg5y52s+UlEi2ae3qHmT9hp1jgtwZKyyR5xly7fNSiMiI+HYoxbG
         Bu5Q==
X-Gm-Message-State: APjAAAUtP/ISIQz7C23z5wt+ierTF465KpaGFYjd13OjBVyzply3AN0K
        da4RmDtc/RmzF3t1NvqYdeGZWG1R
X-Google-Smtp-Source: APXvYqzsH5uNs6kRhFzOzbUBHxUbqMNtiZuSauoSmTcPy6yoH3+fYzbRfmZa5+CmTCAHVIZZIDLInA==
X-Received: by 2002:a62:ac15:: with SMTP id v21mr16352302pfe.48.1575309537233;
        Mon, 02 Dec 2019 09:58:57 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f81sm113886pfa.118.2019.12.02.09.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 09:58:53 -0800 (PST)
Date:   Mon, 2 Dec 2019 09:58:51 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 1/5] Input: edt-ft5x06: work around first register
 access error
Message-ID: <20191202175851.GB50317@dtor-ws>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
 <20191127120948.22251-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127120948.22251-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 01:09:44PM +0100, Marco Felsch wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>
> 
> The EP0700MLP1 returns bogus data on the first register read access
> (reading the threshold parameter from register 0x00):
> 
>     edt_ft5x06 2-0038: crc error: 0xfc expected, got 0x40
> 
> It ignores writes until then. This patch adds a dummy read after which
> the number of sensors and parameter read/writes work correctly.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Need your signed-off-by as well.

> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index d61731c0037d..b87b1e074f62 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -1050,6 +1050,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  {
>  	const struct edt_i2c_chip_data *chip_data;
>  	struct edt_ft5x06_ts_data *tsdata;
> +	u8 buf[2] = { 0xfc, 0x00 };
>  	struct input_dev *input;
>  	unsigned long irq_flags;
>  	int error;
> @@ -1140,6 +1141,12 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> +	/*
> +	 * Dummy read access. EP0700MLP1 returns bogus data on the first
> +	 * register read access and ignores writes.
> +	 */
> +	edt_ft5x06_ts_readwrite(tsdata->client, 2, buf, 2, buf);
> +
>  	edt_ft5x06_ts_set_regs(tsdata);
>  	edt_ft5x06_ts_get_defaults(&client->dev, tsdata);
>  	edt_ft5x06_ts_get_parameters(tsdata);
> -- 
> 2.20.1
> 

-- 
Dmitry
