Return-Path: <linux-input+bounces-4578-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6A914003
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 03:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15E9D1C2040D
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 01:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012B44C97;
	Mon, 24 Jun 2024 01:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="e8YCdGDZ"
X-Original-To: linux-input@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25824A3D;
	Mon, 24 Jun 2024 01:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192645; cv=none; b=tBjDlIoKp7NzXBUkVpbLha40ZJ7vJ7P03F29sj4sb1lygZ950F63y1ajTUftmzR2Su+0FP64u4cAtqgyX/wFNmg2jiPfaF4Ichf9VFZzumwe316L67kGlOs0RIYlyGLf74379WAzF5oqS8VNbHqwI2o1fvClJOxOX+yMVxz6FvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192645; c=relaxed/simple;
	bh=FOWrKXtrZ1kpy4dz7GX61K2da254/sYIEufoJ0WQJ9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGdmJWRtNpqD7qyKq7Nx7nYXpS/rXhMpDvvmYQqI4Bnab1+bKmFftFhehIbJOgZxjDUt9Xbr73umHScAvJAfAGw4mjvAOuTFWAi+TSSEgL9WNAAZvrx0IArpDjRPA1wIGkKJDbOSIVYAwlN4C+GDFGHtrnkvHkveSr0FiG7Ov2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=e8YCdGDZ; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: dmitry.torokhov@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1719192641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PpRdaHq1JaE7u5F5bx43UDOXFu9OjUugTskbkF5xEU=;
	b=e8YCdGDZvsnhygJXihTsD/iUoUW8ZRgoMskrgsBjOvIe+CAa2FTZvl64tZEMa1QBS0wML1
	1QrmdygVyKC97LMKQ8pf8OH17FeOANYXbw6g4n0Ib+Tog1S4hC4SpF4qi3BUQDx2Li/WU4
	44vs0dS7wsSigJuejvx559B4K7ZXi+RxT4O+LSxNf4EUiXkpqI61tm/NFfxgL0GEDCsa0o
	1q6UT4vk7O/Nx89WEyv7fwrOAi8k7H67/tx0Mfd5fPgZx5K8a3RwFUjeVb3A9XzzYaJdmK
	hSheSl3cjviujhagG4kOQeTxzOpgzgPZwTzHrsri0SAtfXzJkc2AAec/Xje4fQ==
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
Date: Mon, 24 Jun 2024 03:30:26 +0200
Subject: [PATCH 2/7] dt-bindings: input: touchscreen: document synaptics
 TCM oncell
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-oneplus8-v1-2-388eecf2dff7@postmarketos.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=FOWrKXtrZ1kpy4dz7GX61K2da254/sYIEufoJ0WQJ9I=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmeMw7/gCGNKCconD+Ch/eeHk9U7YKZTIuov9P0
 IenYfS5YsmJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnjMOwAKCRAFgzErGV9k
 toXGD/oD7VBrteDb1LgNTTNj3MaUNDoalxsYU5g92Dzsky2EPzTJMVcC5MH0mACHnX8R9wBa9aS
 kD3dhj+RSeiPAm0sutRUfUMyTvz+pD5YVG3ivBG8kJjb1T+sDG8TkW9yhITM1H1HblN3bJiaEI6
 +NsX1w3amZEz+9vc+6CrEUugsEzPiEhyOjDtku6eIy4RufFj8Q+y5VX8Rxi2YkgVskr1hOHtB0/
 HN8TwF87h48xqzDDIToxSQ9t6jCefLi8dttk3pA8NyAxa+U3TQMx7Dq6A4UuDxJOJFEaOr66Y+t
 FRsTOEzXUCJ48HP9Ask33KP2OZQV2czshsxTufClb/Uxgn3zq1Vq4mGJe7ezOtoviGLQ9IlWh+m
 oLJQd7pvf8R30pJ7ejWgERnGqQ7EtCgx0lNWUlgqtov1cZVDZVy4wv3SOx6Ln+gX2jUlhLrXsAD
 Ck+aGAIbv64xo7kKV74F2YnWFWRGdwFTQaxKlH0foj1p7n57Tu8KLB5o/A2+vQoMr/57gpyuiZm
 Z48LNN7OC+SGJxfcWhrx/BI8ASxw23RhXKeQh/wOkAtE3updx6vHA9URsgXL7vTUp64SY7ncIef
 IRygDB3Csc1EweC6hOfyhvh98ZQPc9lKqxQB92r4KUGAa/jG/XQxYQ7xH3xA2cT6AmgesLdUMw+
 Rm8zra31dFsqeww==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT

Document the Synaptics TCM oncell series of touchscreens, starting with
the s3908.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 .../input/touchscreen/syna,tcm-oncell.yaml         | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.yaml b/Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.yaml
new file mode 100644
index 000000000000..1795df584987
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/syna,s3908.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics TCM Oncell i2c touchscreen
+
+maintainers:
+  - Caleb Connolly <caleb@postmarketos.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - syna,s3908
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset GPIO the chip is connected to.
+
+  vdd-supply:
+    description: a phandle for the regulator supplying 3V power.
+
+  vcc-supply:
+    description: a phandle for the regulator supplying IO power.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - reset-gpios
+  - vdd-supply
+  - vcc-supply
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      clock-frequency = <400000>;
+      status = "okay";
+
+      touchscreen@4b {
+        compatible = "syna,s3908";
+        reg = <0x4B>;
+
+        interrupts-extended = <&tlmm 39 0x2008>;
+
+        reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+
+        vdd-supply = <&vreg_l13a_ts_3p0>;
+        vcc-supply = <&vreg_l1c_1p8>;
+      };
+    };

-- 
2.45.0


