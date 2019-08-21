Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801C3979AF
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 14:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfHUMj4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 08:39:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39502 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfHUMjz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 08:39:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id x4so1986743ljj.6
        for <linux-input@vger.kernel.org>; Wed, 21 Aug 2019 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EOXeww4Uf23e729rTkwuQA6wyzC7c2QQQGmkeXPLo0s=;
        b=Jpo+UUhhwNEh5NQqmY1XLcyj6evZPbxS2DCMO+HxFkYjq8WNxh3hFd/yV1XYrNmYcb
         ZLDiCGIKgp0IFxh9WLkzoYmVaWOPjmd58Snr5QS6enSkUl7A2AVzCQVVbHZ5J+jz2FaS
         ax9U7aK2r65fEdITgKNKZqNodoCxWNAUCYN1tsPQaj4yXKtrbe6pJpCdAXdr7APQJ64r
         3hI+GbcjaiVgP3zwozN5plL4gFhhxts0sv6sa40tTcj3kq6Ho+fa2S2QTlKjbsZ386h6
         yCV5GvczH9rTA+P6PmTCzUMmlkeuwx0PPUJHwbkTPtWiqDolJb3ogoy6vUGG3mjU9ox5
         DS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EOXeww4Uf23e729rTkwuQA6wyzC7c2QQQGmkeXPLo0s=;
        b=GbuthzzO+k+b7H7X16T3npWyhMfZ/FR2JniH/GRrLYhWyhJhXsYwMqT6m1VGHE6In/
         SiTn71Fu3ml9eFx5BfDd2dTsYoeBUY094Mfuak1w4c1pDfYPPkYJMZOsAdYxbNOXBhaL
         BKsC8oZ9D5K7Ywn6inZQWrhtAR6x2WzFutLa1ktN7GKEJ/8Mha6l/ZLww9hODnG7t33X
         DB/eMoovZu9OxtFiNaLX/LD4F6FQ9m06zqRjNtPUmBeK4A27t/tIC5XgXsqWQ8KRNJTC
         4AvQuIA2CJ7UzRZgwJdQ4jYLr4+gaa36hxbEME3jfuh2i+Ho0iBJqfBNGjOSfrSzaOXV
         tnHg==
X-Gm-Message-State: APjAAAWRPLR8j0CuTrgh06e7n03fyb8YLe1N3w0vhtQ4SLw81mKwGg49
        ++SLEuD8ToE1mTqkGbMrw3omMGWvmhzBZ7yVSWyMdA==
X-Google-Smtp-Source: APXvYqwYkTNtKtafkV5aDsc60HSbv1wFMSkUnoyPW7zeXom6XswAJiHhBvDIFeVFr0Oqt3b6NefTIPLpC7TWMseP0BQ=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr18892987ljo.69.1566391193787;
 Wed, 21 Aug 2019 05:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 21 Aug 2019 14:39:41 +0200
Message-ID: <CACRpkdZo9so+5UoT3QpFmL_8NZT1d1i7Yab202RNn8gDfnPK7A@mail.gmail.com>
Subject: Re: [PATCH 00/11] Face lift for bu21013_ts driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 10, 2019 at 2:20 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> So your patch has prompted me to take a look at the driver and
> try to clean it up. I am sure I screwed up somewhere, but you said
> you have the device, so please take a look at the series and
> see if you can salvage them

I will funnel patch 1/11 in the ARM SoC tree.

The rest work fine except on the resource release in the error path. I had
to do this:

diff --git a/drivers/input/touchscreen/bu21013_ts.c
b/drivers/input/touchscreen/bu21013_ts.c
index c89a00a6e67c..bdae4cd4243a 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -390,18 +390,18 @@ static int bu21013_init_chip(struct bu21013_ts *ts)
  return 0;
 }

-static void bu21013_power_off(void *_ts)
+static void bu21013_power_off(void *data)
 {
- struct bu21013_ts *ts = ts;
+ struct regulator *regulator = data;

- regulator_disable(ts->regulator);
+ regulator_disable(regulator);
 }

-static void bu21013_disable_chip(void *_ts)
+static void bu21013_disable_chip(void *data)
 {
- struct bu21013_ts *ts = ts;
+ struct gpio_desc *gpiod = data;

- gpiod_set_value(ts->cs_gpiod, 0);
+ gpiod_set_value(gpiod, 0);
 }

 static int bu21013_probe(struct i2c_client *client,
@@ -488,7 +488,8 @@ static int bu21013_probe(struct i2c_client *client,
  return error;
  }

- error = devm_add_action_or_reset(&client->dev, bu21013_power_off, ts);
+ error = devm_add_action_or_reset(&client->dev, bu21013_power_off,
+ ts->regulator);
  if (error) {
  dev_err(&client->dev, "failed to install power off handler\n");
  return error;
@@ -505,7 +506,7 @@ static int bu21013_probe(struct i2c_client *client,
  gpiod_set_consumer_name(ts->cs_gpiod, "BU21013 CS");

  error = devm_add_action_or_reset(&client->dev,
- bu21013_disable_chip, ts);
+ bu21013_disable_chip, ts->cs_gpiod);
  if (error) {
  dev_err(&client->dev,
  "failed to install chip disable handler\n");


I think this is because when probe() fails it first free:s the devm_kzalloc()
allocations, so the ts->foo will result in NULL dereference.

If I just reference the gpio desc or regulator directly like this in the
callback, things work fine.

With these changes:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
