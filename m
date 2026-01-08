Return-Path: <linux-input+bounces-16869-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 744C4D02E4E
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 14:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29EF03050CDC
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 13:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DF237F11C;
	Thu,  8 Jan 2026 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLPtW9fi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C218347FD7
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866583; cv=none; b=YOiAyA+2tSwe9cFF91zDDEk3H7zs9JcCbFqT5CdxBIkYGBPdswaBIsiK25WgJGX/nKd9ukbfO7YaD99qqrXkewxOjWInDhMjcqA5JLMI8jK7V2IUyxXTbxrPCx9fq2IRDuElsTURB5pvzrzFYO+Tw8fapJppmtcZkrr4SsiQu58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866583; c=relaxed/simple;
	bh=1t0rpAxQeLHUoXH9EqV6OjuM5gq46cEpA0JagdgwR9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnkvuafMNH9jeRAb+Ei4Vydgh7F+lbzIueNJWiH1QZhSwOytrF0kB38VE3yWugh3MHytDFBrXAw76V8C/bxSTcRk0nhyShwzgwAsPahvSz/vee8dqcJavxufgEeiUAgr1nFNmjX6vyXvKti6EwksDGlepOGIHzs3KPndA7bZjO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLPtW9fi; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8bb6a27d407so272448085a.0
        for <linux-input@vger.kernel.org>; Thu, 08 Jan 2026 02:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866578; x=1768471378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNDmxXp+I2DQQMGpjKHJPmnR6bZXLNX2CabD4SmBa4E=;
        b=iLPtW9fiq12xeKH/UPBX39ctKI2CebAq9BWxVMj/2RpMiK0hNI3+zRzgRXeMM3gPuB
         OX9q20aDPlUJGvQlirWiZJyLZMGbMRO3uijt1MRikXctdLtgHAaF226DuRjR+Uri2Bgl
         J6kSaJmUwcXIOHmJLFsbT60QAy1BCp4PxtHagfVSbIqsCPSjKJJg7HdBK8xfIDuAPCRe
         YjybjkfmoHDyGgpYKgG+kjPbn9RYymnz8R/r7UgnL/zN0NlXur9W+fWTVu+/WczjrgoT
         IC73xdZbnvXeVVrrV+792vT5uz+elHfLBLb5V40B0FsKbA1Pzam6e8aVjNUIeGbt9IMq
         XX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866578; x=1768471378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNDmxXp+I2DQQMGpjKHJPmnR6bZXLNX2CabD4SmBa4E=;
        b=pJme1I9ED0lz8nklQTHqss1R73iqo3YBDgsOxV8YiMWLxJDB6CcZyJqE1N68+eJWTN
         Rvyge9KTQSmloJ/P1OObiJkSM+NuYURa+O8DLwV1vGWoQJfnATgn1cnrPoE5m0xkU3gX
         TqcKgcgQ4QxriBNq0G9m++KaudgFL2ZLA0UHzSfFk26ImEla9xGMcFbPcnFimt1i6hfr
         5Ay6KQm84MWkQYykkxw6DrBiwySs2Uo3m1QQ6f/LSOPBR0CX8Zd+WRuznGsvTA7oDF3P
         Pt2Ma92JgbHIg+gglHrVl6dsihlaIOxq7chUToDmtqXI6sBmdlcMjiH3tW1kMTOvnkvW
         pWtw==
X-Forwarded-Encrypted: i=1; AJvYcCVAhlHHnwBvYFjkkUl4f40DenmoE8OnvuwwyQhySdmCwU+wO81WwbHrXpc3wxXF9qLPXJMmS1AM8r1zhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC63QFZ+bzs2TdwMh8c4/114bHZ6UtxQ9Q89/9rAfVjNXOV/zj
	3IDmgvQz4kIREOUP+BPSP/OG0RyyA/y+ajmTqzbIw6DhbW/I28L1oWaWyU7fcA==
X-Gm-Gg: AY/fxX5oqJVC9OZBBR67i4Dccpd+u5WCYTqJZka04vr9hDSFHPrLjnIc4a2jod8ivjV
	N5yDUiMjUtN+L7DCRnHdIKc1uXKRo+M7k7jJOwWxhnOsBkPFFxXwTdbUUdAMbMWAHb9Rz92r64a
	iUPtl402stzYtXLKIuriZAqf4bWynRXMqN2DENbLzeMiyupkGO1UBg47bFsxG/DHJUcJA9UIYI1
	cCZEoTAds7VgSc6OzLV82qERrpbGbrG8GPjGz4iUmXb9fHrehL4enSinLfBbCiL45MGgqKgnrf5
	Mqq78t145FCNl73AYbMBm6XlgGR82cKayzaIziW31u999eYD4rb8Rh5ZE1AwFvHF/oVXplNbWVa
	XrPeUiPT1FEEtyRoMETIwjQbXUYbQ8S8JbGHrK1fiQjKCMBYX8/ft6sUsgJo2PzebnQvv7n7C7h
	i3OzdtyjIUu9VbA+0r5bUf5rw6qOpsHHTBiQpmCyOgwIqYjXjb87ubU2DjaenQAx1WOmuRAUVTW
	rdM2ZA0dVqDpHmXoVN76w==
X-Google-Smtp-Source: AGHT+IEtkI6q/xm4mTDrq1zwIoRGWeEmLimQWTPdv0cxMzV+X4wwZ1AH39dUZF1XLibUlHDhrrF/7Q==
X-Received: by 2002:a17:90b:1d01:b0:34c:a35d:de1b with SMTP id 98e67ed59e1d1-34f68c48346mr5296424a91.37.1767859752118;
        Thu, 08 Jan 2026 00:09:12 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:11 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 1/6] dt-bindings: serial: google,goldfish-tty: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:31 +0000
Message-ID: <20260108080836.3777829-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260108080836.3777829-1-visitorckw@gmail.com>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Add reference to serial.yaml schema.
- Change additionalProperties to unevaluatedProperties: false.

 .../devicetree/bindings/goldfish/tty.txt      | 17 --------
 .../bindings/serial/google,goldfish-tty.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/tty.txt
 create mode 100644 Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/tty.txt b/Documentation/devicetree/bindings/goldfish/tty.txt
deleted file mode 100644
index 82648278da77..000000000000
--- a/Documentation/devicetree/bindings/goldfish/tty.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish TTY
-
-Android goldfish tty device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-tty" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_tty@1f004000 {
-		compatible = "google,goldfish-tty";
-		reg = <0x1f004000 0x1000>;
-		interrupts = <0xc>;
-	};
diff --git a/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
new file mode 100644
index 000000000000..0b702c8657c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/google,goldfish-tty.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Goldfish TTY
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+description:
+  Android goldfish TTY device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-tty
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial@1f004000 {
+        compatible = "google,goldfish-tty";
+        reg = <0x1f004000 0x1000>;
+        interrupts = <0xc>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


