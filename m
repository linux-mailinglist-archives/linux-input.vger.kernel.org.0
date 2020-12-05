Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2CA2CF9C2
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 06:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgLEFez (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 00:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgLEFey (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 00:34:54 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27799C061A52;
        Fri,  4 Dec 2020 21:34:14 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id d20so10607211lfe.11;
        Fri, 04 Dec 2020 21:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y9gRg52LFimb3ceOLj9UGDG1IkEgZHW2S4OzYw39/xU=;
        b=nvCcLKblZ0/wm+v/rSO+tAPVgvNkk8SLqZlsDR5swBuYHWCb+C0ago4ST5tpgTe7zf
         29IO0MQb5ToHtMX9e5nsYiYKO2mKsIQS0kMIowZPG6ua9TuE7SS4n+3tANH6IZ8qU/m+
         tg8Du3xrko2ODhaRlKJjTz2de/SBfpR5DKs3unBZD8X2dhz8MP4xOdXRu/MmGlWO5Ttd
         4i39DQQrCNHx4ZlrcEhA6WMA38KbCcqmr9JA2c2SGYStZH80vtAWQ9zTgQesdqIOcy1i
         l32tywb19Xm/ZEG9hlWuInp806+8gd12kVhdeZrFdH14DOgPs6BLCzlk7kahgPHGBdqb
         L8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9gRg52LFimb3ceOLj9UGDG1IkEgZHW2S4OzYw39/xU=;
        b=QECYyQKa+cAKiXQqCqGKv9vLg6pWpBJoISiMzwtlKhzFYlxphB37GzuIgLBjP1QNvg
         5hBp2Db9HmMwD2fvPggzi70G8y8/fqfKnrVK5UxzuSF7SUUa9uMPrqVgELnZHD4dwzM9
         86pbHNUuqaR1HLGJfTFPHbhF+K05MWdZKUrgHK5W8x0ICBdhC5oWEPv1tYMYuygnJeb+
         RxKAsdu7VNBIeofwXvMKG2cg1IxkAIrR+dukqixHKVsa8iLIC1G9eSCpp8e03Qx0bEeB
         7o4jQIjX25c+D27RfL1hw+qzwsJOQPT6uT2EP32anTDk3yCh9I34rRYU2oXCfgAQo5tO
         Dccw==
X-Gm-Message-State: AOAM531ptvY2NQ3AWNo5rAeQ0JQX1ePIQK4hqSQrZ3QfgeRF4jGJ0H7Y
        Go+2Ko0VBiigfCUDgdjV/vE=
X-Google-Smtp-Source: ABdhPJyNpszIHBiXNg2Efh1DFc5FliksE0jQko9EltJEFSlPDu4tLfikGI9DZzB+KGJ1rmOwYs+J3g==
X-Received: by 2002:a19:8c13:: with SMTP id o19mr4348449lfd.573.1607146452711;
        Fri, 04 Dec 2020 21:34:12 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id d25sm2289861lja.40.2020.12.04.21.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 21:34:12 -0800 (PST)
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
Subject: [PATCH v1 3/3] ARM: tegra: acer-a500: Add atmel,wakeup-method property
Date:   Sat,  5 Dec 2020 08:33:28 +0300
Message-Id: <20201205053328.9535-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205053328.9535-1-digetx@gmail.com>
References: <20201205053328.9535-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

