Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750D21D045F
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 03:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731983AbgEMBhV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 21:37:21 -0400
Received: from onstation.org ([52.200.56.107]:35608 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728332AbgEMBhT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 21:37:19 -0400
Received: from tp-x1.redhat.com (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 8DD123EA59;
        Wed, 13 May 2020 01:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1589333507;
        bh=9vYr0veDNGoPaF0yS5MgwbJtvztKvRkU36Niw0Jf0FQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vV0fTbCTzCLFGEiGXQv9U0QuwhugL71BmjnOIengbpGcnpJTGPe7nAqq+YlPmmzdn
         hTWjZgaLDfZokWS1ciT1lVx9N+ULN6/aBF+m7PbBYMhzCfo5ax/6OfEFNkozZ4PP9/
         yLn76FCFnP/2emMumEBcxy+8n7TIurFWmTOf8ojE=
From:   Brian Masney <masneyb@onstation.org>
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sboyd@kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 RESEND 1/2] dt-bindings: Input: remove msm-vibrator
Date:   Tue, 12 May 2020 21:31:39 -0400
Message-Id: <20200513013140.69935-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200513013140.69935-1-masneyb@onstation.org>
References: <20200513013140.69935-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The address referenced in this binding is within the Qualcomm Clock
namespace so let's drop the msm-vibrator bindings so that a more
generic solution can be used instead.  No one is currently using these
bindings so this won't affect any users.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Acked-by: Rob Herring <robh@kernel.org>
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
2.24.1

