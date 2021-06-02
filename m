Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0141E399332
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 21:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbhFBTIu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 15:08:50 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:52902 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229710AbhFBTIs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Jun 2021 15:08:48 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id B0FF41A206DA;
        Wed,  2 Jun 2021 22:07:00 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     linux-input@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2 v2] dt-bindings: Add vendor prefix and bindings for Qwiic Joystick
Date:   Wed,  2 Jun 2021 22:05:06 +0300
Message-Id: <20210602190504.23076-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210602190504.23076-1-oleg@kaa.org.ua>
References: <20210602190504.23076-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add vendor prefix for SparkFun Electronics.
Update trivial-devices.yaml with SparkFun Qwiic Joystick description.

Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Device Tree mailing list <devicetree@vger.kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@jikos.cz>
Cc: Patchwork Bot <patchwork-bot@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---

Changes:
- Separate patch for device tree bindings.

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a327130d1faa..706aa102d96d 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -261,6 +261,8 @@ properties:
             # Socionext SynQuacer TPM MMIO module
           - socionext,synquacer-tpm-mmio
             # i2c serial eeprom  (24cxx)
+          - sparkfun,qwiic-joystick
+            # SparkFun Qwiic Joystick (COM-15168) with i2c interface
           - st,24c256
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 944b02bb96d7..a5631e68f5d1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1060,6 +1060,8 @@ patternProperties:
     description: Sony Corporation
   "^spansion,.*":
     description: Spansion Inc.
+  "^sparkfun,.*":
+    description: SparkFun Electronics
   "^sprd,.*":
     description: Spreadtrum Communications Inc.
   "^sst,.*":
-- 
2.26.3

