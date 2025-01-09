Return-Path: <linux-input+bounces-9084-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18FA069E1
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 01:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AC20188900A
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 00:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E649847C;
	Thu,  9 Jan 2025 00:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auzGI0zq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27F24C6E;
	Thu,  9 Jan 2025 00:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736382395; cv=none; b=ti55rXnzNTqttA94ON2HaJZBUqneYQeZOfipefJlqeb55Vs57AJY05AMMjp34RlxZwVLJ3+8sbowjTaH//o+JPNCf/1KqIt91DKq9i/9sTcuNajq8b84UVirmcIusR1UsAIVUSqtI0ArvfaB/+tlbqoWtdL+69bx2jCZBcP4CQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736382395; c=relaxed/simple;
	bh=PfCKjEJ8/ahgFN6RjGG+q9HrWMI6YlcY0HmjPT7E1EM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RtOo8GbuoXB4Qmy0+yDZe8OHrW95QgiZCu4xIITrMi1mBkYyzGMaig5TZG+vSTZcAZ/RZEOeMoo+7EhWeLiS+Z1bosf9vIjqQy+mSl1Y3K81TIANWuhhpwRj7ucu4c0SY32iizEq5xBDehh4Ykvpqvj+Oab0nbMymqEx1XsDKRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auzGI0zq; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21634338cfdso6402905ad.2;
        Wed, 08 Jan 2025 16:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736382393; x=1736987193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsIZZl60dEIPjl7pc2az7uHZ2HOwUEGN+MqA0/H9AGA=;
        b=auzGI0zqBgLmt2NnJ+C8Jv4w1znfgb1/Itz+/h+4V4syVHk/VCxVEnigWIq15gtIxH
         81TbSOZXwane/ABizPkCovE+R3MD/OC7rPJDo65daZXLfBH8JllUkj2p6vNd42jK5EW2
         KVrb/P0VMUagG+DdeCkGc41KIcaHwgPXnY94A0CA5i1YzeOFnEJyGjHaQrpPvcGhulua
         She51WWLNI/SvNr/wsWHUywIlRqKk1n1Y8TA0GcmoEpwToNaCbfHH3FU3rROjlF25sP7
         rvORj4/GNV4bms2hs9Je87peSl4q/qUsLLBWWi3E9lU4Cl91gUJ7g7IeGNJZoMLidt/M
         tg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736382393; x=1736987193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsIZZl60dEIPjl7pc2az7uHZ2HOwUEGN+MqA0/H9AGA=;
        b=hQyhUZSozs2u3a/WWKHabwhL3KE21F5nyjUi+TjrHPMbFI3WWutTnvIFULUBrjoOGf
         aWQlprzkRJwg7esU0aO/iihwiNfjRv3ooTqn+xDisbUyihytLrvzIMQjuTNDMhkMbz8P
         WwR5fw7HPfvmP3S3SSSSQkymcAkdnzUpAUeMdMXo5ej8hoG/r3ZoHtWcCcai7lpUIrgB
         tzP6CloDmT3xxsuZ4rwB50JlAwcXz3r8MCGohYwvodqPhZkawE7fFQKvjUn41sVvfkU4
         FHcZlbKjfyMPJRBXcdL7JD63q2+x/nBEZPJgXxw44pxrzXzxfOG9cApTrTCkCfZ2K3ya
         YMiA==
X-Forwarded-Encrypted: i=1; AJvYcCVNwQxe5DbDBPSx1U4PD4/0PWNunl8088LBnqc8McYyWe4m6GkuTUtZOBcZlkqMGiVkuyE0Mr2KTIuk@vger.kernel.org, AJvYcCWT09lcWCRTDKEHI1TDaahA4o9CgkB3PTG6/jEG/4ZCN/NSXfLYow9GysstflU/B04nwDj5ng7lLhH53wY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxV8XxvPiRZAjV5M6fbWw5N/qpuXWvekB+tVsbOLsJ7ORIUaUO
	pjeshmD+UatMlo52vXQXDtDj5JoYjPbj+DwN+6pSDVL1wvt1EqqdrO1toHab
X-Gm-Gg: ASbGncsvLUeh/VG+u0Cn99AzpwlYF08o3aR7PgnSgOzNBLwnMtss2eVOKAT2NrivSrw
	dTTvxSmAHyC9PBNsjgCuCWSbunUPrvLsOWTva/5fPr2JWYZZrSJMVZZ8SH7UP2WbMFE1c/bf/Bw
	pvgOrkHnaZUecXLFcgCHHpZCb7rNtOtxZ7L13hUA3aElLvos2RGJjvEm9lCD8VpbUKJUpkaEFUN
	dUQi5rPQAPQPNMNhqw9hpTXZXFwj1IC+BrGUpOMEjgdHvzAa2Lsk+MY+nHaS4WZ8uVYCRxvVBl5
	GM+gjX6ETGO+aIjbXstf5FkSeBWSp78uFSodHS6DBA==
X-Google-Smtp-Source: AGHT+IFTwpCgtAWhcoiuknE8MbwvNCyYt4hh1A1hVKRcuqvUytlhUI6C1CnNX6kuasEuhW0eiQu9rA==
X-Received: by 2002:a17:903:2301:b0:211:3275:3fe with SMTP id d9443c01a7336-21a83f5243bmr69201615ad.17.1736382392607;
        Wed, 08 Jan 2025 16:26:32 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca01989sm333481435ad.239.2025.01.08.16.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:26:32 -0800 (PST)
From: Ming-Jen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v6 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Thu,  9 Jan 2025 00:26:21 +0000
Message-Id: <20250109002622.771-2-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109002622.771-1-mjchen0829@gmail.com>
References: <20250109002622.771-1-mjchen0829@gmail.com>
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
index 000000000000..9d262f87dca0
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
+    const: nuvoton,ma35d1-keypad
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
+      compatible = "nuvoton,ma35d1-keypad";
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


