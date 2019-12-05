Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 451CA1138AF
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 01:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbfLEAZN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 19:25:13 -0500
Received: from onstation.org ([52.200.56.107]:54132 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728564AbfLEAZM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Dec 2019 19:25:12 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 2E4CC3E95C;
        Thu,  5 Dec 2019 00:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1575505511;
        bh=MIYlfWlSPtjF56uPfYYHBUYnZwk4RxPjlw4ZKaCtn8o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lqCDvwf94SCpekX0hcjWNeCXi/LRsGXW+hBRHXxvG41kwvVQHcLbsVpbPQeNFsp9A
         kZZvxO7UI5a31yKtK/JmIfP1K9s4UogWQpaKnjszHT9diNcRYfoVICN57zk7FHtQIL
         8iK+vIOGLsgIAih+3nzLKA3U+ZaPFq2CQqtyYtA0=
From:   Brian Masney <masneyb@onstation.org>
To:     sboyd@kernel.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 6/7] ARM: qcom_defconfig: drop msm-vibrator in favor of clk-vibrator driver
Date:   Wed,  4 Dec 2019 19:25:02 -0500
Message-Id: <20191205002503.13088-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205002503.13088-1-masneyb@onstation.org>
References: <20191205002503.13088-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The msm-vibrator driver no longer exists, so let's enable the more
generic clk-vibrator driver instead.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/configs/qcom_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 201e20bc6189..6c7c42ffe5a4 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -99,7 +99,7 @@ CONFIG_KEYBOARD_PMIC8XXX=y
 CONFIG_INPUT_JOYSTICK=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_INPUT_MISC=y
-CONFIG_INPUT_MSM_VIBRATOR=m
+CONFIG_INPUT_CLK_VIBRATOR=m
 CONFIG_INPUT_PM8941_PWRKEY=m
 CONFIG_INPUT_PM8XXX_VIBRATOR=y
 CONFIG_INPUT_PMIC8XXX_PWRKEY=y
-- 
2.21.0

