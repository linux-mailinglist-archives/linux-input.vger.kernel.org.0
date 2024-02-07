Return-Path: <linux-input+bounces-1715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4620384C166
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 01:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96CA32852C6
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 00:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CE9647;
	Wed,  7 Feb 2024 00:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fgQShG/3"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D976F7F9;
	Wed,  7 Feb 2024 00:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707266217; cv=none; b=YU1xIpz9QF3KhlAg+Ot6r/ETFe/75spSK+wpsmUD3XMUb/mqxRphi6Cwn6/c0sgKbHr/xMNVGlbpP00xiVYI45VbpsPMFspazqHWPnGl91R4OMmTxjCKpTQaGUC8t2mVczkIJs9WlbQJDckssyNmAIrvEdKIgQJ4x2WpRPhhRto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707266217; c=relaxed/simple;
	bh=wTxDmVzfPdXcHQSwlW4KF2mssI4Lscw01gT+paiaLMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWcV0oaP8AkTWRBjGEyJhZZdFIov+0Uh+YabRGgXdhuDaISHHAsYKr5WInXGsFmIWef5cgyLB7Sg4+xdsja8jsT4wjYlDDFyxovlI+S5x9EpNAi014u414R3s3a0VClyt3KahMovSuM3EPBaPiqempG1nRUJjgyUTCAkpoLUQFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fgQShG/3; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 416Ng0Rw017380;
	Tue, 6 Feb 2024 18:36:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=47IHhsRme6l9Ja8GxBg5XecVkHApII8gwWqYXN4mq3Y=; b=
	fgQShG/3qdDIGN4vMt12CJcCzoEgmuGuWG8LcrGuDPYM4oZp1vgDmuAb3aTa4+v7
	KInrsHFjfkuC6phiiTYWd67O9Y6PcKSU8IVR601tZOuA9/kjaPXeke6WQ0TsFCyh
	7UUK12zPSXxbwL1jsa0yiV1qD07iv9sR+uVdCPRDSmJrK3CX6pYy3GOloiK/ZO5q
	HUW3q7qpXoLCBEqCqJqrk0Nk07RoWcNnArJF43C3vUlQraa3hcv309OnQAYVZEB/
	sUwNqtcdrSreLuVQi/Jk2W9fiKrkbxhyTzs0Aya8e7NhbgHS6ioJJSiMnaD3i/Pm
	G9tqfEQHgv94hHHg6XAj1w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w1jsnm8yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 18:36:49 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 00:36:48 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 7 Feb 2024 00:36:48 +0000
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3FC9F820246;
	Wed,  7 Feb 2024 00:36:46 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/5] dt-bindings: input: cirrus,cs40l50: Add initial DT binding
Date: Wed, 7 Feb 2024 00:36:09 +0000
Message-ID: <20240207003612.4187370-3-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240207003612.4187370-1-jogletre@opensource.cirrus.com>
References: <20240207003612.4187370-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qMtWqgrcxIqeOypNsYUQ9ZqehdVNfRjQ
X-Proofpoint-ORIG-GUID: qMtWqgrcxIqeOypNsYUQ9ZqehdVNfRjQ
X-Proofpoint-Spam-Reason: safe

The CS40L50 is a haptic driver with waveform memory,
integrated DSP, and closed-loop algorithms.

Add a YAML DT binding document for this device.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 .../bindings/input/cirrus,cs40l50.yaml        | 70 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml

diff --git a/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml b/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
new file mode 100644
index 000000000000..6a5bdafed56b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/cirrus,cs40l50.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS40L50 Advanced Haptic Driver
+
+maintainers:
+  - James Ogletree <james.ogletree@cirrus.com>
+
+description:
+  CS40L50 is a haptic driver with waveform memory,
+  integrated DSP, and closed-loop algorithms.
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs40l50
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  va-supply:
+    description: Power supply for internal analog circuits.
+
+  vp-supply:
+    description: Power supply for always-on circuits.
+
+  vio-supply:
+    description: Power supply for digital input/output.
+
+  vamp-supply:
+    description: Power supply for the Class D amplifier.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vp-supply
+  - vio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      haptic-driver@34 {
+        compatible = "cirrus,cs40l50";
+        reg = <0x34>;
+        interrupt-parent = <&gpio>;
+        interrupts = <113 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio 112 GPIO_ACTIVE_LOW>;
+        vp-supply = <&vreg>;
+        vio-supply = <&vreg>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dd5de540ec0b..b71017a187f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4933,6 +4933,14 @@ F:	sound/pci/hda/cs*
 F:	sound/pci/hda/hda_cs_dsp_ctl.*
 F:	sound/soc/codecs/cs*
 
+CIRRUS LOGIC HAPTIC DRIVERS
+M:	James Ogletree <james.ogletree@cirrus.com>
+M:	Fred Treven <fred.treven@cirrus.com>
+M:	Ben Bright <ben.bright@cirrus.com>
+L:	patches@opensource.cirrus.com
+S:	Supported
+F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
+
 CIRRUS LOGIC DSP FIRMWARE DRIVER
 M:	Simon Trimmer <simont@opensource.cirrus.com>
 M:	Charles Keepax <ckeepax@opensource.cirrus.com>
-- 
2.25.1


