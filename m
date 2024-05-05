Return-Path: <linux-input+bounces-3457-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D87108BBFD8
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 10:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B030B210D3
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 08:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B4E79D2;
	Sun,  5 May 2024 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3LNltPt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF3566A
	for <linux-input@vger.kernel.org>; Sun,  5 May 2024 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714898787; cv=none; b=iZcjrX9Rw63mZb5B2ocVF8gRH2hfEI4xS6KgUZJrc/YRfCtJMeNweFw+pD2dQdw50jNbTPYPnrAh+cA+AC/OxrZBdkQt1zOuAZaRtNRGj7lf+pOichV7Qhm7MGlXD5MvdMLy49zvDYOIFruaB+Ud7wRrnhn7qf/5+h/B6Udz5MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714898787; c=relaxed/simple;
	bh=fRj5AQbtFpPAQ5l9HTpcKDEJ0uqHi3XFIHVzaMmxJ68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJVOD3yjT0CvJuaeSGdnZgwMd30mqXBVpAA6Gre/IYdYhH6Gbvm6xZbLfW5yHE7VkX9PgIWOB42JSLi+wQD/pMSLbgVVO2M0HC6Eh5O5CK9RL1lk7Zd/Y75GBQ96BBKHjmJLgMXZLMgV4H6Awnf0fi843spsDetPU+wNqdmQ1+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3LNltPt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34e28e32ea4so788878f8f.2
        for <linux-input@vger.kernel.org>; Sun, 05 May 2024 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714898783; x=1715503583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rvqUn0JVMmaEtYEVilljD5LiJGeISCvOsUZtPDUnlA=;
        b=A3LNltPtC4xWNMbpMmDIxoexfABDgmW38k5kcxii7JLnPqhU4Bt8PZyTDuQvsZLV7y
         wvT8CnkM8bXdiOJ82a/NEI+7dHEVegc1QZ7HnDBO6BR+J8gg40NBjyDN4bIOt1FO5qh+
         LquE/KKnhN3HtGkatnWW0dpDclBpeMg/FidFB8s5s5IiSJTiox1H34mhbfYJOH1n0qOQ
         ORvQnJqMQkljB9yLH0nrKVMI+mBM4it7vAEqJXxUHQmES74FWhQYWf51QjrIG+lGYDIX
         nTWFXIoSBOsJmn9wCFpVOd/DaJX1/UEmY9jTY7je+G688MJIFJzXIbPRbp6ekc3VPMuA
         0nRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714898783; x=1715503583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rvqUn0JVMmaEtYEVilljD5LiJGeISCvOsUZtPDUnlA=;
        b=EklPCNOTil5ELnimDZqkRXfi9mnKt8ZdvcP5riJar9g8h3nxcT4/2bQtkeOJortJEu
         yfWiNIi5FhfHLdOCEcJWVlVLlt2iabKA8VVxiA5JDgQfhsJ3Wf4kBQerBrB3jgYyzVqw
         q0GckkcDy9FWALaXUSB6L+wUYHCaP1IDdM3uELQUwCkLDoO9vTwQjNEIj9tKSta51kyd
         n3E9EMjub7OSFedoEgAeLy/Rl5C671oBegyLLRfzXSn7l3s0U2Aqe/meINzMT6g+JMQh
         dRbLtDBGYxzIfNGKrYNAXyNuLyXnbeuHfOuSXDChwNqOtVRO2Forx9Gsip29dOJ9nteB
         SvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvwpZitiwI0WpfYngEP62igL31NSdOJrUYkbi51VgskYDUOh4m+FjGpBO00QuzrM3deZhcAQpemyvqpH/kZYyTg2nrTiSSJ2bWQ+4=
X-Gm-Message-State: AOJu0Yyn/HDQkeP21qWb1k5dxVb/ikxmXJ9BkXB787S+oJ2AfcAvqyLi
	bvfv0z0qTcqGbTMYn6jEFxA6AxctdHtiNHJJQm4mc8Ric8aJXAqqWfr2xc7r74A=
X-Google-Smtp-Source: AGHT+IEAIRhFGaEyDg154ublccIoPbU+wBOiO4gHoxXjddQxdSA8q12a5Tt5YvOHYA6M/h8U+EvPGQ==
X-Received: by 2002:a5d:55ca:0:b0:34d:aaca:2f6f with SMTP id i10-20020a5d55ca000000b0034daaca2f6fmr4816765wrw.69.1714898782639;
        Sun, 05 May 2024 01:46:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c4e9400b0041b5500e438sm11840163wmq.23.2024.05.05.01.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 01:46:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Shijie Qin <shijie.qin@nxp.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: Use full path to other schemas
Date: Sun,  5 May 2024 10:46:18 +0200
Message-ID: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When referencing other schema, it is preferred to use an absolute path
(/schemas/....), which allows also an seamless move of particular schema
out of Linux kernel to dtschema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rob, maybe you can take it directly? Should apply cleanly on your tree.
---
 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 2 +-
 Documentation/devicetree/bindings/media/amphion,vpu.yaml    | 2 +-
 Documentation/devicetree/bindings/mtd/mtd.yaml              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 5b1769c19b17..418c168b223b 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -784,7 +784,7 @@ patternProperties:
       gpio-2: GPIO4
 
     allOf:
-      - $ref: ../pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
 
     properties:
       drive-open-drain: true
diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
index c0d83d755239..9801de3ed84e 100644
--- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -44,7 +44,7 @@ patternProperties:
     description:
       Each vpu encoder or decoder correspond a MU, which used for communication
       between driver and firmware. Implement via mailbox on driver.
-    $ref: ../mailbox/fsl,mu.yaml#
+    $ref: /schemas/mailbox/fsl,mu.yaml#
 
 
   "^vpu-core@[0-9a-f]+$":
diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index ee442ecb11cd..bbb56216a4e2 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -48,8 +48,8 @@ patternProperties:
     type: object
 
     allOf:
-      - $ref: ../nvmem/nvmem.yaml#
-      - $ref: ../nvmem/nvmem-deprecated-cells.yaml#
+      - $ref: /schemas/nvmem/nvmem.yaml#
+      - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml#
 
     unevaluatedProperties: false
 
-- 
2.43.0


