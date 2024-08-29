Return-Path: <linux-input+bounces-5943-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF29963FCA
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 11:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C721F25904
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 09:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A717818D646;
	Thu, 29 Aug 2024 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Y00DVouM"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91CD189F37;
	Thu, 29 Aug 2024 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923263; cv=none; b=g0fs9dQW90EpNZUd6L+NpLnc3P6dDoy3a9PgQdYL0UsPQtcWJ9ls5A/m7hK1foIuHpIqfWktB9iOdIo08GQBs96B6hpQ1K+lCmW4WuvJuTDaFEvMX+R/bE5hpZwkqSyccLeg96wT2jaNOnne1LHY2CLsRKWZjfe9ZhXUPaz6Wok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923263; c=relaxed/simple;
	bh=XJugORg/LzFC55f/REHC966kTYTIH3sVOqWKZaSt80s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFNIU6uwuyY8i+0SygkWIgNJPL69GBJZrICKrCIcq6obsKPmIc9O07sTgzakYSZmqyeMV1ltZZ3BNu6G60yaZzKAPO5S/JV2vBQSa1+Mb3h+g6ZtHDmWpr7yY6W/jB1oUTONiVpBABC1ZN9oDi6shGnVbkBCMA0sp+hC7aRPxDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Y00DVouM; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5daQT023782;
	Thu, 29 Aug 2024 05:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uXjcL
	JH5zyb2xQL1amE7PdnQiC7BzUxHgz8hwuNuQMs=; b=Y00DVouMj0auGQXYxhNbm
	wlXCLTl009wbY1OlyBpHFR/DJqFt1HjDGPosxpOjh4Rk5IuGlr1rzjVMXxT0c2IR
	PiYZe83AJiIhmyamGnpvdqv2aHOda4Qq1gcq5SaxnU0L0+PgBM/JPdR7ZRzDo413
	mZyvdjTxQ7XnUkZMx+qvqGge/ElJ5CoCZmC2DkaBQLZgwBTWlvf+VipILU3iugKe
	lm5jetPa4cn0WXlBaRCDsQv9t6hNh934kJwaVlwhAaiOkpJG5GK/EFPHkXU5UpIL
	x90gmhySeRyE7dBl+VBJR6N7Xs6kJY3PjLa9aH3ybbjptxQpIdMWim+hZa9ugYbo
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 41ak1mgthf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 05:20:52 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 47T9KoBx021806
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Aug 2024 05:20:50 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 29 Aug 2024 05:20:50 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 29 Aug 2024 05:20:49 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 29 Aug 2024 05:20:49 -0400
Received: from amiclaus-VirtualBox.ad.analog.com (AMICLAUS-L02.ad.analog.com [10.48.65.124])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 47T9KVkU016079;
	Thu, 29 Aug 2024 05:20:46 -0400
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
Subject: [PATCH 2/2] dt-bindings: touchscreen: ad7877: add bindings
Date: Thu, 29 Aug 2024 12:19:36 +0300
Message-ID: <20240829092007.25850-2-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829092007.25850-1-antoniu.miclaus@analog.com>
References: <20240829092007.25850-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 0A8cgR_m5zRsy1efZL13DtOtIeItD-Hc
X-Proofpoint-ORIG-GUID: 0A8cgR_m5zRsy1efZL13DtOtIeItD-Hc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290068

Add device tree bindings for the ad7877 driver.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
 .../input/touchscreen/adi,ad7877.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
new file mode 100644
index 000000000000..5fc5124c5999
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
@@ -0,0 +1,58 @@
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
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
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
+      };
+    };
+...
-- 
2.46.0


