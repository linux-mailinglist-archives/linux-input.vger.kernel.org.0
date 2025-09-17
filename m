Return-Path: <linux-input+bounces-14791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD448B800D4
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 16:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8F70160845
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 08:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6323090F1;
	Wed, 17 Sep 2025 08:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WWny4WVo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48470308F14
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096347; cv=none; b=kPZKiIuzwO8mucFDIxs/JS7eh+bt38Wq63V+WRzPorO+XCcHK1Gv7f6OQAVKIwh/rqQ4fJNUOA4Bh0anb5oQHfMkursHTByJDxSrpMCEFvmkT8AsM4YGe2Z+075+9OInrd6FHpeNoxbr307tgpnTn7msUQR66lIZ8xDW+52Q+K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096347; c=relaxed/simple;
	bh=is+QmPpGFqnxwUe0KKjrEay6S4ZGinDIfN9T4PpumlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coTKvAj71kfCEL2IBg1KntbdePK4ExNsDbXUg4uYQ8TkmlhF0LQbCNU2IqsvpR2SM3a/F2uReAO3Qg8FJHO57fIgFYXFSLAirG9zmL3rWa+ztkCsFPI8qyYng+tUUK6hY4vpHcVOCTyLJUXFEH19nLUNm7/eHD+V9aDzOJeZSa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WWny4WVo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62f799a5b72so2003166a12.3
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 01:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096343; x=1758701143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA/la65cC0J/yoE9Qt381Ko1XSyZ3tw4GtydE8nU3zI=;
        b=WWny4WVo+X6sRznOgMwvWCbSS6Ymekw+fU3m9vQmMdJX77oNMt2MtKi2+2Rin/MSeT
         rmPKbxJizmI901UejvCxkHJ2QaCuwzlm9xaMLYrmp2hVg8FSgemNqQ+8kmDWCXqS+T7u
         B30Rb5+lC6lYRblUOQBDoCi63eW5TmqCkin8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096344; x=1758701144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lA/la65cC0J/yoE9Qt381Ko1XSyZ3tw4GtydE8nU3zI=;
        b=h0d0KWAc/ec7yAV0w3kcsITenAaQkZ6l+aDCNtrW8XgWvlG/wfVG391zAkgl7DuCiP
         T7kz0YRVTyJ+FDbU/wv+DIgBqUYgvXkoj/JidcBLGRHGIOKpLQsIRHLu6JOnZeAI5dv9
         gFIv87xcRuT9I0rdIh6ufoz5mPwk0pclGhTUGFSHSfsbIO85YsHvBG7XnxRMN1IY8Mbb
         vUZRsjQn/PSPJ8EBuItD80LoqDWyI87fcDJqXR76jRJrFnTMeWV8KXfRSbyPX2/ppSBR
         wxprBrPEbL9jDfl9J8+WMdtBXcog7vI5xIUaWb3PuWb11Q8p30g/sguuS55AKKlG5dw9
         +P+g==
X-Forwarded-Encrypted: i=1; AJvYcCWKgfdCa8NHJnDt3RQmjYHevatiaHLaMqWGXq50N27+vyodAPTk80tVvxgKIJxdENAnXi+4TinNmMxUsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDQKE3Gi6SjE3E/KGoO1Bkx9Z7D7l2l64VvF/6KgBZRlBlxxU
	YLzoz1q4GDVqGyKnBQZmhYEZ/EvpH/GUjkagN18xZKOeA6TNQ6QfytCJ3DraClBMi7E=
X-Gm-Gg: ASbGncuyR8acMFdaQfIKfKGpIOS2nP7eOmjfXpsDpG0aNYFIhgjT4oLaoDkb8jKp6XA
	UY12e7bfkV3F6g3aweRJAzn7JRuWEgCBrOybrb2lJnHsryYzer5uiscNzmkCBh2zRuV0+dNx3ET
	8FPsY7mwVPEG/Rlw4cpaUzL6JroT/FpTayTGy8Yjx4vaP/iKmejYagjBeHYOEi1Z66caZOab9S0
	JADQTO5WanPbaKkPHJg6ZiXYVI5TA4zZ7Wr7b7/IOmVHny7OBH1qKxtH455nTGczMcOJkwVuwPO
	aEmypDu5SE3xSxU0tJG0chGdEBM+4iWq0d7hJPqnsyTlwf7lR7N6Vlk4f4RSX3gWxsspSvKuamN
	dT6o0QnA0ceWkQPSHM5VYEdOLoJ32IJONwrqAphz0SWTRD4ahF2j1NC9XiW0=
X-Google-Smtp-Source: AGHT+IHgnDmHgbGe7M2wf+eae5X2J65rFCbRDo8gVvx92rWiaCFtz+XyS2dWxPaksXXrHlaef/NgWA==
X-Received: by 2002:a17:906:d555:b0:afe:ef8a:ac69 with SMTP id a640c23a62f3a-b1bb7d419ddmr158716766b.43.1758096343566;
        Wed, 17 Sep 2025 01:05:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Wed, 17 Sep 2025 10:05:09 +0200
Message-ID: <20250917080534.1772202-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
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


