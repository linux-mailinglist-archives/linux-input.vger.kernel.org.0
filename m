Return-Path: <linux-input+bounces-9021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4EA04EA0
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 02:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A63EC162016
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 01:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17417E792;
	Wed,  8 Jan 2025 01:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvrW8fyh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545174964F;
	Wed,  8 Jan 2025 01:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736299105; cv=none; b=QQrJafzEykBhTfBAzqQis5Ue0xU2V3yR2ZHEk1w+++mXreCmtxAGHKelzG7dDmEe5IVyVgqHvP9Tkzm8hoWRFjO4Sqkh5EZf+CXfgygduyqH5bvtx8yXNEGDCG/dtoxnXhAomKwAxHEbUoR8v5uK/O/lR7Un1u+/A/nVkmqXyxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736299105; c=relaxed/simple;
	bh=4jZaluji4FIRoLvRmRvj3rybsg5sLup2Ny/5F1rEnf4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I0tWZYx+FgrFVjlXlj8oJiffYAfeBIZ/hiUpELAMVFgvvo2hUHde+DPD+AjNtnozL9aoC7n3RPyIFf/AUKCCNY79pYrMP2O36nxxLav0EhQZGXinvWR+MiuVgu3JHAwZWpZUTxVQ5QTZg6BPZAdssZLUggIxdBSKFRoEIIoaldE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvrW8fyh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2163dc5155fso236632965ad.0;
        Tue, 07 Jan 2025 17:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736299103; x=1736903903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYbGITGbEZjb6OpwtH5VOJ2a6xe00YC1HHwGj8LN0wU=;
        b=GvrW8fyhakSNsVOh06mRIcIW/dK4k23Kjv6S9Zt8JU4YPd0hAH2aPz4lLH6lAXStwC
         xiHRr1Wt5TdU1i1ySr6NjcXpSQkhTLtqHHOXP3mAC4l0qlv5UKI3fGBMTemDqI24ku7Q
         cXZu/iVca97qBxywL5zMv9SRSyZRy2mommlWqrukVeloVi3qi2FIziVoNg7D956Q51q5
         X3VySmOvJoOjCOPbaYFWPFjlNLJQ84oknCA4FstYuYvvhL3l7EMAWUnPVks29J8Mkj24
         i7KemFs29lIggu4J7oXTgG/3pXogOlk7BnHq5V7gk85ewR3iLdD6bA1tt4kUcwUaaDED
         ZbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299103; x=1736903903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYbGITGbEZjb6OpwtH5VOJ2a6xe00YC1HHwGj8LN0wU=;
        b=SGT5HkafFn4AIcLRj6wGJX6N1x5W1k64Gh0PcB5MpPtEUrdrGXUHlT8ytt1jrCGf5c
         kq5eQuhVzlMExPMkJyoyOGetK/wAfGwa55l2tyGBfAOV1KoFQWoDmcddPsInmZTud7IN
         ogSxAd3FXCpGYIKTaTDYne67H2eH7T9aDBabE955L6MmB7ZT2y3Mw2zqT5Hk8riWZKWy
         43C6eZf3nmoRXB37XPFb67r4pEEtbDuNwWhvGiDf4MH9CNEGlY3GnEOK9J6n7MPMTzby
         JenpTM9ChHY+iveQ/EGVm7F9kOegSw/hit4TPz+vcDmQSNDvPMVjgpzxPsTI1DT0KGXC
         7/fA==
X-Forwarded-Encrypted: i=1; AJvYcCVkfpt2ZYvYmTTgcEQITipm2XLySF1zfBcbWNQV9crLwHZWBuVouUCIyB73A1rNXDYbkjmhYfA8Ejyp@vger.kernel.org, AJvYcCXJIiQEswZwhdfdhRVpxG4r9YZroHREL5okXsHLs8G+Zi8e1+b4jJglTd9mb42XUYFjagHYA474RcrMSx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPM53NrjNh050Ak2tSlrAnCA49ns1QxTmnz07CNCnCfUG79Uta
	cFAqK/x3szcU+iHz0CIVtR/EVsTMQH+AEQTzoB+D5gOaJ/euPMqhPTyfy95g
X-Gm-Gg: ASbGnctLQNIi6zix8SFLaarRW8R52Br7a4XA2tzLU/FfkL0/mawvLKaxiTxb4UNx+LC
	KhtrTLTPAKU0FCOAj0GpwQlwq8R/l2i9vna3DY+17BQEK73nKsehN7XhTL+2YQEodfQDgYvQqtN
	Sb+vm6uDWNsayX6FAu0v7tbJ2XGDnVRhYe/+H6kPHF25jup/ReIH7i54xiwbweTjQ4jIrsVtRc/
	GyYTYGjnLzjVAdV6tr0/WAqmrj66yz3rLR5jHcf/1EccTxTWm0l6ITJ2LsGQ8HtsBfXqKj6EH41
	Qq8wO7s0zL86GYOXLDnRgpvhBrYqdUDv9PB/doE4HQ==
X-Google-Smtp-Source: AGHT+IFDcZKcr8r+6R5GTj8bFAPrGBQ0pnx9mZqhIoabk5UESwlqeD+2cfBofS0ds7DMtcNebRzGJA==
X-Received: by 2002:a05:6a20:9c9a:b0:1e1:f40d:9783 with SMTP id adf61e73a8af0-1e88d0ee90amr2280910637.40.1736299102840;
        Tue, 07 Jan 2025 17:18:22 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad83033esm34045009b3a.48.2025.01.07.17.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 17:18:22 -0800 (PST)
From: Ming-Jen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	sudeep.holla@arm.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v5 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Wed,  8 Jan 2025 01:18:11 +0000
Message-Id: <20250108011812.627-2-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108011812.627-1-mjchen0829@gmail.com>
References: <20250108011812.627-1-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming-jen Chen <mjchen0829@gmail.com>

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: Ming-jen Chen <mjchen0829@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..889f253b3bc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Keypad
+
+maintainers:
+  - Ming-jen Chen <mjchen0829@gmail.com>
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-kpi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  linux,keymap:
+    description: Keymap for the keypad.
+
+  keypad,num-rows:
+    description: Number of rows in the keypad.
+    minimum: 2
+    maximum: 8
+
+  keypad,num-columns:
+    description: Number of columns in the keypad.
+    minimum: 1
+    maximum: 8
+
+  debounce-delay-ms:
+    description: Debounce delay time in milliseconds.
+    maxItems: 1
+
+  scan-interval-ms:
+    description: Scan interval time in milliseconds.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - linux,keymap
+  - keypad,num-rows
+  - keypad,num-columns
+  - debounce-delay-ms
+  - scan-interval-ms
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    keypad@404a0000 {
+      compatible = "nuvoton,ma35d1-kpi";
+      reg = <0x404a0000 0x10000>;
+      interrupts = <79>;
+      clocks = <&clk>;
+      keypad,num-rows = <2>;
+      keypad,num-columns = <2>;
+
+      linux,keymap = <
+         MATRIX_KEY(0, 0, KEY_ENTER)
+         MATRIX_KEY(0, 1, KEY_ENTER)
+         MATRIX_KEY(1, 0, KEY_SPACE)
+         MATRIX_KEY(1, 1, KEY_Z)
+      >;
+
+      debounce-delay-ms = <1>;
+      scan-interval-ms = <20>;
+    };
-- 
2.25.1


