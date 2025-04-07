Return-Path: <linux-input+bounces-11553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A4A7D64F
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 09:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769484216CE
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 07:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D743223E25B;
	Mon,  7 Apr 2025 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EzwlF5jE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4145A23CF12
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010722; cv=none; b=gNdLg+l+IxvnXJIFgmQU7xec3vwMhdgR85Ia2ZC+OStZWy2kdpL9qJ2YZBzrqSrapr8JnF/Q1n0Tv4y47TR6pFsI4+g/uhr6yaBPpe8ZxMImWTiq+8cmpwhR6twEh1/IxRis2GlhuOEfNd5ffMG2869+aamFIcWA8zvZlFK0ZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010722; c=relaxed/simple;
	bh=Q2hvduva6KqQkHASyRGukCcsvLKULC9rmnwEVzjrJTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oAneQ+Ghi6hshizZcXmiizAREYwp5jhYiJEXCvsHEYCgE8CVDrP5B+Zduf9dji5fa4fGgLKkcIQYAdz0P8Yr/+JRHjKgagmJlKANJPGgLQhAoM3uQ4ARi2mEMdIsxqfhkSm66r7EiUbOt7Nklh/eCqAlsfjT60divPxiOTV0fKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EzwlF5jE; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso7876749a12.0
        for <linux-input@vger.kernel.org>; Mon, 07 Apr 2025 00:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010719; x=1744615519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibROZn0IFJz5QzV4WaY8wi22jP2cRYC3gjXYgtkdD7g=;
        b=EzwlF5jEVGWVCn3Y5bgBpDUe43uqdtPNOlVD0i16T2RRv+3Lh+KnWrCrAfi3Atj+Yx
         Cm06UUWJ013OBaec7uyecDo937OwwI1gDGSGvUPm6QAGFtzxsE33dCy3dnITN4VD1BIL
         8q6fvDmVyuQrCjqZMStLX0HgfZYCWj9AME0NtvRc6b81EZdq0mM0c3Bwu/cF7TEjZO0X
         EGtgtSXCimLDppbiDQM4gbg2hMPXYiyiw/VBhMw4DcF67mPLg7ckcYDbP2HE3Mx+GDFS
         epiUumE9E76arqbb92dKWZW+NfvoEn0GMLh4JLHh30sC3wpgzQCsuPkIEVZ5yHXQkG3d
         Ixow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010719; x=1744615519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibROZn0IFJz5QzV4WaY8wi22jP2cRYC3gjXYgtkdD7g=;
        b=PH2jhDtL9iG4ibSS6TLbrXXpJBdl+SW6l4TmhpuiAPNAMk4OBNcu7M2Go7q6Hsi192
         QZUpQhUsaASJ4XAQ/YbGs+davMXX1AF0BjSuMl1VN+KeBRp9c9wHri8IFUz6OsQb+VCM
         Y5nXBwejYS/TvP237mpsQRPIhEdXfC8MECYf60xFJ4UQtdvZNH0ZUdpAqrZFpKifO5ef
         vf/NeZuS16AtX+aj8FuLGT+SAaceerMadMF3uH8Z7AZoIGlc4fCAy2R2W36k5Q7U8HOW
         oxC98p7LJsO/HSvLle/i+3XrfjoXNVhbXwocjnk2gz3DMxpsK3Eko7attudXZKHwbdaE
         Qv3g==
X-Gm-Message-State: AOJu0YwC2hPRem39mJH/VGXUbmSdupQAULi5l/Ex9CIUfa+EzMEWlRyL
	lytiWYXrDwzUPvI9YxIAB3PJu/Wk6SGLKdrCilmOrFnNUrlg2an2GAxwYW8HmslP1dwNWafzkFw
	28/o=
X-Gm-Gg: ASbGncuFmYyFbaW8fWYQR7tuegdXRFw8uOe6qKza0hxPA3znHTd/SLCDMhFC/0bukxA
	kg4soLSkys39bwG9CMlBxdwBcpX912Qw5vK7MSyf6IDmLnt5lMXER4yivUpE8Q8QBHgsUHaZJhz
	D/b5kYYTVAhaWOGGdzrRugk/iQZs2JXT6YzIEoE/2iOa67owgcjb73co3OS1xbXOwy4M0B3u4pn
	21bBQu+wV8+fr0+eUMpDfsYQWX6K9hNURT5/xKDTFjH2T+sD7SKROvUN3nvfFTEvlYw4i4yCx21
	l4A2dJFeBeMcDNt1DVStZeydnwBksYz7QYGegE26rTnY+iRU
X-Google-Smtp-Source: AGHT+IEkHVJgOyU9xGp655NX5EHCzYygkvYDzVBi2Npjvs/0OWrQOPdns3JjSlF95Cj2KJnmKf8UhA==
X-Received: by 2002:a05:600c:198b:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-43ecfa0572cmr131452905e9.30.1744010353699;
        Mon, 07 Apr 2025 00:19:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:19:10 +0200
Subject: [PATCH 1/3] Input: ad7879 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-input-v1-1-a8b45b18e79c@linaro.org>
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=foyELHbizbcWk/j9r8xiniRZm26jVuqeFRwl7mGDslU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83xvMsVuyrAN8UuFJvWiCgwJIhVanOjs5RyNU
 f6v6R7ldHKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 cjBhEADJTqfjnpnZK+R+cF6dWcfSD6GmueJNC9Q1SYVFVHW+TQvc3mi2GfaIHJIqqkmrqMSa7VV
 LWzNtodZD6j9I49JZvliGWrbph/MS2MniyULfTw/GMwmhPwZYpi9g5+4cwopCvfPbMUouldhvUO
 cp8vdggCPeBpOaWx/AmYIEeSB/Oy8RofO4vsuvh5/elW3GueigH8vQlas2CQYBndd0kk8OEgdZY
 e4/wFB5pNg5mKqxB7byMuFhmkDtdSEHWP+O1H5+66MQVXNJU/Iy++0DvU1fQJZumxIZxQPIFXCb
 k9yOgd6MtU4N3gcM5dtjsIt+BIVmmn+VDbGrlIvJrk6AmyD0JdtgwDITtnWE5BQTCLkbDtZXM8b
 q+B+ct9iHNr54/R3EPgziIWcCf7cW/FrGqWZE2g3gq/NVmo42KTfZxcY6L6BfW+N6QlI2UtiThG
 62dx7KHW75jBQTWMU1nC6IX+5KC4S6XtY881B8phngJLNcmh3c9itLogh95f229if6u/ktqZIBK
 Mh9Tx8iQMLEyFE383FA6SQQYC2gghSl7zYDqqw5QZmdGbjpEaufAfPbZmRQC9a8pwGE/Dbf8Y1D
 W+9NBHCzUnLCeJtFZlh9Li4FwhHBoRNA1DbM1nJwK+1Br8ruCTsUWJ0mSgmUTC0INmrSfQsN5F6
 wJFGm3Ml2SPjJdg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/touchscreen/ad7879.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
index f661e199b63c..12fc39f9e784 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -444,10 +444,11 @@ static int ad7879_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & AD7879_GPIO_DATA);
 }
 
-static void ad7879_gpio_set_value(struct gpio_chip *chip,
-				  unsigned gpio, int value)
+static int ad7879_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+				 int value)
 {
 	struct ad7879 *ts = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&ts->mutex);
 	if (value)
@@ -455,8 +456,10 @@ static void ad7879_gpio_set_value(struct gpio_chip *chip,
 	else
 		ts->cmd_crtl2 &= ~AD7879_GPIO_DATA;
 
-	ad7879_write(ts, AD7879_REG_CTRL2, ts->cmd_crtl2);
+	ret = ad7879_write(ts, AD7879_REG_CTRL2, ts->cmd_crtl2);
 	mutex_unlock(&ts->mutex);
+
+	return ret;
 }
 
 static int ad7879_gpio_add(struct ad7879 *ts)
@@ -472,7 +475,7 @@ static int ad7879_gpio_add(struct ad7879 *ts)
 	ts->gc.direction_input = ad7879_gpio_direction_input;
 	ts->gc.direction_output = ad7879_gpio_direction_output;
 	ts->gc.get = ad7879_gpio_get_value;
-	ts->gc.set = ad7879_gpio_set_value;
+	ts->gc.set_rv = ad7879_gpio_set_value;
 	ts->gc.can_sleep = 1;
 	ts->gc.base = -1;
 	ts->gc.ngpio = 1;

-- 
2.45.2


