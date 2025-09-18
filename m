Return-Path: <linux-input+bounces-14862-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB8B85D6F
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 17:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1C827E1CD1
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 15:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5564B30CB40;
	Thu, 18 Sep 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Uefhcdmo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93C316908
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210773; cv=none; b=HxKy0bwDEVjeIIj7nhqHK5/hgcM7YnJi+PX+LKRq/ZJAZIzJzY4nJ/ywQrhj4cYJu/60i3HQGjSix8jFNVM630aoIluUe+hAadrys1WRAkJQKSZ4+3W3DpJupkTfjtrJSCItoOpDC/9/HN7RgV0Fxbie1UxihXHlE22ttkVNNio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210773; c=relaxed/simple;
	bh=bKYvTL8MbcZirvGbcTLtImf+31bpwxjEuwrssdUZtAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNBavlBUX5lgHkqOCrI/PZj4oQlNFPBS+i33QbK3fESUqxG2cVKLcQw5c/IbWZdkfzkquRvevhQIrs2zt+1gVBMk40EFTOpEffiHc/IyIzawxZpbywEeHzIBchcXzhgalTFe4/ZXMCBr6bv8d8/THzrUQnWsi/lOgVdXOgjQHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Uefhcdmo; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07dac96d1eso334848266b.1
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210769; x=1758815569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lcdJmzD84uDfab79lyqxcqnmMvBiautmvBU6m3EhEI=;
        b=UefhcdmoBtjBwTbpcnAf2ErmCwikynF09gDihaFdzPqKJ0v2Mzm8yS3yV96nujBc6I
         PstEwlyp2ljv5LlCQGlPSujTgyxGC2bSltrJOGUuOUhPkp8wsmSAhWqBSlAYWOUgH/Mo
         ENwSameNP8fNnt84kP+QLOAhwQkiaEWAQ71J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210769; x=1758815569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lcdJmzD84uDfab79lyqxcqnmMvBiautmvBU6m3EhEI=;
        b=mIwDnUm4hfyOpG/80AybCLSlaCQg1MBeuzbV77tIZsxGn/ufgdnK5n0Xw2YJzOPFK7
         ehwP6+LkXZi/0jL3f6apyHC/71SlsnePgn0tVCtnyPIHWCFIkzPoXPQa6i3pY9CsmFxV
         /Qh8Smzyc6cgFI+RSX9cwtS0XTUsEpw0UHMa0gAXYCY6eOYeKvlLMnqScXiEh7/l/PIi
         SpWNjkv3uvEHxQEozMbt3ybSPvNR1cr3nQlgGENBuY3orPtFnYE5aH0GLgko1szq22nl
         yiAwUPnvVSBqqednZxaelBGtPE1bAIfP30zz9U0Nlm/AIN4RbBcTQ7bm8qPpcg5eO8ry
         g33g==
X-Forwarded-Encrypted: i=1; AJvYcCV6hJfHEelJxh8PUasg69gL978tiPe07dR/JqultVceqhn/Rf489r7Ig7VBeDWhgiCJTqo2JbosGbdyPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZp0SgGuo7uSMvSNdnP9dK45mwdH6hwzN48X5gPIqYdvMJ+0Is
	q8jTCA2rRg8lWxoOpHEHVwgmkyAdeYc3DlirvTwcnWkx6VcYweA8l+W9w9jEOK+6CCc=
X-Gm-Gg: ASbGnct7egerpiCMHLbiVsyEHWz3bgpUKW1WJJiee4gXst+NT4pPDdOTMWtrvp8nE1d
	YOicv0+0l/4c7XNWK60wCBpa0CrQ6oOZ5BNu/OLgvwyW5cNtO/zqCRZItkvWnRyXlOqUAa8AvvH
	l/9anGxsMhnXGlXmOmArk9sb+co+KazetF7GtvMh1rVIzk5c0FIjlbjN6tXOJVavrr5RVxcXNBZ
	UJPwYCoXbSznITYVHk/Ur7K7JSppLDr+aV5pHodyqZIalQ4279vsOsVYFBhsTMK4V0mMv1/Z2ep
	s92110MA8EDiod9981enbXkkYrdaz5Z9fM9M4r4Z5yY6iPPcNi/Gu8uVMbqV7PVXaLXTIDqiN1l
	9vkrp9JZ7xjsAFvKZjKTrYHujSU03n8CvmsdTr5ZTwr2yCsNVlWzzjUFySBwqiDLClq5hIQDb2p
	ckGeuKFeqdUfMgPkNveOsvFbsYhToDgJ6hO09sYDtEzS5Ns8pZJszL2ekIuysftH/Feam3UksnJ
	lt7XoNYcjs=
X-Google-Smtp-Source: AGHT+IErelZCb4Ng2hNIph4lDPD33ehWDH5J7iXux+fMT/vxxySG4ibwfi79WajSIooQhiHJCIIbVw==
X-Received: by 2002:a17:907:934e:b0:afe:ef8a:a48b with SMTP id a640c23a62f3a-b1fae7a9b82mr410713866b.30.1758210768899;
        Thu, 18 Sep 2025 08:52:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:48 -0700 (PDT)
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
Subject: [PATCH v5 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Thu, 18 Sep 2025 17:52:32 +0200
Message-ID: <20250918155240.2536852-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the touchscreen-glitch-threshold-ns property.

Drivers must convert this value to IPG clock cycles and map it to one of
the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:

  0: 8191 IPG cycles
  1: 4095 IPG cycles
  2: 2047 IPG cycles
  3: 1023 IPG cycles

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- Adjust property description following the suggestions of
  Conor Dooley and Frank Li.
- Update the commit description.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details.

 .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..1975f741cf3d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,20 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  touchscreen-glitch-threshold-ns:
+    description: |
+      Minimum duration in nanoseconds a signal must remain stable
+      to be considered valid.
+
+      Drivers must convert this value to IPG clock cycles and map
+      it to one of the four discrete thresholds exposed by the
+      TSC_DEBUG_MODE2 register:
+
+        0: 8191 IPG cycles
+        1: 4095 IPG cycles
+        2: 2047 IPG cycles
+        3: 1023 IPG cycles
+
 required:
   - compatible
   - reg
-- 
2.43.0


