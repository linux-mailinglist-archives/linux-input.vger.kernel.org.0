Return-Path: <linux-input+bounces-11941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8EEA9846B
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 10:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C0213A8294
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 08:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF36B223DFA;
	Wed, 23 Apr 2025 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dv1FAvLg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126B1F2B99
	for <linux-input@vger.kernel.org>; Wed, 23 Apr 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398554; cv=none; b=DFiJUuNMNACgUd0KWoECZBjY8QCq9+rOw33ssoHfMcwsXY4mY5gUaKFmO8w46kzwQaZyOTwGEr9+ivvVp0gEsTVoltowYGP9flKXBQfZ5bpelXSzlO9aWeiYLD8++kCrgAxyuiWWQ6UuYKLSOaXHQ1joqNtQZuD8e5THcjKCAVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398554; c=relaxed/simple;
	bh=ZKUX3nw4FZjC+N4ScPc3tAK+DbEUS/qVAgsD0lmzRTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8Mszmlm9vpZ0tTL10Ysg+jFq22+vZU9SCPf3eya92D8kH9ezC3T0L0G5Hg1e00eadZwuY7mIrIuCbZfuj3f8rx62N1SUoYNP4q6wSpYw2F04YuFLK1AUspUdrktlWelaonf7skBGqRhgvBH0pN0D3M1K0LJ+IVmtiCNg26jYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dv1FAvLg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso3558553f8f.0
        for <linux-input@vger.kernel.org>; Wed, 23 Apr 2025 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745398551; x=1746003351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRQAzpylpQHW7wjn2Yy3ejHzxEGc6mOpxfcsgicq3lM=;
        b=dv1FAvLgh64bifJihDkavG07VIWBZztaKHR9k0KD43kwz9NsRLgB0BnkMd/1EZ6+r8
         9Z19Jaa3Sgne1LRofVtRCfdDTmp7JzQgHETqZGQuA1DxVq+sv0uA9GxX3dBVoftK5LmX
         tIBSAd8f6AAW6ax6FFDZAddF+6ZTaDcfKYk5iOyZvyO8yPrHfXFqYk9YZlkewJvxRt8z
         1WskaHeL/ndJFwU+oaYozajb2G/ijcaQs1yczVvcAQsidB8xA4/y3SHC+9NKkp/Glv/E
         sADTWIeApObbedvid+iWPFc0C6ZvbbX7URc8fV8p8On4j3wb4YkvO5J71aY8pJz+ewwL
         bPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398551; x=1746003351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRQAzpylpQHW7wjn2Yy3ejHzxEGc6mOpxfcsgicq3lM=;
        b=aieywHbUXlq7EclL8jhqU38+ITPjTJCz2MWbyr/MVCNYIpiPFeg1WHF0nw3SezP4im
         brF6Vu7wEJyvqwLT3fiXkhuQ5z1Vf5Li5uIaX/EiRHEoyzh5qj4R2hnM6Rmp6oYnUxzK
         qFz9QwODcRDjnKLPpLWNeORJy/AHRTSk3RYT5vonvR+ovh6D59nYcyZ62qcgA5a1G4Gk
         JnktJ/oZnRCs9xTuJIxRDAOU1Ex5f2k1lsKVn4GKd3DGuM4K+rxqQ3/jjGeFlehmrYW4
         0gpxzcU9H3xTCLsUHDCtF+NPprwJ9vWBanjIpgb9NNuSkYsfSWJIDCHjcQ4Wu/HHvi5i
         /isw==
X-Gm-Message-State: AOJu0YymMF/rOguBZy3Y0l8+1BfBRvegklfaPWbQoe3eESE5fbOqy95u
	I2/wseqAE0zk/AFTr3LSpVf8NeLuMsgJsw2E2x60sWzcCRUOI/VPgOhgX9g5SaI=
X-Gm-Gg: ASbGnct2IfNaqSaBjfyRo2RxC2K6o/u27FSZtKY5MWmC7Jev9V2TOAD0HOvloLrnN4k
	MTggryd36iu/xAZwlnMzWiHOxCmiJX2mWHFkAjf4qBwYhocZ9DU9NYnSJlUF2ZHokQyBicoDJf+
	cmzfqplMNPXjKLIQPTFg5gdnWwagK68uaI0mLbhs/tm6cFtD/ZqfupexAk4sFhcYNrsofQKi1Xt
	63JRByt2ZegZi+vGFsGVgCDewkhbwK/2RDbt6uLI+8IwF668VzVoFN7+VVDVJVRnJPCn+wmyil8
	xSHT3leG5fd3kyubAdhra8BpmXy4go/uQg==
X-Google-Smtp-Source: AGHT+IGoalfCd15VUlEeIzWF5CGPrSIg5URCnSt8BcRGLzzqD0ZxgfBLXu3CW9QMof7F6AmBeY3yKA==
X-Received: by 2002:a05:6000:402b:b0:39c:30c9:815 with SMTP id ffacd0b85a97d-39efba3ce3fmr15132392f8f.21.1745398551044;
        Wed, 23 Apr 2025 01:55:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d3654dsm17731685e9.28.2025.04.23.01.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:55:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 10:55:41 +0200
Subject: [PATCH 3/6] hid: cp2112: use lock guards
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-hid-v1-3-2e6762b582f6@linaro.org>
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3540;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=svsbVswSqZ1RUCT08RBk/vS5nyg6Pd3lS1RPThjb7W0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCKsR/N6zMcg8Ye3ytrtXSvWWOiIfYJxg3rywi
 bYzY8OzIAmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAirEQAKCRARpy6gFHHX
 clA7EACHfVIi2x1uS7Sngv3quCHbq8sy/bhDCfJkvn5O2G9DSvTAsQWYPME8KVA+XFAUmoliGdH
 FQid4I21DsUd4ML9rZW9yCsSu6hHsvB6d+IBLfqA0qRK60DnmGEuOngBHvVpTL6cB8pbKLrWyG3
 Dnkzm4zDPOYbujo7/Eu07KKj3ljHFbWv4qaZFLFb/nqTvCVV1ThvClRN/GDd3nFTs8qKseyI8db
 QRK8GojnAa4XDThabDJWSHnUMXqHldZJ+jzM0HklJwtL0f57KUoxtmlhSzLKRd73zq9LfYf6648
 THljU/jjKvb+QrKT9dWK9mbxqquTasNMDoKnrrpbZ2cutMllgxUCOvaXPfAupyo+McYi5L+4qL3
 PAFOpy7RGn8LQgRby5YR8uXRVTl9r693dJgF0w0XowEtoOn3p81aLegOY1pmtgskv3Jg6+22Hle
 w1wiYqup+vXF+WhVbghNI1tFIqA7OLqiY/UD8SVpfUpGMJidHURMIDDmnuwKRWxKKv1mn+B6r+B
 tfrlDto/G9Ha4x8Kw2Uk0ZDjdenPGTDYrF0XE6KLuEyKwnxrjRKE0Ey4Skwdk0B0iRUO2Co7ot0
 oMWZLYwjZowvcIPxF/HpUL9uh7bEXMmezh38sRzrbu716LflsPRnZHsL/kJUF9Zm2VY6XmI7kG3
 GviItMic5e6OG5A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using the lock guards from linux/cleanup.h
throughout the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hid/hid-cp2112.c | 38 +++++++++++---------------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 408c865efdd4..92dd891b7b59 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -187,7 +187,7 @@ static int cp2112_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	u8 *buf = dev->in_out_buffer;
 	int ret;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 
 	ret = hid_hw_raw_request(hdev, CP2112_GPIO_CONFIG, buf,
 				 CP2112_GPIO_CONFIG_LENGTH, HID_FEATURE_REPORT,
@@ -196,7 +196,7 @@ static int cp2112_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 		hid_err(hdev, "error requesting GPIO config: %d\n", ret);
 		if (ret >= 0)
 			ret = -EIO;
-		goto exit;
+		return ret;
 	}
 
 	buf[1] &= ~BIT(offset);
@@ -209,14 +209,10 @@ static int cp2112_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 		hid_err(hdev, "error setting GPIO config: %d\n", ret);
 		if (ret >= 0)
 			ret = -EIO;
-		goto exit;
+		return ret;
 	}
 
-	ret = 0;
-
-exit:
-	mutex_unlock(&dev->lock);
-	return ret;
+	return 0;
 }
 
 static void cp2112_gpio_set_unlocked(struct cp2112_device *dev,
@@ -244,7 +240,7 @@ static void cp2112_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	guard(mutex)(&dev->lock);
 
-	return cp2112_gpio_set_unlocked(dev, offset, value);
+	cp2112_gpio_set_unlocked(dev, offset, value);
 }
 
 static int cp2112_gpio_get_all(struct gpio_chip *chip)
@@ -254,23 +250,17 @@ static int cp2112_gpio_get_all(struct gpio_chip *chip)
 	u8 *buf = dev->in_out_buffer;
 	int ret;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 
 	ret = hid_hw_raw_request(hdev, CP2112_GPIO_GET, buf,
 				 CP2112_GPIO_GET_LENGTH, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
 	if (ret != CP2112_GPIO_GET_LENGTH) {
 		hid_err(hdev, "error requesting GPIO values: %d\n", ret);
-		ret = ret < 0 ? ret : -EIO;
-		goto exit;
+		return ret < 0 ? ret : -EIO;
 	}
 
-	ret = buf[1];
-
-exit:
-	mutex_unlock(&dev->lock);
-
-	return ret;
+	return buf[1];
 }
 
 static int cp2112_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -292,14 +282,14 @@ static int cp2112_gpio_direction_output(struct gpio_chip *chip,
 	u8 *buf = dev->in_out_buffer;
 	int ret;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 
 	ret = hid_hw_raw_request(hdev, CP2112_GPIO_CONFIG, buf,
 				 CP2112_GPIO_CONFIG_LENGTH, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
 	if (ret != CP2112_GPIO_CONFIG_LENGTH) {
 		hid_err(hdev, "error requesting GPIO config: %d\n", ret);
-		goto fail;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	buf[1] |= 1 << offset;
@@ -310,7 +300,7 @@ static int cp2112_gpio_direction_output(struct gpio_chip *chip,
 				 HID_REQ_SET_REPORT);
 	if (ret < 0) {
 		hid_err(hdev, "error setting GPIO config: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
 	/*
@@ -319,13 +309,7 @@ static int cp2112_gpio_direction_output(struct gpio_chip *chip,
 	 */
 	cp2112_gpio_set_unlocked(dev, offset, value);
 
-	mutex_unlock(&dev->lock);
-
 	return 0;
-
-fail:
-	mutex_unlock(&dev->lock);
-	return ret < 0 ? ret : -EIO;
 }
 
 static int cp2112_hid_get(struct hid_device *hdev, unsigned char report_number,

-- 
2.45.2


