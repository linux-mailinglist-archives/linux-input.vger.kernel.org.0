Return-Path: <linux-input+bounces-17047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37021D18684
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 12:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62A2530381B6
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 11:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E12818B0A;
	Tue, 13 Jan 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JC9rzgt0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A81350A1E
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303025; cv=none; b=GuiZaMtzzE5aihOiNg5c8krIAJYxUq9gCj7KcbEp9B2erKumiyMkdc3eyERTKV7pYF8IFq5spn3Ei8Y/7UdRC72GGWOXq1ODOU6FY/QhpH6u8ZvEQmCBBDnPPLOVtv6z60Jt07Rvcl1wVckCeE/W0lXHSOWMYCfS/fbJvsL2aJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303025; c=relaxed/simple;
	bh=H/DtsJ2E/56brWT90bF0TB1znfavml5P75EoVlijniE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxGbAQ4ZgSloA5aNMoO3UNVotFQvnzoDQxEBBSrVGUWyBxQAOlnoh6uXj2pERtLuMy5KzO2OBkB/v+WshOgPzm0qJb0gmNReFumvdpUSNbVhqT+M+lq0gOTHG7GhfVvVNDLV3XUrr2QCQ6PaHuv6uTqoU0rANnBDvRkK+WuTHGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JC9rzgt0; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3fe9d6179efso4029524fac.1
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 03:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768303022; x=1768907822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XLlcSDrZxQliY6Jsns4WsjKtz/A9etiQH4EFHPP5z8=;
        b=JC9rzgt0PUXYM/531q19B0m1Xx7ES4Xi87jIGbHawyupVWuAC8OzEDmvrBgCY5UsN/
         pMWnpbNlAv916V50uZDRkrCuqlQx3C4p/blIILxIfwbLvd+n2/KX879RcEZO7zlR33tX
         H8t/sCAi1WjVYtEcjio0qPrvXWjXhxqJIBaB9tvU40MnvSvnzvs/ELpmcZSKTttdXYKX
         TG416ny8u3fB9vTc0tzyAqpgm8j21Oz5ipEiz7sGx5oEurllIYNZ/1uMcwvUbFpNxO6R
         +a6YR2W08Ludv26h6nGAxrdPpSNOkaJyzGMYysqpOVNWOssvlp/kH3TIV05wOjaB2jnm
         tC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303022; x=1768907822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4XLlcSDrZxQliY6Jsns4WsjKtz/A9etiQH4EFHPP5z8=;
        b=joi/g7EVCx/sdFA+l4FeR7QPNsoLUM+fNHJURW6FI9nphlZDQ6wS+PZR8k2YIXXp1f
         hNUI/w/BvIwYEh69O5jkx3mXd1AncEfRxjLPHYt/JTGdKW07ulB8kFlFvJ0BWQnznqMr
         l3zNwA3ysQr+k5LzxdJNNQ81MoFqlBbtPobKf1QCd1OzCnbqNo0N1KsihnWSx8YRjGEo
         mpjAgLyxCr0q+IswGIX1tHdk7NL3gxO67yebpH9TI6XKKGcv6AdlezJWzGRWrxhBDVqM
         p9zVJR6CPOQ14U9sQuvL4JXLSQtZOaT/4kPkOhB0xaCDH2gV6RiKfJPC5JZX2XKrn83u
         nPjg==
X-Forwarded-Encrypted: i=1; AJvYcCVzETYI6cPtmpiWuAWbVDPZk/dsvw7KfC6nQ8eu1v+ngT7JQbFPrrY+ieZ+8rZ3jz4IXBGhKlIyoEzZsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOI938LB2f5koH77qTwQKoyj4QcdmgQKROyVBZhs8nhCYI1ex0
	VnHCXzz520Z+sHmVOTs4APiU1I4UvO0PQzJKqyjXhqZJ6S0VTkPPBmsPkQNAaA==
X-Gm-Gg: AY/fxX4C7AVxtJxFmHcslWU4mMuM59wbfGBFpcGS8PHPEC/gYJzd+qAkXLaU6WFnd6I
	+1IPB82DaDKmcOowJVKzLS15LiYgzIpTDE21Z1fusTPp7iXdSlS8yDxtoxCM07bK/kihN83cVGW
	yVKAzOIEdpLXNpJdGCXUs33s7rC50oWgTGIjsXYpEM6voe60fgXmSMvNsntQEYs0Tk99YQNAwgE
	wF66XxCBQU3iSLfwG+a+08gPqA6ofILFvP8CFZnQBgcJp795yfCAAQh17oEPEZncZu0/ohjyye7
	VYrsYGM9rZPPZIkcex710mp0nx7nrOp3oZmIvj1BJlPDZ/YKo0Rmzq/IbZMBv9GLMw2jTKkuMDo
	NHvDZ/2IFxoqCLbn59SNnTiTfQrBo8bNKfhjHCRb9Ra7S2qTEuOtBuD63mPMctQNgZ/ltgmy7Ah
	Gx75fjgI5wDiqx61y7I3M47Yd8EIjXom3fLw2vBunCyhq3SX1kpY3X+xPfRqEHRldlrs7qNYagK
	hItBg2uSwKPJ5XuolWpAA==
X-Google-Smtp-Source: AGHT+IHoetKCTy/pEDc32+prvwD2Q1RnoCrCBHHEv/M6mDpq1Oqnx5ryJch1QdsdD39c7PlRb7aCxQ==
X-Received: by 2002:a05:6a21:c154:10b0:38b:dd94:936a with SMTP id adf61e73a8af0-38bdd949736mr1217364637.24.1768296389614;
        Tue, 13 Jan 2026 01:26:29 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:29 -0800 (PST)
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
Subject: [PATCH v4 2/6] dt-bindings: misc: google,android-pipe: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:58 +0000
Message-ID: <20260113092602.3197681-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113092602.3197681-1-visitorckw@gmail.com>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
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
Changes in v4:
- Use decimal format for interrupts in the example.

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
index 000000000000..9e8046fd358d
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
+        interrupts = <18>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


