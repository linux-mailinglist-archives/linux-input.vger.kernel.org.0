Return-Path: <linux-input+bounces-12925-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33192ADC487
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 10:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE74F3AE44A
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 08:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3992949ED;
	Tue, 17 Jun 2025 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FszV23VG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22F7291C38
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148417; cv=none; b=psunjmFjHrr8WzdA2fRpLLKwzru88ZA2n6qzNKcfIUML+06qDNWiKFYq9Vc1Xo1ijWIJo4hroCi4T+cvrGql4EfUGMUwNW8XOTS0JmkMNpK+XjhpgDRxWFEePkdGwglE6KAXYVXVFrD57M8IaVygRHABPnAcSMtfaiJPI/diCjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148417; c=relaxed/simple;
	bh=sZ4za1Id7G7nTtjakVPvrhklzZJfNGfC4w42qoWdWUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYVkuBM5REgCYWGBQlztcQdzNn1FeD0X0g3231J3+UOFr1mHZEtCWeH1pxXFc3GDYFL7JDaVeRGk3/MvQC6omZDg3YrCCgdn9TkmLNzl+7GCIv85eziCub5OoNIyrfTQ5Sk08n0Bnhxu6wTiETcnb3q9S+vF2WLBtTlhBmBUh7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FszV23VG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2350fc2591dso49507035ad.1
        for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 01:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148414; x=1750753214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=;
        b=FszV23VGo5soy7GqxhDa8qKGOPpx4ZJMjjJTg/0uTpRAaGcmgNhwDNF7oZyfeVxQTS
         T2NZs4rOdGbY4Ft9XdzsAVa4noz+gFOpJqzBKL26PJznvBmf5hbjUAvVHpwKoqiXIzaB
         PlsEXYnHvIoPcZrZ664znfwMIM+9Rkq7cV1T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148414; x=1750753214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=;
        b=mjYxACmU/4OKiZigfeK4gJJ8Cv+hYpUmxJsrJfY1RNgBpBXA5Orng/ePdsnP0KZ+Cr
         +SALP0o5H/U94JqR3yklmYn5hMAL1RC3vD+6+M/7S2UtLg0TfpJ1+aBRffYGRQVDNRvP
         YZXAEcc/WIRe9X11fsabqLEKEIsyR9sSJJh53n2l1/WLHUR8CVFCf4CPHJS8rbxVQlBD
         BYPDTm7o5lVIzLp2qbAUXuum5NlCXqdmZJVk8lTreHTVvoTrc7W4FJgZSgyIiiURL8R3
         1QTDxLB+2SZQqdp5P6D3PyHi5isvzeMCWC/uoTWBYskoqGK4mTzLdmrnfSFoRzWvNcL2
         gs7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEC66NvZurnWs5ml9UseVgkUNLoCn0ACGy5xuhAbV4VK08szMZWRtYestEVKPdeWVhSw9i3NZS8hSm6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRm4LepGIveerieim4izSXvRS20XNSoh1JNOhbqsWCzJe10nzJ
	ZtWD3iSy0vEnKXP8Avt0X4R2ZrO6xryLNpH/5yCBl1+PvjKpX/qgk1ej9LXTpPtdYQ==
X-Gm-Gg: ASbGncty92p6LE56O1Ndco7APeUb/zLU0OVXKt2bpPvgD+e/w8qYG2bnschilFzJ0jw
	uZygelaMpX5XOX9MLa44+nlWr9MaqMKKowQHkeDGcVTQZ5Kpnxv/+8pwtr2TbtNyjatKQ+R9Z9M
	1aQKeNChjsc6cf0hb0H/Ua2735sUCSHmyPl/8+R4BxaSqwwIqCaspr/P1yG5YltIbvvl+31EXdr
	Kq+BeQ5HcCEXL2DWUale7L/XzG6IkifLfTdLFGCWkVfEOAE9WhvLsxKkhFzDO8VnxAv83nuki2Y
	M1id7//sfU78nKvOUx5BT5zNqusvCs+VkE7T9hxsm1M5OZvk6ZU0ZlwykjXiYWN4ITeIYoFfwSb
	AF4Wa7DqA8ZzBSlI=
X-Google-Smtp-Source: AGHT+IFfpg2r7E+A3hwnVaD8XvFL8a9eXnDD2HrKdh1NTx8ZQ0KD0SKLHARkzMHejSWGfoyIg/Kiig==
X-Received: by 2002:a17:903:4b07:b0:234:b3fb:8ed with SMTP id d9443c01a7336-23691bedec5mr30450435ad.1.1750148414061;
        Tue, 17 Jun 2025 01:20:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH v3 2/6] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Tue, 17 Jun 2025 16:19:59 +0800
Message-ID: <20250617082004.1653492-3-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a7e0a72f6e4c..2032b0b64ba7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -350,9 +350,6 @@ properties:
           - const: mediatek,mt8186
       - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
         items:
-          - enum:
-              - google,voltorb-sku589824
-              - google,voltorb-sku589825
           - const: google,voltorb
           - const: mediatek,mt8186
       - items:
-- 
2.50.0.rc2.692.g299adb8693-goog


