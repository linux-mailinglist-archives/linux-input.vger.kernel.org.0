Return-Path: <linux-input+bounces-12718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FE3ACE96A
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 07:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D541118979F3
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 05:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD57E1EF37C;
	Thu,  5 Jun 2025 05:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwfXkHLq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3DC1EF0B9;
	Thu,  5 Jun 2025 05:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749102557; cv=none; b=ceNbWxSwwwlhY9gdr1Ki2XtQ/7xrh/pB66/fp7Q70T0jNFBloL55jG5vgAE0SP/QTHtXOlv/d6bZr+O173BANbRJHhzklWrsM3xurv0VC+sJ8WTWiKSIFATpEu6tfY5BM7U41vBsDnqZFqzLChRNFr8RDV8iqeNCH+y4jKEJyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749102557; c=relaxed/simple;
	bh=OIKPu2mbiRea8toxJB8h77wHD+vkqmaMLDdTwqVMVxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xfe46hRoEXPEgxlu4zd8S1yxbNZAzfkfwpqhKVNmVsxQBY2r/osz13X0WD0aEjWHiKTNxEDW0KT4Jjt//9gbSHjWq/Tie+0GOQl59N1j2QGeuQFNrBdBPtBfWUVcFULxX20hE8v3zgwDzuzSIvlFmhNVGibjYDkQ6u96W02s4xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwfXkHLq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so1251280a91.0;
        Wed, 04 Jun 2025 22:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749102555; x=1749707355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FudjR0hExklji3S366f8VbcX6MleULSZEQFCVDOIEiE=;
        b=DwfXkHLqJU1irRY6VsgG5Ii9e+W89P14uQSJ6QChUOXh6HFh9EbUnsXRGDD9sTjiv2
         wDwI33XDAYN6L1aDGiwi597tSwLuMik3eoL8go7QdS/FY1RPhLE01P2rrkm1plLmDdMU
         TmxUmt0fC9uejMZvfele8Y5COAgeDFViNte0MnJhc4d47A1iUfa2l9144UtyKRGIuFnh
         C9ufUCj2ACsLHhSzXkUVEZWN6xt/3krRN15mM4HhLsPLHpETVcppp+t50644pt+rnqDn
         935DPC2vHIdB7fGICTs4UxB+eLe8QkYeeEtF1a1my243Kq0BvjLF/WHxLWvEf76rXFKn
         7joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749102555; x=1749707355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FudjR0hExklji3S366f8VbcX6MleULSZEQFCVDOIEiE=;
        b=TnfcZbdAT1ii4eAU0jRZGxN3KalEIb5bnpuEHiBMuIwva+cU5oh1tzKTLLKcsa00z8
         l06HU0EXDUp3W9WP0ncQJv3tpnVybtHx4xpSTU3cPgV/LMMqsdBOjFwwQwEEqmyyVuo1
         leSKCdSrc0Yr9X+aa4tVqgK6y0LOcxdHqcuSTHvcw3FB1Z2hpdVQQYdsedKghH0c74km
         QjxKnfXHEFXl3Cyzg9ioVV2yURVffFMPzKOowuxJkEVZgAvk1+gr6ulInpttwSrKu1PV
         RdlR/tvnWcu5ULIMT6T9uQxQOhUxlxD3ZT1tlrAl8e2lpdE7JARvYgutHU/QhxPM665v
         dObA==
X-Forwarded-Encrypted: i=1; AJvYcCUBUpt4HaJbHdrJj4oJA0VyMHOScd7XYBJsA5iBhLjM5hbMsQ/PzdzG2A/x/zxRsRRZ6o7ZPEpvMLFJ38s=@vger.kernel.org, AJvYcCUn0imIF1L3AQ/bRh176Tesn6TJOWwl4HzZScPq5WHT+Pq5Up8DLdMsLA+tvka4svBgU9pG5X9cDC+c@vger.kernel.org, AJvYcCVFbOVkdjiiGJgQIPXpovHjmtEbhvV2E6tXigvUPPHXfCY+ZEPd+LgA23qjDnQ/PGpgFoMURkfXrIaYkra0@vger.kernel.org
X-Gm-Message-State: AOJu0YwrBQQwqp4yiNhcCyaGOEw+qL/ZqNAQny2DuyFJkMGUBKFw6ply
	iEs2hrhVQ+nN0fz8UybHAU14/LjUmk050WuqrzKdcewDuPtH2M+CjAZF
X-Gm-Gg: ASbGnctox7IlIAadLuc600O1z4sjDAoTznteK43rbMME+kfIUY8cKotMNLjal51gxSu
	zQRV874uGdbLAIbcirlgR7yQBnFiaHdJuPg2bv/KqxdJcIFUOC0o7ZS3yGmAMN0Xi1FWCrFMPmG
	NsBAWHmH8i4phhs3osVZ0PGDnJUQ8mghfCGnj2ZhLBNHhcqADUBa37Rn69S5GV6LzotKWMK6pmP
	XGvabWD77kmIY+DCVEgDgQYdmO7gczSCOzoW9KIqX3/Nlbzk7y9ryYuTCzUMKKq4cipDqsaiS8W
	H5zH4KED7Ajow6MYgzv419RJdSC1i6Ry/cfH+0l0ls/SsEEDag==
X-Google-Smtp-Source: AGHT+IG+cLvM6EBM5hqY+xjSwFwgaKlstjrH+n4gxq3uygoWvW5JHICd5wEp+jsd3ecLswc0sEv3EA==
X-Received: by 2002:a17:90b:28c8:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-31328fa1c76mr3016940a91.10.1749102555130;
        Wed, 04 Jun 2025 22:49:15 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313318e6a53sm425550a91.3.2025.06.04.22.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:49:14 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Yury Norov <yury.norov@gmail.com>,
	Filipe Manana <fdmanana@suse.com>,
	Len Brown <len.brown@intel.com>,
	Eric Biggers <ebiggers@google.com>,
	pengdonglin <pengdonglin@xiaomi.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Charles Wang <charles.goodix@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/2] dt-bindings: input: goodix,gt9916: Document stylus support
Date: Thu,  5 Jun 2025 13:48:54 +0800
Message-ID: <20250605054855.403487-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document stylus support. Optional support for DT properties:
  - `goodix,stylus-enable`
  - `goodix,stylus-pressure-level`
  - `goodix,physical-x`
  - `goodix,physical-y`

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../input/touchscreen/goodix,gt9916.yaml      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
index c40d92b7f..e5476ea36 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
@@ -44,6 +44,27 @@ properties:
   touchscreen-size-y: true
   touchscreen-swapped-x-y: true
 
+  goodix,stylus-enable:
+    type: boolean
+    description:
+      Indicates that stylus (pen) functionality is enabled. If present,
+      the driver will initialize stylus-specific input reporting.
+
+  goodix,physical-x:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Physical width of the touchscreen in millimeters.
+
+  goodix,physical-y:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Physical height of the touchscreen in millimeters.
+
+  goodix,stylus-pressure-level:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of discrete pressure levels supported by the stylus.
+      The reported ABS_PRESSURE range will be 0 to
+      (goodix,stylus-pressure-level - 1).
+
 additionalProperties: false
 
 required:
-- 
2.49.0


