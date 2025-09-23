Return-Path: <linux-input+bounces-15010-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D8B965B2
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 16:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857824464B4
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 14:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BE426A0DB;
	Tue, 23 Sep 2025 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="O8TbWdkV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A121ABDD
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638280; cv=none; b=q4AOV/xp0Xvqgn+Dnz1nSLwsaUJdHnLNUx6ObQI9HEhh9RzzMmSXP8ZN2YW+e2tSvEbQnpz1TUx9tgHknuJj1y6c+Q6t+Qi0p2UASCuSrJioMKiWgX+3IMFVu5LcDWUax4EHSEPcc6N6WKzE2kKIkaqM79SBPudrO0/5yACCGkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638280; c=relaxed/simple;
	bh=IAi/8O8/rULM+WO/P3gj9Rt/deukKZIeTgVaOnY7B+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0hkIOID/aRcBAG9ELKGPfQHpQnCkkR/5UhgSHdXfRsDXToFQCUq1PDKriO5fLEMGOIRgbE0zS6vgQn5oUzXAgo8BC1ayTi4XrM36Z0i6xX0qmZkIW0vdR1kSfgsyrjr7EthEFxr2eFnFOIwNdf82rmOk+yvS0jqhwnPOMsax5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=O8TbWdkV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3164978f11so76387466b.3
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638276; x=1759243076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUcTQ2up2eOa5np9juHes8kBZBD61IeSVgwAmot8YUQ=;
        b=O8TbWdkV7XA9I12YiAcfwvbRarhww+y0EKzGH1gqzy2lyynkFi5ckxJ+Bn6bUTP5MV
         tOtaPawLMgAnYO+31lC/XpfNwyNhJV4M04b7wa3pwUOj5IcWDiWgCfJbvi+y/3/j33QL
         7jWyufzgkCEEz1pGociINjv5egzsHShdH2DzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638276; x=1759243076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUcTQ2up2eOa5np9juHes8kBZBD61IeSVgwAmot8YUQ=;
        b=ANV4AgXONEJBmmKO5ULd2bhP0clafpVdhX7Wf8Sf9gx3ZyDE/lKPo+ZYzvna6X7ANP
         xsrditUxe7/qnFj4c52OHTBXrgyBEXj1vZzJykxqjsxPNQqZr9C+cqC8l/1H2jR2o1Lq
         yBn0it4RXMEZajeyB9PuaCoX0oXFEm9aScBBbX8dkyv8qpUqq5CXRgvYTboKeeV6eGnq
         nZj8teAEkA4CQ/yUzzQg11EBqNFIWogN4DLjOCt9D8uyOPXsjhnvz3+6pRIb6M0PNv1O
         UxO0u2dwqmr/zz+3UowErQ5M+8VKIGEp66TygEywVdrdvaYA3ozfr39ohU1rS0Q+FY1w
         REdg==
X-Forwarded-Encrypted: i=1; AJvYcCXuiyjOIM6068yqKlQ8LvPwvAWjwGQzqL6cLzT7SPdXhIQt8+HasUmuwBfRUNmCItub51OKoUHAOBqA0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAHwK3uo/k5zGyT34PvRqvq1KvQoURKou5hZfhoh1XckaPxXEl
	5gEEMeEHr26rz31mGV0aeX1DLDXrZPJ4KNV3SO0oM0C6gWwSkKH3DNbI0r6BE63x+6c=
X-Gm-Gg: ASbGnctyWIohifPXs+XpoYs94KsQqb6rlErkRDd4vUWRSRFdja6ibjzk8pCXAWH4UJz
	4OzluSIkRIj4r4sYjJQ9k09uEASl87HaJbHuV2a0+XdBnjBgn6dl4d3yzmbEO01FX8tmpJODMsF
	J5BDIFtxfFEnY9Rkan6L29mZL0GAfkC9//rlT5kUNMaV5EbDhvK9IvS+TCcyOMYcq4Lv3aN2EKQ
	5rBXZ0Vjrj/d44h+HrpOZBkm2sJU32c7cbjWigLRq+XL/snuferIXNv9I16L1OO5rMgPDHc0ETF
	FF5r9NjMsB34Z5IyPjP3Q4ZhZAD1CpTYloUCBlUOrHlppoCXLI+HedSIh5PLxTPCGNL2BnU5DMt
	NFLKu0qsTenDVixrKD0S/cq/b8hjbX6ySQRbVTwF7KR9zGmww452bSfaBJwduA4yhCbBCGzD4hz
	kkxSEdr+rnqA+ZFe0FMdEZOzmud5j++90bDkYOWsDCeV8WgltXnCx8r0jKVB43L7t9
X-Google-Smtp-Source: AGHT+IGDPnG7HtZZOzHzDzOnTvQCbphPIOssxaWdLijuYXdOKqbHAb1gXG6TbG+I7cy+yOigXJi2Ww==
X-Received: by 2002:a17:906:f58a:b0:b2a:dc08:5914 with SMTP id a640c23a62f3a-b302ad3922bmr273199066b.45.1758638275808;
        Tue, 23 Sep 2025 07:37:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:55 -0700 (PDT)
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
Subject: [PATCH v6 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Tue, 23 Sep 2025 16:37:35 +0200
Message-ID: <20250923143746.2857292-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the debounce-delay-us property.

Drivers must convert this value to IPG clock cycles and map it to one of
the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:

  0: 8191 IPG cycles
  1: 4095 IPG cycles
  2: 2047 IPG cycles
  3: 1023 IPG cycles

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Rename the property to debounce-delay-us.
- Update the commit message

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
index 678756ad0f92..a99280aefcbe 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,20 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  debounce-delay-us:
+    description: |
+      Minimum duration in microseconds a signal must remain stable
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


