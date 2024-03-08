Return-Path: <linux-input+bounces-2294-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E44876D00
	for <lists+linux-input@lfdr.de>; Fri,  8 Mar 2024 23:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 531271F2192C
	for <lists+linux-input@lfdr.de>; Fri,  8 Mar 2024 22:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA92A604A5;
	Fri,  8 Mar 2024 22:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U6x0EyNl"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275956025D;
	Fri,  8 Mar 2024 22:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709936686; cv=none; b=HqGQ3B8X2w74W42CFeLCVDXcxxUnTj68FnCmtwoCMTYudPJDCe2gq24KluaQRU13xIEMNZl56FtWIgFamfoUgtgEAlN7tVtVEvkU+P06j19+Dn/7MvrwBDiwyuqQIAez/Xg0WHKXiZTh7GHTKkmyJG/Fn+EegCR7U3QwwqBPzcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709936686; c=relaxed/simple;
	bh=wTxDmVzfPdXcHQSwlW4KF2mssI4Lscw01gT+paiaLMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y8VE8MV1hW6Cc7YRd1GvTR49JUtJVqfhqZcHGZ4yAtg03ZcVr2ZqrRMyOyhc+IOWUuIPZ/ovL+ei+wLbQ8a3AykFIpskohf9oeU7gLlGV+CGtp6Ck/59KI3SAvIM7nnoauvjmjXEbv+kXKY7vHegVnrbG6rEjsnZyyYOMlC6fUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U6x0EyNl; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 428FgNWf026388;
	Fri, 8 Mar 2024 16:24:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=47IHhsRme6l9Ja8GxBg5XecVkHApII8gwWqYXN4mq3Y=; b=
	U6x0EyNlFg+UnaAYkFBtYKyRgk+JvkDbpLSds6x/W4ZBTTWKNKWBy6ivbvtV61ov
	oNlTquOeRYNh3tza1A9t7PW6AJJ/IQsDqlJaqqXvwcEouyK2HtnU5e4cbZ2KVLlA
	U3jsz/6P0oyVNFhEdMbVJvzB/Lim7ZfYQzTQvgkJkIkyk2HFnTtwc0rV6gPzqiWx
	pqgKfHyKJb25XvOEr9Uj96B+chgHJFK/pm1ULADcop99HRLECh3TjCVELTTMd5k5
	xvx5Yd4p3KEdd3/55gXuJ81dWPuOzghhOp512rdOW5wZLdTqofGmmGJhvjH0z+8k
	FzLii5ubNfJo5EZXRNia1w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wm2d2qu02-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 16:24:38 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 8 Mar 2024
 22:24:37 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Fri, 8 Mar 2024 22:24:37 +0000
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B859082026C;
	Fri,  8 Mar 2024 22:24:35 +0000 (UTC)
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
Subject: [PATCH v9 2/5] dt-bindings: input: cirrus,cs40l50: Add initial DT binding
Date: Fri, 8 Mar 2024 22:24:18 +0000
Message-ID: <20240308222421.188858-3-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RhKIaHsPsDZ9Xs9ht07APx-FqR_yqpsj
X-Proofpoint-GUID: RhKIaHsPsDZ9Xs9ht07APx-FqR_yqpsj
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


