Return-Path: <linux-input+bounces-14710-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74668B56ACE
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66038189D091
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 17:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE7E2DF12D;
	Sun, 14 Sep 2025 17:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CF7mrgTM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A32DEA97
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870184; cv=none; b=pv3RnoPs4ldvnAVPZD/L5s5JWiyaPlW0beIt5xuNTzOXcVJf6/UiXjyuMwntgg3satdi9zLF+3zEnE6L6CKwqzspVPRCay/O3HbVf9uJnDHaq51q3OfbNeE6+wE2nKT7QgKIqHv13l7GeEPr4OPZUI6FYg4618TxH7md55l6tAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870184; c=relaxed/simple;
	bh=RJXStlwzS4+/UQXUO3hnO45i3KP2svoFAvMb0SbrmwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OzreqHZf1cWOZ/4IrhaXqP+EYkfNTI8FXgxk2kIA+hyd0GNPEXw8yJUURptWAa5RXT9/s4Na9EyQMugHItf1eAAycL82S5yL3NP+AM+4/za1vftjl+Wo7NjygheZ25Eqw36P/eLdAl0HMUM0HXwtOygMhri7PNmMnSacachuU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CF7mrgTM; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b04ba58a84fso460066366b.2
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870181; x=1758474981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMdgI0iZ2TvocV4JZ7DyZgorR1pQL3heQi0CeqfMARw=;
        b=CF7mrgTMDalZ3SCRHrEyOUgyTsYwPAy+4kpAHCl27Wnnrgm62ESOw4PGIK15JJy1g4
         Yxv+FreXh0s7xbb99bAbtIXu+RG0Nq+ORO5LAVOfvhteDUojSKyeh1zYuI0kVGx39Qhr
         AnP3Fn65Nv0oGyGZWCMVB1fhA8XG2JRmO47AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870181; x=1758474981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMdgI0iZ2TvocV4JZ7DyZgorR1pQL3heQi0CeqfMARw=;
        b=AvCRL07YuzrjsuY9E2GHzifMuF+YGDOu59jdhwnA+KUWlfIS5S3OS9Yo1ZcPbkPFS/
         jNdp3DTL0S+stkrHVeyXZvvTEdEHUhtIuypT3EhNqgP9Ykw9oU2FBS4iYs3gvMXlrgYF
         /nNGYbIRszSel04FY/MuvQ6vY4c5x5UHxFZdqKpZ0EujGj0tbUBxZ2p6+d8G/dNSzfkb
         BIGLgrl7GPo378HqD0EBM2AVe/L7R+vWP3yFzd2qUgUsJPnsxI9YKw300hybpYyCGafz
         LlUt8VWSuEoNADBV21G9rBjCSTcwca4PZ/Buo2udgPoj7TTmw5pgjIFRcNJlEy9njPUK
         Sslg==
X-Forwarded-Encrypted: i=1; AJvYcCUzW8gADCWCZfNdlOj/bpZ9AXB55wY+WXkhjDZuFway3r+053ONqd5lTbgBpuxNeYQciBrT3HsecSjXJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1DwwMfreCol/Vr+u+D6gA1KhPhiZGg6yTsryBUKQc9avwoNBG
	G4qscMBvJqMN7U+Ff4ccjXMfzAEOLqyZAx1xaZnTbFuHh6Yg9l8HrzLEUeKDYh0G+jQ=
X-Gm-Gg: ASbGncs9DWWbjMM0wHsdE4cd6NHdiVGX35Ruvw54FayNx8Usreu9sMq/9e2PFaMdxkp
	8I24ewhJTy8gTil69UkhgtOXkz+P6Upbb6vvaQHwHK3zy1Iz8GKXRhe30oGBB3D19o0W5lnxf2K
	hhntg/7opBzmEtDu8SbPaWDivgwGNCEcrsRlYMMgwpYcQYwu5smDmyJVm6jpGtay+TIsqqMD6al
	pZIv8YjYVXnmobA76QHU+diLSPGANt+5873hSrDEdkzHNz3muQtR71MuzpvKjvwhTJFIpThzJTQ
	aHgci5ccB7rUepG+10FTzgTTUzETFWKY6ywtE1gZRqryR0z0Y+rx3W4i+BO3apC2Gajmlns4QIW
	67mu9pKbbHD+JTPifpqs0ViwsOG9cuyz2Ydsvk8qnB/OQO/GmdDhHKKEFAgOZfCnj5zmmJNWhKS
	GU1Grb8pPQy/P3stvfInoehQi9w6eCN+A5GmEvGOjp+KhqxJ+/fWMWoBI1vn87p8zr
X-Google-Smtp-Source: AGHT+IHfjFWKG/mF8+Rc9t6eyI85z35rKOGB32yV2tBXoq5uOjqdENe0BpELyw7Da4eiS0RVUPNPpw==
X-Received: by 2002:a17:907:c08:b0:b04:3a46:c4f2 with SMTP id a640c23a62f3a-b07c383f1bemr990265066b.48.1757870181371;
        Sun, 14 Sep 2025 10:16:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Sun, 14 Sep 2025 19:16:01 +0200
Message-ID: <20250914171608.1050401-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the touchscreen-glitch-threshold-ns property. Unlike the
generic description in touchscreen.yaml, this controller maps the
provided value to one of four discrete thresholds internally.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../input/touchscreen/fsl,imx6ul-tsc.yaml         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..310af56a0be6 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,21 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  touchscreen-glitch-threshold-ns:
+    description: |
+      Unlike the generic property defined in touchscreen.yaml, this
+      controller does not allow arbitrary values. Internally the value is
+      converted to IPG clock cycles and mapped to one of four discrete
+      thresholds exposed by the TSC_DEBUG_MODE2 register:
+
+        0: 8191 IPG cycles
+        1: 4095 IPG cycles
+        2: 2047 IPG cycles
+        3: 1023 IPG cycles
+
+      Any value provided in device tree is converted to cycles and rounded
+      up to the next supported threshold, or to 8191 if above 4095.
+
 required:
   - compatible
   - reg
-- 
2.43.0


