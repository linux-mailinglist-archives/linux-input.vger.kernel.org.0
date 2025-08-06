Return-Path: <linux-input+bounces-13842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADE2B1C862
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 17:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E25018C2D76
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 15:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7FC292B50;
	Wed,  6 Aug 2025 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Nzv601WT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719E28FFD8
	for <linux-input@vger.kernel.org>; Wed,  6 Aug 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493027; cv=none; b=mAcaWfHXmKT1q21iFT8QR/ugjwMn7XMsVAxfyNInLxH5Q3rxw6l01Cz0RBDFUDEkENtWyrOCV+1H06qz9XzAZKBn9h0aWUEvcmgYNckHT446lVmpSxfIIC4vT/2N75QZ/w8zwXnSGS2yH8GorfFib0URgyqZlEFWgayygL+JYMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493027; c=relaxed/simple;
	bh=xn+z3E6SdNvNIqyOJnt5f12LBiTE09Ep0qbCNoBliqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdyV1obBKsVZO7w7YZ4LGE0oOe1Zliqx+bVmLjmNw44FRq4C+Jx2jIjMD6jR+ChzGrp+9c7TlJf7beedsgWcVuch/sX+29niuIyr7Ya48VoY9DGFGkPb+JADa6U3MPUXF0El7S9R4nYyZj7h+C6lWRxbNhsiXr78OlUJmwnRobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Nzv601WT; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so12482664a12.2
        for <linux-input@vger.kernel.org>; Wed, 06 Aug 2025 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754493023; x=1755097823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZWHqMJSKAtaZgUKtmwQBcK05igN3a3cRBd0mRIs4Sc=;
        b=Nzv601WTkePHwzTMUj1wiqjRgGo9S7dH/YrD48+zlzpDDPIxVflxa2PDV8bPk8+EAo
         F448zZBf7+OqrKUYaMd31z5MgNot6aGAN4TrHpF7wai7bqwddaa8SYgolTf94nXc6bd0
         aBTEJepyFZATQhPtQFBEdR6vnBHVXLbnmrX4IH+t1tH3dIaCBUTJiNxkOvXvFWOnMPkZ
         m+Y8JIabLAvYm6YJzP4NbxXtGsjkVaPNWWJ592Vwnxi4+X5EdkTBM3JQ1oWfYx++ke3z
         4Qwc8swjEd4+Om83GIavTrwJb1qPcQA0VqI64PvAvt7ZnDIjGxZOdH7tWkvQ9yIS+NPW
         rBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493023; x=1755097823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZWHqMJSKAtaZgUKtmwQBcK05igN3a3cRBd0mRIs4Sc=;
        b=IbTFs65LK6BSO5Y2ZsHnIPp33ZyNRBe4VYlKGT/kK8nRy/mQS3vy2oW3q+KsWXgfBj
         nHHCGxNQa2ei9u8jDkeH0GNEt3/2nXcg+0KG5EV0rvw++lDf+fv8Ejp095GBMMsY77K7
         m4w/Sd+LMAPxJAjDQjNBUcm3DmltGcKtPRQ+4+pvMsXGET7j8uAm/7btPdc5NB6X8Wgy
         10tB/Lw/dA0DV+XsavC1bozZcMeOHBJqEV6MPdhUzlpxCgkrvbG5+2cqpdF84gvDZ1Cy
         /Af5DfryEoumVazgbesc65XU1S6vbkF0yB/JyBsD8V519XbIxgDE+7pa5mHVEtm6gnSZ
         HNKQ==
X-Gm-Message-State: AOJu0YyF776Z5vXaRfj8V9iNyYQ/sFslzfl8lIn58mZwl1MsRQyt0hW9
	d97DtVWlZ8UngWKauKbbEzISac7bQSbW1UKwZnIv2BN07LiNoH1gOh7GjoHiboNSGNs=
X-Gm-Gg: ASbGncuYa5yfH0TizG4gQqo9x2UQhmZNiAdQUion7UVICNndvw0gfQHqr6+1Z8ck43j
	MbFNUfMLTaLgWZjHOnbmSTBhQboPMJi4zemuHTdOrNUgJXr3A+25wriiAhnXUc/gyu92HKs9b4W
	CU3ArgGFTrwaaRaaR37VyRKNHTumYvQ39TYbz3nwtfNrcscsRuxNN44DcyeBL8X5c4cRhS51pRi
	9hUMFNUtoL2J7cTn+H+jNattVNma4Ii58mm4fbgmVha8TtnCHtr9yCeTducV4PX93MaALxiBcud
	NHMkk95fqvwP8PvQYy3IBP1IKY8oo/OOWfshVlFt4pTTFnVI7Z3rRFhRVIBwqkUyK1hwrT8BFJY
	mrk0XHbKH53KWXUbViVBfPa21oo/+ATnAwe3t860vdrBQYHMaenX1Y29P1xCaLOuBZv5gwwdtbJ
	DF4BgW6Kg0+xYL3A==
X-Google-Smtp-Source: AGHT+IGainaHavtMZI9+7CAIfFGuuvoBhwiyDSQg9h2xXqT3N8B6RbuSggCxKjkRCiA1F2wT2D4OHA==
X-Received: by 2002:a17:907:3f97:b0:ae0:35fb:5c83 with SMTP id a640c23a62f3a-af9903f055fmr297334966b.28.1754493022724;
        Wed, 06 Aug 2025 08:10:22 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b77sm1120100666b.51.2025.08.06.08.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:10:22 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Wed, 06 Aug 2025 17:10:09 +0200
Subject: [PATCH 2/3] Input: aw86927 - add driver for Awinic AW86927
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-aw86927-v1-2-23d8a6d0f2b2@fairphone.com>
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
In-Reply-To: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754493019; l=26939;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=xn+z3E6SdNvNIqyOJnt5f12LBiTE09Ep0qbCNoBliqc=;
 b=YOOY2sj6u8FV4dfr7F0J/+vV2+EEnYarZJ1OccaA0TUABqsZtkTIM7dtd1sreeijoNG7BydOr
 2Wm4m9LFxHdDdX+4uWKdN2DGjPsAKAdcUYHQS+Xb3FZlVzZdXkOOeCq
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add support for the I2C-connected Awinic AW86927 LRA haptic driver.

This driver includes a hardcoded sine waveform to be uploaded to the
AW86927's SRAM for haptic playback.
This driver does not currently support all the capabilities of the
AW86927, such as F0 calibration, RTP mode, and CONT mode.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/input/misc/Kconfig   |  11 +
 drivers/input/misc/Makefile  |   1 +
 drivers/input/misc/aw86927.c | 841 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 853 insertions(+)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index f5496ca0c0d2..20a5f552d9f4 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -126,6 +126,17 @@ config INPUT_ATMEL_CAPTOUCH
 	  To compile this driver as a module, choose M here: the
 	  module will be called atmel_captouch.
 
+config INPUT_AW86927
+	tristate "Awinic AW86927 Haptic Driver Support"
+	depends on I2C && INPUT
+	select INPUT_FF_MEMLESS
+	select REGMAP_I2C
+	help
+	  Say Y here if you have an Awinic AW86927 haptic chip.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called aw86927.
+
 config INPUT_BBNSM_PWRKEY
 	tristate "NXP BBNSM Power Key Driver"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 6d91804d0a6f..a311a84d1b70 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_INPUT_ATC260X_ONKEY)	+= atc260x-onkey.o
 obj-$(CONFIG_INPUT_ATI_REMOTE2)		+= ati_remote2.o
 obj-$(CONFIG_INPUT_ATLAS_BTNS)		+= atlas_btns.o
 obj-$(CONFIG_INPUT_ATMEL_CAPTOUCH)	+= atmel_captouch.o
+obj-$(CONFIG_INPUT_AW86927)		+= aw86927.o
 obj-$(CONFIG_INPUT_BBNSM_PWRKEY)	+= nxp-bbnsm-pwrkey.o
 obj-$(CONFIG_INPUT_BMA150)		+= bma150.o
 obj-$(CONFIG_INPUT_CM109)		+= cm109.o
diff --git a/drivers/input/misc/aw86927.c b/drivers/input/misc/aw86927.c
new file mode 100644
index 000000000000..d08fafbde124
--- /dev/null
+++ b/drivers/input/misc/aw86927.c
@@ -0,0 +1,841 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+ *
+ * Partially based on vendor driver:
+ *	Copyright (c) 2021 AWINIC Technology CO., LTD
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define AW86927_RSTCFG				(0x00)
+#define AW86927_RSTCFG_SOFTRST			(0xaa)
+
+#define AW86927_SYSINT				(0x02)
+#define AW86927_SYSINT_BST_SCPI			BIT(7)
+#define AW86927_SYSINT_BST_OVPI			BIT(6)
+#define AW86927_SYSINT_UVLI			BIT(5)
+#define AW86927_SYSINT_FF_AEI			BIT(4)
+#define AW86927_SYSINT_FF_AFI			BIT(3)
+#define AW86927_SYSINT_OCDI			BIT(2)
+#define AW86927_SYSINT_OTI			BIT(1)
+#define AW86927_SYSINT_DONEI			BIT(0)
+
+#define AW86927_SYSINTM				(0x03)
+#define AW86927_SYSINTM_BST_OVPM		BIT(6)
+#define AW86927_SYSINTM_FF_AEM			BIT(4)
+#define AW86927_SYSINTM_FF_AFM			BIT(3)
+#define AW86927_SYSINTM_DONEM			BIT(0)
+
+#define AW86927_PLAYCFG1			(0x06)
+#define AW86927_PLAYCFG1_BST_MODE_MASK		GENMASK(7, 7)
+#define AW86927_PLAYCFG1_BST_MODE_BYPASS	(0)
+#define AW86927_PLAYCFG1_BST_VOUT_VREFSET_MASK	GENMASK(6, 0)
+#define AW86927_PLAYCFG1_BST_8500MV		(0x50)
+
+#define AW86927_PLAYCFG2			(0x07)
+
+#define AW86927_PLAYCFG3			(0x08)
+#define AW86927_PLAYCFG3_AUTO_BST_MASK		GENMASK(4, 4)
+#define AW86927_PLAYCFG3_AUTO_BST_ENABLE	(1)
+#define AW86927_PLAYCFG3_AUTO_BST_DISABLE	(0)
+#define AW86927_PLAYCFG3_PLAY_MODE_MASK		GENMASK(1, 0)
+#define AW86927_PLAYCFG3_PLAY_MODE_RAM		(0)
+
+#define AW86927_PLAYCFG4			(0x09)
+#define AW86927_PLAYCFG4_STOP			BIT(1)
+#define AW86927_PLAYCFG4_GO			BIT(0)
+
+#define AW86927_WAVCFG1				(0x0a)
+#define AW86927_WAVCFG1_WAVSEQ1_MASK		GENMASK(6, 0)
+
+#define AW86927_WAVCFG2				(0x0b)
+#define AW86927_WAVCFG2_WAVSEQ2_MASK		GENMASK(6, 0)
+
+#define AW86927_WAVCFG9				(0x12)
+#define AW86927_WAVCFG9_SEQ1LOOP_MASK		GENMASK(7, 4)
+#define AW86927_WAVCFG9_SEQ1LOOP_INFINITELY	(0x0f)
+
+#define AW86927_CONTCFG1			(0x18)
+#define AW86927_CONTCFG1_BRK_BST_MD_MASK	GENMASK(6, 6)
+
+#define AW86927_CONTCFG5			(0x1c)
+#define AW86927_CONTCFG5_BST_BRK_GAIN_MASK	GENMASK(7, 4)
+#define AW86927_CONTCFG5_BRK_GAIN_MASK		GENMASK(3, 0)
+
+#define AW86927_CONTCFG10			(0x21)
+#define AW86927_CONTCFG10_BRK_TIME_MASK		GENMASK(7, 0)
+#define AW86927_CONTCFG10_BRK_TIME_DEFAULT	(8)
+
+#define AW86927_CONTCFG13			(0x24)
+#define AW86927_CONTCFG13_TSET_MASK		GENMASK(7, 4)
+#define AW86927_CONTCFG13_BEME_SET_MASK		GENMASK(3, 0)
+
+#define AW86927_BASEADDRH			(0x2d)
+#define AW86927_BASEADDRL			(0x2e)
+
+#define AW86927_GLBRD5				(0x3f)
+#define AW86927_GLBRD5_STATE_MASK		GENMASK(3, 0)
+#define AW86927_GLBRD5_STATE_STANDBY		(0)
+
+#define AW86927_RAMADDRH			(0x40)
+#define AW86927_RAMADDRL			(0x41)
+#define AW86927_RAMDATA				(0x42)
+
+#define AW86927_SYSCTRL3			(0x45)
+#define AW86927_SYSCTRL3_STANDBY_MASK           GENMASK(5, 5)
+#define AW86927_SYSCTRL3_STANDBY_ON             (1)
+#define AW86927_SYSCTRL3_STANDBY_OFF            (0)
+#define AW86927_SYSCTRL3_EN_RAMINIT_MASK        GENMASK(2, 2)
+#define AW86927_SYSCTRL3_EN_RAMINIT_ON          (1)
+#define AW86927_SYSCTRL3_EN_RAMINIT_OFF         (0)
+
+#define AW86927_SYSCTRL4			(0x46)
+#define AW86927_SYSCTRL4_WAVDAT_MODE_MASK	GENMASK(6, 5)
+#define AW86927_SYSCTRL4_WAVDAT_24K		(0)
+#define AW86927_SYSCTRL4_INT_EDGE_MODE_MASK	GENMASK(4, 4)
+#define AW86927_SYSCTRL4_INT_EDGE_MODE_POS	(0)
+#define AW86927_SYSCTRL4_INT_MODE_MASK		GENMASK(3, 3)
+#define AW86927_SYSCTRL4_INT_MODE_EDGE		(1)
+#define AW86927_SYSCTRL4_GAIN_BYPASS_MASK	GENMASK(0, 0)
+
+#define AW86927_PWMCFG1				(0x48)
+#define AW86927_PWMCFG1_PRC_EN_MASK		GENMASK(7, 7)
+#define AW86927_PWMCFG1_PRC_DISABLE		(0)
+
+#define AW86927_PWMCFG3				(0x4a)
+#define AW86927_PWMCFG3_PR_EN_MASK		GENMASK(7, 7)
+#define AW86927_PWMCFG3_PRCTIME_MASK		GENMASK(6, 0)
+
+#define AW86927_PWMCFG4				(0x4b)
+#define AW86927_PWMCFG4_PRTIME_MASK		GENMASK(7, 0)
+
+#define AW86927_VBATCTRL			(0x4c)
+#define AW86927_VBATCTRL_VBAT_MODE_MASK		GENMASK(6, 6)
+#define AW86927_VBATCTRL_VBAT_MODE_SW		(0)
+
+#define AW86927_DETCFG1				(0x4d)
+#define AW86927_DETCFG1_DET_GO_MASK		GENMASK(1, 0)
+#define AW86927_DETCFG1_DET_GO_DET_SEQ0		(1)
+#define AW86927_DETCFG1_DET_GO_NA		(0)
+
+#define AW86927_DETCFG2				(0x4e)
+#define AW86927_DETCFG2_DET_SEQ0_MASK		GENMASK(6, 3)
+#define AW86927_DETCFG2_DET_SEQ0_VBAT		(0)
+#define AW86927_DETCFG2_D2S_GAIN_MASK		GENMASK(2, 0)
+#define AW86927_DETCFG2_D2S_GAIN_10		(4)
+
+#define AW86927_CHIPIDH				(0x57)
+#define AW86927_CHIPIDL				(0x58)
+#define AW86927_CHIPID				(0x9270)
+
+#define AW86927_TMCFG				(0x5b)
+#define AW86927_TMCFG_UNLOCK			(0x7d)
+#define AW86927_TMCFG_LOCK			(0x00)
+
+#define AW86927_ANACFG11			(0x70)
+#define AW86927_ANACFG12			(0x71)
+#define AW86927_ANACFG12_BST_SKIP_MASK		GENMASK(7, 7)
+#define AW86927_ANACFG12_BST_SKIP_SHUTDOWN	(1)
+
+#define AW86927_ANACFG13			(0x72)
+#define AW86927_ANACFG13_BST_PC_MASK		GENMASK(7, 4)
+#define AW86927_ANACFG13_BST_PEAKCUR_3P45A	(6)
+
+#define AW86927_ANACFG15			(0x74)
+#define AW86927_ANACFG15_BST_PEAK_MODE_MASK	GENMASK(7, 7)
+#define AW86927_ANACFG15_BST_PEAK_BACK		(1)
+
+#define AW86927_ANACFG16			(0x75)
+#define AW86927_ANACFG16_BST_SRC_MASK		GENMASK(4, 4)
+#define AW86927_ANACFG16_BST_SRC_3NS		(0)
+
+/* default value of base addr */
+#define AW86927_RAM_BASE_ADDR			(0x800)
+#define AW86927_BASEADDRH_VAL			(0x08)
+#define AW86927_BASEADDRL_VAL			(0x00)
+
+enum aw86927_work_mode {
+	AW86927_STANDBY_MODE,
+	AW86927_RAM_MODE,
+};
+
+struct aw86927_data {
+	struct work_struct play_work;
+	struct device *dev;
+	struct input_dev *input_dev;
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct gpio_desc *reset_gpio;
+	bool running;
+};
+
+static const struct regmap_config aw86927_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_NONE,
+	.max_register = 0x80,
+};
+
+/*
+ * Sine wave representing the magnitude of the drive to be used.
+ * Data is encoded in two's complement.
+ *   round(84 * sin(x / 16.25))
+ */
+static const uint8_t aw86927_waveform[] = {
+	0x00, 0x05, 0x0a, 0x0f, 0x14, 0x1a, 0x1f, 0x23, 0x28, 0x2d, 0x31, 0x35,
+	0x39, 0x3d, 0x41, 0x44, 0x47, 0x4a, 0x4c, 0x4f, 0x51, 0x52, 0x53, 0x54,
+	0x55, 0x55, 0x55, 0x55, 0x55, 0x54, 0x52, 0x51, 0x4f, 0x4d, 0x4a, 0x47,
+	0x44, 0x41, 0x3d, 0x3a, 0x36, 0x31, 0x2d, 0x28, 0x24, 0x1f, 0x1a, 0x15,
+	0x10, 0x0a, 0x05, 0x00, 0xfc, 0xf6, 0xf1, 0xec, 0xe7, 0xe2, 0xdd, 0xd8,
+	0xd4, 0xcf, 0xcb, 0xc7, 0xc3, 0xbf, 0xbc, 0xb9, 0xb6, 0xb4, 0xb1, 0xb0,
+	0xae, 0xad, 0xac, 0xab, 0xab, 0xab, 0xab, 0xab, 0xac, 0xae, 0xaf, 0xb1,
+	0xb3, 0xb6, 0xb8, 0xbc, 0xbf, 0xc2, 0xc6, 0xca, 0xce, 0xd3, 0xd7, 0xdc,
+	0xe1, 0xe6, 0xeb, 0xf0, 0xf5, 0xfb
+};
+
+struct aw86927_sram_waveform_header {
+	uint8_t version;
+	struct {
+		__be16 start_address;
+		__be16 end_address;
+	} __packed waveform_address[1];
+} __packed;
+
+static const struct aw86927_sram_waveform_header sram_waveform_header = {
+	.version = 0x01,
+	.waveform_address = {
+		/* Simple sine wave defined above */
+		{
+			.start_address = cpu_to_be16(AW86927_RAM_BASE_ADDR +
+				sizeof(struct aw86927_sram_waveform_header)),
+			.end_address = cpu_to_be16(AW86927_RAM_BASE_ADDR +
+				sizeof(struct aw86927_sram_waveform_header) +
+				ARRAY_SIZE(aw86927_waveform) - 1),
+		}
+	}
+};
+
+static int aw86927_wait_enter_standby(struct aw86927_data *haptics)
+{
+	unsigned int reg_val;
+	int err;
+
+	err = regmap_read_poll_timeout(haptics->regmap,
+			AW86927_GLBRD5, reg_val,
+			(FIELD_GET(AW86927_GLBRD5_STATE_MASK, reg_val) == AW86927_GLBRD5_STATE_STANDBY),
+			2500, 2500 * 100);
+
+	if (err)
+		dev_err(haptics->dev, "did not enter standby: %d\n", err);
+	return err;
+}
+
+static int aw86927_play_mode(struct aw86927_data *haptics, uint8_t play_mode)
+{
+	int err;
+
+	switch (play_mode) {
+	case AW86927_STANDBY_MODE:
+		/* Briefly toggle standby, then toggle back to standby off */
+		err = regmap_update_bits(haptics->regmap,
+				AW86927_SYSCTRL3,
+				AW86927_SYSCTRL3_STANDBY_MASK,
+				FIELD_PREP(AW86927_SYSCTRL3_STANDBY_MASK,
+					   AW86927_SYSCTRL3_STANDBY_ON));
+		if (err)
+			return err;
+
+		err = regmap_update_bits(haptics->regmap,
+				AW86927_SYSCTRL3,
+				AW86927_SYSCTRL3_STANDBY_MASK,
+				FIELD_PREP(AW86927_SYSCTRL3_STANDBY_MASK,
+					   AW86927_SYSCTRL3_STANDBY_OFF));
+		if (err)
+			return err;
+		break;
+	case AW86927_RAM_MODE:
+		err = regmap_update_bits(haptics->regmap,
+				AW86927_PLAYCFG3,
+				AW86927_PLAYCFG3_PLAY_MODE_MASK,
+				FIELD_PREP(AW86927_PLAYCFG3_PLAY_MODE_MASK,
+					   AW86927_PLAYCFG3_PLAY_MODE_RAM));
+		if (err)
+			return err;
+
+		err = regmap_update_bits(haptics->regmap,
+				AW86927_PLAYCFG1,
+				AW86927_PLAYCFG1_BST_MODE_MASK,
+				FIELD_PREP(AW86927_PLAYCFG1_BST_MODE_MASK,
+					   AW86927_PLAYCFG1_BST_MODE_BYPASS));
+		if (err)
+			return err;
+
+		err = regmap_update_bits(haptics->regmap,
+				AW86927_VBATCTRL,
+				AW86927_VBATCTRL_VBAT_MODE_MASK,
+				FIELD_PREP(AW86927_VBATCTRL_VBAT_MODE_MASK,
+					   AW86927_VBATCTRL_VBAT_MODE_SW));
+		if (err)
+			return err;
+		break;
+	}
+	return 0;
+}
+
+static int aw86927_stop(struct aw86927_data *haptics)
+{
+	int err;
+
+	err = regmap_write(haptics->regmap, AW86927_PLAYCFG4, AW86927_PLAYCFG4_STOP);
+	if (err) {
+		dev_err(haptics->dev, "Failed to stop playback: %d\n", err);
+		return err;
+	}
+
+	err = aw86927_wait_enter_standby(haptics);
+	if (err) {
+		dev_err(haptics->dev, "Failed to enter standby, trying to force it\n");
+		err = aw86927_play_mode(haptics, AW86927_STANDBY_MODE);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
+static int aw86927_haptics_play(struct input_dev *dev, void *data, struct ff_effect *effect)
+{
+	struct aw86927_data *haptics = input_get_drvdata(dev);
+	int level;
+
+	level = effect->u.rumble.strong_magnitude;
+	if (!level)
+		level = effect->u.rumble.weak_magnitude;
+
+	/* If already running, don't restart playback */
+	if (haptics->running && level)
+		return 0;
+
+	haptics->running = level;
+	schedule_work(&haptics->play_work);
+
+	return 0;
+}
+
+static int aw86927_play_sine(struct aw86927_data *haptics)
+{
+	int err;
+
+	err = aw86927_stop(haptics);
+	if (err)
+		return err;
+
+	err = aw86927_play_mode(haptics, AW86927_RAM_MODE);
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap, AW86927_PLAYCFG3,
+			AW86927_PLAYCFG3_AUTO_BST_MASK,
+			FIELD_PREP(AW86927_PLAYCFG3_AUTO_BST_MASK,
+				   AW86927_PLAYCFG3_AUTO_BST_ENABLE));
+	if (err)
+		return err;
+
+	/* Set waveseq 1 to the first wave */
+	err = regmap_update_bits(haptics->regmap, AW86927_WAVCFG1,
+			AW86927_WAVCFG1_WAVSEQ1_MASK,
+			FIELD_PREP(AW86927_WAVCFG1_WAVSEQ1_MASK,
+				   1));
+	if (err)
+		return err;
+
+	/* set wavseq 2 to zero */
+	err = regmap_update_bits(haptics->regmap, AW86927_WAVCFG2,
+			AW86927_WAVCFG2_WAVSEQ2_MASK,
+			FIELD_PREP(AW86927_WAVCFG2_WAVSEQ2_MASK,
+				   0));
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_WAVCFG9,
+			AW86927_WAVCFG9_SEQ1LOOP_MASK,
+			FIELD_PREP(AW86927_WAVCFG9_SEQ1LOOP_MASK,
+				   AW86927_WAVCFG9_SEQ1LOOP_INFINITELY));
+	if (err)
+		return err;
+
+	/* set gain to value lower than 0x80 to avoid distorted playback */
+	err = regmap_write(haptics->regmap, AW86927_PLAYCFG2, 0x7c);
+	if (err)
+		return err;
+
+	/* Start playback */
+	return regmap_write(haptics->regmap, AW86927_PLAYCFG4, AW86927_PLAYCFG4_GO);
+}
+
+static void aw86927_close(struct input_dev *input)
+{
+	struct aw86927_data *haptics = input_get_drvdata(input);
+	struct device *dev = &haptics->client->dev;
+	int err;
+
+	cancel_work_sync(&haptics->play_work);
+
+	err = aw86927_stop(haptics);
+	if (err)
+		dev_err(dev, "Failed to close the Driver: %d\n", err);
+}
+
+static void aw86927_haptics_play_work(struct work_struct *work)
+{
+	struct aw86927_data *haptics =
+		container_of(work, struct aw86927_data, play_work);
+	struct device *dev = &haptics->client->dev;
+	int err;
+
+	if (haptics->running)
+		err = aw86927_play_sine(haptics);
+	else
+		err = aw86927_stop(haptics);
+
+	if (err)
+		dev_err(dev, "Failed to execute work command: %d\n", err);
+}
+
+static void aw86927_hw_reset(struct aw86927_data *haptics)
+{
+	/* Assert reset */
+	gpiod_set_value_cansleep(haptics->reset_gpio, 1);
+	/* Wait ~1ms */
+	usleep_range(1000, 2000);
+	/* Deassert reset */
+	gpiod_set_value_cansleep(haptics->reset_gpio, 0);
+	/* Wait ~8ms until I2C is accessible */
+	usleep_range(8000, 8500);
+}
+
+static int aw86927_haptic_init(struct aw86927_data *haptics)
+{
+	int err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_SYSCTRL4,
+			AW86927_SYSCTRL4_WAVDAT_MODE_MASK,
+			FIELD_PREP(AW86927_SYSCTRL4_WAVDAT_MODE_MASK,
+				   AW86927_SYSCTRL4_WAVDAT_24K));
+	if (err)
+		return err;
+
+	/* enable gain bypass */
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_SYSCTRL4,
+			AW86927_SYSCTRL4_GAIN_BYPASS_MASK,
+			FIELD_PREP(AW86927_SYSCTRL4_GAIN_BYPASS_MASK,
+				   0x01));
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			AW86927_TMCFG,
+			AW86927_TMCFG_UNLOCK);
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			AW86927_ANACFG11,
+			0x0f);
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_ANACFG12,
+			AW86927_ANACFG12_BST_SKIP_MASK,
+			FIELD_PREP(AW86927_ANACFG12_BST_SKIP_MASK,
+				   AW86927_ANACFG12_BST_SKIP_SHUTDOWN));
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_ANACFG15,
+			AW86927_ANACFG15_BST_PEAK_MODE_MASK,
+			FIELD_PREP(AW86927_ANACFG15_BST_PEAK_MODE_MASK,
+				   AW86927_ANACFG15_BST_PEAK_BACK));
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_ANACFG16,
+			AW86927_ANACFG16_BST_SRC_MASK,
+			FIELD_PREP(AW86927_ANACFG16_BST_SRC_MASK,
+				   AW86927_ANACFG16_BST_SRC_3NS));
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			AW86927_TMCFG,
+			AW86927_TMCFG_LOCK);
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_CONTCFG1,
+			AW86927_CONTCFG1_BRK_BST_MD_MASK,
+			FIELD_PREP(AW86927_CONTCFG1_BRK_BST_MD_MASK,
+				   0x00));
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			AW86927_CONTCFG5,
+			FIELD_PREP(AW86927_CONTCFG5_BST_BRK_GAIN_MASK, 0x05) |
+			FIELD_PREP(AW86927_CONTCFG5_BRK_GAIN_MASK, 0x08));
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap, AW86927_CONTCFG10,
+			AW86927_CONTCFG10_BRK_TIME_MASK,
+			FIELD_PREP(AW86927_CONTCFG10_BRK_TIME_MASK,
+				   AW86927_CONTCFG10_BRK_TIME_DEFAULT));
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			AW86927_CONTCFG13,
+			FIELD_PREP(AW86927_CONTCFG13_TSET_MASK, 0x06) |
+			FIELD_PREP(AW86927_CONTCFG13_BEME_SET_MASK, 0x02));
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_DETCFG2,
+			AW86927_DETCFG2_D2S_GAIN_MASK,
+			FIELD_PREP(AW86927_DETCFG2_D2S_GAIN_MASK,
+				   AW86927_DETCFG2_D2S_GAIN_10));
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_PWMCFG1,
+			AW86927_PWMCFG1_PRC_EN_MASK,
+			FIELD_PREP(AW86927_PWMCFG1_PRC_EN_MASK,
+				   AW86927_PWMCFG1_PRC_DISABLE));
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			AW86927_PWMCFG3,
+			FIELD_PREP(AW86927_PWMCFG3_PR_EN_MASK, 0x01) |
+			FIELD_PREP(AW86927_PWMCFG3_PRCTIME_MASK, 0x3f));
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_PWMCFG4,
+			AW86927_PWMCFG4_PRTIME_MASK,
+			FIELD_PREP(AW86927_PWMCFG4_PRTIME_MASK,
+				   0x32));
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			AW86927_TMCFG,
+			AW86927_TMCFG_UNLOCK);
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_ANACFG13,
+			AW86927_ANACFG13_BST_PC_MASK,
+			FIELD_PREP(AW86927_ANACFG13_BST_PC_MASK,
+				   AW86927_ANACFG13_BST_PEAKCUR_3P45A));
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			AW86927_TMCFG,
+			AW86927_TMCFG_LOCK);
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_PLAYCFG1,
+			AW86927_PLAYCFG1_BST_VOUT_VREFSET_MASK,
+			FIELD_PREP(AW86927_PLAYCFG1_BST_VOUT_VREFSET_MASK,
+				   AW86927_PLAYCFG1_BST_8500MV));
+	if (err)
+		return err;
+
+	return regmap_update_bits(haptics->regmap,
+			AW86927_PLAYCFG3,
+			AW86927_PLAYCFG3_AUTO_BST_MASK,
+			FIELD_PREP(AW86927_PLAYCFG3_AUTO_BST_MASK,
+				   AW86927_PLAYCFG3_AUTO_BST_DISABLE));
+}
+
+static int aw86927_ram_init(struct aw86927_data *haptics)
+{
+	int err;
+
+	err = aw86927_wait_enter_standby(haptics);
+	if (err)
+		return err;
+
+	/* Enable SRAM init */
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_SYSCTRL3,
+			AW86927_SYSCTRL3_EN_RAMINIT_MASK,
+			FIELD_PREP(AW86927_SYSCTRL3_EN_RAMINIT_MASK,
+				   AW86927_SYSCTRL3_EN_RAMINIT_ON));
+
+	/* Set base address for the start of the SRAM waveforms */
+	err = regmap_write(haptics->regmap,
+			   AW86927_BASEADDRH,
+			   AW86927_BASEADDRH_VAL);
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			   AW86927_BASEADDRL,
+			   AW86927_BASEADDRL_VAL);
+	if (err)
+		return err;
+
+	/* Set start of SRAM, before the data is written it will be the same as the base */
+	err = regmap_write(haptics->regmap,
+			   AW86927_RAMADDRH,
+			   AW86927_BASEADDRH_VAL);
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap,
+			   AW86927_RAMADDRL,
+			   AW86927_BASEADDRL_VAL);
+	if (err)
+		return err;
+
+	/* Write waveform header to SRAM */
+	err = regmap_noinc_write(haptics->regmap, AW86927_RAMDATA,
+				 &sram_waveform_header, sizeof(sram_waveform_header));
+
+	/* Write waveform to SRAM */
+	err = regmap_noinc_write(haptics->regmap, AW86927_RAMDATA,
+				 aw86927_waveform, ARRAY_SIZE(aw86927_waveform));
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_DETCFG2,
+			AW86927_DETCFG2_DET_SEQ0_MASK,
+			FIELD_PREP(AW86927_DETCFG2_DET_SEQ0_MASK,
+				   AW86927_DETCFG2_DET_SEQ0_VBAT));
+	if (err)
+		return err;
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_DETCFG1,
+			AW86927_DETCFG1_DET_GO_MASK,
+			FIELD_PREP(AW86927_DETCFG1_DET_GO_MASK,
+				   AW86927_DETCFG1_DET_GO_DET_SEQ0));
+	if (err)
+		return err;
+
+	usleep_range(3000, 3500);
+
+	err = regmap_update_bits(haptics->regmap,
+			AW86927_DETCFG1,
+			AW86927_DETCFG1_DET_GO_MASK,
+			FIELD_PREP(AW86927_DETCFG1_DET_GO_MASK,
+				   AW86927_DETCFG1_DET_GO_NA));
+	if (err)
+		return err;
+
+	/* Disable SRAM init */
+	return regmap_update_bits(haptics->regmap,
+			AW86927_SYSCTRL3,
+			AW86927_SYSCTRL3_EN_RAMINIT_MASK,
+			FIELD_PREP(AW86927_SYSCTRL3_EN_RAMINIT_MASK,
+				   AW86927_SYSCTRL3_EN_RAMINIT_OFF));
+}
+
+static irqreturn_t aw86927_irq(int irq, void *data)
+{
+	struct aw86927_data *haptics = data;
+	struct device *dev = &haptics->client->dev;
+	unsigned int reg_val;
+	int err;
+
+	err = regmap_read(haptics->regmap, AW86927_SYSINT, &reg_val);
+	if (err) {
+		dev_err(dev, "Failed to read SYSINT register: %d\n", err);
+		return IRQ_NONE;
+	}
+
+	if (reg_val & AW86927_SYSINT_BST_SCPI)
+		dev_err(dev, "Received a Short Circuit Protection interrupt\n");
+	if (reg_val & AW86927_SYSINT_BST_OVPI)
+		dev_err(dev, "Received an Over Voltage Protection interrupt\n");
+	if (reg_val & AW86927_SYSINT_UVLI)
+		dev_err(dev, "Received an Under Voltage Lock Out interrupt\n");
+	if (reg_val & AW86927_SYSINT_OCDI)
+		dev_err(dev, "Received an Over Current interrupt\n");
+	if (reg_val & AW86927_SYSINT_OTI)
+		dev_err(dev, "Received an Over Temperature interrupt\n");
+
+	if (reg_val & AW86927_SYSINT_DONEI)
+		dev_dbg(dev, "Chip playback done!\n");
+	if (reg_val & AW86927_SYSINT_FF_AFI)
+		dev_dbg(dev, "The RTP mode FIFO is almost full!\n");
+	if (reg_val & AW86927_SYSINT_FF_AEI)
+		dev_dbg(dev, "The RTP mode FIFO is almost empty!\n");
+
+	return IRQ_HANDLED;
+}
+
+static int aw86927_detect(struct aw86927_data *haptics)
+{
+	__be16 read_buf;
+	u16 chip_id;
+	int err;
+
+	err = regmap_bulk_read(haptics->regmap, AW86927_CHIPIDH, &read_buf, 2);
+	if (err)
+		return dev_err_probe(haptics->dev, err, "Failed to read CHIPID registers\n");
+
+	chip_id = be16_to_cpu(read_buf);
+
+	if (chip_id != AW86927_CHIPID) {
+		dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int aw86927_probe(struct i2c_client *client)
+{
+	struct aw86927_data *haptics;
+	unsigned int read_buf;
+	int err;
+
+	haptics = devm_kzalloc(&client->dev, sizeof(struct aw86927_data), GFP_KERNEL);
+	if (!haptics)
+		return -ENOMEM;
+
+	haptics->dev = &client->dev;
+	haptics->client = client;
+
+	i2c_set_clientdata(client, haptics);
+	dev_set_drvdata(&client->dev, haptics);
+
+	haptics->regmap = devm_regmap_init_i2c(client, &aw86927_regmap_config);
+	if (IS_ERR(haptics->regmap))
+		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
+					"Failed to allocate register map\n");
+
+	haptics->input_dev = devm_input_allocate_device(haptics->dev);
+	if (!haptics->input_dev)
+		return -ENOMEM;
+
+	haptics->reset_gpio = devm_gpiod_get(haptics->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(haptics->reset_gpio))
+		return dev_err_probe(haptics->dev, PTR_ERR(haptics->reset_gpio),
+				     "Failed to get reset gpio\n");
+
+	/* Hardware reset */
+	aw86927_hw_reset(haptics);
+
+	/* Software reset */
+	err = regmap_write(haptics->regmap, AW86927_RSTCFG, AW86927_RSTCFG_SOFTRST);
+	if (err)
+		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
+					"Failed Software reset\n");
+
+	/* Wait ~3s until I2C is accessible */
+	usleep_range(3000, 3500);
+
+	err = aw86927_detect(haptics);
+	if (err)
+		return dev_err_probe(haptics->dev, err, "Failed to find chip\n");
+
+	/* IRQ config */
+	err = regmap_write(haptics->regmap, AW86927_SYSCTRL4,
+			FIELD_PREP(AW86927_SYSCTRL4_INT_MODE_MASK,
+				   AW86927_SYSCTRL4_INT_MODE_EDGE) |
+			FIELD_PREP(AW86927_SYSCTRL4_INT_EDGE_MODE_MASK,
+				   AW86927_SYSCTRL4_INT_EDGE_MODE_POS));
+	if (err)
+		return err;
+
+	err = regmap_write(haptics->regmap, AW86927_SYSINTM,
+			AW86927_SYSINTM_BST_OVPM |
+			AW86927_SYSINTM_FF_AEM |
+			AW86927_SYSINTM_FF_AFM |
+			AW86927_SYSINTM_DONEM);
+	if (err)
+		return err;
+
+	err = devm_request_threaded_irq(haptics->dev, client->irq, NULL,
+					aw86927_irq, IRQF_ONESHOT, NULL, haptics);
+
+	INIT_WORK(&haptics->play_work, aw86927_haptics_play_work);
+
+	haptics->input_dev->name = "aw86927-haptics";
+	haptics->input_dev->close = aw86927_close;
+
+	input_set_drvdata(haptics->input_dev, haptics);
+	input_set_capability(haptics->input_dev, EV_FF, FF_RUMBLE);
+
+	err = input_ff_create_memless(haptics->input_dev, NULL,
+			aw86927_haptics_play);
+	if (err)
+		return dev_err_probe(haptics->dev, err, "Failed to create FF dev\n");
+
+	/* Set up registers */
+	err = aw86927_play_mode(haptics, AW86927_STANDBY_MODE);
+	if (err)
+		return err;
+
+	err = aw86927_haptic_init(haptics);
+	if (err)
+		return dev_err_probe(haptics->dev, err, "Haptic init failed\n");
+
+	/* RAM init, upload the waveform for playback */
+	err = aw86927_ram_init(haptics);
+	if (err)
+		return dev_err_probe(haptics->dev, err, "Failed to init aw86927 sram\n");
+
+	err = input_register_device(haptics->input_dev);
+	if (err)
+		return dev_err_probe(haptics->dev, err, "Failed to register input device\n");
+
+	return 0;
+}
+
+static const struct of_device_id aw86927_of_id[] = {
+	{ .compatible = "awinic,aw86927" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, aw86927_of_id);
+
+static struct i2c_driver aw86927_driver = {
+	.driver = {
+		.name = "aw86927-haptics",
+		.of_match_table = aw86927_of_id,
+	},
+	.probe = aw86927_probe,
+};
+
+module_i2c_driver(aw86927_driver);
+
+MODULE_AUTHOR("Griffin Kroah-Hartman <griffin.kroah@fairphone.com>");
+MODULE_DESCRIPTION("AWINIC AW86927 LRA Haptic Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


