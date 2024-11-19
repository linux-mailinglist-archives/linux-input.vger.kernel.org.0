Return-Path: <linux-input+bounces-8141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1B9D1E8F
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 04:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 478B4B22682
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 03:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE1D14AD2E;
	Tue, 19 Nov 2024 03:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IG0CrLMv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854B013D893;
	Tue, 19 Nov 2024 03:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731985242; cv=none; b=nwi63KulRG7EPkqWulJG9cUlzgJE0HeoTHwPW1dMr2DLTFe25hhMQOL9Tc/d7TRXcXOXvYbwRrV9Iys7cafAPFo8xjeu3wCvQmf9quMUP6z/nEoUoPht3q9IkdrmK24n5+65nf4NQouM7zKrNFYEB40XVClPQK80gyA1sIg81MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731985242; c=relaxed/simple;
	bh=eiDyLmRX9aY8m91R0HH1DMqgOWQA8HsvsOEeZgWkzPk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=si+W7zBlwHwchbawPqzroY8lDHHEeqdNt6nKNNEthDzmHpHStBeViR2cPET/SIEy1rlvzvuf9hAB858/nAI7uAYmiEFbFrCsvjRX4/IoTn0qdXTp6Zhta6sXNy7zRGHg67g+eFB2lc4EzMTLcMSa25W9s0qKJRbQAvYLIqNV72g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IG0CrLMv; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ea568d8216so1612220a91.1;
        Mon, 18 Nov 2024 19:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731985238; x=1732590038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vaaAwP82EEkak3EibruVYmycrwaT2pwi3dqccRnO+0=;
        b=IG0CrLMvVpoxDhtECvLcblvZHbT2Jur/lxKAlnuHzMGrHW5ZupexT/7j9Z5F8FjlGb
         ZybwCwd4/rvd06bTex1eg9WljF20sYUtuSJToM+JSWUSkw9TBVpJAXx7mO2OAkUDyO6F
         5nsgY8VXRNu6+a1e0r6kRwJWyvKdUlLSsvYeC7AFmOVICuhljVxS5jY/DlLXRbYWwJVu
         YLrSToyEadPsVKKzED3GFUE8gZlqOs6ZIT0zmJev+tHSIrGz8bWCMSi60icX8Xw1GOp2
         xwWIYRPD5TuwRL8ot3c7Lwm2yGrtIItvcHGvaeeVj28qkYHM8LU1XBPD83h5TPDPiyDJ
         6e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731985238; x=1732590038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vaaAwP82EEkak3EibruVYmycrwaT2pwi3dqccRnO+0=;
        b=fbPMv90Q6PMeitC1A6RwstPWUsa6GhcadCqQoaAlIiRxYOY/G9UKL0PmtIJyB3Mzl0
         qWTDUeBA50WA9E2D2JR+AXBV3X35LJ/sqiPYXyVAadrte8nP/IRBl/DX89cSeWjaeMHt
         ZyF+dwMWv8dtK1KCn437qZxGXP0tdR51M+uTljcEGEgaUGK7NoncHV3U/g7dlnS+C3hm
         gmI15JqUh0lNj+W0KeM+i6t9OR5v0yBEEP8+K+57DM4faBZb+jmJKrBa1mU8F+myzD0O
         mZBhnnNqtvrpypGteHGF46dR7t2Tx2IlGymTSAQi+8HFrB84DRTCoHExfVj96YBQ281z
         DaEg==
X-Forwarded-Encrypted: i=1; AJvYcCVxIkwWmjaMsgCO957N6TS7ifnW8YZUAb7W7oIdm1EpFY31ZAinWfe18adjcn4oAnpCR8S+K3KaOvHNg6k=@vger.kernel.org, AJvYcCXhuzsF5VQHw+yQvJ2FC4Lu/ixpJFtiIIhKVXG4nf8yovI9GUI7ne/RQn6Dx/b/OtNLW/o6pt+pAMbq@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQUwg4mHScEX5X4yRUrKh6onTZ2nS8yAC4MoC8T5HSYc8eArD
	GErKJCB5VAuXUEShgt+MLmsDaW6BK9RJQuJ2pH4ZXBJccRM+bK6A9l/3/Toz
X-Google-Smtp-Source: AGHT+IFVHX6iGXJ6c8Im0zcXAzR6FVVI8K8MQVMSFY/Le+InvoR1Xuwz3DMH5i/H8I5J9enh6cMEHw==
X-Received: by 2002:a17:90b:3a43:b0:2ea:3d61:1848 with SMTP id 98e67ed59e1d1-2ea3d612074mr10645022a91.34.1731985238131;
        Mon, 18 Nov 2024 19:00:38 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21210fe87f8sm32760785ad.29.2024.11.18.19.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 19:00:37 -0800 (PST)
From: Ming-Jen Chen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Tue, 19 Nov 2024 02:59:53 +0000
Message-Id: <20241119025954.4161-2-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119025954.4161-1-mjchen0829@gmail.com>
References: <20241119025954.4161-1-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..9ccd81a2574d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Keypad
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
+  debounce-delay-ms:
+    description: Debounce delay time in milliseconds.
+    maxItems: 1
+
+  scan-interval-ms:
+    description: Scan interval time in milliseconds.
+    maxItems: 1
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
+  - keypad,num-rows
+  - keypad,num-columns
+  - debounce-delay-ms
+  - scan-interval-ms
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    keypad@404A0000 {
+      compatible = "nuvoton,ma35d1-kpi";
+      reg = <0x404A0000 0x10000>;
+      interrupts = <79>;
+      clocks = <&clk>;
+      keypad,num-rows = <2>;
+      keypad,num-columns = <2>;
+
+      linux,keymap = <
+         MATRIX_KEY(0, 0, KEY_ENTER)
+         MATRIX_KEY(0, 1, KEY_ENTER)
+         MATRIX_KEY(1, 0, KEY_SPACE)
+         MATRIX_KEY(1, 1, KEY_Z)
+      >;
+
+      debounce-delay-ms = <1>;
+      scan-interval-ms = <20>;
+    };
-- 
2.25.1


