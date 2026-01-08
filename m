Return-Path: <linux-input+bounces-16870-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78430D03E71
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 16:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34E8A3103A44
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4305C3382C2;
	Thu,  8 Jan 2026 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auOAVVT6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3466E3358B8
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866848; cv=none; b=KA7tPfpwkXe1yz2CWrbV3Dbv7SqtSuK6krkzWWyY9XwVCWdTP04vQkqN87sLG+paLD8R7WxzRFahz4viWhgIYElgPyy/ztGK2le3b5y5lz1FayYq/CGRzDFnVZIO0S/pMRBu/tHmfJkTz+U68xwDlEO21OZXAx20qyaJvy9zOMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866848; c=relaxed/simple;
	bh=v6KD22Dyx3+5ck20H0pl2sYgGNxEEsrVPo7bCwCkiBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sc/NbmPXgrE8dTRwsXrhr43p+AVddKn1cYCCNBb/FxYV7ev1Tx+T3uSa7LV+3bOkda/J4xhrR+yn+I7/LPeZ+fVO9I3ucZOI25ZLV2j6iIep9zJryUFg8V/qqElzi1lYtaaoSUNBaNTWzCkEtmrdQNfOhUxShwkZFsAtqFjvuOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auOAVVT6; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso2108506137.0
        for <linux-input@vger.kernel.org>; Thu, 08 Jan 2026 02:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866843; x=1768471643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHhAP8tHFGp6R15hZZObJ523oYtuLJJxIs+qZwxX3g0=;
        b=auOAVVT6hF8f4LxsCS7B/A2NEgx+8HpMgkcdfnTJmO2q0uCL6Qxyly7abUMPzX3Qd4
         HIBoh7aiUxtKiRm/FlqJG0FcUQEF8okZhgp1quQVhspGwIHHm4f2CVD9QT9rqJQj5R1w
         sSKxlhJDkf0SaF9jG2ZZCfUu+wkZB31S8EJ8uVIE2ZagwUmjahTyBAacXmk+iuwvxpFq
         lgRAS5wr3RcEHgXDy283SufTW7A0dmJxmNwfrrxZ+l98rCaPH8fh3Mgqmv8mvyVWSzx3
         /jVXp+OIqgi89oBUigiiFvjP1S/feEbWrNXUGNNM1k641FrYXtduJ+mCuKAHXb2pa3Fo
         YbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866843; x=1768471643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kHhAP8tHFGp6R15hZZObJ523oYtuLJJxIs+qZwxX3g0=;
        b=OSzEgoTBUKYuRL1EcOhoUrHGu5HHE4c9ofK2cFqo6Ab9zvydz8zdSQ07p46rh3/vDi
         UlPTFKxp3Pcl8JOqbXE/AZqmjsKD/cW2oakSQQ6EcM0ZpPqW9aNy4eOFs6/gzefSfs6v
         pe3xRqZdpJa/JcQjffMzqG9ck9ixY2OyPkdAVLiT9XqFhCL6uti9Xr4MBpSDmBozB+5v
         mSu2CvYum2sZNtupuVThDkGj2f4TR9ILCufzMmqdpT/rndb/B6lCQkx1SgFzEoIhnvCU
         mcH4spR1Xil5pOzbyicSa07/O0uPvvIrgiYkDFpyec2pemCcYkxlzMEUvz6ijTHyJJWz
         AyDg==
X-Forwarded-Encrypted: i=1; AJvYcCUmexenEXYabHQlbpv5NWoWlTzirqlT782eQFY8l2HPVaLVbQ3BVsMLSm+3S3zJryZEvqPzW0dchRm4Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrqsqITwGLgeuTZU65z9q3Fge417gaFNObQ5f3kmapeSbOET/
	yFezuwdiSJkxp6+81719T8wD89dicm8jkg8rKQF0uQZfwTIUeWIGn8RK
X-Gm-Gg: AY/fxX7cpQe7eHai/GQEVHp1LfS2GKIxNAKookcg1tfrhQdvf2HEIqKQO2Qx4o8wNvN
	sw0e7CknHBxa589ZsDPjJYPC8/L4Vj8A9Dt9eOSXt3Dp4hU24/xTqYx6E8RXmoBlcloy9aBD6MR
	D46nppTS7y2tXRk6ROWzGMmLp3K5jc3SVCfA8A9HX/2G3wx096N8o/4MIeQLZ1gJRTwlP5kFObG
	aONiE+Cahc1tXMHLo1scqmLfRELKn+ZPLfMOPIVbaoCp2GYk5YingZwls8KxZ8zntBlcEzl0+5Q
	yi7zc/nUMJwweYaQIZbxSaJ3u1KgenLo2q+cbbT0DaUUY+G8e+hgdrPZ4NU8eClHwXyCDmyANUG
	av1TA6O2aj0O5dJcqSVw4RlW1wC3XB3lLSX3pcCTytxjTAJv3ish4b2u54rGQ+VT0ZFu93YKZ2p
	41hUkixrk8G8Q+iK/qFWPi0GrI6omOEpbz49uz5qYqgtVZitV2v1Yr5k3yZAjQngGGAD+zkC4M4
	4XVfwduJnBsuLsFX1qQ+Ic/lJiXDY7V
X-Google-Smtp-Source: AGHT+IExPvCC8KraIjBsVHGHYTjET3yJHc/BTBjFTEdV/VDXcghpuxPJ+uczZtlqCGmQQNa17ulZcQ==
X-Received: by 2002:a05:6a00:288f:b0:81c:9f57:3090 with SMTP id d2e1a72fcca58-81c9f5766a8mr2451909b3a.24.1767859757241;
        Thu, 08 Jan 2026 00:09:17 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:16 -0800 (PST)
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
Subject: [PATCH v2 2/6] dt-bindings: misc: google,android-pipe: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:32 +0000
Message-ID: <20260108080836.3777829-3-visitorckw@gmail.com>
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

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
- None.

 .../devicetree/bindings/goldfish/pipe.txt     | 17 ---------
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
 create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/pipe.txt b/Documentation/devicetree/bindings/goldfish/pipe.txt
deleted file mode 100644
index 5637ce701788..000000000000
--- a/Documentation/devicetree/bindings/goldfish/pipe.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish QEMU Pipe
-
-Android pipe virtual device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,android-pipe" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	android_pipe@a010000 {
-		compatible = "google,android-pipe";
-		reg = <ff018000 0x2000>;
-		interrupts = <0x12>;
-	};
diff --git a/Documentation/devicetree/bindings/misc/google,android-pipe.yaml b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
new file mode 100644
index 000000000000..12b0cfc815e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/google,android-pipe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish QEMU Pipe
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android QEMU pipe virtual device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,android-pipe
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
+    pipe@ff018000 {
+        compatible = "google,android-pipe";
+        reg = <0xff018000 0x2000>;
+        interrupts = <0x12>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


