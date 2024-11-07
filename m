Return-Path: <linux-input+bounces-7935-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C979BFCF0
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 04:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90E71C21BEE
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 03:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6232013C682;
	Thu,  7 Nov 2024 03:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kznDy4A8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2E128689;
	Thu,  7 Nov 2024 03:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730949812; cv=none; b=bQUQXr10+LRmxlKRO5H3GbdL5Di4TvssxY3scmB3U2udHCqb/phhcWRo0QJk7lVNO0V5ScI1F2J+cKCv2Mg1ffHQtAanyoVCZOdcYyoPAgOy6WgpnKL1IEY4+ab2p59lB8lPr3KNfXQBXVqqSSbPdEVnhk27wT2XMRfrsxz5+Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730949812; c=relaxed/simple;
	bh=9I9tvAbDrCRj6kFW3Ln53D2FSsYye54f5kA9wfXQly8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aqcq3/UD44uEmZB6P/8SUW8PFGaTE5jQcvAoXKRj3Z6kH5VuCfhMdAVFdjNNoCh5E546jNzLTDfVp7VmyNkbP1zJVYOjHl2MsIgAcJkSKYX8vR60ZnPnDly8sIXDreaVGWp3QMoYzPzOyCbVsYFVNZbNoTiYF4c7ZmdGE3ov1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kznDy4A8; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20cdbe608b3so5185595ad.1;
        Wed, 06 Nov 2024 19:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730949810; x=1731554610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mW6FFSBTEVZu0HRd5LnYlhO4N7G7lPxJ4XP+X7YSnjQ=;
        b=kznDy4A8C+6fd8I3i+nj+vKcnJRmOQMw7zPEWGWCrZQzX/Vl7EuvK8fIpe8W+frmWk
         gLpnaSW9swk/PIw37sPwuhjLcXYAzkp3hYkJQLPvIg7woLkv2/VOrVBaRzEH4KUivQqu
         wWj10is9hba31ZUavOI/kexeHmrNFjREU/5SHIsKZPyUXU5yoowJO0fBdc72i26afPjl
         c2QqgAQHbaRToZU+HuINBg2b7vwrTJR6EPwHnddH0WMoMFAnzvJSvFUP2MNx0MPqydz9
         d8rcdPyW3bD93w1/ckVBA7+zFKgIFIevY5YdQIU4PN156CTo2t5evTes0q1JgWkmarnG
         HGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730949810; x=1731554610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mW6FFSBTEVZu0HRd5LnYlhO4N7G7lPxJ4XP+X7YSnjQ=;
        b=ML8WkIYuHJTRxk6SQwPI0ervR9hnsyUcYFExrFCgYFyatUzFAeq1duCYL8Ea99PiHp
         8eh4DmN6ONeHiGCvkubj/Ps6N2pybs5fByFV1B/bmVvSruTfg2x44VUI+/76aQKqS6n/
         3oKWvW3/ucRHbdOAK/jmmz500/wYcBco4umdk1ss/bSprwtlOYa3f6EFM41WtUpzXehK
         /NJ2vAbv2VZ9kHKlaqCIyAcYzjKRi2VLK8xN+lWxygX34jEVlQXM3s0nuKW/C7/J9Hq7
         PIKRCGjaJstB8gZnqPAhHrXYgYPZH1cX/t0kg5D159EQPiY+O+qbFLOobJ9xKtpRnsxh
         4YgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIn54hjwhdMOjX3sAcJoNrGaUUoaKJ7GVALNrcK46yI+RRg27lYG8fHjZ0evmd6gUJ79jxP0CiFdvLOOI0@vger.kernel.org, AJvYcCWULRI8Q58dmrEcr2TgGGTEmKfSHLtTjWbhrGMX6U0PyfZkQzw9sc67VznOvM/EL1T1vMZrSMsA3UraMoA=@vger.kernel.org, AJvYcCXnpwvHUtjCmE2vAwMzM+kUSYrbnvaM/Wdi4j4vmBXAeSSM0vLCedYqTukGeM9Ne3lMkDkYWvZhS29V@vger.kernel.org
X-Gm-Message-State: AOJu0YxQImDIN0TsjaD69+8GX9zcIJEu+G9ADDuGQIVPS3rVkPUssFAx
	2mou7e34hlZheVl4BDSNDeBa52/domHizFaQeDTib2ZzdBXaY/Zt
X-Google-Smtp-Source: AGHT+IEcemfgbEWs6tmtNw848/UFNwJTUBFuFXhQfXgm7zPqrE9iXo+PVztggOrMR6fvdZKrQY95AA==
X-Received: by 2002:a17:902:fc46:b0:207:1708:734c with SMTP id d9443c01a7336-211785eb91emr6055885ad.11.1730949809793;
        Wed, 06 Nov 2024 19:23:29 -0800 (PST)
Received: from ux-UP-WHL01.. (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dde2f7sm2227485ad.77.2024.11.06.19.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:23:29 -0800 (PST)
From: Charles Wang <charles.goodix@gmail.com>
To: krzk@kernel.org,
	hbarnor@chromium.org,
	dianders@chromium.org,
	conor.dooley@microchip.com
Cc: dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v2] dt-bindings: input: Goodix SPI HID Touchscreen
Date: Thu,  7 Nov 2024 11:23:13 +0800
Message-ID: <20241107032313.64390-1-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
Changes in v2:
- Change compatible to 'goodix,gt7986u-spifw'.
- Remove 'goodix,hid-report-addr' property.
- Change additionalProperties to unevaluatedProperties.
- v1: https://lore.kernel.org/all/20241025114642.40793-2-charles.goodix@gmail.com/
---
 .../bindings/input/goodix,gt7986u.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
new file mode 100644
index 000000000..b7afa21fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Goodix GT7986U SPI HID Touchscreen
+
+maintainers:
+  - Charles Wang <charles.goodix@gmail.com>
+
+description: Supports the Goodix GT7986U touchscreen.
+  This touch controller reports data packaged according to the HID protocol
+  over the SPI bus, but it is incompatible with Microsoft's HID-over-SPI protocol.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    description:
+      Add the 'spifw' suffix to distinguish it from the general GT7986U I2C-HID
+      touchscreen, as it runs a substantially different firmware than GT7986U
+      I2C-HID touchscreens.
+    enum:
+      - goodix,gt7986u-spifw
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
+  spi-max-frequency: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
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
+        compatible = "goodix,gt7986u-spifw";
+        reg = <0>;
+        interrupt-parent = <&gpio>;
+        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+        spi-max-frequency = <10000000>;
+      };
+    };
+
+...
-- 
2.43.0


