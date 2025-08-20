Return-Path: <linux-input+bounces-14174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E45DDB2DC57
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 14:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC00582B50
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 12:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3AD30148F;
	Wed, 20 Aug 2025 12:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="cNekxlfo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F122F49F4
	for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755692735; cv=none; b=tGYHqtCD02oA929953sAHG0r2PaUl+snZi1fn1xY5I8k7vCHgLo09sQbwvO6oQ4m+l+HFyqpBQVBXEXeJP/rtjT0BYFXwP46mq56ainCauVNNbiYUe3ZS//AP5aHPG/fLXsfxm7EiCBGs2nYOFwCNP4+j7Jxl5HmF5/vKHY27T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755692735; c=relaxed/simple;
	bh=5y5lyKH1/hkTYyDy0RGC/8IY1XSLp6p75tDi/3+y9J4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Krz8qKA2kRNQFTty7r0JbB1tw5iYzzGJRIoXJdMK8e+MdVSbayCuNQfIToRWawVMpCuuHYSU5Oozi6A8673qmTZyMeqdbxND6Et2f0uZrvQS/qYXwwEMsnshyFAEpo8IgNkCOV52lSDtzxsLNKofiwbtmVM3N3Z6W8WG5bYimLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=cNekxlfo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2445811e19dso51457665ad.1
        for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1755692732; x=1756297532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDVo17AEiZBayUfTjsimRdU07RT7bA4wzSPxYn34tGU=;
        b=cNekxlfoGjQnRlP8zrqf36EWkHzcnuKcFs+ekel+UwC+E+zjuwcz8CmFDY+mNLwUKu
         EvvHx690ASh7x+j6STSJR/6wuUvLafIAxt+ANSpRNFJGDc2/zDcI6zgFodDs/hqKQfue
         SJC9pzyZ09rtZ567BJxuGyOQGlwW2uPuqTKZcju2EuPLlqzJt6T/ToxSUhsSigTJA/u1
         wiSKF5RWOR0F40s6LptD7WKbhm61qjOMbtPXnpgIfuMatJshV2kWlMMCktngTKeLKVk7
         AQYEXspP4okU5fkHDRo4LO0fz8TBUp8ndwJCKu12XL3UXmnLJTRW9UCvlnSj31xavztR
         RO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692732; x=1756297532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDVo17AEiZBayUfTjsimRdU07RT7bA4wzSPxYn34tGU=;
        b=OudtXaCZZf6Twbr4yVMmSjgO5ukBooSAGAGbQfvbaAj1HRMUnAqwGyEfuUd5qGCqWD
         PXLovMAKVmFQd1MDzmiVJolKz+g+UYzuqdQxv+OWbSgGkqlAq7ATjZOen1SycnzpeL+v
         ZeOsQjFpBo4cMsf1CEwENfJjtEuDWx+TS6J1qt11i4nr52on+5J8vAixatrA28Uv82U8
         3xQXP0f8ol1o/Jn3EMwwul8Sc9ZzxDRrh89kdpv+ihQwtPrxy1z3myDbjWaQQIB+LKzT
         Wx5DPtuRGQj6kzIQ7iz3bkoN97MVzrRH27cm7P5d84i5/4zjptJW+eqcG2oAayhkrH8W
         EK7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSmypKdnAKzhe0AdwmGhRxTEe6SCQta2gOM3NmzfnubuIP42laojvfncfMkDmpSzIwV+9lpdn81Y010w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAXwOHmIVeWM5HLgaMA9peF09ctYxJAhxRaKpvJXOATwV4Vq3V
	mIFhMNkC4zUTbBvMi8b4MfMbyVV5FSnAYV7CcOcVAyokCLcyWEOXMg2QCAtd7ElioQU=
X-Gm-Gg: ASbGncuRGyXT2FQ4k9QPyY9hMsaxtOMyRBeRJ7CtXvbpml9Kr1BmXNEfDG1YjzoJ9RS
	6W7ZIbf1KbMaGpIyKN162sFm+JtqX6qmkwHwImHOJNhidhpQvajBampTwPPFy+VdK6jDGTR8MEk
	/VLdrtO6kNxed+drGgGLmhVFD1P/q2Fn67lDRM6vD0O9qqKETOvuGvFBYzwmXTLjWmHb7FpXNqV
	lphPSLAWkzFCYvJagCove5J4IoFG5Q1nnenWcZxK0Lvc6C/pf2fLadOCbuAtGv599BDbEk1Vp+n
	BN0b8rVDBwiPTmRktjL4lhkszXOcC84wQgk6Qb4H+dXNdE2hFPxO1YAtGf/YqnLE5WsaT2nON1Y
	3mWdRbcpo8eefYp79uZBXbKBkjqJas7wREC39NymuVUS4FYnVBj87BMdQnqqEGYLhgPKrqg==
X-Google-Smtp-Source: AGHT+IEx9O55cYKi9Uh808obEjpVhsZk0ACrWNpbOz63pRgF26JlfxtJTcbiypz4Elqho4hRYYczIw==
X-Received: by 2002:a17:903:1a2f:b0:240:3ef:e17d with SMTP id d9443c01a7336-245ef23b5f4mr32288545ad.40.1755692732392;
        Wed, 20 Aug 2025 05:25:32 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c745dsm25450135ad.73.2025.08.20.05.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:25:32 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dianders@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/2] dt-bindings: input: Add Parade TC3408 touchscreen controller
Date: Wed, 20 Aug 2025 20:25:19 +0800
Message-Id: <20250820122520.3356738-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820122520.3356738-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250820122520.3356738-1-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tc3408 touch screen chip same as Elan eKTH6915 controller
has a reset gpio. The difference is that they have different
post_power_delay_ms.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../bindings/input/parade,tc3408.yaml         | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/parade,tc3408.yaml

diff --git a/Documentation/devicetree/bindings/input/parade,tc3408.yaml b/Documentation/devicetree/bindings/input/parade,tc3408.yaml
new file mode 100644
index 000000000000..30ffefb96c68
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/parade,tc3408.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade TC3408 touchscreen controller
+
+maintainers:
+  - Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
+
+description: |
+  Parade TC3408 is a touchscreen controller supporting the I2C-HID protocol.
+  It requires a reset GPIO and two power supplies (3.3V and 1.8V).
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    const: parade,tc3408
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vcc33-supply:
+    description: The 3.3V supply to the touchscreen.
+
+  vccio-supply:
+    description: The 1.8V supply to the touchscreen.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcc33-supply
+  - vccio-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen: touchscreen@24 {
+        compatible = "parade,tc3408";
+        reg = <0x24>;
+
+        interrupt-parent = <&pio>;
+        interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+
+        reset-gpios = <&pio 126 GPIO_ACTIVE_LOW>;
+        vcc33-supply = <&pp3300_tchscr_x>;
+        vccio-supply = <&pp1800_tchscr_report_disable>;
+      };
+    };
-- 
2.34.1


