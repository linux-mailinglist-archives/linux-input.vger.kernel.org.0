Return-Path: <linux-input+bounces-14936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54CB8BCD9
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 03:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C7E6A05C60
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 01:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE4F1F4281;
	Sat, 20 Sep 2025 01:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1mcR9M1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E30713C3CD
	for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 01:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758332728; cv=none; b=o+xX/9KBb/pG+ZGVhavONjPkpmCB1l3d6AEQ9U4p69a/8Umhy/HZMzQVbRzukszaiUpz135r62dv+2kmWOQGIy6ogRwjxBTHJa2o/aoa3e2GlWlHlFXmHW3Zy8P9pYjWNnCsKCVMh9y+PA80zo86kKxMO4tg0kRIzlq0wCpVYjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758332728; c=relaxed/simple;
	bh=pBL+gVGPk5Oe6pgI0u7TV5kZR7rId+e7XFYkDX4Yyd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7zHl8p6t+mJmyCOvslzSs1RShvM1XEAp2Ywdv3+PJlPwLQTsvJHL5rBz8o/dm4f17Mx/odpaSPK8iDb2RBkkliURm31vfnRfyxHlxzaNYHFc4p17aiCuhg3+s1wnFOIlTPFMM2uVUEZ9PiSYIH1hu2DUq9LRF/XB3TTPnmpZC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1mcR9M1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so2758575b3a.0
        for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 18:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758332727; x=1758937527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g3X7itFcaYd0uyiDe5Igj71JtDo3enYD8GOD7zyyH0=;
        b=g1mcR9M1H4OE/tqDUPn/KWIVoO7KDOIq7A+byt4N6uy/nsEuqGzOsAhDGuP3n2rFXm
         DOzRgfGiTezHK8VMmjK2TZz3cRROnk8Znv1Zt5XppCmnXC5lT8Nw0TQ3vZl64uLTdkzq
         gtyEeqY0upuagPp/Lt9hFD2nFGFn99ouzdQIIGbM4+K89MsCKPfBMw8T6Ggx0R5pmdTY
         Ifye1nDJqxyYTXxGjcJVJ5P3/uAW6j4SSft/oDeaYpsmu8wMi0/M8Z4ASDG5OTasl/6R
         gW/lNrtq1RA8hfave17gt5IEEnFiJybPcWIvgKJHDJ8cRzJMgh2nZpG2HcdxK8bAuPjs
         M9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332727; x=1758937527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g3X7itFcaYd0uyiDe5Igj71JtDo3enYD8GOD7zyyH0=;
        b=nNqfSpCbH0zTskxOyeU5ZxUUvTZ7NCDSUBJ1UwPm6mOsFaSQFhlSjBc4z/BG0AVBjX
         q7y7zgH1hwlzjYs2aaI+SJNVooDK5h3gDUin/b2sFONm9y5XwMcATkEoSz1w2Jifw52q
         /n5Qe6LD1wyGfXhqtXumVsAEdSSAxbQesu07EIJMNmYqeiGL5qUvDIniAO9NdKMolMvj
         e3tkd3Iimwsi/LfbS21wqv7I1AVl0f1+F9Hv2G+7r1Y0enIysJ8seyTVyQcx4IPdX+Bf
         LOuzYjqeI1FXzkmSjHFZG6GUbvrj1GE9I775pu8C3qqOrh6JCUAxdtx8edomU2XsTXZs
         mrUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8lrMMMfwQBeUr5zjyE2UosKiQrt1FX14XbkYWoQDV9ejtc2iI48EW+2OV950bYZVRn8qHrbncgDwXVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM673RNoWoOpddDkIs5m4JNifiH/luRX1Uy1ozMWK8bRpRFvLM
	MpnVAni6CehesfOysra4BpPgtrJRxrPqklLb5O+BUHcuwfKR2WFPgi3C
X-Gm-Gg: ASbGncu04P36NISGMxdseQ/McT0gI6b+/i2kxLRzVV+lXySLA//zBUKt+NfZi9zyCxV
	qEinTvO3/EUoo2V2KUfSprxzyPOc7kmpeVaQpM5QSW2m8O6GXFemZC03p+FgxLxAWIuGkLHYRz7
	7uZhUkmZtmg70t6Wse/xgArgU+Fd0WSIizl17CbMPVFVSN7G6QmW+KhTsokDQ9CTdoZSdYJ9ffZ
	H19H9IKCUu6ESYcvhyDVXKxM0iynrQWxgMpUVT/Ci7o1l82mNQMlxcxXixZWHDGJnE5zBhlmgrL
	Z5Q2lYloT0FlWMjxjdh4hYohe6VuL+Fa550f6LUlliSF6dzYZhncHmip2O+c1Ei6ShSUFisH7mv
	qcXBgjujrB+p2kJkMmqDc
X-Google-Smtp-Source: AGHT+IH46WKyw6dARtEBBxsg7fBtDAYRS7xjAqSCeJOf6ViP/DWyFWnfqtCB+n4K1vLBS6bTt8oifA==
X-Received: by 2002:a05:6a00:b86:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-77e4e5c39eemr6702571b3a.18.1758332726883;
        Fri, 19 Sep 2025 18:45:26 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f1a72e7afsm529395b3a.92.2025.09.19.18.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 18:45:26 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: input: Add ST-Microelectronics FTS2BA61Y touchscreen
Date: Sat, 20 Sep 2025 01:44:49 +0000
Message-ID: <20250920014450.37787-2-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920014450.37787-1-ghatto404@gmail.com>
References: <20250920014450.37787-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the bindings for ST-Microelectronics FTS2BA61Y capacitive touchscreen.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 .../input/touchscreen/st,fts2ba61y.yaml       | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/input/touchscreen/st,fts2ba61y.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,fts2ba61y.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,fts2ba61y.yaml
new file mode 100644
index 000000000000..d5565b5360fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,fts2ba61y.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/st,fts2ba61y.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST-Microelectronics FTS2BA61Y touchscreen controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: st,fts2ba61y
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  avdd-supply: true
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@0 {
+            compatible = "st,fts2ba61y";
+            reg = <0x0>;
+            interrupt-parent = <&gpa2>;
+            interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+            avdd-supply = <&ldo17_reg>;
+            vdd-supply = <&ldo28_reg>;
+        };
+    };
-- 
2.51.0


