Return-Path: <linux-input+bounces-14625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB9EB53D92
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 23:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24FC63A8945
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 21:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120032DEA7A;
	Thu, 11 Sep 2025 21:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKOMaMqx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B10824A066
	for <linux-input@vger.kernel.org>; Thu, 11 Sep 2025 21:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757625600; cv=none; b=KWDQwyPMm5VbXnCcJxxc7QIFMCvQp2dqacv9xrPjTMoZuO+x7g84FVNJYgx4mD5TO30PjDaNADc6aaP5738Ije4Rl9GmulH8GPq9GW75kE78xgA7+5cSzeEA6HN8lu2+VKO7mU7TB/GqWapWT1tdxINeuTY8kE5ZDNUf/zZDOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757625600; c=relaxed/simple;
	bh=2L+fSa+PA432zDUt5H/Hau7R0lcNqW58ONINBFxp+Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ooPkspQC7CNxg/hPf5QsN2FoR9mtEjObM+oWJ3JqA5Pr7R4sn7kyGOfhFP5M5NqwW0OvVxXoGk2TEjS7AMGCeZ3rWn7vbKtcHN3h8oniu7x/zzK0hp/Tfe6J/eCQLeq0OfZF1d1RL6bn7cQXkJeecn6BFxyD7oSiV8hUGjgWqQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKOMaMqx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24b28de798cso8636185ad.0
        for <linux-input@vger.kernel.org>; Thu, 11 Sep 2025 14:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757625598; x=1758230398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mxio7D4lH3PMkSvuoADG5CMond9DDQMBys3+vGlQ/Q=;
        b=CKOMaMqxaOD1e6Cw/EvPg+bw7f4iPMVpIdG90bAPhp4FDoFeJGdZyHuUbnY0h8WQyt
         lZne2yaa+O7aAnNYvZciZ7eg+CSpACbeaq0GeHsQp2Xx+U1QnclpuE6MKH0HuK3VmOno
         rD5HrJ0v0lgJOFen5DxLWxvTROy07Uo0AHF6in4UEFwKtZ36nuR6Syn7kl2INszfjttt
         3UGHM7q02sQzomvOLtSqZn++Ih4EGk1pSGQSNJL1XhHPYrVo2pXgHC7wfFvUq8OtaVb2
         mEk4YmeShlWJudwiWYcYyKLmdoY7oLG+k4BFRWm5D6BaOws5VDLQEGnMzoLCCDNQpbht
         PGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757625598; x=1758230398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mxio7D4lH3PMkSvuoADG5CMond9DDQMBys3+vGlQ/Q=;
        b=FOcTYksvUVY4eChEZWpVwTE7+hKGE6TkL2akTcW6GcgFddDT8bWoVNx9zk4cUFwa/M
         WH4Q6xgRmU0gQcUXxCfxqpmSMxKEAs7yWVD6ULDEIVqaJOpEs/wBiKlVqrbntDbS2SXN
         9cdinz5Laolm84XDjkxaCyIOLbSJHCx5Sfo1w2XGz9FfEor8ACuPEPam1j7XfV0lTp8n
         ol4k+jwrcDu4ifcGXH2Tw6ey/Pm6Z3z6srPz1rBUl91y8YxarJduv0ZN4EnI4DFD4aQI
         y43MCgN8rzHOa8vPK3x+05BtA9z1cppd5Rf3hDOgBkgywOPULRI3guZvChsiYlpnJIBI
         NtAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK+4JtbpnVe90hCd22lgeC1t5Lpn3PYW5eWGDx7WATA7jpz6smnMYKPsLkUTQj51E6MpMQIcn6OszUzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFgaYL2vY0Ay/OFQgGZgzCiIWHSUf1VrADaSdu0zzDdpYsFHfj
	2n8riOiSsUcHR7icbEp5upIps3ze9uUDtIXeoGJPD9dSCt3VBHRzRCcY
X-Gm-Gg: ASbGncvTHB4rFs+lDYYKFgGAzU4EdoqYz7xmNg6TGT7fe/KqqkdPHe3o3VLswLmgRos
	oGkzf+9RndCZin+N53kt5bv6/YhDmO/mtlltQECDQvRC+uayN3O0danfAluhM+dr22U+XO16oGj
	urWC5TgoiaPb0r8GoS3PR0SvSBhd5Xb/Dwrin+8ShRHuOCL9r4yheS+HAL4Zv7UTC8BC5TnFBXA
	+HmLVuKCX7awgLBvkjMoDbI+sb2WD8f3k9sN8ax/+Z6uJzU+vsJSBUreKL+mH5DA8iAIkqedk6B
	fsw9mmesSVn6jnVlYP3wmM7m300flpWJ0bhV2hZUpiR/jpkPncYqXsnNidGrhQJTp8vv2ZMihyi
	ZNZ28phqDwj8j5M/aHKIFwqI3ElCOjQ==
X-Google-Smtp-Source: AGHT+IHJ0YQITOH1cO+OS2gCc3deW3ojCo0Hw4piYT18eYlxrwjAwVB/YDz0ez1UkvorsCLsmq8WMw==
X-Received: by 2002:a17:902:fc47:b0:25c:cfe2:a0f1 with SMTP id d9443c01a7336-25d243eff84mr9799115ad.2.1757625597678;
        Thu, 11 Sep 2025 14:19:57 -0700 (PDT)
Received: from archlinux ([152.245.61.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36dbb159sm28705045ad.13.2025.09.11.14.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 14:19:57 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [RFC PATCH 1/2] dt-bindings: input: add ST-Microelectronics FTS2BA61Y touchscreen binding
Date: Thu, 11 Sep 2025 21:19:09 +0000
Message-ID: <20250911211910.45903-2-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911211910.45903-1-ghatto404@gmail.com>
References: <20250911211910.45903-1-ghatto404@gmail.com>
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
index 000000000000..e4d076bc7bcd
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
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - vdd-supply
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
2.50.1


