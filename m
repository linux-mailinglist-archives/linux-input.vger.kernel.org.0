Return-Path: <linux-input+bounces-7605-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7E9A99D5
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 08:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA4C1B2149E
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 06:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F931465B1;
	Tue, 22 Oct 2024 06:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJFko04M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0224145B27;
	Tue, 22 Oct 2024 06:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578732; cv=none; b=BmJF23iuRrcX7Z0OaAUc3fhLuo/SmnYBZFwg7CtLK1zI1QQbTm5rfekDX2No6SayJKhHtZ79hHRbSyhaa7xR4iDbkR/sMU8fWERiSnOfMhI7iivfBCz0XhUgzThrD5vEOB2/87XT1xmkPKn8BMFpXPW/FQUIa/15jPTI7g1gR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578732; c=relaxed/simple;
	bh=3wNVy9kHqRa5tDi93MkIX3E6i54+ih92cr8/cz6Bigk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oL16mvxWsIace3VB+7RyK97flZTcxtkLGt6uu6oJ7GgGBG5CMykjfWfy28oXYqPI3K90OtxBu0jXCZh/zb9b2gvkPzJmcKGiGVbcPQpgiQ8fN3JLsoRmAiPoj/Ez8lQsLIErQ7Ty2jX+wyWNmvMB2qSWbC7GNTQfUFZfXr5+lPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJFko04M; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e3010478e6so4183820a91.1;
        Mon, 21 Oct 2024 23:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729578729; x=1730183529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhZnFvvf8Id6PGMcwnAZsntULqiyWtz+J0PFKo90yqI=;
        b=kJFko04MgSObyy4efyAwe+/recdEIpFDD8GMKRgpDf7IsQuI9yjTk905HnnjgbCebr
         JV6NhPlrWn/zwKBIAN3lPZZIdowCJjzHUM0qzscKx1WrHy7TKrBsWA0KErclZihQxDKN
         eZc0LdFexpLKwaE1o2WNxpCghlmrAi3xKtaQFUTcRbtqhA1YxjrE6v5Dw/SdSue6iA12
         E3Sgznmi7e3YQHINurv4Ed7u0bFZ9Oewr273Wau1ducGe8eRP1Icji/vOGsF8wXa3YcK
         p190gVaDlI6UeZX4PKJuLOSf4A+qE2if4Ksh7xX/Ms18lwZn+cLnDv4h7H9Xa0KfYOOs
         JDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729578729; x=1730183529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhZnFvvf8Id6PGMcwnAZsntULqiyWtz+J0PFKo90yqI=;
        b=azTNF4y9Vz15bwRyfcRWpKO4o//++BN2ImgkpdLrfdut/qUy2XQ+D1a+4erx+cVUBG
         VkWGNl/+1X6aGL+JoZEGsJ+XTnxkTsqY0umEHOiNmtAl37Bgv9mZ91f69Vw3sNzwYN8c
         fiFAwOQWxrfYLeg4+QP+cUavKfRNuddU57VLbrFldHBOqG4cU6vZ9X4BF5jXA7fcSdBV
         voj3lggP8hd1pNAKAeiGG0I4HV5o8LZ5eAjE4D4eLP8vyIT0ULs9pPZXlmULlf2jk1dr
         qbNNByMVSaKE8u0yS5o6/zlHf1MhEFfjiZ1pxdckavBDQuh6t3Ju9TJlXsJpQsAZk39F
         wbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTw6qyR4dluVjdwaIN745eBIs8CzNvm0hfItECi8A24MII8sgU1NKTUA5x8cJ6xH7GHReztkzEC6uKKvk=@vger.kernel.org, AJvYcCWuwJrT2qp1BrJ+04BQO/rM0w8AQiDz69dDkpM0owhuANr12RIR+XzTU09Ryp9+PT6ll/cUbGfHNon7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6WeYq9GqpAaPP38eHrS3ry4IXd89xzB01DEYHZ2vWom7kme9z
	R5opuRs+6LmTKdTAgWnHmied5B/NeZPA9qpQjoOqOxt5mTIQmzHR79h1TX05
X-Google-Smtp-Source: AGHT+IGN8i3mOey7VdZPPlZdjGYJJmkHvvSelu321aCwFvVAEV3cURA9WTE75dCfPDQ8v06QzorsLg==
X-Received: by 2002:a17:90b:3013:b0:2e2:d181:6809 with SMTP id 98e67ed59e1d1-2e561a178e6mr16626201a91.39.1729578729488;
        Mon, 21 Oct 2024 23:32:09 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad355bebsm5227508a91.7.2024.10.21.23.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:32:09 -0700 (PDT)
From: mjchen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	mjchen@nuvoton.com,
	peng.fan@nxp.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Tue, 22 Oct 2024 06:31:57 +0000
Message-Id: <20241022063158.5910-2-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022063158.5910-1-mjchen0829@gmail.com>
References: <20241022063158.5910-1-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: mjchen <mjchen@nuvoton.com>

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: mjchen <mjchen@nuvoton.com>
---
 .../bindings/input/nvt,ma35d1-keypad.yaml     | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
new file mode 100755
index 000000000000..3d9fc26cc132
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nvt,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVT MA35D1 Keypad
+
+maintainers:
+  - Ming-jen Chen <mjchen0829@gmail.com>
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-kpi
+
+  debounce-period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      key debounce period select
+      0  = 0 clock
+      1  = 0 clock
+      2  = 0 clock
+      3  = 8 clocks
+      4  = 16 clocks
+      5  = 32 clocks
+      6  = 64 clocks
+      7  = 128 clocks
+      8  = 256 clocks
+      9  = 512 clocks
+      10 = 1024 clocks
+      11 = 2048 clocks
+      12 = 4096 clocks
+      13 = 8192 clocks
+
+  per-scale:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Row Scan Cycle Pre-scale Value (1 to 256).
+
+  per-scalediv:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Per-scale divider (1 to 256).
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - linux,keymap
+  - debounce-period
+  - per-scale
+  - per-scalediv
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    keypad: keypad@404A0000 {
+      compatible = "nuvoton,ma35d1-kpi";
+      reg = <0x404A0000 0x10000>;
+      interrupts = <79>;
+      clocks = <&clk>;
+      keypad,num-rows = <2>;
+      keypad,num-columns = <2>;
+
+      linux,keymap = <
+         MATRIX_KEY(0,  0, KEY_ENTER)
+         MATRIX_KEY(0,  1, KEY_ENTER)
+         MATRIX_KEY(1,  0, KEY_SPACE)
+         MATRIX_KEY(1,  1, KEY_Z)
+     >;
+
+     debounce-period = <1>;
+     per-scale = <1>;
+     per-scalediv = <24>;
+    };
-- 
2.17.1


