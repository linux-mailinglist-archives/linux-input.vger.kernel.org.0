Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0AA32A591
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444946AbhCBMu5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:50:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379999AbhCBKYn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 05:24:43 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C3DC0617A7;
        Tue,  2 Mar 2021 02:22:09 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h4so23053942ljl.0;
        Tue, 02 Mar 2021 02:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ez28sRNxxnA+mFrwwNyOygQjyXiZVskV4841e9M5tTE=;
        b=Qne4+z/IjF+WaFiDJb7UeJbCSjyzc0cZiYik1OfF0ZBeomFum8Oy+OPGD/u+vc4Z5a
         F61VhUwcMlrAgb14aJ/rCBxQrfuw1bG3bnd1pxZyIcw1Xr9n5uzPcrhxncDYI9nFmT9X
         a1wkf1jjFTemTpn85Jcas/KT6LN9kRD7j1IM+cb+lQtobBkEy+bMs5tFoLHu5P7cDlnS
         56p1VFdhGs+JORQGGl423NIE6djgC/pIplzWsHx0+W/tMdaZrFk9nCc6F0kg7e7Lpq1P
         b124giCYd641SEGPn1HTCl1LH11rMl5w4VpYBBaSC0kXgt7/OVdktFfDPFKIhZff1VpJ
         KSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ez28sRNxxnA+mFrwwNyOygQjyXiZVskV4841e9M5tTE=;
        b=Q4u2XDtU4MVWpboEq5V7CGneTEw4hOxzYrGRfWXxJ/fpWGa0dhIrDJovgazPNkXxrK
         xj2eQHZ2y2pkfolL++coDPoLp/grzokqC5qeMFTEvby0wgyKwIbOjlx4ZVFnEMKAbRET
         tZ9QMqwAKSEC3K0Y5/QOBpwmAPb9flb5ujAcYKTmoF6HWIOBJnD+z0KjBB0yX56c0Zt9
         xFgpp/CoAZzLEmhgTOopeKb5pGqjR8kuelzNsE6lUQoshMiP5xtrrxZi+xc10nZ6+6pb
         JaTdZcefhBobjSME/WyMlPK1eyxs5qOpWJdgZ3u/ensJO4TMwQcNbZI4wF4Qdlu4+18f
         dw7g==
X-Gm-Message-State: AOAM532rSYREopCI7KTOTjvSuxkomKEtCeRWzLPCoOtzFPnXyuOSYIAM
        yTLGAws8OFjIgktW0LDqsfM=
X-Google-Smtp-Source: ABdhPJwacKskz1iscj45Emaav16iDjjJ3zCeIbF8xVQ4y/Zd4xC03VGoBI7nRTwwfmkU1qhhnTWQfA==
X-Received: by 2002:a2e:b01a:: with SMTP id y26mr11496407ljk.442.1614680526143;
        Tue, 02 Mar 2021 02:22:06 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id n2sm2586369lfu.274.2021.03.02.02.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:22:05 -0800 (PST)
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
Subject: [PATCH v6 3/3] ARM: tegra: acer-a500: Add atmel,wakeup-method property
Date:   Tue,  2 Mar 2021 13:21:58 +0300
Message-Id: <20210302102158.10533-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302102158.10533-1-digetx@gmail.com>
References: <20210302102158.10533-1-digetx@gmail.com>
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

