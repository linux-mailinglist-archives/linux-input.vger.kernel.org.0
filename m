Return-Path: <linux-input+bounces-8376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3723D9E312B
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 03:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97112B25FE0
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 02:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE65D76026;
	Wed,  4 Dec 2024 02:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebtb5bka"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C066502B1;
	Wed,  4 Dec 2024 02:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733278238; cv=none; b=W3QRk9grLwXffs+2sQKqFQuYH//LnmJtDn8dtZE7VviV//8AREWs9r9GopGtTkWN5sk/YFAVcsgaFcBx4ma3eoBvxtOU7RKia6E0q8Fp49foFldZlzwcyO9j3V5rJVCU1FdWK8W6gnZYGKR66Z8n9zHnztcFcCUU56yzHR3BuRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733278238; c=relaxed/simple;
	bh=Doe0MwewGAhauo6FL34Oa8tMjvZ06r9tSHSBscneF7Q=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJG8RqSjiDZ2x8QzmdRUerye6kP6WN1lthFPoH/WueLIwzdu93kkD6VO6/z+uYJj+yCBEaizasbt+G/j5QYvZ8UwVUGqE8/3JlKpc3vZ6qFqbA4VYv+PP5PhqeSIkz1ZK5H6Z1kWuTG6wRKGez04NS8hy/TYapx/JxBXa7S6p6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebtb5bka; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21577f65bdeso3127605ad.0;
        Tue, 03 Dec 2024 18:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733278235; x=1733883035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8dhTpLIBr5me5F35lRQFrvVcb4wHxn4cA08Itluul0=;
        b=ebtb5bka6lu5nwvf+IsKa8Ba3PViZt4hqf82KNmBxMInevlUwwBQLTpcPaHUO8TLgR
         qu9OWaICE+lEY7nF/y76ZiQo9wAmMgU44twfqmKqDv2UJdl+8G8cRDECgX7Y9SREVE2V
         JySNDrjz/8h0cmgNkygGEnLqzlz/cs4MFIqbD+UhE9QvDzhhATm5fpx946MzUukoflaJ
         T2Uxbn20Fz49s9cpKjk+CHMZSyF4xayewKgIyOlWy5GFpoPDDsUo4cNrcYc3UKmvrUKn
         rTPxPvYUJlPf+tSVxfzlXuZKHfuUrewpZSIlQKmsfsjNhcQTdwZxpusLgwDoMH+sQ9HA
         GlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733278235; x=1733883035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8dhTpLIBr5me5F35lRQFrvVcb4wHxn4cA08Itluul0=;
        b=dEElbmTCqEMVl8v6rbQ7WmUoiW3XI4bnX6yIinBUoEoHMo9DzLddedOq9BYBu/vMYV
         M3Z6o1k4aielp3Ifb/wgmOVfIfQBikvsH56FccJNsWgwGVutwU+ZqnEFv8UFrxhf1a0H
         FOi0z3B2bIRPltejY1+zOHqiqsB5xDFRyun5zyMq6XXHE7kMrSOt1MHuIE4kIWz461mU
         EGSzwPUufSrzlGFAlzAs4etDz2PlksjBuOtnHNTOyYpkqrnn9YOlKZuOQrLMLXlz64T/
         DTOR5GDtCyFsSzyHKBkUAkAFfcTfv89D0l85L3OGFZjggOo0g8gA6o0BvfJuRrmF2Rw9
         RULA==
X-Forwarded-Encrypted: i=1; AJvYcCUTAPZh0oYqJ7V+gBXBcmD8bVoufLpERjtqDaMnpIDfaUBH4pLSVfuBzN0qiuHiJU2jJmWOeizZZp0s@vger.kernel.org, AJvYcCUZqam1rCa2wzozvjWUtvNxf9RG4QNPBpel9qGDVrVrx3ONr839r3suJVSmh7eSvjrpX93sPKai/r6FnVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYpIi/wl6gcJjxpriRm+c5vIQ5cFs9/d9KfseHaC6BUuEEYHC
	q9c8P09hXAPAFWqIxAYxjQhKQedcMpIg873B6GuUtVYVTUvLWrTuNmBK0Q==
X-Gm-Gg: ASbGnct3FJdDdCJHJKQbE6vjMr+p7IetHxg5U9m5N43Q2ahlCd0J4R2qDUZZ+vRvhNM
	+ASKq9P81G2FA8W7EEIngbGbqc5O7+ARrEvjMAqobGGhtIqqd4KbX3iDiH60+/KCQDGdYuxA89H
	TiyZt/3Mspmx7K32JLLcWLSNnmYype5OTUm3CQGREAejMyIEGgg5pkYy+BvsB4z0CBEC6XNT/l3
	bJJEHVqiS+xjG1e4POz79WDWs8FTsNHhaJRZwVOwBshdNmQKy4SGuc6I8aEdVV5kNYhW6OBbaQu
	PfQuU4bfyDMUzNFMFh+/hFDHOVNbzVStW+Y=
X-Google-Smtp-Source: AGHT+IHv34fl1zF21h28QS1304jqN3qm1y2mC9/dqDbZryhdc9R6IjuT3cNWpoVXgTk9IJ3grX7J5w==
X-Received: by 2002:a17:902:db10:b0:215:65c2:f3f2 with SMTP id d9443c01a7336-21565c2f650mr253229155ad.6.1733278235600;
        Tue, 03 Dec 2024 18:10:35 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2156815bcfesm62785115ad.215.2024.12.03.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 18:10:35 -0800 (PST)
From: Ming-Jen Chen <mjchen0829@gmail.com>
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
Subject: [PATCH v4 2/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Wed,  4 Dec 2024 02:10:14 +0000
Message-Id: <20241204021014.5083-3-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204021014.5083-1-mjchen0829@gmail.com>
References: <20241204021014.5083-1-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..54a81583bf2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,69 @@
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
+  - debounce-delay-ms
+  - scan-interval-ms
+  - linux,keymap
+  - keypad,num-rows
+  - keypad,num-columns
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


