Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF95C9828
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 08:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfJCGND (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 02:13:03 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:44162 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbfJCGND (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 02:13:03 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id DE39BA095B;
        Thu,  3 Oct 2019 08:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1570083180;
        bh=Sy55JxpoNfmQQuRDsoHKv3oT39z9AK+6c1CfdAzxXGo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qnyz60Vu9VwZiPMwwj/WiDRprNd7qgpiuD8Yo2Tbrt3b5CsxGoLBWutOLIj9rVX8j
         v2Hdxf2KH3lB1Y9P4+MHxTVMuvrcqNTdx6VOJmP36W7+S8zMMVTONbqN09Rai6rp2i
         5kX72p9/bZGdvLbxqXqg9hWohGIoWiS/ySMpWjK8=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v3 1/5] dt-bindings: input: Add common input binding in json-schema
Date:   Thu,  3 Oct 2019 08:12:52 +0200
Message-Id: <1570083176-8231-2-git-send-email-michal.vokac@ysoft.com>
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

Create schema for the common input properties and merge all properties
from the Documentation/devicetree/bindings/input/keys.txt binding into
this common schema.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
Changes since v2:
 - Merge content of keys.txt binding inti this schema.

Changes since v1:
 - New patch in the series.

 Documentation/devicetree/bindings/input/input.yaml | 32 ++++++++++++++++++++++
 Documentation/devicetree/bindings/input/keys.txt   |  8 ------
 .../devicetree/bindings/input/mtk-pmic-keys.txt    |  4 +--
 .../devicetree/bindings/input/st,stpmic1-onkey.txt |  2 +-
 4 files changed, 35 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/input.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/keys.txt

diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
new file mode 100644
index 000000000000..ca8fe84a2e62
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/input.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/input.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common input schema binding
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+properties:
+  autorepeat:
+    description: Enable autorepeat when key is pressed and held down.
+    type: boolean
+
+  linux,keycodes:
+    description:
+      Specifies an array of numeric keycode values to be used for reporting
+      button presses.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - items:
+          minimum: 0
+          maximum: 0xff
+
+  power-off-time-sec:
+    description:
+      Duration in seconds which the key should be kept pressed for device to
+      power off automatically. Device with key pressed shutdown feature can
+      specify this property.
+    $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/input/keys.txt b/Documentation/devicetree/bindings/input/keys.txt
deleted file mode 100644
index f5a5ddde53f1..000000000000
--- a/Documentation/devicetree/bindings/input/keys.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-General Keys Properties:
-
-Optional properties for Keys:
-- power-off-time-sec: Duration in seconds which the key should be kept
-	pressed for device to power off automatically. Device with key pressed
-	shutdown feature can specify this property.
-- linux,keycodes: Specifies the numeric keycode values to be used for
-	reporting key presses.
diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 2888d07c2ef0..535d92885372 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -10,13 +10,13 @@ Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
 - compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
-- linux,keycodes: See Documentation/devicetree/bindings/input/keys.txt
+- linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
 - wakeup-source: See Documentation/devicetree/bindings/power/wakeup-source.txt
 - mediatek,long-press-mode: Long press key shutdown setting, 1 for
 	pwrkey only, 2 for pwrkey/homekey together, others for disabled.
-- power-off-time-sec: See Documentation/devicetree/bindings/input/keys.txt
+- power-off-time-sec: See Documentation/devicetree/bindings/input/input.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt b/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
index 4494613ae7ad..eb8e83736c02 100644
--- a/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
+++ b/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
@@ -15,7 +15,7 @@ Optional properties:
 - st,onkey-pu-inactive: onkey pull up is not active
 - power-off-time-sec: Duration in seconds which the key should be kept
         pressed for device to power off automatically (from 1 to 16 seconds).
-        see See Documentation/devicetree/bindings/input/keys.txt
+        see See Documentation/devicetree/bindings/input/input.yaml
 
 Example:
 
-- 
2.1.4

