Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CE02D0757
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 22:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgLFVYN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Dec 2020 16:24:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgLFVYL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Dec 2020 16:24:11 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4A1C0613D4;
        Sun,  6 Dec 2020 13:23:31 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 3so11855681wmg.4;
        Sun, 06 Dec 2020 13:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y9gRg52LFimb3ceOLj9UGDG1IkEgZHW2S4OzYw39/xU=;
        b=d7O0my1wBVi1u1gtjj4jjGlO8BWfXhGjjM23J6VRYei48Yys8pDpV2EQtxxZnohaM7
         UFEfYFD7AaQVaNa9JbIBnbT8EeuFyLfbHZUDSnzSf0BcrQAB4hGCGo2K9PYpHsGvwqxl
         5T2lrcjUKHvwoBW2EteXUMBjz/aSlK2j+tPXiC9U1cPMHpsWbrMq2uB3upji+eyIxC0l
         dWRwkYAmAG7cmee7cR/2jk71CngxTPJuEcxOhkSvmClPm645SpRTNAbPwdlwXw1/oHcs
         xM2GDsvrvnxNZxXJnB6DGUobM+SZw0F1JY1mc7lOGd2KaoB7Knf4G6/qmj0PknU2bfuQ
         Q2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9gRg52LFimb3ceOLj9UGDG1IkEgZHW2S4OzYw39/xU=;
        b=PCDSgg2TLfiBAtsptb6rcA7bHN4etTo+aM3NDIVlzWrOC5ACme2jf6jx1CawjJ8yTt
         1XAaWmVaenEnqaFV9AH2dgJrC44DDywLHekjiMPOhvMlQKCs06FkNQ87mGoEkO8vLU7g
         bDSM/GlSsKDhNipQ0b5Zx8at0KIVTQBfLpYHR+vCT/1Ha6shBz1NUB4SPFQpBGfg0Duq
         JH7ivHZF9lYuAzxDreBbO7GI9zdA6yUWSLAEY2P5gZuyY7w4x8zR0bpniZmh/JIUYr31
         vi/+Ez0e4Safgpy4hbJeK4bsnT3W7DNOfk9NjqdFzUQzU5Yddu/VCMNSs9lKDlBBkxlO
         +NLA==
X-Gm-Message-State: AOAM5316yTtnGuLS0VhPhzoxEJBc4YKiUXgsLcZN7YMGBIeXGaf/H2VG
        aZ1aiZlQtz0r102YiDBN87M=
X-Google-Smtp-Source: ABdhPJy9NBN3kkvBfGdqYfnw9bTVuONN3G+ZpBDYqXmWuw1LROkYuyN1GceG+MLBXwmmERRuQBaqwA==
X-Received: by 2002:a1c:9916:: with SMTP id b22mr14670639wme.182.1607289810102;
        Sun, 06 Dec 2020 13:23:30 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id l24sm12737540wrb.28.2020.12.06.13.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 13:23:29 -0800 (PST)
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
Subject: [PATCH v3 3/3] ARM: tegra: acer-a500: Add atmel,wakeup-method property
Date:   Mon,  7 Dec 2020 00:22:17 +0300
Message-Id: <20201206212217.6857-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201206212217.6857-1-digetx@gmail.com>
References: <20201206212217.6857-1-digetx@gmail.com>
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

