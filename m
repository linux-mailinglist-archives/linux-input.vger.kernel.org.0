Return-Path: <linux-input+bounces-14676-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 955E1B55FE1
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 11:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C201C8565C
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 09:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D3F2EA74B;
	Sat, 13 Sep 2025 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="h+E2Y/D3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ECC2E8E0F
	for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757755636; cv=none; b=n8SKmT6vt9jo0ZVSEOpgrsjxMy+2Wdlt18QxkeRvfDJER5DzV7/nH0/c7aeabMRERX7dJi3HbUs0qy9VbRDXp7tl2OygE6aFykGYr+5qgHdzc00pINStA4XwQFgc+6acj4jf4gZJQ5NMRISkoPZNMVM45FFtKEZakOtvseucjtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757755636; c=relaxed/simple;
	bh=SI3lDQsYd8CRACImpGfulLofBUBh/AVtpawU6yv+3+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvbQUNmDha/doZliNP5yH2zT8/JASk5h0ILAzuG1WWQvJkVz9eDuc1/Tw5MDRRFkIQa0s20lXyMKkD6zFOt99888t5Tgbw8w3ptF7DEc/+8KJnVZFnksz6z9kBv1Dr5nSLLKLNd0KqAbD+DLeTbZha1OCgoDdHt36nw7i6p9oxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=h+E2Y/D3; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b07dac96d1eso131452966b.1
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 02:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757755633; x=1758360433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llSqr6SrvAH3wy9n6q0vaWwWuQff59HrQWE9Ffc1WMQ=;
        b=h+E2Y/D3jUv7HP1IEMN3DagljMvpNyd9MvYGaqnH7O6iVbTjUoQ5P8V44niaOP7/Mg
         uSg3X9zI9+vdMxsJ32ooHvZqm3dX4f6DKz9rtxjsoatCDdOccdsWfA0tX2TxxpvlBNk4
         qPF+q0jVJmg9w9uP6pFOirHKIl5W6C4fXkpj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757755633; x=1758360433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llSqr6SrvAH3wy9n6q0vaWwWuQff59HrQWE9Ffc1WMQ=;
        b=GXIw+vJd2rRBb2/V6FxtyR4zQ1tImqbblqSeC28kiiOYJoSV19tY4kcLTLWl+BNvjj
         YHWNNcZAD0o28AYfbrzJxL+fPhrP8qZy5AZ1ak/AMzOSHEkrc/Kl6NjRAhgywzS0RzqS
         bF1LG13cnbSRkvmtegfrkjbDY3geAJsBxS2vMMiTs3JuGe8IkdS1JQdRxKT/GA6aSGZ1
         wBOykbZJpyODSbzmvUwGKGHALMN90G4dJdTHKw4H04B6RVhawBryPdqBVyIPJDrwUKZp
         mgXMdeSyfrpIuKUt1xoUmM4bnWydHPSWIrW5lggsBELovLj7Ltm7JTrTmigK4tKLOHCC
         f2ng==
X-Forwarded-Encrypted: i=1; AJvYcCUClySaN4aTMuF3P2BwRtXQABkJdrexr8eqBJQJBe5spOv2ndhT2xoUAI9HM2+yA5mikxoxLr60pNZOqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGxtirBvwMKskRpT8vfZL65eNjQTmpoJ8/b/PmOiVuzTa7p7gu
	hok6EpRI8iOaISJAiF8ac3dTA6tLY46HU7arbmaRJduyMSMVdpLwz/LjVtLCjJTzr14=
X-Gm-Gg: ASbGncsF3Q3Vz0GGdlCkYHXifNyXAhmGwueIMo+TNnoaPNgtpoQEKbrItlqEV+B9+4k
	vcu70T3ThYTm6C1A5l2q/5B7ubLHivGRqb3NCF+U0xcsnwijPlljU+yElKldDZKNgNHSi3m2iOI
	zUehLFW1Fw7z40W61bjQxGS6x2HN2Tlvf45oUws+MVjFuwDZa7SBpv5m76OJUoQ/ro5fvH5ZaVg
	bjRZt79i6GK3FuYV+xsau8BxTNNfitXwdoiPiwDi2vuClYGRT6TNtTMVxhB0xWe1o7dFNxhlD8J
	/XNMM0NiM/FOSiBQ5rFC5b8srAYQEO7ViIMUUUob93GM6HX3jTgEL1ogRxBM/7++U6fHl2/Cx/E
	zVCRg2/Hda0bVJJwaaNM5POX6b6kMpGv6pjc2jK+CEjyTZsKBkSlHyB7M/Zwdqp0v7XllxiNQyQ
	UrgT8udks67IiJ73hMDiVuSqDU86kTITHwkZReYX4XDkNadvxPNeLuLWnMDl+4jRyZ
X-Google-Smtp-Source: AGHT+IHcZdrPl3YiT8w37AtF2eLwy3H1lf7B4vokF4mlZ6H6fOjpLCxDlkfMTGZH+eFNfBTCbsCKyw==
X-Received: by 2002:a17:907:74e:b0:b04:6546:3475 with SMTP id a640c23a62f3a-b07c22b2136mr684830166b.6.1757755633084;
        Sat, 13 Sep 2025 02:27:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b33478besm551705766b.99.2025.09.13.02.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 02:27:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v2 3/5] dt-bindings: touchscreen: convert raspberrypi,firmware-ts bindings to json schema
Date: Sat, 13 Sep 2025 11:26:53 +0200
Message-ID: <20250913092707.1005616-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
References: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Raspberry Pi firmware 7" touchscreen controller device tree
binding to json-schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Added in v2

 .../touchscreen/raspberrypi,firmware-ts.txt   | 26 -----------
 .../touchscreen/raspberrypi,firmware-ts.yaml  | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
deleted file mode 100644
index 2a1af240ccc3..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Raspberry Pi firmware based 7" touchscreen
-=====================================
-
-Required properties:
- - compatible: "raspberrypi,firmware-ts"
-
-Optional properties:
- - firmware: Reference to RPi's firmware device node
- - touchscreen-size-x: See touchscreen.txt
- - touchscreen-size-y: See touchscreen.txt
- - touchscreen-inverted-x: See touchscreen.txt
- - touchscreen-inverted-y: See touchscreen.txt
- - touchscreen-swapped-x-y: See touchscreen.txt
-
-Example:
-
-firmware: firmware-rpi {
-	compatible = "raspberrypi,bcm2835-firmware";
-	mboxes = <&mailbox>;
-
-	ts: touchscreen {
-		compatible = "raspberrypi,firmware-ts";
-		touchscreen-size-x = <800>;
-		touchscreen-size-y = <480>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
new file mode 100644
index 000000000000..8faa796fb7dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/raspberrypi,firmware-ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi firmware based 7" touchscreen
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - raspberrypi,firmware-ts
+
+  firmware:
+    description: Phandle to RPi's firmware device node.
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    firmware: firmware-rpi {
+        compatible = "raspberrypi,bcm2835-firmware";
+        mboxes = <&mailbox>;
+
+        ts: touchscreen {
+            compatible = "raspberrypi,firmware-ts";
+            touchscreen-size-x = <800>;
+            touchscreen-size-y = <480>;
+        };
+    };
-- 
2.43.0

base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
branch: drop-touchscreen.txt

