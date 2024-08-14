Return-Path: <linux-input+bounces-5567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AE39512AC
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 04:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0471C20B09
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 02:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7668A381BE;
	Wed, 14 Aug 2024 02:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdlfaGpT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E847635894;
	Wed, 14 Aug 2024 02:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723603548; cv=none; b=UtKyl72ow3FEBrkzj+1SdFk0C3Onn9qDnFxtgQrAimgBOgxn9M5FFVwPmRH4SCK2to8I7e694qeHN2RVkGmrg5w9AYk6t04am6hfmAt/uZqDsTdj6F5dsBO8KswnJesAmPR48KCh60fm8SRblaLDsklOrdkpgpE++OktDaeC0lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723603548; c=relaxed/simple;
	bh=jdY16bMTT7d7t6BdJP4W99f/wkdG9llu6sz8a1ALBkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqXEAz8dTHT30uH0sNA4kjCLFA/1GM2WLlLnQDBx3vjlLyarNU3kfamu3Iwx0zeKCkH0xCAtwu2k6UV6YizIGQawU4tG7BsDelnpwyDeIOpGdhJB2/iSHux9XAC/eAJqHtfGs3ScwK+tGLg6AAU8Y43LC3nm/jS7R9gWa3ECC5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdlfaGpT; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2689f74963bso2818421fac.0;
        Tue, 13 Aug 2024 19:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723603546; x=1724208346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ/yDY3087EGlmID4jcrNqs+B8biqRYxpHquclJRclM=;
        b=UdlfaGpTf95jSqkPi5VUGJo7hiaNw/bw24Uvs0ZFzr06SeIBt1ysJi4INSdukX6sDU
         M2gy4dsCr5UIcDCJjikcxnc4wmhEoLuodOQriVRe1g9LQF1Av8YEwwRuVNqGTQ8DuJio
         21w+oB9maKDQikKGOhn8sbLFcYzY6US/z561N7EvKkfk4fqNIbraQ/JkCSwu8XuTRBlW
         8/v0LGZxgYXX40D24h7OUeJRy0kPr7gMLA07ZqunzVmi1UXKAHJwDTaksOFHA5aLRfaR
         luH5ff9LTOpjN54JMLBHphMoPxDRaH0sFC8zqj/X74q0F+igQhfnjAWIl1X4HlIC71WG
         L9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723603546; x=1724208346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZ/yDY3087EGlmID4jcrNqs+B8biqRYxpHquclJRclM=;
        b=E5fEeKTFN7jmgHCgaxq+4nLdAZLDbzNXXevkG9YPn+BcOg+XyyZuL4C+ePjT5i3pmd
         G/oH5/d730St9hCJ+ll8oSf4McaGvrs05QHEQyEse6/NImJX161mHNuSqar3Y4vzDmIK
         p6WS0I5ZMsHUbDQmrNQnSViyhj21k3235bBgWzNdtGvLdKupZ/CgkYyuvjpvzgMDgJ/8
         1RagU1XvD+2yZr3WHy4eDrt4VWWlsowE8PhFeEfI2mSNra1SklevHiiTRG+xwyzIMdkQ
         +6are5KXxuqyvxscdFEWyh/LfjmYCEEUCgm1mFRceLV+m36BMZKIkCsym1Jv651uuhb8
         3WUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWwk1ZPRgZP1L1WLPCtWIlWENg5A2Q1VHMJW4i4VSeYAKRJQDaIL+tpwHdqkNpJCpNNk0hRRiwdZq3QdsFHjLUS2lpV45phEzRqIbAvkP3f5JUMhC42GpvDQSSLzDTKRSIffc8BIG01PIWkmNxl2xzRVQ8qdwEc58c9XvrrNrWUrzj4ZuC
X-Gm-Message-State: AOJu0Yzv2cBd0KXAHmC4cpMec9E3Zu2YvB/RIZ6kjfZ1bucv4qu6uwxc
	1uN9BC+HK6owrV7EjYulPz5O0WjKUzvN1IN0pJW4wdTaL0XNyCQt
X-Google-Smtp-Source: AGHT+IFvQL2auP9BSnM1SQRN5nUqxhJXh5SHuxZfvw+iF7K966Ab7Dcril3HWiEcS6tVv+QoP6TZPA==
X-Received: by 2002:a05:6871:2897:b0:25e:d62:f297 with SMTP id 586e51a60fabf-26fe5c655c7mr1676407fac.45.1723603545920;
        Tue, 13 Aug 2024 19:45:45 -0700 (PDT)
Received: from ux-UP-WHL01.. (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5aa38a2sm6353329b3a.183.2024.08.13.19.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 19:45:44 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dianders@chromium.org,
	dan.carpenter@linaro.org,
	conor@kernel.org,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Date: Wed, 14 Aug 2024 10:45:13 +0800
Message-ID: <20240814024513.164199-3-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814024513.164199-1-charles.goodix@gmail.com>
References: <20240814024513.164199-1-charles.goodix@gmail.com>
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
index 000000000..a7d42a5d6
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
+      - goodix,gt7986u
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
+        compatible = "goodix,gt7986u";
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


