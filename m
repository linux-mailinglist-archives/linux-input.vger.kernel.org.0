Return-Path: <linux-input+bounces-15982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C988FC4ADB4
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 02:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D0FE1890494
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 01:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD642BE7B8;
	Tue, 11 Nov 2025 01:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="XanAVJYj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B2722301
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762824908; cv=none; b=eFDxIQmU4HSxh26EJlrovj0dYBMgICPrN8/Z+/HtKWkmBRn38eXTxOSeEiYrK4mE1WrVL4UyJE1+8+YXSdedYM5vAq44cAwkxqHcBBSVPKebDQVNU2shPTPqfnEpViX6JHUe6Cz2EvRGZ0Onc3OZgWkVtgxUW6z1QjIhMQXl5ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762824908; c=relaxed/simple;
	bh=EEpirpK/l6Pxsdp58Zy1SYZgMnffAi4qGVL80OHpxDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H0zqIckmJ9dN/5u3TfgV/cJIGvqpa2zVSJbhIkhs9LF4t7rm4017UUK3KNhc2Mu9n579Y4C6omYE4VYS6fNp1o0mgOZcSnWPPddZg6fmlDvgi68vbJppUVqwu31dP1AZSkJZEZt+1DWYILFIorrEmMyq9DyWt17e5e/Q8IcxANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=XanAVJYj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2956d816c10so39337365ad.1
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 17:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1762824906; x=1763429706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCRUjyzQWysqM14npqbWdyxPUdu80BrwtIvFA0r4EOU=;
        b=XanAVJYjW0gAdoRqJZEl7JyLoJ8O3xWmeDoZUS3vFWqAKbw5kBxjSelvaVWpCMozLR
         H6nZeGIb4Tl/EIBvn/uyvTjCqKcwStzarji+NRokwfcJKMEcjV/Fggbrf6TLsjMNerFE
         oPy/UoO3wfYQpw2JpagfJRqod9btzNR3C9UZ8rUVRk8/wo8ri4v3IcyOZew5EgPL+Lxj
         4Q9Bbpq2chFF/hhBy1b9480EUGYrgzFb7fKHBTtHXlN9+umLtnXZ46oWagvC/FhBOO82
         CUwoPAzpHR7xOJgXjrZ79RU+nyXivNRTFNz1tALpDBvWhC+QA5bv1PQVxhoUDSuYk3U5
         XjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762824906; x=1763429706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCRUjyzQWysqM14npqbWdyxPUdu80BrwtIvFA0r4EOU=;
        b=cmkUvGcJq9Xid1GowMl9rGVpbbNRwgTawwdBrPryBcRz0r3D2h27nGFBSK66zdBRdQ
         Z+5lVMIQ2OMk4+kkvNrzvTx8XxqUYI/hrmLr2hiDrelLxaPGZ+tgmhAFF0wxkwB+f8qD
         HWKtXE3CZW4ymqJ6Wq7/TtbKC2KbYVScjShj1SAoAKpaK+ENromT40Z/r6420QAGhqFm
         9ikqS1dnkZwAS7loKSHIhiqJSS38G1z4PU+8X+39MGuKsp3JlEX7sQv1mMbwUWca4Fb6
         RP/5+ipNXQQou4UM1muqBmXfsek+Cb7cRhnKzPwa4A7p6CWiY0t6yKB67aqSnThklcti
         48bg==
X-Forwarded-Encrypted: i=1; AJvYcCV1CdVBYMboTojfnd8MHVsylhUnnyjUbGBfUsonaYqPvECOqVVoTLThnaUzjd/VUawkUkZoKpw2K+p4Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGpTtjLPxjI5NqLz/QOLAExH8w4f8bKyAy9xPwZVeUMMudHdh
	QmOjfMje0a7mm6o7u8H02TgRWeWc08E7FeeDpBuTXn0kONEHY1P0DwD8pmIw/Er0ng==
X-Gm-Gg: ASbGncvbO+/G1x1ieAb3Q3/ApRTK0N9AhMyxwyG6Gz0K1IfDTbDg6PaeWJ5XNvxZvrR
	VfF5p9pzMp94ajSs6r106+Cyv3Y4Itq+VRhwmG/ms5Am0+RtTMqwVQtJhdbae/Om9jNyChfY1Wk
	JeShTSC/6ySnUVqKefbaITSJphsHB0Xlwxund36BSFQmNbLJfnWVKCiYY3AOstudY4/C7GBRI+n
	JI0iNgSpZgxCUPVw79pNsFtqOyxqMeiQGy71T0eHBiMx4hzrXB1MkXFGkiHxurUWzGWYLFOw/CL
	hCtevEV0m4QrI/h0sAxMGVl4Nuq8KRw17YEPsM5LTgnXv+P9AKyoUV7oDg67IO4oJY7nIhHqF/j
	6y8to2DxN800OefwqnRWNT53NkoNgaQoUEP8PpO6xcd0IGPlVVA3opYrfeNJLtiiWEe8lPEF2Gu
	tpO4PXJ4XxmNfiVUZsKN0HKAc7slZr2+8Ny4qM4r2htUc82q4TGpYnQospnkou9yjy418AAORwO
	VHhgYZdlWY5Nm1iSKiAEPIy0AwQw4bh2gIynVURHP6QOHyn5+IL7rn4K2pF/o6ORTX6EA==
X-Google-Smtp-Source: AGHT+IGRoXVLZ7agvfhSDaP/AeheoEMsIJIdYyiaZZNnoHcNgq2mN8gZOGSrD/OnhlDdhDdOfevBZQ==
X-Received: by 2002:a17:902:ec82:b0:295:4d62:61a9 with SMTP id d9443c01a7336-297e56aef0fmr135124385ad.38.1762824905979;
        Mon, 10 Nov 2025 17:35:05 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-0959-d540-843d-31d2.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:959:d540:843d:31d2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c740b5sm163666485ad.70.2025.11.10.17.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 17:35:05 -0800 (PST)
From: daniel_peng@pegatron.corp-partner.google.com
X-Google-Original-From: Daniel_Peng@pegatron.corp-partner.google.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: HID: i2c-hid: elan: Introduce FocalTech FT8112
Date: Tue, 11 Nov 2025 09:34:57 +0800
Message-Id: <20251111093426.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>

The FocalTech FT8112 touch screen chip same as Ilitek ili2901 controller
has a reset gpio. The difference is that they have different
post_gpio_reset_on_delay_ms.
FocalTech FT8112 also uses 3.3V power supply.

Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
---

 .../bindings/input/focaltech,ft8112.yaml      | 66 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/focaltech,ft8112.yaml

diff --git a/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
new file mode 100644
index 000000000000..391825b24fcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/focaltech,ft8112.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FocalTech FT8112 touchscreen controller
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+description:
+  Supports the FocalTech FT8112 touchscreen controller.
+  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - focaltech,ft8112
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  panel: true
+
+  reset-gpios:
+    maxItems: 1
+
+  vcc33-supply: true
+
+  vccio-supply: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vcc33-supply
+
+additionalProperties: false
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
+      touchscreen@38 {
+        compatible = "focaltech,ft8112";
+        reg = <0x38>;
+
+        interrupt-parent = <&pio>;
+        interrupts = <15 IRQ_TYPE_LEVEL_LOW>>;
+
+        reset-gpios = <&pio 126 GPIO_ACTIVE_LOW>;
+        vcc33-supply = <&pp3300_tchscr_x>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..69f54515fe98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12326,6 +12326,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
 F:	Documentation/devicetree/bindings/input/
 F:	Documentation/devicetree/bindings/serio/
 F:	Documentation/input/
+F:	drivers/hid/
 F:	drivers/input/
 F:	include/dt-bindings/input/
 F:	include/linux/gameport.h
-- 
2.34.1


