Return-Path: <linux-input+bounces-4510-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9457B910BE8
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 18:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CCCD1F2197C
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 16:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F55C1B3F06;
	Thu, 20 Jun 2024 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OhO5PovD"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C0A1B3F01;
	Thu, 20 Jun 2024 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900294; cv=none; b=pSyXbsgQ6Pj5MYitlhKPbdHy4ExHpg9wAMQyWQ5vwTUNPF1cHb4QtIkZsRYS35Py+n02IEeO/4VDSD6uYbVPTW7JcbVh7stoR7+//4VcPzBPYl+coQPGRqlwbY1tPUqFzLYPZ8WaBzu9sO5dHSkltEy6OpWExhQuFj5OdQEZFmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900294; c=relaxed/simple;
	bh=7xZCWng81CDzMd35IrdcSkySPd9jb1m6v5xawz25jXU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YRMyRJ3AGcsBPkFbor35rV2fzUv5uPytVlNf+/paJcLcz9zcHi2P0LB7y4+5+IU/sW831Ddi0eAS0I0afEYdlO/ipS3RLEnsKKJEkMFQua7RMJM4cSM7fQKyuKwU8QITSaXsf+2dZw5aTNK0QlYWdMNIyoTXCC2gA0+AYxjDyEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OhO5PovD; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K5O0A9008336;
	Thu, 20 Jun 2024 11:17:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PjupxynkZtlrpHZ49csTkIWVC8B67c0z/fSu2b8BHE0=; b=
	OhO5PovDm7sQntg02PNb+9ucC7uXv1hudOgY5RaL0Vfc8TX14EzTYS8gTdouCtH7
	07OnF5aMfZdUGnlB3mphBWUc69QucPfc+kq9bOOatTfx8YU9y9eaow4cMM2Vg0Wa
	/Gk1aIemF/BRuZpLeu0RbC15k11iqqtwhIlpPtVSG5AFRi+al5ua2CiFSOt+K/E4
	ydblWfvCqZ04HC1gDF835Q+s6CnB619yqFbo32/Di6N1ZPVRFzJxYDxRaVXAwYmT
	wT2FUjMjwnJiSG3/AciKO5tO4lLHT1OZnFVRz6oAb/a9Ms7zjzWySyGvnyUnbz6b
	v+INNyi4kxkqbTBM67k3Pw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yuj8m2276-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 11:17:55 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 17:17:54 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 20 Jun 2024 17:17:54 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 60720820248;
	Thu, 20 Jun 2024 16:17:52 +0000 (UTC)
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
Subject: [PATCH RESEND v11 2/5] dt-bindings: input: cirrus,cs40l50: Add initial DT binding
Date: Thu, 20 Jun 2024 16:17:42 +0000
Message-ID: <20240620161745.2312359-3-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mrHQcIUiwPEANgk1DVQhmKUf1U6dTaAa
X-Proofpoint-ORIG-GUID: mrHQcIUiwPEANgk1DVQhmKUf1U6dTaAa
X-Proofpoint-Spam-Reason: safe

CS40L50 is a haptic driver with waveform memory,
integrated DSP, and closed-loop algorithms.

Add a YAML DT binding document for this device.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 .../bindings/input/cirrus,cs40l50.yaml        | 68 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml

diff --git a/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml b/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
new file mode 100644
index 000000000000..89bd06864bd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/cirrus,cs40l50.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS40L50 Advanced Haptic Driver
+
+maintainers:
+  - James Ogletree <jogletre@opensource.cirrus.com>
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
+  vdd-a-supply:
+    description: Power supply for internal analog circuits.
+
+  vdd-p-supply:
+    description: Power supply for always-on circuits.
+
+  vdd-io-supply:
+    description: Power supply for digital input/output.
+
+  vdd-b-supply:
+    description: Power supply for the boost converter.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vdd-io-supply
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
+        vdd-io-supply = <&vreg>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dd5de540ec0b..862a18e3fc7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4933,6 +4933,14 @@ F:	sound/pci/hda/cs*
 F:	sound/pci/hda/hda_cs_dsp_ctl.*
 F:	sound/soc/codecs/cs*
 
+CIRRUS LOGIC HAPTIC DRIVERS
+M:	James Ogletree <jogletre@opensource.cirrus.com>
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
2.34.1


