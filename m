Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC7E613648B
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 02:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730362AbgAJBGl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 20:06:41 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35126 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbgAJBGk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 20:06:40 -0500
Received: by mail-pj1-f68.google.com with SMTP id s7so260760pjc.0;
        Thu, 09 Jan 2020 17:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wgAymSU4GWWjWhxlHOlcITs/f4MtVm2uBljOF9sEuhw=;
        b=tj5DcySslPYtzFN+mDGIAggLC+7tLFTNtdJF7FSrql2dWJWPrw2rp5th0QMCqQyuQN
         PVEHJkqbLUVGFlXDPDZ5PPuTBkfgyAO8L6mQaEPQewh8UwiZ5wcoDi6GzrfIgCjmjwsm
         jJyYXh3707hgboGrEB0o+VdVHgHGIyIAvx8p0E2o6NSVs5sZpSX9b1DawfTd3ALTBKkp
         /H5+UfJ5vrZA3smloXAge2Fas2a2bM6Z2cYp2lR05OwPAUg+9m0QH/5wJY5zghfH8yYt
         PxjhkwBNOCHBObHY56by9q4P6VealoUdRYhn7lHblvxTKhzqERMz18QjIEJz+WIs7cAO
         tULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wgAymSU4GWWjWhxlHOlcITs/f4MtVm2uBljOF9sEuhw=;
        b=HImGdojQPcNZXOZv6nU9oJhwetlWJSzBRqSPwfPBJsArOjJ3qBorzFSsehoagj9CVA
         bpegwONLyfpap6saX+WFgR4CpnArWqMGmMb1V7+UeebUp/J1tm6HmDefOtJS2uYNwII9
         fz7gWQp45wy8j0WfdFUOkg/Ms4bygj1FmwAYmk65/HMjPYR7DVSUgXx6ckEUQ149nO3u
         +YPLsgAy5iTHcGq3usIY2E/fZb5s2Q83dD0DZc/I2kKcaTRPr4T4QA1LE2po2MZXQv2l
         UE+JnBzF5s5sMcL5PMK4Xyp5hzbzV0xnRSqUfqoGaePufFeoe9efzVv9e8YwvSBd2tIK
         YRqw==
X-Gm-Message-State: APjAAAUerQTUiWIPJArs3rFPVwJBErNHInllKEfg3eiQ+eKmzOS9Y2fU
        QwyPuGtDRrgfHqAvtvi//A8=
X-Google-Smtp-Source: APXvYqwHDxkeJWKviF+1fsZRZSIg5ohwWr65zCTkM6FqKDb/4B5OHCMKXIyJNmHt8pKIhap4V4E01A==
X-Received: by 2002:a17:902:a9ca:: with SMTP id b10mr954173plr.23.1578618399877;
        Thu, 09 Jan 2020 17:06:39 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g10sm168649pgh.35.2020.01.09.17.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 17:06:39 -0800 (PST)
Date:   Thu, 9 Jan 2020 17:06:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 1/6] Input: edt-ft5x06: work around first register
 access error
Message-ID: <20200110010637.GK8314@dtor-ws>
References: <20200108111050.19001-1-m.felsch@pengutronix.de>
 <20200108111050.19001-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108111050.19001-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 08, 2020 at 12:10:45PM +0100, Marco Felsch wrote:
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
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thank you.

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
