Return-Path: <linux-input+bounces-8028-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B81EB9C4E40
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 06:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 471E81F250A8
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 05:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1DB1A01CD;
	Tue, 12 Nov 2024 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHTx6SmU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8D27641E;
	Tue, 12 Nov 2024 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731389515; cv=none; b=iu8tiNEAohi4YY4yvaqD7SZzQYhlt/kiYltSjCckMG6p6hpDWD54Uc45UV0WHQ7asL/4gYS+JKv7BO635j5Uo7ePT55shsgj8mzGuEJISCmOSEkVQrIhrV8C3LvzCV8LOpkNVLFjtXtqObHxgQcHK3MPBTefyMgjvvBtUuOAibA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731389515; c=relaxed/simple;
	bh=Stb7X7M/xL4Q0Mk8YzzWxj5kTNgs6JSCFiQN6JAILwM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uBdCl0DbJrxjog0vcqSegNwK2vbwYYMKt39mNnvHjbEPHWSDhD7M32BR/ZdwETZO8vI5VRpaXr28GGOm9pUhmpPoJWXluxy5Fxj4daEZWYXgrIw8+FMnLdJ1JMbc1mV4vaJTG/rrC8MvOYiMIhyQfB5UIpI2T1TqsVhcpHzRt1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHTx6SmU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c6f492d2dso57684425ad.0;
        Mon, 11 Nov 2024 21:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731389513; x=1731994313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5evVJe9YgCMoLbOq7vFTmVzweZlO6clGzRhDs8KjQ4=;
        b=DHTx6SmUnyiS+jo5fetKHaRpQVxisI5GuufyvKKcXwd6QDuWkah+8k83S7lMurJNnp
         pCJ6y0QB9ndE/uJRpoFn2giUiyAKXIsRtGiZxiAfh9PdFLThV4CCTD7U6lOyT4VojWu6
         zhGJWmj1d23LX4ea6TIi30+6eBwU+1+GrAEAGcCDO+ZIn9UAo+rLBcUc1bY3jdQlthsH
         ywJQicCWwch6WEEQ9mSfwZ8jPW/nxZlSXHLsk0XhqublMmIObmL6Fqj94lxtS3ohW+zk
         ffZ61DVcGkN5TS3QOnhqsA3u6RhEDCAO+7o669Y0f/kbnXbDrLJEHa3QFR6yP8AaHUCx
         ysRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731389513; x=1731994313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5evVJe9YgCMoLbOq7vFTmVzweZlO6clGzRhDs8KjQ4=;
        b=NLpH5FyOqAeMzjLuwXM1lfwMOAmzzpJ2y3Hl3af2XiTVKuU5HSA8HdtHmXttn7JB6a
         2+1r6w/M7fIU7zJwRJ7Sk3zIVrysv+mqow6d3vx6jFlnUJKJUu+tH8gMtwu0we7IYode
         PQnL5IRdDZ+2aV2860wB7OwJlRrY9FxTdEtYoXiuQQsDrE/bFbv9tFoqvBlgcTTFMp3y
         OxD2kJo3CcMf2keKKrQlzghe72kxcNunimyfCMNrd9mCMjKHaJqBi4Tlk7ohw7vvFfLl
         ZZFG2j4p7l+D8dNFvqDXlkCIKHtBpzZNYA5KjfKJskxuFDIHxOv1LpianYU+lMpSmS3j
         n2dw==
X-Forwarded-Encrypted: i=1; AJvYcCUlMbHdplL4zlrdEzqRmUAf4SryLsgPfhV1gXGVR17lc5UO054NDWDXDF3GpbM4Z8R0WmOTqu6mzb34Lbc=@vger.kernel.org, AJvYcCXAbVUflu0cNxjlowfKskgJEy7g1XkvK3EOPJ7lYPxhPrf7be1QxauB6DV5RQTVxxtmurJAPTXseJwfP6rr@vger.kernel.org, AJvYcCXNKaAStvSSV5cbs/c7hksVCI+cWEj9nlXCs24k3V6JspL08XBIZ1dVs1nol37oYFHUoKPuebngFmwo@vger.kernel.org
X-Gm-Message-State: AOJu0YxAv65/31dgHXOemi/p/D75gmoj6z8HtcbyjDQK0QevpaE4QOLZ
	svz2t0jgWpy/mhYq648NCiKVmJ9eoVwov8HpY44dmxiEaNud5sf5
X-Google-Smtp-Source: AGHT+IGZcCjvN1JPlKYyMIXS7wcYyjBWhgB0d+UbZEbzCOILH5e3F6ERAex9O4PI4FBWMj8kvxPryg==
X-Received: by 2002:a17:902:f54b:b0:20e:5777:1b81 with SMTP id d9443c01a7336-211835b1f2dmr223702395ad.50.1731389513249;
        Mon, 11 Nov 2024 21:31:53 -0800 (PST)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddf19esm85815505ad.92.2024.11.11.21.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 21:31:52 -0800 (PST)
From: mjchen <mjchen0829@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sudeep.holla@arm.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	mjchen0829@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Subject: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Tue, 12 Nov 2024 05:30:58 +0000
Message-Id: <20241112053059.3361-2-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112053059.3361-1-mjchen0829@gmail.com>
References: <20241112053059.3361-1-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: mjchen <mjchen0829@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..71debafc3890
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,89 @@
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
+  debounce-period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192]
+    description: |
+      Key debounce period select, specified in terms of keypad IP clock cycles.
+      Valid values include 0 (no debounce) and specific clock cycle values:
+      8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.
+
+  nuvoton,key-scan-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Set the time it takes to scan each key in the keypad, in clock cycles of the IP.
+      This parameter controls how frequently the keypad is scanned, adjusting the response time.
+      The valid range is from 1 to 256 clock cycles.
+    minimum: 1
+    maximum: 256
+
+  nuvoton,key-scan-time-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Set a divider that adjusts the scan time for each key.
+      This value scales the time it takes to scan each key
+      by multiplying the key-scan-time by the specified factor.
+      For example, if you set key-scan-time to 64 cycles and configure key-scan-time-div to 2,
+      the scan time for each key will be increased to 128 cycles (64 cycles * 2). time.
+    minimum: 1
+    maximum: 256
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
+  - nuvoton,key-scan-time
+  - nuvoton,key-scan-time-div
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
+      debounce-period = <8>;
+      nuvoton,key-scan-time = <1>;
+      nuvoton,key-scan-time-div = <24>;
+    };
-- 
2.25.1


