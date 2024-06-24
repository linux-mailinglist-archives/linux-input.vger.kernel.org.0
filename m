Return-Path: <linux-input+bounces-4577-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8357914001
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 03:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7A6F1C21B50
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 01:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80636139D;
	Mon, 24 Jun 2024 01:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="MzbWX5RW"
X-Original-To: linux-input@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AAF20E6
	for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192644; cv=none; b=O7tME6xiT+gEddxSV12G2AhOWyxpAJghCzzEYoPD3T4AtwfH4Ydx8QTQ3KIQFDH/C19j0pFzgevD9NDrABkt2d+6USSGXdZyLv4+/hRgceExZXwYY6tsf4afVPP4l4nrwOUhouq8tHx/sIMk1AYD9mD7axiVPsEQ6gvKBGDSt6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192644; c=relaxed/simple;
	bh=3wuuyZRn04C2HmOsJ2tCtoWRp50+LXh8JBT0OpCN7Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5J9OLXuVs3sgx/Ggb6qw/E2NoOHp4ghdWvohC9ZFyR70LT1q8C1dgl/4nGoxzj+ltFlyVIc8rBh2ypXnhxKjOU56TnIE1nz/UqFe8ZhxmHP02RqYv45H1MMEGdMMJQ4fsmsjWx4htnTJGy0cDmeMqvoDIJO6N7Y8CZLLz3wQWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=MzbWX5RW; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: dmitry.torokhov@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1719192639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSIdYkvNGFlVlsQy9M50XkydHh2OwcYsy8NxF0doad4=;
	b=MzbWX5RW5j6CKndPqvrMh98kjYayvn+fUOLaGW7KwmfZKhCyKxSaQSe9ZddyUG5AtdQ6Qg
	vTJxt2mH/2mO5cj/PvsLezFCDyPe6gdBwl9k2N1cWBPo/BXl8+amrpH5+5MRUVCbOuHh4k
	P70aBdfepSZNjLFoSsqO5pTnndnac7BiyGywSSCgUeRgnocLI3a7cWT/cjPDoHHHAHodUn
	c8MNYG6Dh8AtR2d8IVqlvs8K9WJ9EaGM9NTMXjYI4+BsFpZ3/88UZreOo9EVpq+iJHJak2
	UGjP2XJimhIiU43EGz+Y2MFTb3Fh+OruBA7i84Iq+ZHKPdmpItZR7ym4VqH3uA==
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: andersson@kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: robh@kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Mon, 24 Jun 2024 03:30:25 +0200
Subject: [PATCH 1/7] dt-bindings: panel: document Samsung AMB655X
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
In-Reply-To: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=3wuuyZRn04C2HmOsJ2tCtoWRp50+LXh8JBT0OpCN7Zg=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmeMw7FEWLxM509rVGpvrS5mGgN0xetJGbNC5Jj
 BKW2FZy5pGJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnjMOwAKCRAFgzErGV9k
 tlu2EACg1fWl6ROkJUe1T1OBQQaGU0Sz0jMounze9Gtzs+weigxjs1pNrT0zVn+E5hn4cybm/RV
 RMp0CBCTMR3XiJvwL8KMPEwr5l80aAL/lXnMTMiFbN6h7QWV6eT9muXJlhUbHMNMwIT1l9m18NB
 aqBW/1y6Mowyw9+vIGDAUfyAwzuDuVPkZKnJmhRfJLdT8pWt+9sGWv7fFY9LCGZPFKjKVaqTqf3
 i3lmGZFa8xmFd2PFlSbEGNGLa6HwKDdiJd52fTieHeyR8eXKyyptbDghZi1J7qYU34+j7wpZ8NU
 qvMnndnqBubCoCna6e9otVHCJGn4XeNre7/rwIKNDP8Hv9X/SDKQE3f49etJJmm328nLw2mgBfE
 fktB0LtMwWuq+Ymk+vBxdxTOt8x6jSzeTlfVMbNfLSLEG9tZTL052VtwLwXNS09oF+WPU0hhKMt
 /AvSpOSpwS+CEE1mYJKAMgpBJ8f825AAGmEPIiOA5a88EY9UiViFtQ1Ymu7dVQO3IQAE/+dCVL5
 06YO6+PDJfA5coLfXxKU1xRsdQyOn0YXFCZWR1L4bhGQzqqNULpnJvGMy/uM4sJfb10l202T9NP
 0EDyrjigzWJpwhUrlTvUFGiJNCQg0K3KGTW3S0/F40QlA8ptmogVqGTcsPF2N70J0iXS2VlKJkd
 SMDswny1nRl1YTg==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT

Describe the Samsung AMB655X panel. It has three supplies.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 .../bindings/display/panel/samsung,amb655x.yaml    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
new file mode 100644
index 000000000000..eb987d022a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,amb655x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMB655X 1080x2400 120hz AMOLED panel
+
+maintainers:
+  - Caleb Connolly <caleb@postmarketos.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,amb655x
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description: reset gpio, must be GPIO_ACTIVE_LOW
+  vddio-supply: true
+  vdd-supply: true
+  avdd-supply: true
+  enable-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - avdd-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,ams495qa01";
+            reg = <0>;
+            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_3v3>;
+
+            port {
+                mipi_in_panel: endpoint {
+                  remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.45.0


