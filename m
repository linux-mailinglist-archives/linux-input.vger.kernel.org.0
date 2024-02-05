Return-Path: <linux-input+bounces-1674-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480E84A112
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 18:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 382D6B23D3B
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 17:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1B54594A;
	Mon,  5 Feb 2024 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="Tir6mgG9"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F144C79;
	Mon,  5 Feb 2024 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707154767; cv=none; b=LLGJebdbviE9bNRjQU50hN2IP07stzKGawYButZPomghAatCr9/DYl3UkZwkw7fsEpj0nRI3p1MbpHfI1sbEx3dISI4eKP3vAycz38mfVeyyzQc2oFUXUACk17HpUPczgX1O7bHuvWw5R7aostJcNB7WDtCj7Eda3b5kl9nHjV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707154767; c=relaxed/simple;
	bh=PfPrSvl8macsOTASVTdaVpQtGniW4FyTFZpSDQapbzU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u+az8ORPl+l+Fez3qopNqsiDSBTE5qcBl7vbS7DW91hPZSyquFD5mTIYGwOBZrT6HYhKRDdwgTX/Z76bdqbc+TkcIGRY7xP+fEJ1eldBJkPn3xxD4iip1uI9ZyWTfOOzGNwqiA59jWmPZHgUD52DhdoPLgMQuJ67KdqBSe8VMZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=Tir6mgG9; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341554.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415942dB006589;
	Mon, 5 Feb 2024 11:10:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=pps1;
	 bh=qi09aERGXrzq6TaIit5wBBXbtf7tAYC/KJeKKvaZw/g=; b=Tir6mgG94bw0
	01Q1qH9WbK+UiE6N+BLQgCYgCHU30lquh3Lgg7K9xR3Tve50UQtGFB4JqUIWjS+b
	cQ6wND54N9ufQImd0JezMeWcpm7bbE7kV1yLmHOFUQTqpQ+sNBlJOg9bBBAx3mk0
	WyBAjE945CQNfD5rN4+58nqDDDBg/hgCc9U/aGpTsVrQ/lygomZWxlmFM3uih6xp
	pJAzk5E3+OcAOFqbHeGdFAPK2F70K2i0PkxHx4aRAyu19K0+Lm6cANG+NzjZRSkt
	h6eXdizMDBolC5RsNvjiFcTkUvfsahvzkttzRK6c7KenW/hCvQz1ZXFs+D4cIc5/
	8piZA4EClA==
Received: from dcc-mail-mx-002.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 3w2vqg148j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 05 Feb 2024 11:10:31 -0600 (CST)
Received: from dcc-mail-mx-001.na.plexus.com (10.249.48.15) by
 Dcc-mail-mx-002.na.plexus.com (10.249.48.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 17:10:29 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 dcc-mail-mx-001.na.plexus.com (10.249.48.15) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 17:10:29 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <andriy.shevchenko@linux.intel.com>, <bentiss@kernel.org>
CC: <jikos@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <niyas.sait@linaro.org>, <dmitry.torokhov@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <ethan.twardy@plexus.com>, Danny Kaehn <danny.kaehn@plexus.com>
Subject: [PATCH v10 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
Date: Mon, 5 Feb 2024 11:09:20 -0600
Message-ID: <20240205170920.93499-2-danny.kaehn@plexus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240205170920.93499-1-danny.kaehn@plexus.com>
References: <20240205170920.93499-1-danny.kaehn@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0lcjYDnQ-WLfDU6GrJ6JNhydrbZE6X9A
X-Proofpoint-ORIG-GUID: 0lcjYDnQ-WLfDU6GrJ6JNhydrbZE6X9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_11,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050130

This is a USB HID device which includes an I2C controller and 8 GPIO pins.

The binding allows describing the chip's gpio and i2c controller in DT
using the subnodes named "gpio" and "i2c", respectively. This is
intended to be used in configurations where the CP2112 is permanently
connected in hardware.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---

Note -- Reviewed-By tags have been removed as suggested by Benjamin, since
1. It has been 6+ months since this binding was reviewed, and a lot can
change upstream in that time
2. There has been some contention between using named child nodes to
identify i2c and gpio nodes, and also making the driver implementing this
binding compatible with ACPI, since names aren't significant for ACPI
nodes, and ACPI names are always automatically uppercased. It has been
suggested that perhaps the DT binding should use child nodes with
addressable `reg` properties to identify the child nodes, instead of by
name [1].

Of course, I acknowledge that other firmware languages and kernel details
shouldn't impact DT bindings, but it also seems that there should
be some consistent way to specify sub-functions like this accross DT
and ACPI. Some additional commentary / requests for comment about the
seemingly missing glue here can be found in [2].

Any comments from Rob/Krzysztof/other DT folks would be greatly appreciated

[1] https://lore.kernel.org/all/ZBhoHzTr5l38u%2FkX@smile.fi.intel.com/
[2] https://lore.kernel.org/all/CAP+ZCCd0cD+q7=ngyEzScAte2VT9R00mqCQxB3K2TMbeg8UAfA@mail.gmail.com/

 .../bindings/i2c/silabs,cp2112.yaml           | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml

diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
new file mode 100644
index 000000000000..a27509627804
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CP2112 HID USB to SMBus/I2C Bridge
+
+maintainers:
+  - Danny Kaehn <kaehndan@gmail.com>
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
+  gpio:
+    description: The GPIO controller node for the CP2112
+    type: object
+    unevaluatedProperties: false
+
+    properties:
+      interrupt-controller: true
+      "#interrupt-cells":
+        const: 2
+
+      gpio-controller: true
+      "#gpio-cells":
+        const: 2
+
+      gpio-line-names:
+        minItems: 1
+        maxItems: 8
+
+    patternProperties:
+      "-hog(-[0-9]+)?$":
+        type: object
+
+        required:
+          - gpio-hog
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
+      device@1 {
+        compatible = "usb10c4,ea90";
+        reg = <1>;
+
+        i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          sda-gpios = <&cp2112_gpio 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+          scl-gpios = <&cp2112_gpio 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+          temp@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+          };
+        };
+
+        cp2112_gpio: gpio {
+          gpio-controller;
+          interrupt-controller;
+          #gpio-cells = <2>;
+          gpio-line-names = "CP2112_SDA", "CP2112_SCL", "TEST2",
+            "TEST3","TEST4", "TEST5", "TEST6";
+
+          fan-rst-hog {
+              gpio-hog;
+              gpios = <7 GPIO_ACTIVE_HIGH>;
+              output-high;
+              line-name = "FAN_RST";
+          };
+        };
+      };
+    };
-- 
2.25.1


