Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EF128B3F4
	for <lists+linux-input@lfdr.de>; Mon, 12 Oct 2020 13:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388282AbgJLLjE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Oct 2020 07:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388188AbgJLLi6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Oct 2020 07:38:58 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E2BC0613D5
        for <linux-input@vger.kernel.org>; Mon, 12 Oct 2020 04:38:57 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d3so17209603wma.4
        for <linux-input@vger.kernel.org>; Mon, 12 Oct 2020 04:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AizmEGLJWCh5e+BIl/5tzrCIJ5dIEIgB9BBqx3BLDyw=;
        b=0qmWSBxEbq35KurZTOsOhck3qTnnnOHUBmvQCN3yCNiwPxRpua2FZOxJKkZtJr8Tdl
         s+jM0s3YJE8/WServiwBPovX2q/PyHCKWFjRpcNF5DvBBNEEhUkUaxZ2J98D2l+VFjXw
         wm9iszb90LKGBzEyPGMWA+jOcptEtN8rj2Z0b43VAlif4tmF9bGPNtSBUnQkr17QpU8D
         WiqKPpohjr1wRnc/KxN105r8k/0GbhTPQvGnqPMv9qgDxDewvykK8UDF/UyPYYA7hrtC
         ca9JqBx3wIGuxtRxq5bIu3NJ9RI2Xd6awIXk3+5isloa933zApn/57ZrRdqO2wIjyPd0
         pXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AizmEGLJWCh5e+BIl/5tzrCIJ5dIEIgB9BBqx3BLDyw=;
        b=rHG24/PLl4uE3oINvbSiJuTdMZ9vTwerbveM3Mn1jtHm6er393KJKu4kBvnrb9Vzeu
         xkKPJx4Q+dKpmaI58MUJacdp/Awf1ZStOWI9o8UfXLnfEkjpMgy5X7C1u52SFW360Jef
         3UzPGltrnkHT/LVRN+/NdPm9GGODuchVkyB3Sv8UGsONlKgFB3ozFCqDbv8gA8tDaVAT
         JSxS4tMwUqK1DVJseNsCHTb1MoKyISiHhMOLKJdWxUeP5iqQIHwJyR2OneynlWivRSF1
         VX1LcV+HS+8cw24kKl2b/P16vuJU2ueYhqRnU0ybYdwbxFAme/JtF7paGFLPgCw+ZPhW
         riSg==
X-Gm-Message-State: AOAM531k5ubxVxE3YiM9u//tixAlMbuUH5rFzsXUfwkSa/mzXPdWAFV3
        PE+hSOF6oJg9iHoio30ouf9yZQ==
X-Google-Smtp-Source: ABdhPJzylMLeTRhmQpLakNIW7gsPR+5BowgUIi+DkXjP1HpgG9IEx5b2JG9z5tyO9ughYMPkuJqBxQ==
X-Received: by 2002:a1c:bb06:: with SMTP id l6mr10907219wmf.40.1602502736377;
        Mon, 12 Oct 2020 04:38:56 -0700 (PDT)
Received: from localhost.localdomain (170.175.185.81.rev.sfr.net. [81.185.175.170])
        by smtp.gmail.com with ESMTPSA id o194sm22378065wme.24.2020.10.12.04.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 04:38:55 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, matthias.bgg@gmail.com
Cc:     hsin-hsiung.wang@mediatek.com, lee.jones@linaro.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 2/3] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date:   Mon, 12 Oct 2020 13:38:39 +0200
Message-Id: <20201012113840.396358-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012113840.396358-1-fparent@baylibre.com>
References: <20201012113840.396358-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v6:
	* No changes

v5:
	* rebased
	* Rename MT6397/MT6392/MT6323 into MT63XX to make it more readable when
	the list of support PMIC increase
	* Removed Reviewed-by from Rob Herring because of the new extra changes
	made to this patch
	* change the compatible for MT6392 to also contains MT6397 since MT6392 PMIC
	key driver is compatible with mt6397.

v4:
	* Patch was previously sent separately but merge to this patch series
	since there is a hard dependency on the MFD patch.

 .../devicetree/bindings/input/mtk-pmic-keys.txt     | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..71c82687ab92 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -1,15 +1,18 @@
-MediaTek MT6397/MT6323 PMIC Keys Device Driver
+MediaTek MT63xx PMIC Keys Device Driver
 
-There are two key functions provided by MT6397/MT6323 PMIC, pwrkey
+There are two key functions provided by MT63xx PMIC, pwrkey
 and homekey. The key functions are defined as the subnode of the function
-node provided by MT6397/MT6323 PMIC that is being defined as one kind
+node provided by MT63xx PMIC that is being defined as one kind
 of Muti-Function Device (MFD)
 
-For MT6397/MT6323 MFD bindings see:
+For MT63xx MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6323-keys" for MT6323 PMIC
+	- "mediatek,mt6392-keys", "mediatek,mt6397-keys" for MT6392 PMIC
+	- "mediatek,mt6397-keys" for MT6397 PMIC
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.28.0

