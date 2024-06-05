Return-Path: <linux-input+bounces-4145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D11D28FDB16
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 02:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27041C22B25
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 00:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99FB364;
	Thu,  6 Jun 2024 00:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="ePfx+9b1"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0046e701.pphosted.com (mx0b-0046e701.pphosted.com [67.231.157.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EF123C9;
	Thu,  6 Jun 2024 00:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717632040; cv=none; b=XnYsZtOn+LSnoqACvWiAwD74MkEnVUY/bzhBcrW+V0nHQ/95a9KO4IH2lHzTTlceNHSmAKIPCSzeJZQz51bnWiHf84xtRKv/63ElQGZofdh8vZDKBmAp/yJzZ3cchnwOxVsR9zp1iKM8mxqmOW0POKyYXrt+9Ir/D2eLD/9Sqq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717632040; c=relaxed/simple;
	bh=bD6OdL68EaJAFx8NMGIrSd33wCJ8XWh9kWoYIyfKz8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t3iYcVrVWD8kKJoyZ0ow58idQ/3epo0TeFzQcNU92E44uIdVHDncV5EYrsTl7+m9+nY0Iau8uZkwba+qBokd86TKWnfE1Wx7rMShcbhNhk4GCDtVJBJ0WlzJFZVoLthlcqqjbHjJPXr+pU+fu1yQIxG0uIGisSVVWskikdilfW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=ePfx+9b1; arc=none smtp.client-ip=67.231.157.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341555.ppops.net [127.0.0.1])
	by mx0b-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455MCwgq016418;
	Wed, 5 Jun 2024 23:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=AhU2D
	ZJBcuW78r8ntcxANy5fqvNuhWgM86A5vqDna+4=; b=ePfx+9b1hEZnUXUiNyJkF
	Rwex0Ifqq1TIMT2rV1sXRIDNqmch+f72otO2lrU7F8YIESL9OFaXF5A+RPhyRDqo
	lFX58PZDhHosbkZNfwOG1zEExNJgWb+BjNz9ZsTDLXSNZ71Boi3BIsZXXyvoq4uC
	fJqd5RZEsbLwAzTZl56y663Rf+isJ6Nwh2DFS/UK/fnHEPaOejpC2/D6kAKNZcIy
	vVPC/9XWZ2V3JgdHoZEig9nnwhw1IQWNNsyi+srwBPrtZNL5I8/alr3iHV9WDXcE
	ei5xsOVOv927jm3SrtnqX8Xt+Brpr1ewLlB9HNM/Sl6Gb5fKX3A0H3VA8UCXphH4
	A==
Received: from gcc-mail-mx-001.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0b-0046e701.pphosted.com (PPS) with ESMTPS id 3yjyu387kk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 23:17:49 +0000 (GMT)
Received: from gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) by
 gcc-mail-mx-001.na.plexus.com (10.255.51.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 5 Jun 2024 23:17:48 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 5 Jun 2024 23:17:48 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
Date: Wed, 5 Jun 2024 18:12:44 -0500
Subject: [PATCH v11 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
In-Reply-To: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Danny Kaehn <danny.kaehn@plexus.com>
CC: Jiri Kosina <jikos@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ethan Twardy
	<ethan.twardy@plexus.com>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717629180; l=3233;
 i=danny.kaehn@plexus.com; s=20240605; h=from:subject:message-id;
 bh=bD6OdL68EaJAFx8NMGIrSd33wCJ8XWh9kWoYIyfKz8w=;
 b=f6B8R1Cbg4GmuaImdj6iWAkHWF5H4DjMuFBE2OuVNC6ijJUNXEvVQOtuyyN9jhcEds19rR6AY
 TANKAWTu4ZpDKCep9KeGZQJmJWnIi52Qn7KVeG7HYYr1WWvF7Ch2V1p
X-Developer-Key: i=danny.kaehn@plexus.com; a=ed25519;
 pk=+a/HbfS1U7uuw+5dRHN5PsUDyPWbx4dXDnblK41GI2s=
X-Proofpoint-GUID: gWH8qvVIsWnRP6WjBfEgjFps3BggmZJb
X-Proofpoint-ORIG-GUID: gWH8qvVIsWnRP6WjBfEgjFps3BggmZJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050175

This is a USB HID device which includes an I2C controller and 8 GPIO pins.

The binding allows describing the chip's gpio and i2c controller in DT
using the subnodes named "gpio" and "i2c", respectively. This is
intended to be used in configurations where the CP2112 is permanently
connected in hardware.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---
 .../devicetree/bindings/i2c/silabs,cp2112.yaml     | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
new file mode 100644
index 000000000000..0108f2e43c8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CP2112 HID USB to SMBus/I2C Bridge
+
+maintainers:
+  - Danny Kaehn <danny.kaehn@plexus.com>
+
+description:
+  The CP2112 is a USB HID device which includes an integrated I2C controller
+  and 8 GPIO pins. Its GPIO pins can each be configured as inputs, open-drain
+  outputs, or push-pull outputs.
+
+properties:
+  compatible:
+    const: usb10c4,ea90
+
+  reg:
+    maxItems: 1
+    description: The USB port number on the host controller
+
+  i2c:
+    description: The SMBus/I2C controller node for the CP2112
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      sda-gpios:
+        maxItems: 1
+
+      scl-gpios:
+        maxItems: 1
+
+      clock-frequency:
+        minimum: 10000
+        default: 100000
+        maximum: 400000
+
+  interrupt-controller: true
+  "#interrupt-cells":
+    const: 2
+
+  gpio-controller: true
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 8
+
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cp2112: device@1 {
+        compatible = "usb10c4,ea90";
+        reg = <1>;
+
+        i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          sda-gpios = <&cp2112 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+          scl-gpios = <&cp2112 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+          temp@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+          };
+        };
+
+        gpio-controller;
+        interrupt-controller;
+        #gpio-cells = <2>;
+        gpio-line-names = "CP2112_SDA", "CP2112_SCL", "TEST2",
+          "TEST3","TEST4", "TEST5", "TEST6";
+
+        fan-rst-hog {
+            gpio-hog;
+            gpios = <7 GPIO_ACTIVE_HIGH>;
+            output-high;
+            line-name = "FAN_RST";
+        };
+      };
+    };

-- 
2.25.1


