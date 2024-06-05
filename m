Return-Path: <linux-input+bounces-4135-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30C8FD032
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 15:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A16D61C2266C
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8CDDF44;
	Wed,  5 Jun 2024 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Fje/BlTJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C77BE49;
	Wed,  5 Jun 2024 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717595617; cv=none; b=eZjSqvdGMMqxD1JHlJJUV0WxW9Jso54ABRIQ6FBIV7mLHP2jvwwaFcC8EtNAj6x4Nj8BdnsjLUYtF52lGaqRJJ5oCwYx6rDf499dT4Ywu08L+P2X+SBTBOUflYvoFdqUK6828IOcRvyL8JpLy9lPyz3v0lnzuNIHqtw31GCL5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717595617; c=relaxed/simple;
	bh=7xZCWng81CDzMd35IrdcSkySPd9jb1m6v5xawz25jXU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtqeVAY+W0VkF+3kRYPK/6kfwJybkV9a2bUzZBXJ3txARCh8lEHBrfGaTQ1A4caOlq0imTChytK8Nwn4JjhE0ECMX057iGrxB/iy+JUUNna7FRs04U+aQhb/OtyfmQLfiTVaWd2iP0XbhPAxHo51awaJDRnAApBKUcVsL6xvGo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Fje/BlTJ; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4555KehH005669;
	Wed, 5 Jun 2024 08:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PjupxynkZtlrpHZ49csTkIWVC8B67c0z/fSu2b8BHE0=; b=
	Fje/BlTJ6WsfrPxuATtAPcIzZlGW8k2v/mpxa0iduy1xANYmu9atJZvuaFFYjtD7
	dC82S9QpeRPVksMnsEUPbbbWICxPZAzOCkPa8TKU0iVXxKUuvangEGN/w+b1Y5Hl
	MliF2131lzztLJSvGrcxa7J/ccUye21rI1h9T8KR6m6Tfn/dA+Qpr2TS7UetFeha
	nA92vxpJ/3MQ/NPiZbQdMwPuSbweYsRxeW4WrTmPpygoDH5gVDpjYCl2wqMRzd12
	qBI6qmLopbvBwU87Mh/2klAiwOLxSe8PSAnW10UAUd2DQhqttwmFpErQoP51+hY8
	+fFjiJbF9+IFNxmUDYb6ug==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yg02hm0m0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 08:53:18 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 14:53:04 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 5 Jun 2024 14:53:03 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 14C94820249;
	Wed,  5 Jun 2024 13:53:01 +0000 (UTC)
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
Subject: [PATCH v11 2/5] dt-bindings: input: cirrus,cs40l50: Add initial DT binding
Date: Wed, 5 Jun 2024 13:52:46 +0000
Message-ID: <20240605135249.361082-3-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
References: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Of5QMawZYeGocXGm8Tp-itrqdTTjYibC
X-Proofpoint-ORIG-GUID: Of5QMawZYeGocXGm8Tp-itrqdTTjYibC
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


