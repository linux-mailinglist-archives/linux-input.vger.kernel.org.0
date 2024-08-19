Return-Path: <linux-input+bounces-5645-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E92579562E3
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 07:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 277B7B2188D
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 05:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EBD158A08;
	Mon, 19 Aug 2024 04:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlyEwvqY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3C158524;
	Mon, 19 Aug 2024 04:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043519; cv=none; b=fD3uy6PGZe6qjFNslUUCKpKWrOkJYtUnwJ8Fs0hPrYMmgtAIHSpqtvkiWdTLwEFCydvPvACwOjZZojOMEUtqRko2QumxeAzZ6x9RqchdMCMoQTCPOvhtvxjSj1F8emT56qMe+yZFDcTMZpPxoaG+x6chs1AmzJSpIKisi3/KobU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043519; c=relaxed/simple;
	bh=pWY6q3L3+rcdHBFJ72AaCd4gwD1AvD5QCAXJ1uEhjds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lP1W+231SzgSHcCMsfzxEX8wDpUurVphRdaKfrdmFFHO3EdeOgT6MSN3u6QIPIZV2J4o8TJ0qV9x1EKxEEklQr7/rxugln96co2lgwWkw9Zf41fvrlbK/QSabVocSpDfCm+3LxWYHVyLZyOlcphHE+jNZHvxih8fAdJ/Gz+sJls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlyEwvqY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-202146e93f6so22585745ad.3;
        Sun, 18 Aug 2024 21:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043517; x=1724648317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rL9e50K+KTD0iWv/ZJJXKGxKFtaByRAx8vVdC/BQNE=;
        b=SlyEwvqYDhY1g0i0Fo+Pqec3pwzDzSZNpItUk+o+20w/TkqVhr4yxvfbl3Z8UzU9tU
         8Coy7ExWkktRCmFlinQyHmrxPhzc3N8+CvEnurAX815whsVyz8l5zCG03MpeYnx3WoOG
         iOCOy3athlPiEpg847SdTetv8vGBNFaOd3SA2uv/FCTaYgs6LyK0tYElHfy3UGWRyajK
         k0/+LiMbUmGR/8QYX7AddT9SJjFxrwmy8UjlAoYBlt081WKHZR1Yu4m8PwtpfIPNzTeH
         mhaqkIStOR/nCJF0nTs+lJcS+Q++5Ga56fQdQ5KEkZ1EfCkDbB13wfY7JT59OV5PZJE4
         N7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043517; x=1724648317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rL9e50K+KTD0iWv/ZJJXKGxKFtaByRAx8vVdC/BQNE=;
        b=IM2sH4jjOZdMz6ZTngtaAnKhG8wHc0191bHhfzOgmA6tlWFf0bTxRzRweUoC3FkqAz
         FKJWMh8FQZV69TQQJswzzFROpcmPhHuVg8RMd/oGDAf+6dFA2N3idQ35O2ooEZ0qLnyW
         aHF+T3c5KJcCFhbo/Zaj2krkgDq9XES6CidQRO7lgeyxzeQ8nsXk30/zP974laHLO9gj
         p/oqZz3hSC60tlsXucWhlpe1EEmg8uFz4du8+OjSafB5p4+tLN4Rhc0dxMHHC3LRaeLC
         VFdNmFTKpRrwBvcYw35bzpKag1vECDelR++qS/1zIT5j+T/+W6lT/RmOCIViLAUi8uYd
         ORqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5dTRQT+/qKNvJFHkTlPfcB3a1j5Lab62Vo/a+NOc0ptKJ2wdcDanGJTOSNR6ftlNQYK+WRRHyWd/OYeL9v7DEzc1n/soUdNArxF9e5OE3lopsUi1HcSmlik9vud4J7wWX+pry+OJgeT26owzNjMV4UNhxRC+MCjJQ1Ksv7MTjpYtgCQVhhPU3LvJz
X-Gm-Message-State: AOJu0Yytdfbx0aXZPNixB4q22AdwxU0qnixDP05yybBA1UIA0dwGxRBm
	nScC0WWCTMnTxB5Y3OWJKy+HnIVX38rmgOGsrLobsZtqN2/3W7Qk
X-Google-Smtp-Source: AGHT+IHRfw+SZ9RF2mv8HemU9qcOBYNa4aOGEE+5+suKU5vhvp5qcT10dqeZbTjbknB4zaBQdB79yA==
X-Received: by 2002:a17:902:f988:b0:201:ff75:fa3a with SMTP id d9443c01a7336-20203ea01c9mr85637105ad.23.1724043516489;
        Sun, 18 Aug 2024 21:58:36 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:36 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 09/14] dt-bindings: input: samsung,s3c6410-keypad: introduce compact binding
Date: Sun, 18 Aug 2024 21:58:06 -0700
Message-ID: <20240819045813.2154642-10-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding with a sub-node per each key is very verbose and is hard to
use with static device properties. Allow standard matrix keymap binding
in addition to the verbose one.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../input/samsung,s3c6410-keypad.yaml         | 57 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
index a53569aa0ee7..28a318a0ff7e 100644
--- a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
@@ -16,6 +16,10 @@ description:
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
+allOf:
+  - $ref: input.yaml#
+  - $ref: matrix-keymap.yaml#
+
 properties:
   compatible:
     enum:
@@ -37,6 +41,10 @@ properties:
 
   wakeup-source: true
 
+  keypad,num-columns: true
+  keypad,num-rows: true
+  linux,keymap: true
+
   linux,input-no-autorepeat:
     type: boolean
     description:
@@ -81,12 +89,33 @@ patternProperties:
       - keypad,row
       - linux,code
 
+dependencies:
+  linux,keymap:
+    required:
+      - keypad,num-columns
+      - keypad,num-rows
+
 required:
   - compatible
   - reg
   - interrupts
-  - samsung,keypad-num-columns
-  - samsung,keypad-num-rows
+
+if:
+  required:
+    - linux,keymap
+then:
+  properties:
+    samsung,keypad-num-columns: false
+    samsung,keypad-num-rows: false
+  patternProperties:
+    '^key-[0-9a-z]+$': false
+else:
+  properties:
+    keypad,num-columns: false
+    keypad,num-rows: false
+  required:
+    - samsung,keypad-num-columns
+    - samsung,keypad-num-rows
 
 additionalProperties: false
 
@@ -94,8 +123,9 @@ examples:
   - |
     #include <dt-bindings/clock/exynos4.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/input/input.h>
 
-    keypad@100a0000 {
+    keypad1@100a0000 {
         compatible = "samsung,s5pv210-keypad";
         reg = <0x100a0000 0x100>;
         interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
@@ -119,3 +149,24 @@ examples:
             linux,code = <3>;
         };
     };
+  - |
+    #include <dt-bindings/clock/exynos4.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/input/input.h>
+
+    keypad2@100a0000 {
+        compatible = "samsung,s5pv210-keypad";
+        reg = <0x100a0000 0x100>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock CLK_KEYIF>;
+        clock-names = "keypad";
+
+        keypad,num-rows = <2>;
+        keypad,num-columns = <8>;
+        linux,keymap = <
+          MATRIX_KEY(0, 3, 2)
+          MATRIX_KEY(0, 4, 3)
+        >;
+        linux,input-no-autorepeat;
+        wakeup-source;
+    };
-- 
2.46.0.184.g6999bdac58-goog


