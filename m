Return-Path: <linux-input+bounces-11551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A4A7D5AF
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 09:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0602A16DBF7
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 07:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BF822ACFA;
	Mon,  7 Apr 2025 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jIUPdJvK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED1A227EA0
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010363; cv=none; b=fq6T5KjxPTAMvM5/lmb+N9ObCxXdLl0MevWfoFesUj1I6v3D+s8brfxpMtkY2IDxO6nb0O1vFzphGE9iG/CIol+Q4CDQ+P/dZpUhnFXWNYoGnBGiTKjqg7FJ4oRWEe59vje4mXHKOUBReCvXtKLXG2RFrsGjhlO8QQsBNw8OHVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010363; c=relaxed/simple;
	bh=+deuLPSQkEJHMd1oN95jU1WrKRZsQUmYNkgMgUdiHfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQ7GX5VvZdllaWqz5dnEfdeArWugn2buF47wr6l2Ll/b48XUWuWZQTLxnuUecgPRSsj5UPTDfzHjraEk9NphAIY5WcwjLVjFZS8eHi+j2RfH+cQfF+12xIUt5szpGf7W1kWU74lwfMZTFSt/p+KD2Hi11ZG1PGM1G4fZ34kMDf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jIUPdJvK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso36793195e9.2
        for <linux-input@vger.kernel.org>; Mon, 07 Apr 2025 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010360; x=1744615160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChXOA9p44Ws7ALTa8sIdL/yKUHK+mgWVc1wgenfZZQc=;
        b=jIUPdJvKW0zUaPcv6jYIZw9bUSZquBFCMgkXHCx/MOgbnwdqQXYqyQrvhSGV4Ny7ok
         e7qn0XOQzKLGR1Y2S/6ndt86fL9U1lL2Ur40pRuviqyLY5KxDkoFy0wt3pPPWOsqPWIp
         arVdaRnskhRO+VMxRTmVj9yqmWDG7EBmgsxEGCAJGkXeJXrVOH6D1JY+YRhGfveb2tTv
         3aq3M0rSucHP98Fn2QJEHoodNU/eyuoXmm8EAyAaabILY9meQtHJk2lNLubbWQsmINHd
         Ky54dUmKDMiFkErbacL3gPvkhw61eshYf0WDU3p4/9B6KTka+UQ8UMeaxwLqkEHHMfBR
         2efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010360; x=1744615160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChXOA9p44Ws7ALTa8sIdL/yKUHK+mgWVc1wgenfZZQc=;
        b=s4e9yUKKZQLACCCXCcVZ5CFz2WBfyaq1ElwQRY7w4E22nAlD1isY1RgqQxSz2QDxhU
         NH8J3/qlZv9Ewvw/9LFm9EDZpgrPKRM0IQy0BMsDvEyGfq0+tLGMMl7ZPDzUSjiRDmZQ
         7qu+GkVq1+AMqSBEtF3ZBC54AVHP1zdAWP6thpbSjiXmgtAKIm8IDGJa3oaHOfW5lQL1
         wL/s4UjoeQca8YisgWtkqg0Xm0IUL6abhCkQS6/y+V2bG6uTvF6QhTjc8fWbf5gE8XK3
         15JBCLO2VNndZxc1mwUtipIZ2iZP6Dx4t7DouMErOaY3MWM0As/30Id0UCxzQJESgBTx
         j3ZA==
X-Gm-Message-State: AOJu0YxeRpCRl7U3btLb4tnabR5/O4VhkLIspcx7JhUGAN6P3bCLHXAj
	LpjmOSe0NDQHYJKKzZYKcJOXjRCXG1LQqcfMwERs5NbnoiA7bugje52j3l/+txM=
X-Gm-Gg: ASbGncsQaG3MvQzvNqXOkZMjrZRKyblXtwRAegCHapeL8hWV1q5GEXZ8NlTiQmFOlMJ
	kCLjmpgBxEAS1G6nfsDq/KS/fD9fyzoMUJHr/ECWGlFdToTUSgOUgjht4scJEiK1P9aI5MgXveo
	2Q2dYBKwIAUpNrD0VTxbGT+2xpK1LcKQU+AdzjFTW9Zm2r9ANz6QG+F5nOO0QhyRgO/VJHB4UzI
	waCnEcBEScgZrQNh54BAe3uz6bD0MCuZPfCyoxjPfIs+ZoHBtoNBpYNCf65KOVBE6+qTPa8RmyS
	BJlB1PL8Uw/0UWMVDs0XmboOi9tOGrexErj0cA==
X-Google-Smtp-Source: AGHT+IFV4P8oQ3nG1OU2BDLNtmclbNouSwMD4cLpZlwSZElcCaMEGPNksjQsv2nIGYL2m479ZPgS9g==
X-Received: by 2002:a05:600c:1389:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43ecf9c77c7mr84576565e9.20.1744010360289;
        Mon, 07 Apr 2025 00:19:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:19:11 +0200
Subject: [PATCH 2/3] Input: adp5588 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-input-v1-2-a8b45b18e79c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o8UJdITbenIEBWagS9tbUTRGEbSz2Bo2wwxkVvQkfuo=;
 b=owEBbAKT/ZANAwAKARGnLqAUcddyAcsmYgBn83xvqP9Ph+Wa7aamh/W98Tk8+U6/kt9q1kKzL
 05h47rIvU2JAjIEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 cotzD/UbHDgftNnyNJ8HCygByrRKaQFZ3aVycjBz4aWVoHfft7cLF9QRClurpPH5B6EURB0jL1V
 a0RXvV3COSo5AGBpew/77WVrjil5NBTUiZTan6AT2WF8JuKA4U+mkC/lAP88ylLZ8dtt19wDdAm
 5oqlO5wxa2+Idky0zIakj8SU8Zcy9VG6Kc1f3nBGFKgKmVDc5yYI54dwJu2RUK9j2TI0Dw4E4rF
 QJOQ1sRCE9Ecqa2rcFyi50PZXKrx7Z87Wyqjyo4NWrkkpNCphgyGNXdwhr2hRn7VMB+VDzj95w4
 MIuG+wuPGvjtRbdLG8XnM6SSSHpkTkIzDLqGFWJVWlbk7t3Yuk1RlPTEzoax3PzeicvlYK8MZii
 fB8DzqERSRcDBy+ii/ZNgPEQwMfPaSs/XVKVMrQumqss35lI/D+bQ4Iw+dCpEVW5DT0xNMdfN0U
 ermT0MKJknP5URBrPtN0+ua3StIuqDXebEqp50PvrHdHctcN1zie4uTrCoquTp8VMxEaGpaVykr
 ++LB0/0XSElxUmX3LTa2b0EOyhDvgMijDA1xK10XqtQ48lr9rpJy8z84X/9xXbTn1+cFod47Qbm
 ExQc9D9s/iia3aqiKqZxw914ArOYaV0BQRyOY3YnP7rDuXZ6aw6CSaRr735fSLigKVzdRy3QBIY
 eOQws7vTqgCa3
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/keyboard/adp5588-keys.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index dc734974ce06..2b2aca08423a 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -232,8 +232,8 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	return !!(val & bit);
 }
 
-static void adp5588_gpio_set_value(struct gpio_chip *chip,
-				   unsigned int off, int val)
+static int adp5588_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -246,7 +246,8 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
+	return adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
+			     kpad->dat_out[bank]);
 }
 
 static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
@@ -424,7 +425,7 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	kpad->gc.direction_input = adp5588_gpio_direction_input;
 	kpad->gc.direction_output = adp5588_gpio_direction_output;
 	kpad->gc.get = adp5588_gpio_get_value;
-	kpad->gc.set = adp5588_gpio_set_value;
+	kpad->gc.set_rv = adp5588_gpio_set_value;
 	kpad->gc.set_config = adp5588_gpio_set_config;
 	kpad->gc.can_sleep = 1;
 

-- 
2.45.2


