Return-Path: <linux-input+bounces-17002-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B94A8D154E3
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 21:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7785C3012DD5
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 20:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E3E34FF5C;
	Mon, 12 Jan 2026 20:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lt3R10WK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC77434B40F
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250672; cv=none; b=LAgkTz5DNreeN7AqJOdUKmOAdmHGss0GWyCPXXYFzXwgwjQWoI0cyc+4OGtK1CjA2kTFK84F+e7HomvM4wdIlYkD+tr3qSS1PJxx8lrys1umO4EWuaf4ZSYsOpHivD0OEVCM1MzVMraII/aiJrxdOLieVDsorS8lvRIR/j+i2oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250672; c=relaxed/simple;
	bh=R975+6cFhZbxfj7AcmB2qCDxz2fjGpYeQFlJNfAlsrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrlL6ZsSHvFpNGPVxhpvFFBL7Zb02RGBAYHUDdDlU4M56OiWXL+PKo19AhvdRHMJIc4Zr4hiOZEb9We3PkexNowjuI+Qlp/jTTtm4hQnAQM9pQ9P25ciXFbXiKLiFulPQUtPrVwQ/ZfFAjU2XV2rTWAXam1DwUccD4FlIukIyMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lt3R10WK; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-450be85b7d9so4467150b6e.0
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 12:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768250669; x=1768855469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcjtfYLr/hzQ7i+u9m84wCmIOhDfx7TiS5rWTLTDi7o=;
        b=lt3R10WKy5lCLsShho83YTxOkIojFNrcl5W/4KItWaiObCoHEf15t2X6YXdrzv/u3U
         sT6Q9KJV1y5RtdLKHBooPPC0cVBQ3vB3epi68STrf5LBNAFqgdBrbDW2CS3IV8ezqvT5
         yMpEkqLTjHq2soRVVtvG/lrOamTPffxQPrdv0usfGwArzYvObSOa3X1MjC7Z8Ah6gFPA
         PaSyWb5iXFCuxEVCGvT9SOYjbaDDk6GzCvTFReXm2idtbDo1WBtiWYf9T7C+c10ORVxp
         e0JUFlDJEIOwiH56ozTgfbYM8+seEo4rnEW6/CYWr1cDGVzvGE9lfx9JSL4Oh9DJtkL5
         X6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250669; x=1768855469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcjtfYLr/hzQ7i+u9m84wCmIOhDfx7TiS5rWTLTDi7o=;
        b=I4Fn2FogdUyEX6GPD3Hf7wbx89YoWC2/I9vV13SzoiNtUtZ9PvZtWnUR1+fSZ4KSxD
         d9fJy5wdGVg7wIhEteq+UnyoVle0fBLT1RDFSYjcAr94UyvUq/5teIJYtGNfgRUDelYT
         gKaAiHXiLVcj757pWzVSQphp73NW4bHba7Au0E0NjpjH6zGXMaQX0DvLY+/TOv4p9OM5
         FGQGxVB8t8h9HzQve0sl5LleLcID/VmV/SHP+QLMswdrzwkIFVPrtqJVXStkkeTxGWei
         fWY5aDaJJJMWdJM3zWkh2ki+K9nMOKauRnNZYrGZZodyn/GAS2gqcWQ547Cez1tk/z/k
         sj0w==
X-Forwarded-Encrypted: i=1; AJvYcCWxqGmcORLqYxL6Ddo44NMRb0Ab+pMaXqZ2XtI1u3XEHQjjswKajp6D0N+RAFRdcJyvLOlDUvNKYTDeyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5xRiD6RzSfkPxdDZVUVdgoSeRLSKuXsN/EY5l7rSUe46pCSt/
	SaSYkFwjBXgqnpzw6gEWRvyQBTNjvuVrKesPvnl/ldNvycx3Hsn1dT6yl5lbGg==
X-Gm-Gg: AY/fxX514BhOMIyk0WHnXKzmVASvvh/FwubapC4SiqGIWZsjG5O98N69KyJ3oCqaq43
	RZJ3yxL2yvtn+gO7tmDw+lqjU2v2ZvlDTbzceRg5Y44DWA2jXAlJjPx+JTxEaLX8/rhXkQx/c8F
	HD8aeu7Gmk0ZrzUGCHHjBwaysryxAUKHzIamiTLw29tWJUq3GOPvYNl+femfwGnnZ14MMToJp5V
	iCZR7NCUBG7JScnt5v0DeoCZ/Tl7BWaHc54BP9zyaFnfVB4Zdu79ExDr7x9rOg/bjBBo/ZYY+D6
	eHNNwmzEmNtf6MAqcaIkgP5HbQnJDSNJrA8cN9H7E3HA/zA7D2//Yw9i+3DMXdn5Gp1BpEurP/d
	tkccAh49OTU7dGjMFDag54moKtDlyaF3OH6aj6Hdj38OVHI4Fk2YKWCr6olAMLrJLZ2B3qGEcDo
	MFAgc4xy9Td3G+1SzA7GyPsD8OoOA4JMPTOhMQpZsLnGjBBNIS+kJvsa79K3Dkm5kxysTB5/zUo
	ssxDTAfjhktX0uHROSy8w==
X-Google-Smtp-Source: AGHT+IEhhjkMRhLtfe06HmVUiVLdJt4MdPUnRHhK5mx9O/EoN/yul2X9MrifSFUaAnpKZe76DRHW3A==
X-Received: by 2002:a05:6a20:430f:b0:366:14ac:8c72 with SMTP id adf61e73a8af0-3898f9db825mr17301674637.72.1768243931042;
        Mon, 12 Jan 2026 10:52:11 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:52:10 -0800 (PST)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 5/6] dt-bindings: sound: google,goldfish-audio: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:43 +0000
Message-ID: <20260112185044.1865605-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260112185044.1865605-1-visitorckw@gmail.com>
References: <20260112185044.1865605-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Android Goldfish Audio binding to DT schema format.
Move the file to the sound directory to match the subsystem.
Update the example node name to 'sound' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Use decimal format for interrupts in the example.

 .../devicetree/bindings/goldfish/audio.txt    | 17 ---------
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/audio.txt b/Documentation/devicetree/bindings/goldfish/audio.txt
deleted file mode 100644
index d043fda433ba..000000000000
--- a/Documentation/devicetree/bindings/goldfish/audio.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Audio
-
-Android goldfish audio device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-audio" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_audio@9030000 {
-		compatible = "google,goldfish-audio";
-		reg = <0x9030000 0x100>;
-		interrupts = <0x4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
new file mode 100644
index 000000000000..d395a5cbc945
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,goldfish-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Audio
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android goldfish audio device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-audio
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
+additionalProperties: false
+
+examples:
+  - |
+    sound@9030000 {
+        compatible = "google,goldfish-audio";
+        reg = <0x9030000 0x100>;
+        interrupts = <4>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


