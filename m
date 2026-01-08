Return-Path: <linux-input+bounces-16862-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B261FD013FE
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 07:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D692301EFC8
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 06:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34A533A71E;
	Thu,  8 Jan 2026 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vJql1NFG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A8233A718
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854136; cv=none; b=i1K2D5DZf8HFU1c0B6RcqjXNxFfK8Cn7eSSNACoiAmxirbrvT7xwAJdRRsezwUTkmaP0KKlsbUuPFOEw7Oo8YuMlV9xFoCWOl8a4GfWjCJYk06dyovJUk/QIMSSkmvyFbMBCiWCfB/tab+38RxqZNv/zlWue6KF7g3WYsTuiaAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854136; c=relaxed/simple;
	bh=xK/uY5dPDT/WYt2ovB3Su03oSdypjzmDFfJL7Y6Aluo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pM7vma8eqH4DED6vSB68kKN5PCIssZn8WVi1T1Q+vlgrqDz0Yn9y4kghABaLQEdB/vEQcT5BYrrcCnIUqRUeJ/kSMnhHuRp+N766f+8eiPaI7i+qxtF6mnpjozzWjcWGQpg4tZLa6wU2qrRgVVoLQU/47ddaHZnc20yhhy8nYm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=vJql1NFG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso861899a91.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 22:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1767854134; x=1768458934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtqV3HNShNm2ULsU/XG89WUNwV7hWFWih/MmNNnjuJk=;
        b=vJql1NFGW2cHz5FuGysqEkQ5LRRjDtEc4YFUAxVt7Wdubhx7ulxD1PELPwUYgLlpxG
         znIbs6LASozSpt+uy+1RhsjgqlukhL4PVdJcrvu2QpDbIqFsftnMwUPjFdarKS0FiJOr
         iGgUYCUWnlCAPmrc00/4S3TFIa24oTn9BR4gjiXgEmzSKzR3u6dtFBov6LgoBEM32c/n
         vhfgKTwC5oR4C6KOL/XkNOZhV6OTtFr0IrZhKOiN/6dSL1ArDWGUnFKI0B2obSYqeiCz
         zM5gdHFLDxrXQwoT5T4RUE6jbUBHKtdR2mpiwRE1938E6mBePQT9IS/MQ+mXX4gvN4h2
         r2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854134; x=1768458934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CtqV3HNShNm2ULsU/XG89WUNwV7hWFWih/MmNNnjuJk=;
        b=FfbmSb7inOsX8R9zfxuqjp7o4FfltMfXPgMKS3Bx8YLU22k888dKZBqSx/qeDWDUEx
         xFfMmxKD87M3zHrtb/BUiZTpvd45NV/8yFVAcYZkC4ids5YQwxPVnR7oVgYomDJu/UAt
         xq1cp0vFMtExoYOPvTVhnvuuUlwYsl6y4RTHMnkiOjWAA7fnyAiIlP6QPySlKaiqrYvs
         I0vdT2iOUCjCWEd5I4/fl+4VxZOwj9Od+ZHh2Z9bAVlmtIduGWrVzLVh+770zakmsVdb
         qXYb+by5xmlZpJNjlFYWABP29KwNDjDVL9Vz38ch9pQXpa0kxe4TAd+rABgdarqyyhW5
         I42g==
X-Forwarded-Encrypted: i=1; AJvYcCXX/08frfBIHu6jfPWpRT5RTWLelLI2sIDMiXywfvYGvJZu7wj55YFk6aO6YvJdwkTzM1/msLDaqoUDpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04B2EYLTEv5XMOgUVnF+a2DVQmnkqvFqIsPCnpKUXR/D1APKJ
	6M4s0uigej9aELtw992WsG9b72oMmET1cE+NTNml8YiQDGI1RyHmcUn5K8tplLsGI0Q=
X-Gm-Gg: AY/fxX7Hr0Od27t42LsefdBtAT3qwoxl6l6Te4Tm736jnxS3bw5Ny/qxHeyOBlWBeeA
	WqgBVtS3I8FqIyzg4e7CBkfJupvl30zGjEGBY2LjN9/Da5OVcnhhw8peeBNXIoKi59xEM/uzD4e
	vFxUCKZkYy7pZG7w0AVxaawIgLTpVUMuQWuyVC0n0RuXEhEUV2gDar09geqPQo+zQ8w4QB5Acvc
	D6phM4l0BGrYLn0gw+IwMDBA3YtoChXPe7kMv1edN9X5HPfXA+79sxJ1h7WUA3yrO0QOVhcBQhF
	C71V0+xU7HjiS3Yc8/xOneJsv/zPvv02ZN2sod1U5AGx7SsnjYwobXrjhA7aJptEXW5QxQLG79Q
	aG3xxmy+nkGNORTfWmsl+GeNhAlXbnINmTw+yFCECcfLuFFsE/GWryx7UVPNm1sXoqWjFKUZvwK
	UyP+toFTYUGfOVJ9TuZl/rgHf41evmlgmGTGSDCJVXKbHJcc9msA7BbxTbew==
X-Google-Smtp-Source: AGHT+IFKkxZzWLvjb3+PwNvGG7Bu25u9blNXCqhqGleG3FQQv9LAZ8QqgnZWMrwfabvbKHHbNyoWDA==
X-Received: by 2002:a17:90b:568c:b0:34c:9cec:3898 with SMTP id 98e67ed59e1d1-34f5f928c3dmr7834991a91.13.1767854133622;
        Wed, 07 Jan 2026 22:35:33 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa93ee7sm6712750a91.7.2026.01.07.22.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 22:35:33 -0800 (PST)
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
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V3 RESEND 1/2] dt-bindings: input: Add Parade TC3408 touchscreen controller
Date: Thu,  8 Jan 2026 14:35:23 +0800
Message-Id: <20260108063524.742464-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108063524.742464-1-yelangyan@huaqin.corp-partner.google.com>
References: <20260108063524.742464-1-yelangyan@huaqin.corp-partner.google.com>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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


