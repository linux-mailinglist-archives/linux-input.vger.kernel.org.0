Return-Path: <linux-input+bounces-6731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE3986BD0
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 06:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DC931C22198
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 04:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822371714B4;
	Thu, 26 Sep 2024 04:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtoQmLn0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7116FF26;
	Thu, 26 Sep 2024 04:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727325783; cv=none; b=MVAFUC1NggvOREImBPKEKIoymeJuWwNISM1Nf41//iARcZYGcoC59x/DuLmjCiu/Io5lHuJUUfPFpgoUVaWogcmoDZLCSgX5pYpMcLWMvGL07u9nEl2+yhtfFuXAHJRTY5/EghihE5AER/qHlQkr/5ByUezdhRm9E90YY8SJlQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727325783; c=relaxed/simple;
	bh=pvyR97GWROMGSDup1dg7LPvjSw+ejcn6mDNV5sqMPHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAUZqx0bXs6M99x1NLzzCAoSnRsV+O+m/b69ctsigB3V1WFVIly6YBp7q4syFQ4p2tKGCmTI8iMqFjjA/jAgVZW16lBHaQ1D3Ob5DpP0e5DwvNvdV+4mo1QDrIH4mMgauEWPphLeBK4BkHs7SzyXv0S3RoSXzWnCSbTYvcL2ITg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtoQmLn0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7178df70f28so495546b3a.2;
        Wed, 25 Sep 2024 21:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727325781; x=1727930581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JW7NVeDKoToVXhIzMtIXfxWOsqG3HHW7/liw5BFTJas=;
        b=jtoQmLn0TYQBY4uJFlzUjCo38cpB4YaYrFIiD+cjVCBEuhRs+dwUPybJ2PIU/XzR9k
         rImOtn9vyCn2p5vkXGh2XpLsIi8X562jht2PWuk3zzvnaG71LJOMxRGYilqXeo2qrn1V
         ANoe6budqqqUwK2PNT4YjffBFKMfiC+ur95Jfbad9Hq4j7xuVQpeglv3r+mypl0nkfOH
         hntcbtDzTOxX7q4vefocqrnzl0iU3mGhmT03k4AaGt58RSKmDjWz9+cKu8GlveF+6hJB
         2MPIXeHRCi8vaKjUHqJTyUCFItLoufT0QFcMlWyu86H8HVOfNThl9ppz5Mhd76d6xoRN
         0Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727325781; x=1727930581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW7NVeDKoToVXhIzMtIXfxWOsqG3HHW7/liw5BFTJas=;
        b=l+pyb61atwCK6Wjn6HaYKOQ+IoYIy0oRZ3m14tqIHOjifmH/r2T7Cfj1JE++WHjwwn
         58LWkwloVFA3g6Qdfa8W986u9kyhChzzKoxqW/8rvvP/atMDRjMVn4w2sQHbbwZbCTe+
         R3yk4GfRT/RJHQEi0NIeZtMz2BY8KAc3niIENvMyGjxlHzWoGadRYBH5n+GVFnrJ6qeR
         7SVLcCCY8+inxHw88p9gWBuF+NtA0IQaX+BaFdnmf6DS0AJJ7TgExALOoLJ8rIfMfHy7
         Fz5kwFdRj7uOwG81H/3Ft24Q4MDnV9WHv5RtEpIlNIUg29QA6zza0KxnipPWI7SD6BbO
         5P/g==
X-Forwarded-Encrypted: i=1; AJvYcCVmZBzOr5+u2+4ps/DxH4ltA6VBZNTHouluDenE5IoX3KIfZYrifJTKQqkV5Res7oB9CGWDFavmX/F7@vger.kernel.org, AJvYcCVoqktUuxq8xtkJA8vamxR3MGXQlxauAolzP53z38YRhyxWrIJKDXGgCfNsQzA7400of5ypvc32mwCCeJIf@vger.kernel.org, AJvYcCXTQqcGWiS1GHAABiZpeCb+YJ9GTHwKBzIUFZrOwKciH+K1jEPP2BiU5fBs6J8Ib7wlSovvgGZex3R6wXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDeCUgfHZcxDCBsPs8JH71g0DEQGH7RidCrrpoO6qScGvuN8kN
	IXu/2aIyIPXC7BFJ0FF4YCOr+nVnlo2OSOPYpsX00kjaGtE/vbDb
X-Google-Smtp-Source: AGHT+IHyw1xwhKRM13Tc2gLZQfqxouRBAQYu6bSDuN5z51/DINcJVO9iJcCF4mKEmaenFXFM2gVpZA==
X-Received: by 2002:a05:6a20:65a4:b0:1d4:e49b:6c47 with SMTP id adf61e73a8af0-1d4e49b6cc7mr4131801637.27.1727325781143;
        Wed, 25 Sep 2024 21:43:01 -0700 (PDT)
Received: from ux-UP-WHL01.. ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc8347fesm3474279b3a.35.2024.09.25.21.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 21:43:00 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dianders@chromium.org,
	dan.carpenter@linaro.org,
	conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Date: Thu, 26 Sep 2024 12:42:17 +0800
Message-ID: <20240926044217.9285-3-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240926044217.9285-1-charles.goodix@gmail.com>
References: <20240926044217.9285-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Goodix GT7986U touch controller report touch data according to the
HID protocol through the SPI bus. However, it is incompatible with
Microsoft's HID-over-SPI protocol.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
new file mode 100644
index 000000000..849117639
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GOODIX GT7986U SPI HID Touchscreen
+
+maintainers:
+  - Charles Wang <charles.goodix@gmail.com>
+
+description: Supports the Goodix GT7986U touchscreen.
+  This touch controller reports data packaged according to the HID protocol,
+  but is incompatible with Microsoft's HID-over-SPI protocol.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - goodix,gt7986u-spi
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
+  goodix,hid-report-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The register address for retrieving HID report data.
+      This address is related to the device firmware and may
+      change after a firmware update.
+
+  spi-max-frequency: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - goodix,hid-report-addr
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@0 {
+        compatible = "goodix,gt7986u-spi";
+        reg = <0>;
+        interrupt-parent = <&gpio>;
+        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+        spi-max-frequency = <10000000>;
+        goodix,hid-report-addr = <0x22c8c>;
+      };
+    };
+
+...
-- 
2.43.0


