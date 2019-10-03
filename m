Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1FC0C9826
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 08:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfJCGND (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 02:13:03 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:44178 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727587AbfJCGND (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 02:13:03 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id 3BE37A0973;
        Thu,  3 Oct 2019 08:13:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1570083181;
        bh=oIkokaJCWSqaC/MedpRmpwQpGjqjHo/ZVzfOZeqsW7s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VXlKrOCX494qkZhWWBl8z/EKmVHGAZPXGKrEcaMkcFMBDAUqlelwpBBPMCSazjWs5
         ay7kf0rGeWqbSRFR8qtURyvozFED66cP7HqJW5KMCwXK4SzCPX6Az0pSSpIFPQbv7Q
         7ZR862+7j/EvhXN1OeaofSGP7h3TxTxOSdAcLsyE=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v3 3/5] dt-bindings: input: Add poll-interval property
Date:   Thu,  3 Oct 2019 08:12:54 +0200
Message-Id: <1570083176-8231-4-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add an option to periodicaly poll the device to get state of the inputs
as the interrupt line may not be used on some platforms.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
Changes since v2:
 - None

Changes since v1:
 - Use poll-interval instead of linux,poll-interval.
 - Place the poll-interval binding into the common schema.
 - Properly describe that either interrupts or poll-interval property is
   required.
 - Fix the example to pass validation.

 .../bindings/input/fsl,mpr121-touchkey.yaml        | 25 +++++++++++++++++++++-
 Documentation/devicetree/bindings/input/input.yaml |  4 ++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
index c6fbcdf78556..035b2fee4491 100644
--- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
+++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
@@ -17,6 +17,10 @@ description: |
 allOf:
   - $ref: input.yaml#
 
+oneOf:
+  - required: [ interrupts ]
+  - required: [ poll-interval ]
+
 properties:
   compatible:
     const: fsl,mpr121-touchkey
@@ -41,12 +45,12 @@ properties:
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
     i2c {
         #address-cells = <1>;
@@ -64,3 +68,22 @@ examples:
                              <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
         };
     };
+
+  - |
+    // Example with polling
+    #include "dt-bindings/input/input.h"
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mpr121@5a {
+            compatible = "fsl,mpr121-touchkey";
+            reg = <0x5a>;
+            poll-interval = <20>;
+            autorepeat;
+            vdd-supply = <&ldo4_reg>;
+            linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
+                             <KEY_4>, <KEY_5>, <KEY_6>, <KEY_7>,
+                             <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
index ca8fe84a2e62..6d519046b3af 100644
--- a/Documentation/devicetree/bindings/input/input.yaml
+++ b/Documentation/devicetree/bindings/input/input.yaml
@@ -24,6 +24,10 @@ properties:
           minimum: 0
           maximum: 0xff
 
+  poll-interval:
+    description: Poll interval time in milliseconds.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   power-off-time-sec:
     description:
       Duration in seconds which the key should be kept pressed for device to
-- 
2.1.4

