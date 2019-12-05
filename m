Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E4D1138A4
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 01:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbfLEAZM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 19:25:12 -0500
Received: from onstation.org ([52.200.56.107]:54082 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728459AbfLEAZK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Dec 2019 19:25:10 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 928183EE76;
        Thu,  5 Dec 2019 00:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1575505509;
        bh=pIGbqstYX1DDUmUHjMHhQCOZgHwek3BSxn3fKIXXUms=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vm2cj0A2uwowoG4JOx0tTVpZjXRol+meOIAFbxO+ppePLdsGQ5+TLDKXCuK9LHMJx
         kYrlkbkYTWrczhMe33jMvOwW1o+CC9dz/T5ODNYxrMyeND8rxTUcS4xp3qMuxq5wPU
         HNwckRhRU0/bGurEzlg2j7pC+fp5pEwAfncQqqJs=
From:   Brian Masney <masneyb@onstation.org>
To:     sboyd@kernel.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: Input: drop msm-vibrator in favor of clk-vibrator
Date:   Wed,  4 Dec 2019 19:24:58 -0500
Message-Id: <20191205002503.13088-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205002503.13088-1-masneyb@onstation.org>
References: <20191205002503.13088-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Let's drop the msm-vibrator bindings so that the more generic
clk-vibrator can be used instead. No one is currently using these
bindings so this won't affect any users.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 .../bindings/input/msm-vibrator.txt           | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/msm-vibrator.txt

diff --git a/Documentation/devicetree/bindings/input/msm-vibrator.txt b/Documentation/devicetree/bindings/input/msm-vibrator.txt
deleted file mode 100644
index 8dcf014ef2e5..000000000000
--- a/Documentation/devicetree/bindings/input/msm-vibrator.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Device tree bindings for the Qualcomm MSM vibrator
-
-Required properties:
-
-  - compatible: Should be one of
-		"qcom,msm8226-vibrator"
-		"qcom,msm8974-vibrator"
-  - reg: the base address and length of the IO memory for the registers.
-  - pinctrl-names: set to default.
-  - pinctrl-0: phandles pointing to pin configuration nodes. See
-               Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-  - clock-names: set to pwm
-  - clocks: phandle of the clock. See
-            Documentation/devicetree/bindings/clock/clock-bindings.txt
-  - enable-gpios: GPIO that enables the vibrator.
-
-Optional properties:
-
-  - vcc-supply: phandle to the regulator that provides power to the sensor.
-
-Example from a LG Nexus 5 (hammerhead) phone:
-
-vibrator@fd8c3450 {
-	reg = <0xfd8c3450 0x400>;
-	compatible = "qcom,msm8974-vibrator";
-
-	vcc-supply = <&pm8941_l19>;
-
-	clocks = <&mmcc CAMSS_GP1_CLK>;
-	clock-names = "pwm";
-
-	enable-gpios = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&vibrator_pin>;
-};
-- 
2.21.0

