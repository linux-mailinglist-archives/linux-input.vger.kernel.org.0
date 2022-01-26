Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBF349CEA2
	for <lists+linux-input@lfdr.de>; Wed, 26 Jan 2022 16:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242902AbiAZPf3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jan 2022 10:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242932AbiAZPf2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jan 2022 10:35:28 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D471C061749
        for <linux-input@vger.kernel.org>; Wed, 26 Jan 2022 07:35:28 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id s9so10625269wrb.6
        for <linux-input@vger.kernel.org>; Wed, 26 Jan 2022 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KlQywLM4SRqpFvXyB5cSelAzc/97HjHZ8/iIFU/mpmM=;
        b=K0xAZphaFB3cOn2S+KjeL76gs//nCrAcf06PaPQ51oH2guyo8PFTVs0KveAl7euaUT
         Dsg21sXr2zJBKnHm7Xx7EhRkvlZkqzm3J4rrdH4wdjV2rACFV9LYD9ScKhtqdwTr00fX
         gY+VXsxZd4wSgadmZUmjcR0Y6x99tltZ+cLckMc6KgKg8p5NMZSyEIacvnvAwyTjVxbT
         NswgQkcr013ohkacykuRhWGYZRPg/VFUepXYuxw4zrvgfUavlZBRGc701qc3/18lmpS4
         jVTbY6Vt1fw/ZLzeigRTsjd3bsQ/ufFGYmxdOHDRlV+4p1cuAqnB657T+jAxo42Kxp6Q
         PijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KlQywLM4SRqpFvXyB5cSelAzc/97HjHZ8/iIFU/mpmM=;
        b=CH8x8HXHl3BX5x3YODfk7e45ihWoFkKvokurlltl8Bfbz0fK8WOxNZ9Fjnf6WVR1Uh
         HzbDzgBHuuSUAVH3i4qtMQbRbbrPRGNT4rBcZ8e+cPVZLqJ3T4BIyAH7dDKclFEs/eKF
         LbzJSV80awxOTCGnNp9lU2jzTns13nB2qzUcufCMDfP8YMj43+IYwhdRJ3XOfDn/jkxc
         r+43mbsOcbkoqfNV1NMaMYxgGShfuibZQYMG6V5gNLRkYuSov1ks6if99MdHkG4xtncY
         4k7SiSD936TtM8fRukceqn9O6IvyGmvD2F/9JjfLb8JqBja2A1bT8mU15ETHUAPKaGt9
         ubYw==
X-Gm-Message-State: AOAM5332OUzA0O+21k89s5pfu9gJ9eQgN6u4JJhWkfc6DY1NnIQGX9Cu
        krMZGxRX0DKnEtXlvZXwwzq5zw==
X-Google-Smtp-Source: ABdhPJxotKUt+W40osc+v3XbruY7Q8g2wgWP28RkprzdfNHadOgnPqN6aUrBhwYKp8IgGrivKAt0gw==
X-Received: by 2002:a05:6000:c1:: with SMTP id q1mr20663651wrx.195.1643211326793;
        Wed, 26 Jan 2022 07:35:26 -0800 (PST)
Received: from mkorpershoek-XPS-13-9370.. (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
        by smtp.gmail.com with ESMTPSA id n10sm3360958wmr.25.2022.01.26.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 07:35:26 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fengping Yu <fengping.yu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v19 3/3] arm64: defconfig: Add CONFIG_KEYBOARD_MT6779=m
Date:   Wed, 26 Jan 2022 16:35:19 +0100
Message-Id: <20220126153519.3637496-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220126153519.3637496-1-mkorpershoek@baylibre.com>
References: <20220126153519.3637496-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Add Mediatek matrix keypad support in defconfig.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e2b9bdd702..099a9e68711c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -390,6 +390,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_MT6779=m
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_GOODIX=m
-- 
2.32.0

