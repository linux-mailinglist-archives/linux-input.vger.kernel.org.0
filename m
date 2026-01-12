Return-Path: <linux-input+bounces-17001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CED15435
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 21:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 004F83008770
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 20:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3802345CD7;
	Mon, 12 Jan 2026 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZxyV+/5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725DC33EAE6
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 20:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250214; cv=none; b=cpjy0aWULQNoSu0hDSag8lrSycMGVb4pa4S6xs2neWM8TbvGe92R3kY4opJPwWINxZ3TeIWEPswTZTze2EgPn8n+RfruEB0jIibWV6jj0uQO55P5lcJDq97rtlmIpcEekHBAy/6aM5pe1IRttEHseDqQxcDHKMtqW3Fxk1A2l5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250214; c=relaxed/simple;
	bh=ymB4O87Tj8cdyAQ2Mbv88kf7il5FRPCeihIKxEZnuSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CANeYDZ2Iz6V6+JHJ5LLiQYcDXjrICMpEdllIDZZOJmnTwzONmhiI7S+9i/SZ5LGHfeyG3U5t5UX2WxXwuOXKfLIGpUBMK2j/RYBI2t7N5KK1ZlImEgBbz3JlpA98SOLbULrWejL8hflHwowRbLN70GItkcULgg+Hok1RQHmk4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZxyV+/5; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88888d80590so88431026d6.3
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 12:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768250212; x=1768855012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IpW9E256hAdb5Kp0Yw/WkAtwWAPi3uXbVhccnFIi6E=;
        b=TZxyV+/5wbDHxV5hc5e/FXDGEEbecqYNM1jvSLxAoncdNZ3gLqDWbvWxCv76OoiAzr
         Ftn5SUWa5Ykd4CtVEwJ2R7uWJFhUIECdwPi0NBTDTE+e2nUlodFLOl8JdnUixhmKxpB9
         XAgRnOpXsOSPyRQ/uSnrQAxM6efG2K2aXYYZWeWFe//b9GXyHzWNckyXSsUubV7LRVy5
         b487CEImfjB+dKjz6M52qobXgsJjl+/WC7n/m/J1N0Hz9ZeLXawB+Bn86JjXKOdP3CNM
         ylAID8aKrUA//cHlA6nf/AGJzvGDt83YJPR+8ZepBjUTMaCXoVaMDLIV3Baby2ZNGFMv
         wGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250212; x=1768855012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9IpW9E256hAdb5Kp0Yw/WkAtwWAPi3uXbVhccnFIi6E=;
        b=WR9dgpDw9yJARR3RGBIz6cComw8Gw2et/K9AuzGypU8ZrXJI1JXzVCkcx+5A6badue
         YpyY2adNf7f8F7DCdGkWL01kqFiOzU2+aZrOC5n7GDiac8G4pwIl0gR697xuGRTGsL38
         SaQktwiSWjDObqzrPvc0AvATGp4LbAAa1N6jdu0czueIpQ24FiKqu1zOJHRx1plXJAqw
         6Ocy5mXUullzs0o8ofz2erZX5ailpIU+TgvXQrwD3i/E8Z3LAx+ymDG7MxfojX7ZLldC
         yltGs5wKOCiM9eyGR8M4DGgIapIv/+TUp/MDHDBJ2iob6cz6jvEhsdkM2SUNFn2v5d3q
         GFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/HMJNiB74kHbiQFvpNccojhAnKVMRWWFuIiDxeFDKQD0mHUBBBzcKM3vOIk+pFHbmJeQlnGt6lsKttA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1utxQval0q6V66IFOC0mOUg79ViWe3s9lMPY6PjVqMj9zx8Zd
	+9en1+EYYaelfKVqsyb+cfb6N7WQ4xq5ztp/+e9y2+rRMasC3qH+dGmTaOd4VQ==
X-Gm-Gg: AY/fxX7WseTh8L9TOGqwlPMrNM8vz8t40Tzm5isVCqHNTGBXQVJMk6asq0d/KSXFc5E
	fuZNakdwqIey1I0LDfyYojr79u+hBM9p+uNh97QPi1enIyXm2JnxKYiOJCDwBwcEE1sH9rFJ+bQ
	1bqrv0ezaUKmtSsn2MJXgKcB9sYitaq6l9VWMZLyHT0TQN56ctWSWS46EFW/2WWRGY28nOt2iQA
	rv0wkz4jqHE0j6cRafHBjzp647XGmo8pZrI//IFnVsrvCFWx3mrf1bppHGFQaTD8dHbpPJ+nY9g
	Bu57i5nthbQPxlpkrChKN1LoqUWD7SDi8T41bgimil5cKbKSyXjidGRVqJ+hGnFMaPeI2hPB6ra
	Wpx7hjpoFmmYm5CAojo2B1xvKbSaD5K7Ie10u998O11V3AZx6wNL3gIU10KiHkyJy+7LGKXnaBr
	vkyHvhRBZdf3ZGPg5JmKqjC/XnFUJGYU+cCj9qM9mZEb1+mlrvUEQvaGDefyLkTAjZGb0Jd8tSi
	XqPLAEbKSeVkEjkCv9l0g==
X-Google-Smtp-Source: AGHT+IE0iF957v0dhX+oh2JuRctvQjKaodi99ci7bX97j30HxAiXsxhGrr+rNQNYdsy9DMkXs0FDHQ==
X-Received: by 2002:a05:6a20:4322:b0:366:19fd:dbe4 with SMTP id adf61e73a8af0-3898f88eb3emr18090615637.4.1768243916723;
        Mon, 12 Jan 2026 10:51:56 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:51:56 -0800 (PST)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/6] dt-bindings: misc: google,android-pipe: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:40 +0000
Message-ID: <20260112185044.1865605-3-visitorckw@gmail.com>
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

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
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


