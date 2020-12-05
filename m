Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A1F2CF9DF
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 06:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgLEFsp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 00:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728779AbgLEFsp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 00:48:45 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77087C061A52;
        Fri,  4 Dec 2020 21:48:04 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id u9so5129078lfm.1;
        Fri, 04 Dec 2020 21:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y9gRg52LFimb3ceOLj9UGDG1IkEgZHW2S4OzYw39/xU=;
        b=cSb0GmoETBlwzLSWynys0Kkv9th9aqH3FayVYZAgIqTL1sjNjIQsw5z4FCcrCJzkLw
         FZZnxK7ARi7cHGUzFyku0Td+a9EO/WrNrq5/2wjxgWruaLycLrRxxcrp2NHT25GAMwb2
         jUT/lYHM2yYVek6WBLXzxBTr2WISgpe+yItSSn6TU8cfP/z+MskC+/Q5rvfxT5Z2C22D
         1MoLHsm1tRIHppgEDdGSq4fiX4Ck4mKvSudcalzse5QiKBp/QspRVzJ0Ht3J2ciUF6qD
         k7jMK6Rrsl95rad7mWmzQw//W5kmrE2Neq/DnoaJ53okp52+sM5OUSH6MyT+62ovZ14y
         E0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9gRg52LFimb3ceOLj9UGDG1IkEgZHW2S4OzYw39/xU=;
        b=hDFKgIsEMNfUw9ZzmZpZOcbRzoywkH2OqEs7piFI6oZzCwcbwWVgVM9JjravSeewGV
         HNvur2xnMYV+B0RnNHtrCiV6sr49RB1cTFiz9PFq8CGWRtcInRQYMjxzTQ1LEhwpZiUx
         Htt3yTvMkCI711tB/SKBxMVqNzY80tZ/Tz8Y1E1HRsriXpREde9LL3HbEbAA+SB5x9o4
         6DjdigEhpXlFA08NlgvEc0vRJ2wb0Y4DHR3oro0pg5UfUV0QNZyt9Qq5FSPJHsySiSqZ
         cromjdYJtVv6tDBTwbbDYEhqZqTyC7/wwIWxrL9ztG0BzwTAjC+dcP39Aml3e8br3UcW
         nbeg==
X-Gm-Message-State: AOAM530ld6ywyWl7/ilvJ2189zHGhXf1+mi93RqZlpU1fVN43gAz5gqr
        ZQPqgc5VpInT+5gJzD4V4rc=
X-Google-Smtp-Source: ABdhPJw3Ub3qM1rkXJggA6CZxirbnewaybJ/Y3lky7bsLoQiP0/c9NoE+6pvHLGt3yupJGH2CzEaKA==
X-Received: by 2002:a19:4a08:: with SMTP id x8mr4589545lfa.322.1607147283042;
        Fri, 04 Dec 2020 21:48:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id w28sm2231490ljd.48.2020.12.04.21.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 21:48:02 -0800 (PST)
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
Subject: [PATCH v2 3/3] ARM: tegra: acer-a500: Add atmel,wakeup-method property
Date:   Sat,  5 Dec 2020 08:47:49 +0300
Message-Id: <20201205054749.26487-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205054749.26487-1-digetx@gmail.com>
References: <20201205054749.26487-1-digetx@gmail.com>
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

