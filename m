Return-Path: <linux-input+bounces-14583-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F57B518A1
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 16:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50273483F3B
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 14:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FBC322747;
	Wed, 10 Sep 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FGr4p1mP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC409321425
	for <linux-input@vger.kernel.org>; Wed, 10 Sep 2025 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512765; cv=none; b=uwggOu36tGpbS4tMaRYo0E7Oo9S2tWflDPtoXTkvWtogWSX43fNSwZfbtsf8UPJJlscu8N+JqsV4DSR+6Zk5q6CJJ90ky7intVTAB+b5ryPq6rJ3avUHat/sg6rmnnN6sBeu3FcrmQOHAUo3wm3HPQwT0l+DOxhYeHpY7jIU40s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512765; c=relaxed/simple;
	bh=6DM9dMZAtcwlDKvhQvsmdFJDn+355Evyd4COdeLDukI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGEtNwCTRttRS7gpI8ZXCBsoNpTL0uHxFM/bwSO72+jWqyrlYveTH+1L/Ml4r7p37NmhgddaWVhwaZt1N02SbUnDYsdqE/g9a86cmiE1FwQC9HUh6ftAaPgREsMlItJbKiIVLathUMyvYoy8rrV1205M2buh3DeS38CG10q1Qco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FGr4p1mP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b045d56e181so1022169166b.2
        for <linux-input@vger.kernel.org>; Wed, 10 Sep 2025 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512762; x=1758117562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=FGr4p1mPt3o3KMsqm8t8Vr0lNxxODvzir+BfjRbAffjFFbeZcxFSGZofGT+rqfR8ct
         hunTWYBhA2tI7hulGU4SAIUjlqnDWJgv2uOsE+dqfH3stDacSnRPz2qIDTRi6T/0vsi9
         9rUgJiztKDYtwq6tWB9ByfQmpv+vi6Cq7ZQRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512762; x=1758117562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=RIy4l6/J5JotOkgNdZQhEUblU/1uTLwfqowfdO9y1IrKbxrElP30jrVWqLCpal6Fj/
         7i3Xr2CDFTtfzVbiCgXOvRDLxj701KotarGiMDTpdpJ0S4EEnxhaASnVOZTzJItozQI2
         1zp58Ds75+0hEwbNjn+941a0j0Oe7CR1WOQyz/mxvG3B0dK4tG6S7gL/zBbdOMidMkVk
         qDS9XQaozZ8XanxKZoRCpyKR6FP8jBCGm4ivKmBjtl84aY88EyraSH11EoXI+zJEAF++
         oDEOrfS1igsM6DPc0KQ0dr0iORKg3E9egQpBh/MrLKpYWwXtFtKdhoHTq7/Xv8Ve11/7
         vuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH6yxBElwIf4gXBDEfSocgJ19FJeTo9dhXx9gYbQJX91ybw8Lyu6Z2pSOsHisOYx/neObeg73GEhFXeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG426VGeJQ+BO5w8sMEOgulItm7/Fkq9X5x4gnZKxN8htoVrzT
	Z4VF7KMhf+9gSMmTk42/jiy/dLk0RX5/SFpP9wb8L2KKLjMgBKRrbzap5Ln8if7RI3w=
X-Gm-Gg: ASbGncvRWBSLEJxlqb5EFIFMpcOVf94rHkfKCrmqOuPi91aujLRPlMhxYpW3STrAgsG
	tIA2XXckv4MDRlRECFMQoxa6rKjfzuzUmjL2yxr/CugIeUsje1QoCVjQONmIYRPSR1Vi1C7bI1S
	h7HdY+4AR4n66nL42n/K9EgvfC6bIrNLwowONxTepr76a/qjdSQPz/ky2eI2v1MWx0W8Ixcxe0/
	AtNbSBWcz/4MUO4RajlzGQMrbpniz1mi3OlxTNNaWVBQTsLZf8nYRujPl2/0gRxfLMQhFd9ht5c
	JL3VlUh1btzjJHZsKBwp0e2ErRpr0XSg/Vn/VV8iECo+J0G9UscemqG42yqI3GODeEZIpIWp0w7
	iPWxYFNNo/hg9vGJMR0SAqR2NnJvBcxkg0jsOWzEb4p0cICawN48iT8BsC6tKYFWLb87IUwSMfW
	1gMzj+yRyluxgY0ku4KZ4T3kks4FBJY+gohh3IZHMUT/eNpzaIo07H+3HvRpLIs2Lk
X-Google-Smtp-Source: AGHT+IEwFKbwXQOp9vR5RWBfca+LwdgNqWC2NlCsLiPo9Z3IGD4hXe/SLsqdKeNLsPpGK5bn7AW6lQ==
X-Received: by 2002:a17:907:d91:b0:b04:626e:f43d with SMTP id a640c23a62f3a-b04b167b9f2mr1190384166b.47.1757512761817;
        Wed, 10 Sep 2025 06:59:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [RESEND PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
Date: Wed, 10 Sep 2025 15:58:36 +0200
Message-ID: <20250910135916.3939502-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for glitch threshold configuration. A detected signal is valid
only if it lasts longer than the set threshold; otherwise, it is regarded
as a glitch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..2fee2940213f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,23 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  fsl,glitch-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    enum: [ 0, 1, 2, 3 ]
+    description: |
+      Indicates the glitch threshold. The threshold is defined by number
+      of clock cycles. A detect signal is only valid if it is exist longer
+      than threshold; otherwise, it is regarded as a glitch.
+      0: Normal function: 8191 clock cycles
+         Low power mode: 9 clock cycles
+      1: Normal function: 4095 clock cycles
+         Low power mode: 7 clock cycles
+      2: Normal function: 2047 clock cycles
+         Low power mode: 5 clock cycles
+      3: Normal function: 1023 clock cycles
+         Low power mode: 3 clock cycles
+
 required:
   - compatible
   - reg
@@ -94,4 +111,5 @@ examples:
         measure-delay-time = <0xfff>;
         pre-charge-time = <0xffff>;
         touchscreen-average-samples = <32>;
+        fsl,glitch-threshold = <2>;
     };
-- 
2.43.0


