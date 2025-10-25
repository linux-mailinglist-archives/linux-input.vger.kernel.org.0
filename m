Return-Path: <linux-input+bounces-15710-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE14C0865F
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 02:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E3DE4F1CF6
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 00:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2602C1865FA;
	Sat, 25 Oct 2025 00:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpGam7Tx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3984F78F43
	for <linux-input@vger.kernel.org>; Sat, 25 Oct 2025 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351905; cv=none; b=iimN5sLW5AWHpPWsEknkc+w/BT3lVtqhKRyCTMrSiyBqRmDbs8HGxLKXJ6lApRB66HCvq+6Eyg6Iqt+4ThjswHbeaWy8+UvDCNvBoT4gPGYicPjiEdSNvt6oD7kSk9oxeScP0nbnWemq2FsmMjtG9DiYJFmmkG/Xo9EnpZGWeJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351905; c=relaxed/simple;
	bh=doc6D/qsvutmJbzXvdZDYSYz0ZxXLQM+iyKROYiaouk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLqMyB18Ay9W1yxX9OScc5PkKwmiAFkxX5XNdeCA4XnMTWIddCbjy+2p3kn/QEO68Xfj3+u4oiF0ELUdYGh0Xb5O4IqTDArMTK1nnIUh5+3zNBwfyWfrodVVU4aJtUrtPsuBHb+19LZXG+hrXbQx4FfjyhqcGghp7d9/qaSBXZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpGam7Tx; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27ee41e074dso26487795ad.1
        for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 17:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351902; x=1761956702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=DpGam7Tx91C3uwnzdqHANFynSeEaPGgVqstnUk4slv0fq87EaP6eGvTyPSaZSKpwoU
         8lty4dwHo8cAtxbVwYDzNIZwXOwTmKoPMvabSn0/whEWCTT9Fl2eBb3Q6QQEtdTSfH5+
         vpyasGtXqN8U+3XEiQGzE6nXAEg9xfJAdLvoOTY/tjlwe4InBVi02H+f7QLp/gGc3H6R
         lJAlaued35/Yyl++Hr66tacDWlZG2KomI8MXxYAtVCstUwIb7G6dOAf3zTln3BgI6gaS
         i1QOTrgZ8Zwdc+ZEiw75xo96Klo/CM3C4/RPJ9BJzeqIYP+DlJxFo09c5vBAYx+fpvNQ
         KIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351902; x=1761956702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=deUyFI048/EK46ZYnzFrNQvs45tmYnW75Pq5dhi+TxhaTkIYMrie4f9RoamepeslRc
         9ENaKWje1GLTD2lH5pLTHXzNNk38y5oxPT1BA1Lxs4mPUX3vq/rltKhTt+JNiPalwhVk
         FlxNdiyV8v1GEjzpHPN87jWA0b4HftYYX632er92Pc+A5EwR43cwZYsOdlGsVRKrRa4x
         VYi4qlDa6+5AmG9e1gx9dzgB6lp118U87NsLrKFLHBZopdNaFNLXxwsloE3Z1nrOKwDO
         PC5BkIGHsd4IvwXadqgJVzwDXS3VdMij8reMlnJnyQvKklC3tiT0E2AT7sSq1UX/c/+S
         72BA==
X-Forwarded-Encrypted: i=1; AJvYcCXoc3IoTvuJXG0niDjiZUS5gl2NVo2xp6Imy+nMZoWJZrx8ghMy0LrAbLNe+6QoTxqsqaIWciOjSt4Mww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwmIqVlgyb/QaZf7S0KXHlNUk6IKPJl5AXgU+kuH1HbBPlgo98
	fUupKr0Vu16XA1c2p3F6qfRZqqvrv0exCCvgMLCzHpkekvZYKillJ/Rl
X-Gm-Gg: ASbGncv5Cx4MmFdA40J93rsTZRaOv0HyEn6QJ/yw0NSrNs1/oborL3MNjwT5daVKap0
	Fh+/zR7c61pVbJ7W+Ua/oCtw3vLGQ9VDvDnQ3mgUKL8hN/UVpM+72I8kx/88n4PHAUVaIB6UWk1
	nZHvsRzUkVKrq0xpCQNDbtHVxnn/K1UCi5NRO0Gq5nC8A24TPbY+MUlEgrl/PB2Qt35mlDkDntm
	s4EHA2Ff8HUITySViskq7lY/756yxKJjWLddfltLzHAqt58UIzH4uvNCX+8pCRusoR5rEa0+IbU
	BZ7LXDQQeRWkUEY5ULcU9oIvyolPvNhoWT75l271TYUspXiAOd5R/NIZ7fJ062/FNDQSEzWU+3m
	tS3bjowqcDsWZBsjc57tq42iznGRfsG8aL881txMHG3wNFZxGvGmG3eZneq9np78Oy9gUKdTzI8
	DZ1MvUkdjj6XGALn2vClcr5z3kwLyBq/eBiq+YecmhUPZ+OToNwXS1y8nLKnTcM8pjym6KA28Og
	NhIChNFRuKCV4wMdAjJG71NPc1SuejZuOIearGfR794RU/+Ck64Jg==
X-Google-Smtp-Source: AGHT+IFEqmXz9bRiukdYngtpXwv8pFo+7VapY1AMW8bk3PUTqtg9ECS2KTxI+6Fj45sxyikhlb2EeQ==
X-Received: by 2002:a17:902:cec7:b0:269:8edf:67f8 with SMTP id d9443c01a7336-290cb27f40emr370038515ad.52.1761351902363;
        Fri, 24 Oct 2025 17:25:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:32 +1000
Subject: [PATCH v4 01/11] dt-bindings: rtc: Add Apple SMC RTC
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-1-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mFOSrinm6mR52T1DXQZDpIdEAeTd/TshZKSbr4XqCgw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM5KOUU19IWnm920k5nipVbb7c99zz1Ye9FD1RWXL
 bg5V1p2TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApnpmICPD/JeKQcuVJpTJ5a0VO/JY8PkWXavfna5xi4x7tfR/GthfZmQ4vNRKL0n
 +VX/I1WCGLzziV2SPLPpV/aN1bcasfeJRCZ94AQ==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/mfd/apple,smc.yaml          |  9 +++++++
 .../bindings/rtc/apple,smc-rtc.yaml      | 35 +++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 5429538f7e2e..0410e712c900 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -46,6 +46,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -80,5 +83,11 @@ examples:
           nvmem-cell-names = "shutdown_flag", "boot_stage",
                              "boot_error_count", "panic_count";
         };
+
+        rtc {
+          compatible = "apple,smc-rtc";
+          nvmem-cells = <&rtc_offset>;
+          nvmem-cell-names = "rtc_offset";
+       };
       };
     };
diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
new file mode 100644
index 000000000000..607b610665a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC RTC
+
+description:
+  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
+  but most of the PMU functionality is abstracted out by the SMC.
+  An additional RTC offset stored inside NVMEM is required to compute
+  the current date/time.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+properties:
+  compatible:
+    const: apple,smc-rtc
+
+  nvmem-cells:
+    items:
+      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
+
+  nvmem-cell-names:
+    items:
+      - const: rtc_offset
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index b45db73e55df..745d85b66365 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2435,6 +2435,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.51.0


