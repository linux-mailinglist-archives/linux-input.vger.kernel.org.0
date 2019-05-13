Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45F2E1B832
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2019 16:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbfEMOVr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 May 2019 10:21:47 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40894 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730308AbfEMOVq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 May 2019 10:21:46 -0400
Received: by mail-wr1-f67.google.com with SMTP id h4so15518105wre.7
        for <linux-input@vger.kernel.org>; Mon, 13 May 2019 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cSguXg1ULNsLVeUlyV/JBYC1DyTsN/aiCX3xWl5lL/w=;
        b=jleNO/Cdfykym1Iv62B4ZMzaeTMBfgLnbRfEOuZTYHQdFwoD/fE3Nu1uIO83bTuCb0
         WufTyu79QjpzY5s5s1Orw+T6OkXimC1WGuD0yHItW1LPMoPvqskys5DxO8pNyTC4ETUn
         89Ywwrps4NBIRn5o/0NOl6bzkn3fmWkCmrYM3/Grojkmqb4lW1xowhu96CezF4gLiK/1
         pDJQJQvPFq6JEytsSw8z70jl3Aeprsh4UCVcEIAsKpgSj9R8c3+d/jI7Jk6plZr47VhM
         Mb/gptNd4QJJZk6wUuG2U8eo6Ut7BoGxnUESQsUaQv5y5S+4390RDYWn7yytT4L9H7BN
         VSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cSguXg1ULNsLVeUlyV/JBYC1DyTsN/aiCX3xWl5lL/w=;
        b=JF0ddG7ZPKqAkfzWinJp7tRFNlLn+A3aVtynB6hkrbOiA1+7oU7FtNGZhdMHokMNNR
         CGrGJpZOyMwtRlXHIGukAJFN5f/4FYPiM8aQce/Df9ZH2JXYnScXDdBtb0FmDbrzvmXA
         jXlheHbD0RKOUmS7jj7afXzv7WZGRK001/GiZj2z0+cwNmSR9zBvPNXX56A1yBHdxrIi
         5NmBCJHngM64MFLfGS3wpnNCm24EFQnD4qVOGFl6T2nhlo59fqQV/MA4nidrdfa3scM3
         W7YO2b4KPJcMfmBh1UKi37o6ZcuC+Nx+QgGuLQ4a+Kfj6ZC6hDvJIQZ6a0UA7CgDY5zt
         HYFg==
X-Gm-Message-State: APjAAAX7dAWcGlIzQgbF4N2UK9vOZkFb5BaMUGGcS5a4DBrRQEtp83vS
        FOAbxWedBFySRlnazNu55OPT+w==
X-Google-Smtp-Source: APXvYqyb7jvJZ+9TFKgT7DkyliaCtl4ZcjeYhYQ5a7ehr+YjdueGGPUKUKqqrkwlDWYC3gJx5sgcgQ==
X-Received: by 2002:adf:aa0a:: with SMTP id p10mr8675758wrd.125.1557757305028;
        Mon, 13 May 2019 07:21:45 -0700 (PDT)
Received: from localhost.localdomain (aputeaux-684-1-11-31.w90-86.abo.wanadoo.fr. [90.86.214.31])
        by smtp.gmail.com with ESMTPSA id v184sm21133615wma.6.2019.05.13.07.21.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 07:21:44 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 2/2] input: keyboard: mtk-pmic-keys: add MT6392 support
Date:   Mon, 13 May 2019 16:21:20 +0200
Message-Id: <20190513142120.6527-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513142120.6527-1-fparent@baylibre.com>
References: <20190513142120.6527-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for MT6392 PMIC's keys.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 8e6ebab05ab4..aaf68cbf7e5b 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -83,6 +84,16 @@ static const struct mtk_pmic_regs mt6323_regs = {
 	.pmic_rst_reg = MT6323_TOP_RST_MISC,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x2, MT6392_INT_MISC_CON, 0x10),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS,
+		0x4, MT6392_INT_MISC_CON, 0x8),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+};
+
 struct mtk_pmic_keys_info {
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_keys_regs *regs;
@@ -238,6 +249,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		/* sentinel */
 	}
-- 
2.20.1

