Return-Path: <linux-input+bounces-16742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 919C7CEA90A
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 20:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96B853002967
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 19:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8FB318143;
	Tue, 30 Dec 2025 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDs5TYwT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C106431814C
	for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767124501; cv=none; b=bGvToaNRcw5BsPcYFSlLdXfZ2OTsBs5eCrfTOZLUv9zDs/ajGzULoNGBGNO0fKLuz3++9aA3qTozMfzp8FIBcALVqowT3xTc+5T/Nu8bikSXZa/5qzP1X7xgSwDRJ14565UOfmHlAE5NO7+gIVrNQWrEP5S+b2mKdmgVnrbtX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767124501; c=relaxed/simple;
	bh=dBZA5ta8Wg18huaW0x593dUQGODH+A9HatruQgqiYAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxrSZYyYhyNfl4dltf0XkabJ8/3g2G7dzOT6i5XNHdDUnUHZccfx2z7Zdvl+mH/O3uo4XlKRj60toBHP0C4Siwdeat9GX3iWe/TrJ5kAg6tL/lwYNrWPUIDwjn1d0BKnKXe0F/JSkqJbXucmX/AcaXVp7zh0rQW6/iWx1IfuXqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDs5TYwT; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2148ca40eso1639273985a.1
        for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 11:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767124499; x=1767729299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cweyuKIwKmSRdsl/r/hQ+dHMBlDfUCmP+2wWQS89QfI=;
        b=WDs5TYwTdyjEnF/HSK6EibKvM3OW1xy8syrCOVc3cIeiQoLYBWpGQko0JMqVnZPTIh
         Zp8xJmoBjs1x9oV69hTbQVaRypg7gGx3zqp+Hr3Yn+SCCwjp8R177uqodNXGbV4ue/ob
         GjOSsrWxbXL9CGz7HYpIETwPuunD8miMltV/ILlhn5A8lfhrkTbxjKOY9i+zmPR15eNf
         Nqvb2fiv8ZPWNS5aUtNRil2bpyM1jq6FIbtDw3RJEW+Pl2QvqehBkZLdI6smG7t3vCjG
         pNah8qYHHTI2NIxCMOHn2nUiyyo2uucEX84QwAudQP0otc7+aiSF28dVH4L2omf8RdIc
         N4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767124499; x=1767729299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cweyuKIwKmSRdsl/r/hQ+dHMBlDfUCmP+2wWQS89QfI=;
        b=eOe+wDgN3BR/dWbtABY/03Lxpjx6a39SZeiBTeFKYE8Xk9phLMru9GKTO4J5O8SFJ7
         rbFg1yqgdXAsfu4+rdXr3ib5SWFOlr+EzWhG0w6gbwxCk7YK40Y5suV01swssdpG1MhI
         +Qj1kACcO1qrr5DaHg1QoYvZD+l7YaMYwCKRv3nxvHcumGySJaOdY1uMNmwiDe413KFH
         eGUECRVnCTjNQmnMbfK03VJt86trnd+QicrCesHMM/VufqIPgdEFr684QeerqGNsOXuw
         1P+PmYsW67zdBl3UZe8SfBpHbvGE9dExjp3JsUjEv61tPufAtp3V5VpHsN1vM86g8YWY
         Jd/A==
X-Forwarded-Encrypted: i=1; AJvYcCU507hYHfKuQyYgPqyXDkoolMuCvTT29Xek948dq8S5poJydo5GNwY/fQAvtdXntET0zc7Xjjsgn/FTDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+6HShJxu/76hipNvfLKD4P6zGZ9UE5kDfjL/JGxggOWTeSFMf
	DeXXGY33q6H7xiVA8prdkHlv6pYKVXH8rdiL3Zy86+ECi9tMJcp7YES56SDR0Q==
X-Gm-Gg: AY/fxX4WaoXFVNiLa2t5sw9Pp5yAlrm+igrkoxBB2hwoLUB3ZesdSZusUTks4aDzw1s
	e6LfJ26g9zHM28FJMYkvGIkhMKmII7kOFOhzZ1olPwF0fv7oD6r+n8j2IXuL6nAXau6P9TrO8uH
	ExgwCd3O2xAY7ir8I78OOb8SX5XPig9efL8lE25Nz29vUozEIhuD/ctpYX7HAah9RNeMupwAW/p
	Txkvz0TIUuQxB+naufJZAqZRWf7pPhEsFYZeuKMfh2uz/vzbd2derWr+JU+wHnonNtCBsp9ebvh
	riTFnSs/Ij0RkH3+e9IQPqjOV1LKzadhV6GjS29xjs8hWyGoOgbEOCjKYZDho4S9yLEPsXZAh/u
	Apw6lsKVh0gITLlZ47K0TfslN1Di2SxnqGqGfiBEEyZ7nCasxEmLDKVXzULmzEBv6VuM9xjBFho
	gc/FyfSfFyKziE2NDR+/LY3pq+INH1PXRNuhoPAGvbuE/B2xuSznqpBFMv/K26yCdnTGC6pCnIK
	1FjU96RIKWTy8G2mxKOAw==
X-Google-Smtp-Source: AGHT+IEV2tPzXOwPHApBAgjAbkeJhyeb+ZtfRECHHa+IQaEP0X/+BdIgcNvcf3mgMft3lyGdkE/kaA==
X-Received: by 2002:a17:90b:2584:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34e9220204dmr25951440a91.36.1767118265942;
        Tue, 30 Dec 2025 10:11:05 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:11:05 -0800 (PST)
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
Subject: [PATCH 3/6] dt-bindings: input: google,goldfish-events-keypad: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:28 +0000
Message-ID: <20251230181031.3191565-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20251230181031.3191565-1-visitorckw@gmail.com>
References: <20251230181031.3191565-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/events.txt   | 17 ---------
 .../input/google,goldfish-events-keypad.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/events.txt
 create mode 100644 Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/events.txt b/Documentation/devicetree/bindings/goldfish/events.txt
deleted file mode 100644
index 5babf46317a4..000000000000
--- a/Documentation/devicetree/bindings/goldfish/events.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Events Keypad
-
-Android goldfish events keypad device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-events-keypad" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish-events@9040000 {
-		compatible = "google,goldfish-events-keypad";
-		reg = <0x9040000 0x1000>;
-		interrupts = <0x5>;
-	};
diff --git a/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
new file mode 100644
index 000000000000..348cf18d3d24
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/google,goldfish-events-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Events Keypad
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android goldfish events keypad device generated by android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-events-keypad
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
+    keypad@9040000 {
+        compatible = "google,goldfish-events-keypad";
+        reg = <0x9040000 0x1000>;
+        interrupts = <0x5>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog


