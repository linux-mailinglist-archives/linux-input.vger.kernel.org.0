Return-Path: <linux-input+bounces-11552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 668A0A7D5D2
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 09:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 377863BD868
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 07:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41903230BCD;
	Mon,  7 Apr 2025 07:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iSXeQ5gs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE1922FF41
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010366; cv=none; b=Tb5+JcFyFD0ejgsKDxBYtl4vAcQG+oHpKEkAmeOsi+gJdC3e+CuOxUqzM3LkwN0nBJClhd5KzwmYUzUmh/4M9OF4cGpakZIEGZtnCRgJUVU5NNPzSdxOAjXSkEaNXNFGLIGlhvIpD7QKJxLw0PvtUzGetw+MBDLptb5T0yf/bMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010366; c=relaxed/simple;
	bh=XdR1F1d24wz4tnZ/+4ZmFiOQGGu2evq7oEPt90HJ6QA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sX33YWsSaUxTfhELyrGvhosEEBT70kMbQW+7iXYR5bAMb1trRA2wPpGtiWtuG+JDXPx0AA6rEmyyGuAki9i6Z/N51KEtNy1eoHM5+4Y2+SkyN7G+fbiIgOrI20mWdKYxTyy3m3fDUyZCmc4Uc7feCuzHUd3q6I1M1MyPBkFRNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iSXeQ5gs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so19090465e9.3
        for <linux-input@vger.kernel.org>; Mon, 07 Apr 2025 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010363; x=1744615163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHa5+3Xv2nYSlmM0R8jZrZyFIIPzDhCPSeCMfkmkG+w=;
        b=iSXeQ5gsAl+nDzi1pIhA0rEAb2e8/tvmVRSlvKLsoE1EmQBaGSXH5MBeOF2KERnpFg
         KgFYKfrVWr5kKMZ2uZzBWzbF0fc8dCxl7YkE/ROCjY9GNP6gHqyYfimCOoRq2ZPVvCaj
         VkXNm39nqd73ngjuhwjj2enuiFOVY9dgRhMkMyYtHaUwLbsk3+dXUXuGWfhsaZ/lGfK+
         V7tlIicmFRRpeicTEl/m4pwABa6UEmTgvWCDaSSNK8rplgapQ84kEgU3OUKoouqvAT3i
         u/A1FulLUt53Oy2yLLYZ4JTb/TqL/OQun753gdtEYDTME64LKXN23HH0IB/jpnJhTm1E
         gj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010363; x=1744615163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHa5+3Xv2nYSlmM0R8jZrZyFIIPzDhCPSeCMfkmkG+w=;
        b=ZKZO+7XsfF83wCBilPoAZl8b9pDmveBUroKE9GbdCIBx6mbmwfxvANTeKNWKh1u4vy
         5Ri1ujV2S6r9nmwuQAGWG8NXZvNETGKfl+8m9zeusSQlwgLW4XNfdK2POVAfo4M+KMll
         LzROATSrkT5eqT2vZQMRDmJJMQbTIIhZllWe+5c7qwRCIzol6pnCS0FD0vSqqE3gFavr
         /9GPnqSrrlnMnZkEhLz3iyvFiDatgGwP8acqjzZoUbVWSWWFBH8UUKB7/TxMxKdxfMTd
         OcuDof2niysS8iYfpGJCtupNc5uJy+kg6uaMv3r1u7c/fImqE1SwLhVdmiAWOgalqKR6
         9O3w==
X-Gm-Message-State: AOJu0YymGl7zTjb2hT55Nk8wO2AnkLtpkSoLr3u2iTpMEMuACZwU4Nlb
	co/vO90ABOUrmpjL9s1wDDpb9uGyoJf1Z8mrQMZgEf2xpoItgOLrkvq0LBQXn74=
X-Gm-Gg: ASbGncshedFUfkbZ1DDfnO28wNf2beTDJgphRVILKcbjBAjQidFuervUPZ4nwFlGo/D
	4RiN5iQ7IkWt8OHjPmmCG5H3EGLvE0jppkDbeEd3WzNec3NPTtQtViiznBgGzSHw4sgKUfGHK1X
	HNTVHtklztNT3n6HEZotuXqULLirSFfTBungim6JJO/yodMJt7T1HOYIzXPEWH8Ik+S07ZOYCsk
	AmZMiX6Fndm6lFX37a9Yeap6Lo027XOtD3WzCksUn3/EfAF84qhsn72fwjLADBfELr65IR7hnMv
	9lS3cBZmkt75OlX0cbX6Npz7mq1tYp2isCmTf0kdWnNwyhnz
X-Google-Smtp-Source: AGHT+IEC4uRQ9XNMmKKpbID7+2W+G955oGmEj85gPslrlwXGh/J5f08lBKYmki24DDnHeD1PZLDfuw==
X-Received: by 2002:a05:600c:1e23:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43ecf81c304mr101899695e9.5.1744010361163;
        Mon, 07 Apr 2025 00:19:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:19:12 +0200
Subject: [PATCH 3/3] Input: adp5589 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-input-v1-3-a8b45b18e79c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=b1mbZ9+luKGaPZMmERJAiMQlHQJ363cz8LumGJPcpTM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83xvW12rx8RkPQUSxweYOqwmmE0p4xrJnqauq
 fSmi5ZJlsWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 csOwD/0TeLStBON5XGpuhq0sT+tGYEAXHhUsDfBm+6vTRWA8DAPj8UvyoWIJpVSXHhJ14d+LF9/
 MPaJf0IY5KUNyBNefLcPapsbPwWG4ThYyel073Xq/8IP/P5hzy8HdOzgYem0VzpGSgS22YGPsSY
 PNI3icdfVpBrtblUKN1kOpsW/DvAvjkrayb74UCZVoeQAftbNnswVMBDT80aOyEZx/VCcBAroae
 0JrqhW6RnTqY5eCZmkEzuLOeSpwHcd9Sh0PzKcR/r+9BMVBLesPLi50KL+yvJtk2CZDkH2A6DRR
 /EKjKEg7xJdPho9+PiPV2yfsyrb5DM6B0El7Mdn+tRm4C8VDd2by7PeXD2cdumvIELOGxwQ/9if
 MqC4/wLoXqsxumsw4FSiok/CNfk/XlVXp+mFazMOpHVobIWqRxd6gbU6QTuWsRuy4tlPq8KxPdO
 8A0318xTNB9W9mLoM1t7jRSh0rFsKuIyV8b/z/aOaHxYvXaVTklqSw941hlG7RwODDLWoArsuyj
 6DOlSS4wIAgFuzEKbO+R10JTBsNZcnQ61h1rbpxpA1gjpxN070eGsllW6ZgVxGcRtJeMoeesB/W
 fB4CUGLxl5ZUdXR457F1R/jgRWnleYoFvOLMcH/FZHOppGLoXtg/PCyHDYb2w1zI0STYpvzds81
 RaKAUPjWTuQTCiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 81d0876ee358..986a789f1ec3 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -404,8 +404,8 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	return !!(val & bit);
 }
 
-static void adp5589_gpio_set_value(struct gpio_chip *chip,
-				   unsigned off, int val)
+static int adp5589_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
@@ -418,8 +418,9 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) +
-		      bank, kpad->dat_out[bank]);
+	return adp5589_write(kpad->client,
+			     kpad->var->reg(ADP5589_GPO_DATA_OUT_A) + bank,
+			     kpad->dat_out[bank]);
 }
 
 static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
@@ -520,7 +521,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	kpad->gc.direction_input = adp5589_gpio_direction_input;
 	kpad->gc.direction_output = adp5589_gpio_direction_output;
 	kpad->gc.get = adp5589_gpio_get_value;
-	kpad->gc.set = adp5589_gpio_set_value;
+	kpad->gc.set_rv = adp5589_gpio_set_value;
 	kpad->gc.can_sleep = 1;
 
 	kpad->gc.base = gpio_data->gpio_start;

-- 
2.45.2


