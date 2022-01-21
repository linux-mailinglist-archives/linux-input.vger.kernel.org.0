Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C79496055
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 15:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380974AbiAUOES (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 09:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380878AbiAUOEJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 09:04:09 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61492C061763
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 06:03:32 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id n8so18147299wmk.3
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 06:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loBYM0CvRSmbYDvfbUBNz4qYHn2wRGpqqQjyZhyXZLU=;
        b=IBdLRh3GfWtpz9wVQJ4xWuWdyqUBqcu2/DG846I5k5YYLKBKHhiL418mxXKdYBztaN
         qdXWkHF5UDFbawXQlr0ZzIea4m+fHilr3D6gUNN99tKSc2+5e3WwdD3XWcTzh8vUjorD
         Rtbfrg+NQsdJTOItj7h2sOOlMKjRuBmgHqyinlsUW6WS+GE1aOn/ABvcsMwnywrJJYde
         qUvL7VRhP0abO0aBWYyv3rW+k9qlOvdU+MKYW1FIcrUpooRTpevYryNFRz0rb6Xd51WG
         kOHOX4CuojJ5vHG07Tkl1V2MG9biEcOLWD6anj3eWiQEt+5DhoZs1PY2hjZ6HmeKd8i1
         HfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loBYM0CvRSmbYDvfbUBNz4qYHn2wRGpqqQjyZhyXZLU=;
        b=p+4swIvlmzhN9fuiazyHQSnuZKQjfBTFnx0sJHIRLlrbqVi9l1d2bQY1VLlMHaj3n7
         3uRlO89JTh6xxOIozbhb4N4jg9pawhXE7nExRMwYkVGMF7zmCZkQoAUnGI4Gkx7ycZyd
         x8W6YXhimLNF5Gthvo1VXzQApbNc3TlC8zX5HDkWU6Dk/Kk1QzD6CZJG6hIUriTvOhyM
         0J8HJtM3gabVvScmBJv8/pK0e8jt4n5FiDmUVCRRH5eWVEwxjqt5hTctXAo+QVPk4i4n
         By8XEq1cnW5V3S/0pLEOxZVZhJyky2AiCI1vwLmWSpO/+o9yLUKn+V7rnmF69shNEbgn
         Nxzg==
X-Gm-Message-State: AOAM530Oqlynsiwqds35N6VJn1pX26pAu7HB5lgYLAOIu+IXeFX2uC7C
        bpKj/wiSpHyR3hZVt5xH4n6SPYI2dbF5nw==
X-Google-Smtp-Source: ABdhPJydtfNsdqeZZA9fWZU8clNybEl4YDGRvOfTL+ORNNu48acgumv2Axn2vVIs5i6oDvNkpO+iHw==
X-Received: by 2002:a5d:4b87:: with SMTP id b7mr3858530wrt.327.1642773810915;
        Fri, 21 Jan 2022 06:03:30 -0800 (PST)
Received: from groot.home (lfbn-tou-1-205-205.w86-201.abo.wanadoo.fr. [86.201.52.205])
        by smtp.gmail.com with ESMTPSA id p29sm9225129wms.5.2022.01.21.06.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 06:03:30 -0800 (PST)
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
Subject: [PATCH v4 4/4] arm64: dts: mt6358: add mt6358-keys node
Date:   Fri, 21 Jan 2022 15:03:23 +0100
Message-Id: <20220121140323.4080640-5-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
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
index 95145076b7e6..98f3b0e0c9f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020 MediaTek Inc.
  */
+#include <dt-bindings/input/input.h>
 
 &pwrap {
 	pmic: mt6358 {
@@ -357,5 +358,16 @@ mt6358_vsim2_reg: ldo_vsim2 {
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
2.32.0

