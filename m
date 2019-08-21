Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88C879819F
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 19:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfHURnC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 13:43:02 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39050 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbfHURnB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 13:43:01 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so1719398pgi.6;
        Wed, 21 Aug 2019 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vktIy0TSpcc19xMgGhdmnbgjHLgZeK7LsjqhPmlI8NA=;
        b=HC+Mkk1Gu5eqrSDBCAP1AC8nVrNBDGWMHYW0UG5D2H0nUYL01dzEJxukIVG2IFJhrc
         HuINwtp38jH0me3cQsyAzE60qaOueL2lZeC+Z986GiSnFW6kob/mLDu2/xWjhISPeBxc
         Y/kKeQuhRExBM/XqGAWFzPjjoMeNu1HziYtwe9WkYgWUqtGCS8/39MObCoh92hYcaTdB
         XiaatTDjur/uqvWaVHQ4fbFvCyrY8fizW1OTOpFVJVgKl5COfOvObzIbopgZAHi34wgb
         BT4HEsRQzUc5OxMnncXJdJWg+UMrNE4Jscm6IK2r+q2940b+pK0u/YxOupaqkX4G10U7
         PIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vktIy0TSpcc19xMgGhdmnbgjHLgZeK7LsjqhPmlI8NA=;
        b=EYJtjRoOCi/n9Iml4KE/XUSI/csnu5reaQxy9++TdypuD9qfNzY0EeYFGGRYzmwKlY
         UUVzpGXKuFDv8w5IU9vOVFUP4QsuMrTcSwk/r+AB9v75gNeuFFQ3Rr7tbr1WYbfveqip
         7nPthkBRHgDhXpyhqXPBhdl9qN0KfuPM/AQrtH+07rPospcgcuguZjCQV2m+B9vOmXEB
         MPwTq0x3Di7U0YpKTRrhCT/ifHb8ITXeKIWz81Cg2yzjx9RS/1WoEWE3Hzj5fY6jHkii
         9mG6qMjdWOWsqogJTTw0cqtSGsMBYg0XV+Q4pxeZjsh2IrsyGqqv04xuys9uQWFSwhYZ
         0dAQ==
X-Gm-Message-State: APjAAAXHfpnEHfZMiCDe9wBciRN3oqIQPnJXNgLyOZG7zZXGr0y/pVvp
        6XtIDQxaOHKtgTykIMqanwQ=
X-Google-Smtp-Source: APXvYqxB4symrJgN/ySME/vlU0HGxs+7dIxhVZIbQD1KUlklUkDhYk8DKAvofJiv2EWpwvoHK1f65Q==
X-Received: by 2002:a63:7c0d:: with SMTP id x13mr29953004pgc.360.1566409380239;
        Wed, 21 Aug 2019 10:43:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j187sm34085941pfg.178.2019.08.21.10.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 10:42:59 -0700 (PDT)
Date:   Wed, 21 Aug 2019 10:42:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/11] Face lift for bu21013_ts driver
Message-ID: <20190821174257.GC76194@dtor-ws>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
 <CACRpkdZo9so+5UoT3QpFmL_8NZT1d1i7Yab202RNn8gDfnPK7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZo9so+5UoT3QpFmL_8NZT1d1i7Yab202RNn8gDfnPK7A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 21, 2019 at 02:39:41PM +0200, Linus Walleij wrote:
> On Sat, Aug 10, 2019 at 2:20 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > So your patch has prompted me to take a look at the driver and
> > try to clean it up. I am sure I screwed up somewhere, but you said
> > you have the device, so please take a look at the series and
> > see if you can salvage them
> 
> I will funnel patch 1/11 in the ARM SoC tree.
> 
> The rest work fine except on the resource release in the error path. I had
> to do this:
> 
> diff --git a/drivers/input/touchscreen/bu21013_ts.c
> b/drivers/input/touchscreen/bu21013_ts.c
> index c89a00a6e67c..bdae4cd4243a 100644
> --- a/drivers/input/touchscreen/bu21013_ts.c
> +++ b/drivers/input/touchscreen/bu21013_ts.c
> @@ -390,18 +390,18 @@ static int bu21013_init_chip(struct bu21013_ts *ts)
>   return 0;
>  }
> 
> -static void bu21013_power_off(void *_ts)
> +static void bu21013_power_off(void *data)
>  {
> - struct bu21013_ts *ts = ts;
> + struct regulator *regulator = data;
> 
> - regulator_disable(ts->regulator);
> + regulator_disable(regulator);
>  }
> 
> -static void bu21013_disable_chip(void *_ts)
> +static void bu21013_disable_chip(void *data)
>  {
> - struct bu21013_ts *ts = ts;
> + struct gpio_desc *gpiod = data;
> 
> - gpiod_set_value(ts->cs_gpiod, 0);
> + gpiod_set_value(gpiod, 0);
>  }
> 
>  static int bu21013_probe(struct i2c_client *client,
> @@ -488,7 +488,8 @@ static int bu21013_probe(struct i2c_client *client,
>   return error;
>   }
> 
> - error = devm_add_action_or_reset(&client->dev, bu21013_power_off, ts);
> + error = devm_add_action_or_reset(&client->dev, bu21013_power_off,
> + ts->regulator);
>   if (error) {
>   dev_err(&client->dev, "failed to install power off handler\n");
>   return error;
> @@ -505,7 +506,7 @@ static int bu21013_probe(struct i2c_client *client,
>   gpiod_set_consumer_name(ts->cs_gpiod, "BU21013 CS");
> 
>   error = devm_add_action_or_reset(&client->dev,
> - bu21013_disable_chip, ts);
> + bu21013_disable_chip, ts->cs_gpiod);
>   if (error) {
>   dev_err(&client->dev,
>   "failed to install chip disable handler\n");
> 
> 
> I think this is because when probe() fails it first free:s the devm_kzalloc()
> allocations, so the ts->foo will result in NULL dereference.

No, the release is done in opposite order of acquiring resources,
anything else would be madness and would not work.

The issue is this:

static void bu21013_disable_chip(void *_ts)
{
	struct bu21013_ts *ts = ts;

which shuts up gcc about the fact that 'ts' is uninitialized, it should
have said "ts = _ts". I guess it is a lesson for me to not call the voi
d pointer argument almost the same name as the structure, as it is easy
to miss in the review. The compiler would not care in either case, but a
human might have noticed.

Can you please try making this change (and the same in power off
handler)?

Thanks.

-- 
Dmitry
