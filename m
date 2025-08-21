Return-Path: <linux-input+bounces-14219-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08703B2EBC8
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 05:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CF7DA23B7E
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 03:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3F22D97A0;
	Thu, 21 Aug 2025 03:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="amfP20CX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA728934F
	for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 03:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755746129; cv=none; b=fNUoqtLI/XiVqepyX7CHgc2j2IIznfOpazaD2ot/gGlKIOzDTljl1tuIGrvFm+DEk9jzkJjpndbP4m4PApNpVaMO9Z1t8WyQ7MPNGXIao9S3n2LSLW/fXPGr3eXE017DwkfD7ugT3GosNYPfdxaSZJ4U7Lsp3bW7uxFPD4dfm1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755746129; c=relaxed/simple;
	bh=xK/uY5dPDT/WYt2ovB3Su03oSdypjzmDFfJL7Y6Aluo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ejyns+5M+JpOGOxOG4ByWA2nwNdxwtC9t1gXZEH5w3ep6p+1VO914541DOEFbla4tuVhZuSLYAHtNXeNp4Dk/AJ2gfi9Yglc9z0orDOacJOFXTQNHar1hCetmesPqCv3orSYEplDl/u/pOKCt8lFzHtAkYQLV5uGOAJK2IvzBmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=amfP20CX; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b47174c3b3fso276240a12.2
        for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 20:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1755746127; x=1756350927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtqV3HNShNm2ULsU/XG89WUNwV7hWFWih/MmNNnjuJk=;
        b=amfP20CX9yzLrJsRK0B+oGG7RJOUgxJ4KbTwjq3i1U/V4Qh3CmHkE1E04hvCglp4lQ
         0kqM4aA2PFDz10bt+HBm+nTtc9zYhrCf/QWCK3DLHdqtP6CU38MDRvGEjdrYNDC3Md1s
         0cC282Y4lBPsuO5KaMvmfwGBWkw7vA8tJax7fYVpL1jK/RY03K5zfkDWBg4onXurSf7A
         GJ+Rpq7395O8fooXsYGf0S6Jp4VcamZDK33GZRbh51B8hSTWBxgUV8vJFO6Hm0O0udLn
         uSbwisP69hCNU8x1VQWfToV9qhHgfAwfbGwPQrHYxRs8GJh3Qg6EAnPtHISHLPaMzXfj
         OQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755746127; x=1756350927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtqV3HNShNm2ULsU/XG89WUNwV7hWFWih/MmNNnjuJk=;
        b=KcU0+3MU8EWXFjMldJd+6u7GfTiPtHTPbNO6XAz73Ja44hTHC0vXKInmOC91lxxgi9
         r85e3A2pkrfKq/nMisrJn7GHJr68lH1ykgQwEXKPtOt3Xj2mz97NaFs5q+gAbchPKAoF
         GUgAQmD6IUEiBnkSXZEVz4vYKydLbSjiSOdlCs6yXBwuNSKeBZZEdx1xcUeRnIfwv/yc
         eZmAXewFnRPAQTiJlGeXejkOrW7KUvFgnxKE8y+jRPoIijO1i7f6Jb5S/7hxa+5vUjMv
         H+uGeVy5LC3EgBusLReBGw6Nj52LwaFG3qKoz5wegJwnVXzrY23HAe21eCfMvzS4Huk2
         B+YA==
X-Forwarded-Encrypted: i=1; AJvYcCWRIVe2VhWcgBuaNKqj69p5boTmjXOe23zf3Mu/3Z7cbwZw6bnYxJRx/lTd8vXo9VAXV5uLfuofzzW8HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOG81kNmXQ02FnhaGfvlndZYN0A826NU+PIdPHjYUeDWGYA800
	Q3yOccCKnRWRJreWMa+YgC5kAzae1d1+tpkHbtg8S/ZmuB9tqM9z3qP0/n8Cst2zbWU=
X-Gm-Gg: ASbGncvNvYPLGC/jOFnKqlypgYZtTNmIXd0uRUU3ko7bI9/mnaEwQ5bYzgf2mh6+ZMV
	L3mQrIm+lzvsODKnPA00/kMphcbx0R+0PbDQ8rU7FYPveLapmOkjRUeTzGSmoy2xtXK44i75ak1
	G/l8wqFLZVvBs4Llf8RakIY9xU3LPoRp4HDbYzyMGWcy5ofnSDs0x2JDQoTY7Xy5sQq82K/4ZaQ
	OYj/OGD9iTemqeyvKUH1QPzuS3ig2T+ubMkdHKk46LGRMVKgtV7X8SZHeP0k0lyqEvsO+HGI6mv
	Ahqw7x/JybYhLjYtSL6pQF8VutBREE3iW5J6FNsyuJ0a+6f+fJ3hLkLSFRj4n/aHqVkU/8UVsrK
	cA8xUKqHFKKhRsvtqSrslfxmDrrsMEAxWv8eeIJUyp8g81BPpCKl7XQ+ZvQjpItUTV7ob2Q==
X-Google-Smtp-Source: AGHT+IF+UOh47xwCxLPPcHRa7zc66TOfiikkAYATLHWVDpLtA6g22wxOpRgfhU+bncrwFyy4s4nCTQ==
X-Received: by 2002:a17:903:124c:b0:224:10a2:cae7 with SMTP id d9443c01a7336-245fedcad87mr13708355ad.40.1755746126670;
        Wed, 20 Aug 2025 20:15:26 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3d3sm40285415ad.147.2025.08.20.20.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:15:26 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: input: Add Parade TC3408 touchscreen controller
Date: Thu, 21 Aug 2025 11:15:13 +0800
Message-Id: <20250821031514.49497-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821031514.49497-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250821031514.49497-1-yelangyan@huaqin.corp-partner.google.com>
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


