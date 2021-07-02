Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E3B3BA17D
	for <lists+linux-input@lfdr.de>; Fri,  2 Jul 2021 15:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhGBNqB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Jul 2021 09:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbhGBNp7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Jul 2021 09:45:59 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F91C061765
        for <linux-input@vger.kernel.org>; Fri,  2 Jul 2021 06:43:27 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o22so6733277wms.0
        for <linux-input@vger.kernel.org>; Fri, 02 Jul 2021 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rEhU8Um5f0JiN5UeHBJI5GyHDmhvUyYTxNlEBkR3UOo=;
        b=Olhx4UlCuIfRvcxRt/0zqVPZpQnQBNItBR/JKERv+Eev5CLysDIlTi2lcWT6kpawpK
         x4pfq3AcH7YHbC2ZTTdraCay59JnayrekmOCc0cCcIeD7fjGqlx2xLsxOx9Krx1l6KY8
         6kvCL5XcrRNOdqUoApmmPUUtebmR41JiiBlnnVFPeB/sY86Hhbun+gEZgyq0br9EXPS7
         dI8YRus3MYM3+Xsn8UPe0JQqN5Qspc1iExCcbKHHNVakYOe4m0OLpD5+kqXk4Plr+4n+
         9+ApgSFKmBEcpYkbN8qJZohcCL2+1yx5ZjENIwqKds/9oaV0casBgsmQMXtnD8QQWPx8
         sGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rEhU8Um5f0JiN5UeHBJI5GyHDmhvUyYTxNlEBkR3UOo=;
        b=axkTBJmFOYAwyiicMcfOgoXzR1YV7cp5johCxlbELAsxZGDdSIsuZHVFRXxIe/2c7X
         c4tQ3Rcviwy1TUC25sTx1K/7uh6gjNF9cZlxf5KKUf6owKr6HAhOoR22EWoNjZFJOMM4
         4C4p+96WK05Vr6BpYfFxT2kf3aTKDxxkch5HDdXB+hx2MgdeKD/mY1mOJDjx0uvXdYTt
         Lk8lmSrd1InVG91yZWPU042fEPQG2LNmHityI2PN01+aT2gPa1ZPvmNdDeA3O+314b2m
         +zbFXZL+6WHJqhr0qEBxbYH0zrAbNdAItKK8jnFmRkC/Wz+MFmDXkqlSzKgytCinHNzG
         BfAA==
X-Gm-Message-State: AOAM5309RmRq21wZzUo5D7Pdn5uKCtgLoMGXMy++O0IX1+MbJ8R0NiVV
        chqmyPgrNCqiTLJvyCcRvis9KA==
X-Google-Smtp-Source: ABdhPJwnStGuaizhehaJ7yHxKMwHfg61nZmXZITfuPGPqNtQIfKaLtBLZH0EDnMdLDGsESkAkkkrww==
X-Received: by 2002:a05:600c:1c8f:: with SMTP id k15mr5646909wms.91.1625233406190;
        Fri, 02 Jul 2021 06:43:26 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:c5f3:6ae:eaf:87a2])
        by smtp.gmail.com with ESMTPSA id s1sm12595512wmj.8.2021.07.02.06.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 06:43:25 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v3 4/4] arm64: dts: mt6358: add mt6358-keys node
Date:   Fri,  2 Jul 2021 15:43:10 +0200
Message-Id: <20210702134310.3451560-5-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
References: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This enables the power,home keys on MediaTek boards with a mt6358 pmic.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index fa159b20379e..a1b017a6a751 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020 MediaTek Inc.
  */
+#include <dt-bindings/input/input.h>
 
 &pwrap {
 	pmic: mt6358 {
@@ -356,5 +357,16 @@ mt6358_vsim2_reg: ldo_vsim2 {
 		mt6358rtc: mt6358rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
+
+		mt6358keys: mt6358keys {
+			compatible = "mediatek,mt6358-keys";
+			power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+			home {
+				linux,keycodes = <KEY_HOME>;
+			};
+		};
 	};
 };
-- 
2.27.0

