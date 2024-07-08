Return-Path: <linux-input+bounces-4892-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96544929CEC
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 09:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31C88B20CD6
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 07:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CFE23775;
	Mon,  8 Jul 2024 07:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvqzMpH1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA84224F2;
	Mon,  8 Jul 2024 07:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422971; cv=none; b=YmZnysBWt6Y01iiZzG8vBzjgxItDqaLi/ZAgU90/oY+1FWYs32Q/ATsKvFWw/sqTEdGa3Ef1TML2EbFUwPvkj6XsBNIkN2hY+V96sbX3pOqLhCYVyf+ZnWEf+wPuFJk2SF3HwbRcMCiPUOO8+KoJDD0fW/+APGnFcZSIxR+tGEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422971; c=relaxed/simple;
	bh=h3+KBOlt8omvXSrpwxNhfGFcHcpApPKjKBcqxJdbRQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAh0KOH/XSDVEYpLTHnB2en5mWeVOV9KSq/ckePRNgDJsaZy/lqO/p9eWktrEajfRi5p3jLvDX86v1oJqN+aGBNBDJ5OKlADqlzMWWWjogdUIBGGf5v/QOpvjgcoU8/R9ROiBUW5O69BGA2uJoTnBGYmezLx1xfeywn3WqBL8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvqzMpH1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367ab50a07aso1704955f8f.0;
        Mon, 08 Jul 2024 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720422968; x=1721027768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSr6W9+kIBrExV7rAUXxvmIpCII4LVhMfKMFiF1UZnE=;
        b=bvqzMpH1wsRa8xnoFcwCbSmxK0Ik0l6A5bEMuPvAHyfpLaJnLoBZPKFnBVb85qeVIl
         Mm/fb8K4IDmoRkhgyZ7UysVV4kuQAZ+XbzsjYiqN/w4ReDeRixLRHpFNcxFU2tWPn6Gi
         gxhWn4xKejUkZCEJ4JxBJkTke/om0lLscEo594NgFXCMhPcuwKWWK7TeUYvTjD1g4HDd
         VtO1fiYx33M94dJfJvRRSyu/4Y3dBbK/je+cawHYfBAVYraC9JvgAv72CI8SZqNTzeLt
         kG+ENV02Y5+1M9Z5TdDxSMP7lDrFPNZui4ya+kmPPmnQ23+7eR576SEbwp86BpVJP7sl
         ky/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422968; x=1721027768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSr6W9+kIBrExV7rAUXxvmIpCII4LVhMfKMFiF1UZnE=;
        b=ZLgChrphDUCilaSqKdg5DGziJNZIszYTaRwwAbJQDNXxb8WUFDbPbw2PlWIoSkLzaL
         yACBK0m5Op9B/xKKP2uawAWBy31nwEBNlEE8U5m2naaehfZxRIoAD4ZFrM1rU6T5OEFf
         dw4XQInKo+VjYYm48eUlHuLMSdyEBzJOgSatK5c2cZEf3QjHIbM4pZ+nm3IVu03Ffw1U
         puQsKeQ2G2afOw2HWt1Ut/ZfdDHAMsFJ0VTy9Ec0GxXRIY4D47u6o5b+fpepK8eD1y2l
         0nSCP7GH061eqPSLvxjy5uakjxjuk6wRw5OpOuf2T9nE0POvez7I9IayLl5iX3NVBBHT
         wYgA==
X-Forwarded-Encrypted: i=1; AJvYcCXLnCo9UlV12Whg3xPc7MLH1/3tdhhHTsGBdSptd0mCP8RoICgYBva/kCer3voVSdOXjL7EIrDoUhxpmiEZQhvxk1WaG8jNeDcM/m6P12RGxYm72p0G7iWTuzNB6JyMOA4k3xPuCbkDIg==
X-Gm-Message-State: AOJu0YwBQgSToMiCCGqTnARI82GYCYlBpVpkA1oglrc9Isy2RemXp+B8
	oln7eRSOuzE11mQscUtO5KGo4fV/xaYy9rrTawsgHnWdAhxnoyX4
X-Google-Smtp-Source: AGHT+IHrzhQu0plLHQSnW6EQAbhlLdpaa6G8qkl7Pllj+JcKaF9nRXS7gqQjM6Ofo0NmYv4Ov37Elw==
X-Received: by 2002:adf:ecd2:0:b0:35f:1dce:8671 with SMTP id ffacd0b85a97d-3679dd29926mr7019361f8f.25.1720422968305;
        Mon, 08 Jul 2024 00:16:08 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a786:d603:1c55:ced1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679dd5ea09sm9994564f8f.65.2024.07.08.00.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 00:16:07 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org,
	francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v5 2/4] Input: atmel_mxt_ts - move calls to register the input device to separate function
Date: Mon,  8 Jul 2024 09:15:49 +0200
Message-ID: <20240708071601.7571-3-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708071601.7571-1-eichest@gmail.com>
References: <20240708071601.7571-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The calls to register the input device are moved to a separate function
so that we can call it without having to confiugre the device. This is
necessary if we want to power on the device only when it is opened.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 34 +++++++++++++++++-------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 4fc83a4cabd9b..85f3c685bf526 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2277,6 +2277,28 @@ static void mxt_config_cb(const struct firmware *cfg, void *ctx)
 	release_firmware(cfg);
 }
 
+static void mxt_debug_init(struct mxt_data *data);
+
+static int mxt_device_register(struct mxt_data *data)
+{
+	int error;
+
+	/* If input device is not already registered */
+	if (!data->input_dev) {
+		if (data->multitouch) {
+			error = mxt_initialize_input_device(data);
+			if (error)
+				return error;
+		} else {
+			dev_warn(&data->client->dev, "No touch object detected\n");
+		}
+
+		mxt_debug_init(data);
+	}
+
+	return 0;
+}
+
 static int mxt_initialize(struct mxt_data *data)
 {
 	struct i2c_client *client = data->client;
@@ -2831,15 +2853,9 @@ static int mxt_configure_objects(struct mxt_data *data,
 			dev_warn(dev, "Error %d updating config\n", error);
 	}
 
-	if (data->multitouch) {
-		error = mxt_initialize_input_device(data);
-		if (error)
-			return error;
-	} else {
-		dev_warn(dev, "No touch object detected\n");
-	}
-
-	mxt_debug_init(data);
+	error = mxt_device_register(data);
+	if (error)
+		return error;
 
 	return 0;
 }
-- 
2.43.0


