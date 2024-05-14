Return-Path: <linux-input+bounces-3708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3348C54E4
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 13:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F7311C23CF3
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 11:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82836762FF;
	Tue, 14 May 2024 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8torin/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071804CB2E;
	Tue, 14 May 2024 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715687512; cv=none; b=d/hq1D09B48IZA1S2DkNf1nkWJoWk+0FirNZJxhXr5LYFb6/3SKLCI4CSXnqi4U+Rji4ybWV3Pu6aCZ/zpDGeWOViFzoC8HZGckVzHquh6s8HywMePA7gFBo8uCCD15zWQ1aHmhDaaXCmg9+y+cRaufVnLzuVpirAD68J3s0oVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715687512; c=relaxed/simple;
	bh=UNV8JfYem/8oImfNlZQdc3ikSt6VXuX9ZNnO9h6Q9fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtA+sWFPmqXert/56rnpyTrVZ86wvIh2tbiHRIfEJ6mjTzifEyQLzqxvkK1TOFzbkkG3IZh9MpeyptlXb+DlQCrXTbSzzsCAg+jH+TYsYi5V4BmfqNldPsPFuFDwY9DWpcC1Mfx51DOAmPG32EIvjVONaam2n3Ltb2BfJuPO9so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8torin/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1edf506b216so37236995ad.2;
        Tue, 14 May 2024 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715687510; x=1716292310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7H6uW9D0ayQK2hkUHsEJhkRWWPonEd0xy4jiWJi98zY=;
        b=Z8torin/RCMx7f4EZYMxc2fmLErgAwmDEp3HCjm8pXMTWDUO0OP++lFNC+QmUul7bC
         dEILFzD9xS8YGyAxNa+JRt7xE7drVFlU6zKlGi6UFfBx8rRNXdrUpAUkgj96ncaIxHej
         CW+T3Lg2s4THbmug/QHWFh8j/7gzrS4NnpP9Z3i6ThFiQIYq/njhaJ3Rkr7sX4TURzKS
         lqJVfGbmnIN2tg2Cu6RdfXpHPI9xl3sIjsebl52WxK4ealZUM2WCtFIzmjYKsiBnmCtO
         hzwZnb7U/9eI+Yy617+zUheKc1fLCvHCJoQa2G84kkxKmub8JyJz68p8jzlGRq5OQDXm
         5ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715687510; x=1716292310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H6uW9D0ayQK2hkUHsEJhkRWWPonEd0xy4jiWJi98zY=;
        b=DjM0cwFtUZuYDRumDVmfR4Tw0c29Wn5SLWQ4Si50pLIQJAvrlQNIxWOMrODdUhPajw
         cSFMDpoH2SjW9jYZGmg7tWU0N0cRnT1bfFCTNduCSBfhSZBLnHi5q0mctiwKsHdCXZb/
         HwRV6FZvqiurZF77kZJStr2Q3YBbf8tqxOUSs2Vo/y/clozEJm/AAtN7ZLD6qrtoUzxh
         oLcrKpdITXON7fa+if0lNtR+N5Xch3piDpPIelOIFdTRihIOdrMK16AvYq24Yjks5Yk+
         Wyp0HHwYiYzrNoZV7L7UUXri98EHSWo62qBs4NPtSTT/pjs6v7RLYaTBCZ2M8V1XGwsC
         rS7A==
X-Forwarded-Encrypted: i=1; AJvYcCWxghWgOQRCRa4IC4N/GaIiC4K+jQ+HoaCX+BKKSctWEkeq20PkJ6dvUKQfBwKNmZRHtdbjYogTmWzkyKZ5vRs0aiO4HtxrnOXSSjE/0vNpngYIw85XAxe73uuXHdr0LHV57m4YQsbthlk=
X-Gm-Message-State: AOJu0Yy8pE+hDp+FxYtcNjcOjviLRFf1MhsOjJjwkNMCrPAh+V1RS1mf
	P1ChAUDf4RwCXAJH6+Bt8UUYMYM5POdZz5E6ve+8zSHIGCrDRsVg
X-Google-Smtp-Source: AGHT+IFdddJdd2lyhL38lOuVGGUazefd2EYRoy+/4EGyuecBUfAnRfO3SDc+gkX7Yr5JrzuCGltyqw==
X-Received: by 2002:a17:902:d58e:b0:1e2:65b3:de68 with SMTP id d9443c01a7336-1ef43e28388mr158362965ad.19.1715687510167;
        Tue, 14 May 2024 04:51:50 -0700 (PDT)
Received: from mb-board.. ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c160c63sm95450675ad.282.2024.05.14.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 04:51:49 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: hadess@hadess.net,
	hdegoede@redhat.com,
	dmitry.torokhov@gmail.com,
	neil.armstrong@linaro.org
Cc: hughsient@gmail.com,
	broonie@kernel.org,
	jeff@labundy.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	charles.goodix@gmail.com
Subject: [PATCH v3] Input: goodix-berlin - Add sysfs interface for reading and writing touch IC registers
Date: Tue, 14 May 2024 19:44:43 +0800
Message-ID: <20240514115135.21410-1-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export a sysfs interface that would allow reading and writing touchscreen
IC registers. With this interface many things can be done in usersapce
such as firmware updates. An example tool that utilizes this interface
for performing firmware updates can be found at [1].

[1] https://github.com/goodix/fwupdate_for_berlin_linux

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
Changes in v3:
- export symbol goodix_berlin_groups
- v2: https://lore.kernel.org/all/20240513123444.11617-1-charles.goodix@gmail.com/

Changes in v2:
- use dev_groups to manager device attributes.
- use dev_get_regmap to make show/store functions generic.
- v1: https://lore.kernel.org/all/20240506114752.47204-1-charles.goodix@gmail.com/
---
 drivers/input/touchscreen/goodix_berlin.h     |  1 +
 .../input/touchscreen/goodix_berlin_core.c    | 43 +++++++++++++++++++
 drivers/input/touchscreen/goodix_berlin_i2c.c |  1 +
 drivers/input/touchscreen/goodix_berlin_spi.c |  1 +
 4 files changed, 46 insertions(+)

diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
index 1fd77eb69..38b6f9ddb 100644
--- a/drivers/input/touchscreen/goodix_berlin.h
+++ b/drivers/input/touchscreen/goodix_berlin.h
@@ -20,5 +20,6 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 			struct regmap *regmap);
 
 extern const struct dev_pm_ops goodix_berlin_pm_ops;
+extern const struct attribute_group *goodix_berlin_groups[];
 
 #endif
diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index e7b41a926..020f8a31b 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -672,6 +672,49 @@ static void goodix_berlin_power_off_act(void *data)
 	goodix_berlin_power_off(cd);
 }
 
+static ssize_t registers_read(struct file *filp, struct kobject *kobj,
+	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
+{
+	struct regmap *regmap;
+	int error;
+
+	regmap = dev_get_regmap(kobj_to_dev(kobj), NULL);
+	error = regmap_raw_read(regmap, (unsigned int)off,
+				buf, count);
+
+	return error ? error : count;
+}
+
+static ssize_t registers_write(struct file *filp, struct kobject *kobj,
+	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
+{
+	struct regmap *regmap;
+	int error;
+
+	regmap = dev_get_regmap(kobj_to_dev(kobj), NULL);
+	error = regmap_raw_write(regmap, (unsigned int)off,
+				 buf, count);
+
+	return error ? error : count;
+}
+
+BIN_ATTR_RW(registers, 0);
+
+static struct bin_attribute *goodix_berlin_bin_attrs[] = {
+	&bin_attr_registers,
+	NULL,
+};
+
+static const struct attribute_group goodix_berlin_attr_group = {
+	.bin_attrs = goodix_berlin_bin_attrs,
+};
+
+const struct attribute_group *goodix_berlin_groups[] = {
+	&goodix_berlin_attr_group,
+	NULL,
+};
+EXPORT_SYMBOL_GPL(goodix_berlin_groups);
+
 int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 			struct regmap *regmap)
 {
diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
index 6ed9aa808..b5f48315c 100644
--- a/drivers/input/touchscreen/goodix_berlin_i2c.c
+++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
@@ -64,6 +64,7 @@ static struct i2c_driver goodix_berlin_i2c_driver = {
 		.name = "goodix-berlin-i2c",
 		.of_match_table = goodix_berlin_i2c_of_match,
 		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
+		.dev_groups = goodix_berlin_groups,
 	},
 	.probe = goodix_berlin_i2c_probe,
 	.id_table = goodix_berlin_i2c_id,
diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
index 4cc557da0..fe5739097 100644
--- a/drivers/input/touchscreen/goodix_berlin_spi.c
+++ b/drivers/input/touchscreen/goodix_berlin_spi.c
@@ -167,6 +167,7 @@ static struct spi_driver goodix_berlin_spi_driver = {
 		.name = "goodix-berlin-spi",
 		.of_match_table = goodix_berlin_spi_of_match,
 		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
+		.dev_groups = goodix_berlin_groups,
 	},
 	.probe = goodix_berlin_spi_probe,
 	.id_table = goodix_berlin_spi_ids,
-- 
2.43.0


