Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBDB632A58D
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444928AbhCBMuw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382789AbhCBKQr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 05:16:47 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B3EC061793;
        Tue,  2 Mar 2021 02:16:06 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 2so18687125ljr.5;
        Tue, 02 Mar 2021 02:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ez28sRNxxnA+mFrwwNyOygQjyXiZVskV4841e9M5tTE=;
        b=Pe9rtYsa9lFn64dDCfahYZxf306oCCrCBssuyBL0i4/OD+iwAKllbdLC+VFdMBpVV2
         hSG9CxV0SYOxtRMU2+KHv26/jHO99lHaqj44RG0qgSSt+rG1g0TmI05EbrkCINvWXlfC
         STOdJ53W5t9CMpWhuhOAa1COLTShxILaBLCB3xrpgct/PJR5tmq/7NQpoeHk7y+y3+xf
         ERqq7SUU7jxRJRGp/QtP0+4YAxl7tIfBdMST0Q5DwtncB2Yh++BOJKWrG+ca3VUFnV46
         NUt8ZgEuoICro7NoRRWBJUUHhkHtQ++Bwjf+fPRVReOP31SLCHl033GO3Ok9giyh5EXH
         gczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ez28sRNxxnA+mFrwwNyOygQjyXiZVskV4841e9M5tTE=;
        b=eALMMUbkC5js7KcODfBkizzZXtPGWIjj7Aj37VSKeSgtwZg4kSHp7Qjigtb+CJ5FNK
         D7h1eZ7MZc7NWVCXkjGSDMFP+AiQt/L+ZiNMn+NyLrkELL/vxH+/fJckehenUtq2BsD0
         5Jyocen+rSAY0bYifzUop0Ic8nGkNG2mPPzjbLS587Rv04XSgqoXVAPP3U2r5nxDkBji
         d59erbPm0a2snUeFbeuKRlTEeUz7OFdPzohSiOev1l7ICuj6Ec+LP9twK0ky8tqFpBFa
         FjIvbIPeC835YxV51Nl44sgO9CkSP5xZAqhJSUJhRzq/9l5mq5yfKIG3XfeCCGjHiPxI
         SGdg==
X-Gm-Message-State: AOAM530LW8/53ZpcFtU7DN2uHxS6XWTIalcbSp56xq3uDL0H2gk7ugK7
        4dBG/MVAwy8fxCGmpqyLbwE=
X-Google-Smtp-Source: ABdhPJwSjaCEsicL1qhYHUgqIVulGcRUyynY4bR4v9OwDAf/6N3OSUFxzerqK8lhycH+qEKmS5rC0A==
X-Received: by 2002:a2e:8592:: with SMTP id b18mr11679623lji.155.1614680165412;
        Tue, 02 Mar 2021 02:16:05 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id w4sm307861lfl.236.2021.03.02.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:16:05 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] ARM: tegra: acer-a500: Add atmel,wakeup-method property
Date:   Tue,  2 Mar 2021 13:15:56 +0300
Message-Id: <20210302101556.7150-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302101556.7150-1-digetx@gmail.com>
References: <20210302101556.7150-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Acer A500 uses Atmel Maxtouch 1386 touchscreen controller. This controller
has WAKE line which could be connected to I2C clock lane, dedicated GPIO
or fixed to HIGH level. Controller wakes up from a deep sleep when WAKE
line is asserted low. Acer A500 has WAKE line connected to I2C clock and
Linux device driver doesn't work property without knowing what wakeup
method is used by h/w.

Add atmel,wakeup-method property to the touchscreen node.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index d3b99535d755..40c1bab22155 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/input/atmel-maxtouch.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -450,6 +451,8 @@ touchscreen@4c {
 
 			avdd-supply = <&vdd_3v3_sys>;
 			vdd-supply  = <&vdd_3v3_sys>;
+
+			atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
 		};
 
 		gyroscope@68 {
-- 
2.29.2

