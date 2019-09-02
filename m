Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81E48A5528
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 13:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731001AbfIBLkp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 07:40:45 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:43748 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730975AbfIBLko (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Sep 2019 07:40:44 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id 9168DA3572;
        Mon,  2 Sep 2019 13:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1567424442;
        bh=6RQ2RglASyvtA3arVyeg0dngL0bF8rz4y3wnPK/XtDE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ld/8aFhBvlIOlMpJMzC5bN8Wdqpg3U4mH+9fXhaFsUw+L++xBcS2/QNnDqzECIGAA
         9UkOD0PnCeEiHXbfmegMm1M7Mpf3tcMMRRdeR/dv54nDBZ5Y1eAmWdDosrcKL8+Go0
         wi/kpLoGD/CjJa8uvNUA0BfWVoIGiiLmGpN5EePg=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH input-next 2/4] dt-bindings: input: mpr121: Add poll-interval property
Date:   Mon,  2 Sep 2019 13:40:15 +0200
Message-Id: <1567424417-3914-3-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add an option to periodicaly poll the device to get the buttons states
as the interrupt line may not be used on some platforms.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
I am not sure how to propperly handle this.
Either interrupt or linux,poll-interval is required, but not both.

 .../bindings/input/fsl,mpr121-touchkey.yaml          | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
index c463c1c81755..2b3073a3c9f4 100644
--- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
+++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
@@ -34,6 +34,10 @@ properties:
     minItems: 1
     maxItems: 12
 
+  linux,poll-interval:
+    description: Poll interval time in milliseconds.
+    maxItems: 1
+
   wakeup-source: Use any event on keypad as wakeup event.
     type: boolean
 
@@ -44,12 +48,12 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-supply
   - linux,keycodes
 
 examples:
   - |
+    // Example with interrupts
     #include "dt-bindings/input/input.h"
     touchkey: mpr121@5a {
         compatible = "fsl,mpr121-touchkey";
@@ -62,3 +66,17 @@ examples:
                          <KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
                          <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
     };
+
+  - |
+    // Example with polling
+    #include "dt-bindings/input/input.h"
+    touchkey: mpr121@5a {
+        compatible = "fsl,mpr121-touchkey";
+        reg = <0x5a>;
+        linux,poll-interval = <20>;
+        autorepeat;
+        vdd-supply = <&ldo4_reg>;
+        linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
+                         <KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
+                         <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
+    );
-- 
2.1.4

