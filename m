Return-Path: <linux-input+bounces-6023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8909663A9
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 16:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDC561C230F4
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 14:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B411B2ECE;
	Fri, 30 Aug 2024 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NgDB6If4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6861B1D79
	for <linux-input@vger.kernel.org>; Fri, 30 Aug 2024 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026680; cv=none; b=US0QJrV4L7T0S/6e77AkMtGGcZgOLT63tZJDKkKMDDhi3fSlvR6yBwBkHchfYtnBVZa2HumxTx9JRnWnZm8tiDV/DFOtDGRi9WgPeLh2xSgxCdEZp5Q3IshO7fzEzg5aT1XqPCWCE2SbTJznVei2nnMJ/X41gFVyqqrFgdWLpCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026680; c=relaxed/simple;
	bh=bUSAlReA5HCO5Hbs+U36cEM1lcuyKt/jW8z+UxbrTMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHXNQWjLEGegi1f0teiIdOxfL+UyflBe73+C1NhSoHLmHUnnAe6iGhKZOUKAdHftJoj1FzVgVZf7rIB8brgDH5D0Zuw/Z5bmXe78ak/Jj0uty3GNhNQ+3SIB79Q7l0TTM++ZXYQczW0/laCSELGNUAFc0j5zRkriAPqiWbTRcrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NgDB6If4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so2427985e87.3
        for <linux-input@vger.kernel.org>; Fri, 30 Aug 2024 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725026676; x=1725631476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwZj4nHmi3YA+XCByv/flCbspNw18pXfJDWZvmz0uO4=;
        b=NgDB6If43opF6F+tD6QppqTMw5IqP9Vj5FqlPHEw5XojmFi2Uk6NxSd15mAxfn8mvc
         As7EqQAM/F8m4LUn9UecrZOzcAb7+GpYDbPbCvzkk2RdS9/YXnRBKLxclR9htLCuNsNz
         ZNuxVs8WA8/bPGVW2t3CrhbdduuAnwzHbTCRG4E47eg0h/dbsgjDtZiUsPbQ26x5a+AI
         oBUf+GSkSQ0UlSTarU+SPYeek63oxj+R+ZimNhZCALrAxU3OyI9bZZ+MLB9Wh1INdbPe
         SBtPMlww/6nXJNi1Vq/SrE/C7ZWjeWFLKhQ2hgVW1OkiKGHktLT0BGm+SpP2qUmYY5o4
         +UnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725026676; x=1725631476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwZj4nHmi3YA+XCByv/flCbspNw18pXfJDWZvmz0uO4=;
        b=UnIsyj370M9AbAOjenT96n17I8A9Kxb4abXoe9T95ejha4aetzk7Xonpl9NO7aBwFZ
         ZyT68NwiPnlcX4ST+PtT7tqI0F8AhX34XQbLq3unjdlEAJEdbSBwPR7+m5Ay2pxytwHc
         medtpDW86J0tGgy1P8gM87jw6GFrspLYeNWbH27I8OTqPbDUPu4p6jemR7t/Nt3lB59d
         GGkETmRt59YazHUQ4mm2IPuGPlomMKuYJ0TgmUDHXDvtAh8N1E7h0RDxGnyqywVFFiAj
         NxrPWVbuSO3eI7xazNXgPSJ3f2lwfRjmdJZiP/oOOGLeMRDkOX1uj9Qe7IbGk4HySHO+
         dCSw==
X-Gm-Message-State: AOJu0YyC5eZTR1kCL4b8sGRd9qoNsQyGUQ1i+l1VGXJTf4UZbh7wgQ7V
	Znj9CgzoSCGr6ioYkOrQvOiTRRscyPVYS/RJD9d3V/Dr9cq2PuKKEA0rJqMqRyQ=
X-Google-Smtp-Source: AGHT+IEIDCCPohsfd6Zso0VznQ3mvvEWhBtIgd633g3IeF9np2aS5n9uDfYEht1/pzwWg6nyrWUH/w==
X-Received: by 2002:a05:6512:3e06:b0:52c:dfa0:dca0 with SMTP id 2adb3069b0e04-53546ba0eabmr1464475e87.43.1725026674829;
        Fri, 30 Aug 2024 07:04:34 -0700 (PDT)
Received: from Fecusia.lan (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084118dsm616826e87.217.2024.08.30.07.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:04:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Aug 2024 16:04:28 +0200
Subject: [PATCH v2 2/2] Input: zinitix - Varying icon status registers
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-zinitix-tk-versions-v2-2-90eae6817eda@linaro.org>
References: <20240830-zinitix-tk-versions-v2-0-90eae6817eda@linaro.org>
In-Reply-To: <20240830-zinitix-tk-versions-v2-0-90eae6817eda@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Nikita Travkin <nikita@trvn.ru>
Cc: linux-input@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The different revisions of the Zinitix BTXXX touchscreens place
the icon status register (to read out touchkey status) in
different places. Use the chip revision bits to discern
between the different versions at runtime.

This makes touchkeys work on the BT404 on the Samsung Codina
GT-I8160 mobile phone.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- No changes
---
 drivers/input/touchscreen/zinitix.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index e47e0bff80db..b6b380f5aed5 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -35,7 +35,13 @@
 #define ZINITIX_DEBUG_REG			0x0115 /* 0~7 */
 
 #define ZINITIX_TOUCH_MODE			0x0010
+
 #define ZINITIX_CHIP_REVISION			0x0011
+#define ZINITIX_CHIP_BTX0X_MASK			0xF0F0
+#define ZINITIX_CHIP_BT4X2			0x4020
+#define ZINITIX_CHIP_BT4X3			0x4030
+#define ZINITIX_CHIP_BT4X4			0x4040
+
 #define ZINITIX_FIRMWARE_VERSION		0x0012
 
 #define ZINITIX_USB_DETECT			0x116
@@ -63,7 +69,11 @@
 #define ZINITIX_Y_RESOLUTION			0x00C1
 
 #define ZINITIX_POINT_STATUS_REG		0x0080
-#define ZINITIX_ICON_STATUS_REG			0x00AA
+
+#define ZINITIX_BT4X2_ICON_STATUS_REG		0x009A
+#define ZINITIX_BT4X3_ICON_STATUS_REG		0x00A0
+#define ZINITIX_BT4X4_ICON_STATUS_REG		0x00A0
+#define ZINITIX_BT5XX_ICON_STATUS_REG		0x00AA
 
 #define ZINITIX_POINT_COORD_REG			(ZINITIX_POINT_STATUS_REG + 2)
 
@@ -425,7 +435,18 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 	}
 
 	if (le16_to_cpu(touch_event.status) & BIT_ICON_EVENT) {
-		error = zinitix_read_data(bt541->client, ZINITIX_ICON_STATUS_REG,
+		u16 iconstatus;
+
+		if ((bt541->chip_revision & ZINITIX_CHIP_BTX0X_MASK) == ZINITIX_CHIP_BT4X2)
+			iconstatus = ZINITIX_BT4X2_ICON_STATUS_REG;
+		else if ((bt541->chip_revision & ZINITIX_CHIP_BTX0X_MASK) == ZINITIX_CHIP_BT4X3)
+			iconstatus = ZINITIX_BT4X3_ICON_STATUS_REG;
+		else if ((bt541->chip_revision & ZINITIX_CHIP_BTX0X_MASK) == ZINITIX_CHIP_BT4X4)
+			iconstatus = ZINITIX_BT4X4_ICON_STATUS_REG;
+		else
+			iconstatus = ZINITIX_BT5XX_ICON_STATUS_REG;
+
+		error = zinitix_read_data(bt541->client, iconstatus,
 					  &icon_events, sizeof(icon_events));
 		if (error) {
 			dev_err(&client->dev, "Failed to read icon events\n");

-- 
2.46.0


