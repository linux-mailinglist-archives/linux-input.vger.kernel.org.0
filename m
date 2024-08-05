Return-Path: <linux-input+bounces-5364-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C979C948553
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 00:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 666E4B2278D
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 22:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01FD16EB7C;
	Mon,  5 Aug 2024 22:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZrlTmC/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5EB16C696
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 22:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722895920; cv=none; b=h0jXuYK06nZyYANR7xXHUKHgokywGDWH2iG/50QtetO68Ipqu90dtS+7VECaghQrA9iBauWUmy0AdyP37Gx2ESbaei+xRFYyAGfVX0+gj0w8miuMMpkbbxj2vp0D4ygVMMMnK3lM9bR3V2thP6CGRf5+sB9G+/WnJAiORhmMGug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722895920; c=relaxed/simple;
	bh=qm4WI2Uj7unPGJ54zu872tDCX8Amv4QwY8HL36YJuxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhX0dj/UWjwy2zbQeFcLcYJNe5taPwHpORjI4XhXM0UiRKCYxCGbDEzMhRpF9Hz8DHcGz2jTmwrwR/33bIEr0rwGSr127pHw2d9pC4jZItr+iooaBFNa04RQf4TFCbB0AXWfAwpn4MvMNkBm7cjG1ZtF+R/Fh2SgvNyjTSdhnrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZrlTmC/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-530d0882370so1608184e87.3
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 15:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722895917; x=1723500717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV8meRMt6hbWbqTys4+psjZRLS3pDSyNBFNrM1LzGGE=;
        b=TZrlTmC/dJDokpHiAWja9KKkVhG8KnpQ6Bde5uxDXjZ9LLpaT9JXeiOGL4XnvGO+Ub
         8AnDaVtrs2l8oYHHrPZIZ58mSUWOgB9eQBmPDOzdar5I4cD+lJH6KLCO/TalMexRcyKl
         kUAV4nMEbEe77/GgLzB3ZU0H83ht7Lnt/ZU1eCU+sqDJXBPb0rzFudxN8w7LALppvQNm
         kFnwPdi+/5mXkCmXmkjaRBi8d4IyeJJ/PPnUC6f99UVRxdXZTI4jWDuU6KvXWbxe8inT
         fNe36Xl37qkgtMu09PQk1vYOonJbeJ2MCf7oCcbIzee/ZgXcT5kka7cwWq4NqS4IYjMq
         CCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722895917; x=1723500717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV8meRMt6hbWbqTys4+psjZRLS3pDSyNBFNrM1LzGGE=;
        b=OmMr5i0jJy9DT1T9K5bTqJTv/Kn+He/jcYCZJB0IMEGBaXHldSfHafaxqkj18Sw3hf
         +uaC28LyctCaFbmg2DRTktywRh0LG2nXawgvk7LWSjK5gXD9u9GapxN9FE4M7qQpBhky
         zmodvwt+622AzUqncuYdGsLvNdcXzfNrSKxh/vN2gB47/eSMkxtEnGLLyq5eoTohp7H3
         egGp6bD39cn3j9N5CQL6YBQHP/dD8jBdGqbAm6D+FmS8Hnik97mQuJy/4uy/QwCZYaNr
         66SHFU/0ogp40qzpNXkMwcAx/WqAWRdylTfP13SKJ6480lNc+FpMh/rh5Zu8RsTUajS/
         /YVw==
X-Gm-Message-State: AOJu0YzEf2JGzddtgJs4QYhtKJtQgOhxkLNW78mWo1CFEM0lJcinqS8m
	AwwtNUCUtse/+naaMkEjPXQ8y7p6uSlAsSvGjORmZrLJxlcvrlGvKAkhRtm4vQM=
X-Google-Smtp-Source: AGHT+IGmlAzNuLzbic9z2rxq45VXXByc+gAfLt1YCxZYc/hzpK6dfpQ5fDEwUNTZ2nCxkiCSQ1CsPg==
X-Received: by 2002:a05:6512:3d10:b0:52c:e1cd:39b7 with SMTP id 2adb3069b0e04-530bb3663camr8343987e87.5.1722895916429;
        Mon, 05 Aug 2024 15:11:56 -0700 (PDT)
Received: from Fecusia.lan (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba3cb61sm1268590e87.245.2024.08.05.15.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 15:11:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 06 Aug 2024 00:11:39 +0200
Subject: [PATCH 2/2] Input: zinitix - Varying icon status registers
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-zinitix-tk-versions-v1-2-63ef79c7f2a1@linaro.org>
References: <20240806-zinitix-tk-versions-v1-0-63ef79c7f2a1@linaro.org>
In-Reply-To: <20240806-zinitix-tk-versions-v1-0-63ef79c7f2a1@linaro.org>
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
 drivers/input/touchscreen/zinitix.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 17a98fd79297..1afd71e49ac4 100644
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
2.45.2


