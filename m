Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FBF300D65
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 21:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730600AbhAVUJx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 15:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730929AbhAVUIe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 15:08:34 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CD8C061788;
        Fri, 22 Jan 2021 12:07:54 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id u25so9255711lfc.2;
        Fri, 22 Jan 2021 12:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y9gRg52LFimb3ceOLj9UGDG1IkEgZHW2S4OzYw39/xU=;
        b=W99sHHYI7t0CcC8oPYPlrxWcMoA90BV6xA91iRAMLJV2XV7BhYK41oipX90fiNkoUu
         vVo1yn1SVS67lzOTgoSLuuscQ0HEw9b+BGmcSg+RBO243c+oxIOLNClbWWk9hY2rlWNM
         EjJTpmiKNOpqgRmuAK+KiUsRoNJlowI2X0ww+956L6WezLCSRuT5yRJqXdrDiTVgixsE
         iu21JqETyon+PSIls/+/2DI3pRJs1bPtPsTkAWYiU8CNmacjnRaopRgygsj9LuOu/Vm4
         E7DLGi/wyUUS7T+gcSrdKZB+1yMSzUGntYWSqrz3fSECz0lcZ0Uy9qov8Gek8ULjpBMB
         wd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9gRg52LFimb3ceOLj9UGDG1IkEgZHW2S4OzYw39/xU=;
        b=Eljau46Bf/mF9YzJ/tLIpCnyNaXTCrc2y2I1bN0tNX5eJAgzUvpJMSJTqpLopKkjDR
         fJ54QbsHKmsiw9SuM+ATzYmZ+z5Mlg0a347MPis0QmS+zMXCGb0LwJIxNeHwT4Wwei6u
         omeU1PwMeRbVHjQwGZRCFDSxTQLrGjG+wyR/WaeNW5t5xFCoGI4njyI+nHlj4rTNT24J
         Spatp3cVoJx9kwVkT4hx9lf1rTTNrBPor9VZPwUHBgP9EWKKqdZB1YvBnFJZfCpQlboL
         YJ0ps6ljOlZ7k+Kd4Dv35EsD0Ir4/Okw/u8woPAkijKQFuzZiMfcvM3MrxPKYvEa4IKW
         9r4Q==
X-Gm-Message-State: AOAM533UW3vZlwFKKMYC8BcdMh0WSrzhHVH3uayX1/S1PNhEZbEbOc9W
        LfY1LKPCtXjFWvjKmmtkC4Q=
X-Google-Smtp-Source: ABdhPJzM/KzLAJZlVro7XhRkCNgTHuayNlQowADJx0rYOUq3vQEUkH/KJYLTiZeFCZ7e2A3rk8dd3g==
X-Received: by 2002:a19:2346:: with SMTP id j67mr1374571lfj.254.1611346072510;
        Fri, 22 Jan 2021 12:07:52 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u6sm994589lfk.127.2021.01.22.12.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:07:51 -0800 (PST)
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
Subject: [PATCH v4 3/3] ARM: tegra: acer-a500: Add atmel,wakeup-method property
Date:   Fri, 22 Jan 2021 23:06:59 +0300
Message-Id: <20210122200659.7404-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122200659.7404-1-digetx@gmail.com>
References: <20210122200659.7404-1-digetx@gmail.com>
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

