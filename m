Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BBF3ED18A
	for <lists+linux-input@lfdr.de>; Mon, 16 Aug 2021 12:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235806AbhHPKA4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 06:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235778AbhHPKAx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 06:00:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAF6C061764
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 03:00:21 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id u15so11194777wmj.1
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UDJl1ra07oVDdz98SG+iWdsSDX/qH4lLdmGYx5g/CN8=;
        b=UQAyx7S0xUtzb5rTtzfeSVsO9o+fgeGp9Nm2qsgnLgbRKWX+fddfLIKN64iYkM2A2z
         MRfyQMKROkCJ8L1xbxXgKL3EO4qI17hTWLw+CYKLPoINaJuhRbiTNmhkhxFqY91AL86v
         t1pPO6mPDprK4yELktLu/ZBvlmCrSt7uvigyNzkoTQ1AzmWbroFa8xAqYOmtn63mwUrz
         BeLHNgGed4T/eRoYG7o/v9tL99Q+Kr2DWH3quLRUwE46LMI484PxnHCwLQi3Fy4U/MjY
         P3l0wI0LIep52C7+iLezChqstJBlHfUr56ubVB4HKdRGa1TjZySBQateYIbI+wAl+7Zl
         d1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UDJl1ra07oVDdz98SG+iWdsSDX/qH4lLdmGYx5g/CN8=;
        b=lgjt0zXLuspfXGdOtnXDn2nxp/ODJipypQc05vnxB6XOcxJyvqvt2k4t6ANKJSjsmZ
         ftKulQ6wCu5uzBgMM+xcPo5gictlxbd7L2BTGX+vNGtc1PGf1A9esIyyA7K0/I+u9MRb
         +t2CJEiVX4TGTE7Npd43S+yG5LQ15QH2Kh9ALe3vwRtl0rFPN33mt4XPsKetcEACPnyG
         JShMxpSKzCw/rEdOlR/PvS5ePF+KlyXWlgEGuiMr+73eLvh76NdB32MhmRJ4kQVfE3e1
         F7gvkHkr9db/qPB9pC18whAWynJ0LWGHXpXOem1v13lR3NsEGAm8oNon2049YRaoempI
         Db7Q==
X-Gm-Message-State: AOAM530yOENI2eVt7X2EL7cKjDnjPcdfQ7GyaHzV2kAu400K5FEJvBAn
        Lv7BQH4pNpOEUwqUr0pKNqSUkQ==
X-Google-Smtp-Source: ABdhPJwDYN8zt110c62GL+L9QAZr4E6pKpjaOL2oGDz6fohYbxdvZxmPMyAy0YyEKhI9y39j9ZFhaw==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr14711494wmi.2.1629108020370;
        Mon, 16 Aug 2021 03:00:20 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:92b1:d3c2:1204:85e2])
        by smtp.gmail.com with ESMTPSA id u10sm1916645wrt.14.2021.08.16.03.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 03:00:20 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH RESEND v3 4/4] arm64: dts: mt6358: add mt6358-keys node
Date:   Mon, 16 Aug 2021 12:00:13 +0200
Message-Id: <20210816100013.100412-5-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816100013.100412-1-mkorpershoek@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
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
2.30.2

