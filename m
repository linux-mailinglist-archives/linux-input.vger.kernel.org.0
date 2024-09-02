Return-Path: <linux-input+bounces-6048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD799681CB
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 10:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D55CCB20E3C
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 08:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CC2186611;
	Mon,  2 Sep 2024 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Ax9psk69"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29296185B52;
	Mon,  2 Sep 2024 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265697; cv=none; b=iyEN6DxB7tZEPhoZS6YggG9wb2F4WIh/iacMVZJKcIz1jT7s/pEZ8IiI6/2adbrx8SsE1dOpzDdkbM1fi1Vgti3m9bSiMLXjDSs0TJ7NFGk7U9bq+ndTeq6y9ZoAgBwbVRMl1eCz6/jCQTMBR5SSdyFfpZbGR9KCwhA5bUBgUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265697; c=relaxed/simple;
	bh=JTGXCPQV1SXGDQLLqnNtwYuJsMTwPZ/BFJno9CJLK2E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G9kn1q08RhnvBLSERoujM/i0T6Sqt3r54v1bd3X+5DTzUVOFSGVsf2DcOo1cwjI8TrrAiAqq5iC6kgIuUal3wJtrNBMHOzXVnzbcalEnkPM1mfSXuz1e/1dN60rgi2ugHdQ2O1wK9vZ2qBYdzgbYdn9xoZ/shp0zEbY2vG1rj/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Ax9psk69; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48238Gfx014371;
	Mon, 2 Sep 2024 04:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=WgkV6
	53C7pjxd2xTEAb72p4RtTDQX5Aehp2L9UtlQhI=; b=Ax9psk694wSVFBcyb+a8x
	dYk3rbgtR92k++keuuhWv/oBUQqjLGVDx7c/+14TGMK4mDYRtIHYlahcgdB6NdRM
	wpk+xM3pBgfdr7RTX7jLw4BQM6t7r4Um6rbnUbN+t/zTCAYk1eY/SPDeC0tDR4sI
	OCaDsco5+jQDGdFwozxdfRqy58jZkTJoKMNjTQw1dm4wRzTKXEz1t/iBtKd+Now0
	nHwrL/UG3/oWnyTauQOg10BBnDfkl9gPySrhB62FilfuRptuZyBYQM96vp+Wwjjm
	hNa7LCXPqHXBDqfoowcLmBEx8gvNNfBzdEEdmseYr/lfoaCBkk3DWJ+9PpZ+SUv2
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41bw13phn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 04:28:12 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 4828SBGv022765
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Sep 2024 04:28:11 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 2 Sep 2024
 04:28:10 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 2 Sep 2024 04:28:10 -0400
Received: from amiclaus-VirtualBox.ad.analog.com (AMICLAUS-L02.ad.analog.com [10.48.65.139])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4828R9oS014033;
	Mon, 2 Sep 2024 04:28:01 -0400
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Antoniu Miclaus <antoniu.miclaus@analog.com>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: touchscreen: ad7877: add bindings
Date: Mon, 2 Sep 2024 11:24:33 +0300
Message-ID: <20240902082707.4325-3-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902082707.4325-1-antoniu.miclaus@analog.com>
References: <20240902082707.4325-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 1_ey-6oR9a9f6QrL3vaxWP3feygB1g7M
X-Proofpoint-GUID: 1_ey-6oR9a9f6QrL3vaxWP3feygB1g7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-02_01,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020069

Add device tree bindings for the ad7877 driver.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
changes in v2:
 - add only the used properties from touchscreen.yaml
 - add vendor properties.
 - update dt example.
 .../input/touchscreen/adi,ad7877.yaml         | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
new file mode 100644
index 000000000000..035e2d5bbcb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/adi,ad7877.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7877 Touch Screen Controller
+
+maintainers:
+  - Antoniu Miclaus <antoniu.miclaus@analog.com>
+
+description: |
+  Analog Devices Touch Screen Controller
+  https://www.analog.com/media/en/technical-documentation/data-sheets/AD7877.pdf
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,ad7877
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  spi-max-frequency:
+    description: AD7877 SPI bus clock frequency.
+    minimum: 10000
+    maximum: 20000000
+
+  adi,stopacq-polarity:
+    description: The polarity of the signal applied to the STOPACQ pin.
+                 0 = active low
+                 1 = active high
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1]
+
+  adi,first-conv-delay:
+    description: Delay before the first conversion.
+                 0 = 0.5us
+                 1 = 128us
+                 2 = 1ms
+                 3 = 8ms
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+
+  adi,pen-down-acc-interval:
+    description: Enable the ADC to repeatedly perform conversions.
+                  0 = covert once
+                  1 = every 0.5 ms
+                  2 = every 1 ms
+                  3 = every 8 ms
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+
+  adi,acquisition-time:
+    description:  Select acquisition times for the ADC.
+                  0 = 2us
+                  1 = 4us
+                  2 = 8us
+                  3 = 16us
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+
+  adi,vref-delay-usecs:
+    description: Delay required for the SPI transfers depending on the VREF used.
+    $ref: /schemas/types.yaml#/definitions/uint16
+
+  touchscreen-average-samples:
+    enum: [1, 4, 8, 16]
+
+  touchscreen-x-plate-ohms: true
+  touchscreen-y-plate-ohms: true
+  touchscreen-min-x: true
+  touchscreen-min-y: true
+  touchscreen-max-x: true
+  touchscreen-max-y: true
+  touchscreen-max-pressure: true
+  touchscreen-min-pressure: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - touchscreen-average-samples
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@0 {
+        compatible = "adi,ad7877";
+        reg = <0>;
+        spi-max-frequency = <20000000>;
+        interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+        interrupt-parent = <&gpio>;
+        touchscreen-average-samples = <16>;
+      };
+    };
+...
-- 
2.46.0


