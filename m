Return-Path: <linux-input+bounces-3946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4C8D370D
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 15:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76F152867E1
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 13:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE844107A9;
	Wed, 29 May 2024 13:06:50 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out198-11.us.a.mail.aliyun.com (out198-11.us.a.mail.aliyun.com [47.90.198.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC9DDAB;
	Wed, 29 May 2024 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988010; cv=none; b=C+s8QAig3jT5HRbXKho2/KBz2F6I4Xm123p5Gsf/tebzWcflwCNVzVPP+1DycP+Xh3ZxDp5IXtB2F+Osb8bShOsq1SSJO+8IN79wKnA9L2t6eyfgwQ9tiDYH2V1DPkDrA0TqYxBXF7S5rkZvn4TdilAHy9ev6gTPhh23t7fEHt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988010; c=relaxed/simple;
	bh=UNYgwRsC/DcJD432DmuGTrbp3zABC/67odF/gbKNxzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWeI1qHT7xofOqRcEZZOTWuZhEkhLTRNw56CqXK9Y+8BbVgfADxjR1vTgUbuRePwjzmW6Vv3IBQWpa2eCw4V2ItXA8CEkHm8LoYdh6jCI1GyLydZL8Q7GvobQS3xiRqS+GKpCZVnPUcsC+1ydcNaDfOZGMPzAEACyvHJh0E2b8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436429|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.435426-0.000639855-0.563934;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045002061;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.XqPpuA1_1716987984;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.XqPpuA1_1716987984)
          by smtp.aliyun-inc.com;
          Wed, 29 May 2024 21:06:31 +0800
From: wangshuaijie@awinic.com
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jeff@labundy.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: wangshuaijie@awinic.com,
	liweilei@awinic.com,
	kangjiajun@awinic.com
Subject: [PATCH V1 1/5] dt-bindings: input: Add YAML to Awinic sar sensor.
Date: Wed, 29 May 2024 13:06:04 +0000
Message-ID: <20240529130608.783624-2-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240529130608.783624-1-wangshuaijie@awinic.com>
References: <20240529130608.783624-1-wangshuaijie@awinic.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: shuaijie wang <wangshuaijie@awinic.com>

Add the awinic,aw_sar.yaml file to adapt to the awinic sar sensor driver.

Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>
---
 .../bindings/input/awinic,aw_sar.yaml         | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/awinic,aw_sar.yaml

diff --git a/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
new file mode 100644
index 000000000000..ed4ec29c9b4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/awinic,aw_sar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic sar sensor driver family
+
+maintainers:
+  - Shuaijie Wang <wangshuaijie@awinic.com>
+
+properties:
+  compatible:
+    enum:
+      - awinic,aw_aw96103
+      - awinic,aw_aw96105
+      - awinic,aw_aw96303
+      - awinic,aw_aw96305
+      - awinic,aw_aw96308
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  sar-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      set the index of the sar sensor.
+
+  vcc0-supply:
+    description:
+      Optional regulator for chip, 1.7V-3.6V.
+
+  channel_use_flag:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The flag of channels used.
+      Configure according to the specific chip channel used.
+      Bit[31:0] Each bit represents a channel.
+      If the customer uses ch0 and ch2, then channel_use_flag=<0x05>
+
+  aw_sar,update_fw:
+    type: boolean
+    description:
+      Choose if you want to update the firmware.
+
+  aw_sar,monitor_esd:
+    type: boolean
+    description:
+      Choose if you want to monitor ESD.
+
+  aw_sar,pin_set_inter_pull-up:
+    type: boolean
+    description:
+      Choose if you want to set the interrupt pin to internal pull-up.
+
+  aw_sar,using_pm_ops:
+    type: boolean
+    description:
+      Choose if you want to use suspend and resume related function.
+
+  aw_sar,use_plug_cail:
+    type: boolean
+    description:
+      Choose If you want to perform calibration when plugging and unplugging the charger.
+
+  start-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      When connecting to aw963xx, select the location where the firmware starts.
+      set 0 if start in rom.
+      set 1 if start in ram
+
+  irq-mux:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      set csx as irq pin. config this field when connect to aw96308/aw96305BFOR
+
+required:
+  - compatible
+  - reg
+  - sar-num
+  - interrupts
+  - channel_use_flag
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        awinic_sar@12 {
+            compatible = "awinic,aw_sar";
+            reg = <0x12>;
+            sar-num = < 0 >;
+            interrupt-parent = < &tlmm >;
+            interrupts = <72 0>;
+            //vcc0-supply = <&pm660l_l4>;
+            channel_use_flag = <0xff>;
+            aw_sar,update_fw;
+            //aw_sar,monitor_esd;
+            start-mode = < 1 >;
+            irq-mux = < 2 >;
+        };
+    };
-- 
2.45.1


