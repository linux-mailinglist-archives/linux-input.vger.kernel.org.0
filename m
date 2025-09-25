Return-Path: <linux-input+bounces-15099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E60B9E905
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 12:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B663213BA
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 10:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9DF2EA74A;
	Thu, 25 Sep 2025 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="glqlS/OL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538512E9EC9
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794870; cv=none; b=iSa7ArbGU6IOcexylgyxXgPssfcGsTA6qA2y8v8gn1U1LrS7PZ0r7tpzUE6ICzhaba1jdUSKFeBg4Roqiq1QTVbGfq8zivrW5cNFlEy9JUgHHoIJ2TdfHgnj34UyPfCI+uYNab/iZLD8ahzNUJmOC6Jnjc/+7/GVfc7yQykdf5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794870; c=relaxed/simple;
	bh=1QUK9jJoKqv/JFiexX45KtZUZbQgSKDFt0QiDPiytLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DseFgWvtQ22CpmDADnYdS918lIpo4iMmltwntzIzBcEasnXBBhq1TJCDUSyIRG33Rb0nIn6Os5DPXRA3PvoD+fd2SIe4HcMDERxcatBWvt98Im7QOuTiVTWxwIZeUUswVy6VcB7iP/KIwTShJ3/aIhNBsTCeduzmE22LrOsF+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=glqlS/OL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b0787fdb137so128910966b.0
        for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 03:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758794867; x=1759399667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlraT9aep0ygh9OC4i2N/udBlNlRXDYuFWD4+3zrjGg=;
        b=glqlS/OLGMkYgPlfvz9L29E4za7zNYDA8P9oFLOyN4O8FTR3+Zcob0z8fbJRWgpN/L
         4rp/ycWnS1DPDdzbQ7OiHXYFIkZI5PJchm/nWfRmYpl541J4niJRqH07zWqHQPK+6Kb1
         J9YxvxCx5jjj3AA9tcLRryEC3F88Fm7FMsSh29wTMD969EbYtxkRM81Z4OFP5+yv6ks9
         P97CorLvv8FRv2nkWz0qdht74Bz6ptj3OtJ45ire4p1FKxVM/25NMxlFQ/6AhDk4cyo7
         C0zSkEdZLT3d3RgfCEk17JhHnFoDTamADQsvtazEOF3sUCb8MmIa/QxfMwOyTmp4v7/0
         LAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794867; x=1759399667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlraT9aep0ygh9OC4i2N/udBlNlRXDYuFWD4+3zrjGg=;
        b=Fg3Got7fRd1lrkvLgBOkogWTss2uV6qGJ+TsKqIXWnnL1EvLYXBIq3hQe+kvBTaJHJ
         Ut255fvQI1/sa/dmDhJ/3BWlBjEYqNzz69vHMPlXAfY/Pn4zRVn8dv0Qr7+LEarrUTZN
         RcPAbTJ+vmxrEBseFoaCEOkhhc0sNvYTP/zxjmk5EmXfc1AxvJQSAbB7A9y/rlLBZJ0f
         9PdkGgB7EgFfcJx0l8wbVVPc+wfFKqKhgpyC9+5KQ/0T0YhNbfQbNdtkg1iXkbuTGPiy
         slcYRaj4O2HDGbp4RCACIBMypvyCsvctDlMUKVB+tPFxU83KV5uANDN0sKVDpfve3jld
         +Mow==
X-Gm-Message-State: AOJu0YwHyURlleb+LQdRr6QJrO8D6L9cSt776QQ+ZvSZw17ueKInjLYi
	PJ2E0EVFpgV4lAnbC26LhV2dJWFTCDGI4QzrvHSeEV8E6FwwYFEA3OPf5A+TN+WrPlc=
X-Gm-Gg: ASbGncu1VCAGy1lnpPYFVdQyMMELs9hOy1vwGm8wqcbuwwQtTburas9bERCm/nrzdMb
	P2z9Q97YU7fQFgbT2Ummc2fCDjD8XT/fescLO/qXUmAcq+g5KehixGPIMnAaN/o0Mc8f5p2Ju84
	Lizg/FOpDUcyfimFmAFxepYVzWmPbmTOe2rjre4YUNF6+zQBDmU9otnfjO/Cmi16MeOhd9tYxHo
	Bp7Jeg6j3BEjS9ec4+AispvrTL5K2C8pI8HWF0XGBvLy1lVfLE46BsvoWuaVCcz4Be8Llp8TlNe
	QflN17EON58z9LdxwKCn2MPkoCmnmyt3b18sDr49AEXT/XMUZnm+FyzYvkviarMCTD5F6p4JrgE
	I7y2fhTLNsAkDP8RPOjLWk4w0vCS07Ae/YAMK6CHbylGVzfsVbC6JZMlj85Igh8Yms3WKi1GuCg
	ROVOQH
X-Google-Smtp-Source: AGHT+IF6yachSnDBfrcZ3V0TzrsfeZbsh50wHUGTubUCMItVqZFVHiYHFhthgCJw93KVQb8DLdZCow==
X-Received: by 2002:a17:907:d0a:b0:afd:d94b:830d with SMTP id a640c23a62f3a-b34bfa5c2ddmr346388166b.62.1758794866636;
        Thu, 25 Sep 2025 03:07:46 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7746sm134270766b.59.2025.09.25.03.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:07:46 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 25 Sep 2025 12:07:28 +0200
Subject: [PATCH RESEND v3 1/3] dt-bindings: input: Add Awinic AW86927
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-aw86927-v3-1-1fc6265b42de@fairphone.com>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
In-Reply-To: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758794865; l=1746;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=1QUK9jJoKqv/JFiexX45KtZUZbQgSKDFt0QiDPiytLQ=;
 b=fsqcucISYV12YVSllE7SDA4gLAbgrvocKzurN7EjjzUKfL99HMpSbvtKf6IalaWBzxCDjwImf
 OHcWM3YxSn6Dr/itl+UN+LBAjCCjzWaWDdmOfrThQTxT/q+oH5dMAZZ
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add bindings for the Awinic AW86927 haptic chip which can be found in
smartphones.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../devicetree/bindings/input/awinic,aw86927.yaml  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b7252916bd727486c1a98913d4ec3ef12422e4bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/awinic,aw86927.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW86927 LRA Haptic IC
+
+maintainers:
+  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+
+properties:
+  compatible:
+    const: awinic,aw86927
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        vibrator@5a {
+            compatible = "awinic,aw86927";
+            reg = <0x5a>;
+            interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
+            reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+        };
+    };

-- 
2.43.0


