Return-Path: <linux-input+bounces-16741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD34CEA8B9
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 20:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 213A0300AB36
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 19:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B772231C91;
	Tue, 30 Dec 2025 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlP0bP0A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3981E832A
	for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767123594; cv=none; b=rzBN0M6AElcQE6+7Ed/++5E83LGHXky8d6WL8oyvItQWqgOTQfZ6F7VJy8fHXJKucPLjvYMkfgvsNhrBbSzYDWBEKShSDTSjNTUGC8oUSCuKVIzMde9mlF2VmPIcV9VenpOSfJ2KXiNd2SEQ5YkDQUKm+DFXsBmMojYM9hHkCI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767123594; c=relaxed/simple;
	bh=UfuU7YANuY2DtAb1JPJwiKh/zNCqLQCQAfbDrFS7vE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyREy++PIcyE4g/uziOEjbqOOJoINslH9CQP/VnfC6ZV2+5ub84iBjhuCtVEWP+YG+8MFJ2V79fxrLnbQPEqQC6NuBwEZnnGF/rvzoZ+UXV8SIUwI7zVgvyt56hGQmLDRaKp3Cm5HUZAXlOacLWlOILxBe7nwBcJZ52m4n/fUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlP0bP0A; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c7533dbd87so7623094a34.2
        for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 11:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767123591; x=1767728391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83p8xxawIJkmopSMpAdalPGsHw+uQLv1ciZtoS9EH+c=;
        b=KlP0bP0A6fDNQzBGiiqYbXnt2mo5MWgVC2zroXzbvtqpyjfnYg5kwu9Wz+41RlQnoy
         uoQWwe1Sqe6c4Ms5EXc+pFhmjHZ00CCxfKnyt6tMeqyCAiBHrAryMBvahr57YTyTwEnG
         Vm/uCqDa6/yaK6Vwy2WR3X9NZoifd5LqlAh35GVqavrUQ2JaHpbVhMSrmv++iLpoXf3x
         25udr0xQF0wkhqu1M5BS9uerOhtxGsmlt1fkHbQ6942zYTlrT3JeZFClrzhPavavtUAT
         upxC669E2M2+/RK+abi1mFi8lbaTjwt2/e/ltX4BJjvIYzYEjJDwdKs3UaCqV644uG8G
         Uz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767123591; x=1767728391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=83p8xxawIJkmopSMpAdalPGsHw+uQLv1ciZtoS9EH+c=;
        b=m+rLmioUQbr20WEA9kZQllgFmUngeSuGi4wETb19NkGQbw2jBmcaEFqu21PVJ0/hjD
         9b3nDFYhS+vZgq9gkbxQ7ZiwnMucTmRhuYbtNpxC3DWgEexXcWbqoN2difg+6Z0vvtzZ
         u1ev52mJp/PH/whxaADgAOE9k6+N8wviaJHo5YC+jAQGUJe+SrBufQ+5hq4sO+VFVnLe
         E9DF+G0ReTbGPnTbw0vXvvMKEWTNPj9PFVsRG0YoHQbc3ZtB8/DrFTSzNgzV0BUMq7Ba
         VAw+5FRnmThPBVY1p+A2BuV6lKpH5kTsASkfoRMKjeHguo2DI5Z4o820VtOPOSWyNHhI
         Ymlw==
X-Forwarded-Encrypted: i=1; AJvYcCWnU5i5HUblQCg5YjA+b8JzO7ZkT2bUuVMinwuUUn5jxx465KlSc9wx1HIDQ6T6spVLu4PFf2CFQ34pjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YPVfe9N1i9nAckv7G0xvYJg2JYKTcOvqCGgdjvTh/ACHskFK
	vct1F0wmEZSnYrRg1tH30DxdMt3jXkDYGiYjMTr3P4z13Zif/a8f94hEIpWXYQ==
X-Gm-Gg: AY/fxX4ANw5Xr9mrpU9Ib2PRVyh9at3A6UfWtct7LxjYZt08vuNzQldYuKHKaWlt6rL
	oEipvyIt88zMe6iDMPAecWK2qvwFd2Z8iYnlV4UrLD39SPND4+XyV4zpIgeqDkjz37Azt6uNDmL
	nX5IDc8I2LirXTl8KecB7U6quiU60GU7vRTEe/y/gRVRJub26A61iWYydkcDjRW8hWWo3XCCVGz
	cyVRsOEbPSoTc/aE1TUfmLJLZMFSzagHpYJhE1QGgF4I0t386X51qVO9r/bKIp1Tus+EVez+7+K
	Hirlmidlf3mMyTNTamOH9Wd5d3GAn4ycI3Py0J/fvHHS125vKbpDYM1wfAFsBPPM2umxW1rFV/x
	NoS+LabAf/TEHpbkTNt0mYq1Yw2/bRXiVVc0FBT7heTEyxylBe5vcetuEFYs6wFoOyN/cm8Af+4
	+RpfIqIoN8gMlKlE2+MsoihBzHyE6xDGlLnR4GE9lgoK7BYTk+PlEcBKoznpyvbE9vUmfiI1DNh
	EQp2MFt0jgx3EhMxQL8HQ==
X-Google-Smtp-Source: AGHT+IFIRsb1yFLdQjiEzch59E2/VO7Id1WJQzqg0S6DL4+slVXOXOweBZRKfGEK/PtM3/p1UkcWag==
X-Received: by 2002:a17:90b:3f08:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-34e921ccb3bmr30732436a91.29.1767118270582;
        Tue, 30 Dec 2025 10:11:10 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:11:10 -0800 (PST)
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
Subject: [PATCH 4/6] dt-bindings: power: supply: google,goldfish-battery: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:29 +0000
Message-ID: <20251230181031.3191565-5-visitorckw@gmail.com>
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

Convert the Android Goldfish Battery binding to DT schema format.
Move the file to the power/supply directory to match the subsystem.
Update the example node name to 'battery' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/battery.txt  | 17 ---------
 .../power/supply/google,goldfish-battery.yaml | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/battery.txt
 create mode 100644 Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/battery.txt b/Documentation/devicetree/bindings/goldfish/battery.txt
deleted file mode 100644
index 4fb613933214..000000000000
--- a/Documentation/devicetree/bindings/goldfish/battery.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Battery
-
-Android goldfish battery device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-battery" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_battery@9020000 {
-		compatible = "google,goldfish-battery";
-		reg = <0x9020000 0x1000>;
-		interrupts = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
new file mode 100644
index 000000000000..a7c98ef56201
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/google,goldfish-battery.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Battery
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android goldfish battery device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-battery
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
+    battery@9020000 {
+        compatible = "google,goldfish-battery";
+        reg = <0x9020000 0x1000>;
+        interrupts = <0x3>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog


