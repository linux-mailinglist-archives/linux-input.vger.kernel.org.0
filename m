Return-Path: <linux-input+bounces-12926-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD061ADC489
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 10:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D44116C76B
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 08:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B1F293474;
	Tue, 17 Jun 2025 08:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dycxxRg1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285D22949E3
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148418; cv=none; b=WkV9i8HGgHAxXmOHL5qKVJ27m/6XGSfKGEXmLM0DH+gRcoECkOqXq6lVuB72OxQrwpH0NsBuiboK+gQKxNeRadmwXqfOwPXHBOjGb/YWsRMjjWmgSp8Hg/Xwzwb0zt3BocNdmkHnTXq3OEZ14UwglBagexfDDnt8yeoXFkHhGpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148418; c=relaxed/simple;
	bh=UxAuiy3peyOlwLJBGOPsPiR8T6DVdxWS7Est9l1Frw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBcrtnt1PYyjjfkNSqQN7WUwRGPjFyvOE/oPh1OswbQ9NTJsmcj6WlJ84hQxkb/FoQQtgnt3FnAWf1T/2+W7nwi3MiiaLwrXy8HwbMyOJjx1GJwfxU6gfWG8WY11sNL+wbc5McZnWxxwbltsJmhhHGO3mhV2sxPlWQJAs0fOkf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dycxxRg1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234d366e5f2so70483485ad.1
        for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148416; x=1750753216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=;
        b=dycxxRg1MQFA+QY5WXQUEmRBQCKew+3Qv1hNIdOhEyqmjsiabzW5aiSMJXy9CJ3HHr
         DwyltDia5ZJl6M0jbflsrENZUlilBPKvV2aP9vMoVcuT2FtD1kUSG/JgRevQGoPo9qxb
         09Sd0g/xpTLPtRyz/H6C7Xw/ElgKmPnDkEzVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148416; x=1750753216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=;
        b=ViUGQOW6jh804A697j/XyYXGBgauqHVHWRJc8sfcvV1791U7uJ1X0D5jAD6PMSZRNe
         p5aBpYNQTNXvaw8U6ZbGEO7chycTGIizS2gm0gbfKge6Puf/pPpvaC5maemYhj7AskKe
         azpoc3Nuo2yceXYEMK0fRHksF4qr0opRs23R0fvjKkpWkYPW2y8qNFkQc90BN0cRubhJ
         6Oq26msif9yzdeqs4k5xqxjg5jWHBaZQoiNiPovRfAObezawpzhQ76Q8VmS9SzbFPBFB
         BGzRQMHsqatWJo6CkvN0knW5CN9Z6qNSHsmMxpQg0HxRkcnH5a8clhywB6GU4bsTD1hP
         MzQA==
X-Forwarded-Encrypted: i=1; AJvYcCWIUfk3Worqf8lQdYc4BmMHAxpeI5MEhT1TzRrQVR6fNItwdXymMxbJG/y7S/BAIE+ANsd6T0xZ/CtLgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgY3aROZAdW7VVKf+cy621e24xsLwtrEVeMX4aHZabbbNC7Rk
	q12v6eE3ekaExDfWbPKhQnicCUjzvlDfb3dfVjZI7UITbGgzyOyy1qp5Sxi4Z+A9MQ==
X-Gm-Gg: ASbGncsHl7vUJMAdGvcgecOcMjHmQva0nckPG5d1baqqCoRub/qsUauKNV0pilzCXhS
	CVnxw0fCATO8Uzh9fKVAcMS8pAyD4nGVn+6hm5hrbummsgcWBRf+TMonClGH6xPOIxiv3cVjj8m
	7e5pnlvMDZAtcnLHUfBRA1OhDuHDeCj54VEJj6CCeYFCKgoYy1NjFMxK1cZ539JvbapcM01M87+
	ZMY5/nEg+GTWEYMgnwdTYNpOJFBg9MoqVd7ytX6gJG9iSgqmdcUw6Ax/KwaEki+f0eR7GjgQiA/
	epijr+lpcDarfDag8BjGNocnI/D/niD8O8bGJyldCxgtah5HdammbUgClsT0uoUSZIJtRLpGmdb
	a0vcD
X-Google-Smtp-Source: AGHT+IEDu/d0gvLMPkfg382ZhcCdbDKZbFxmgqE3AqPSqBv9agEnIVcL4Kq6GKfMPiLzVnBd6My2XA==
X-Received: by 2002:a17:903:24f:b0:235:ea29:28e9 with SMTP id d9443c01a7336-2366b3c35b0mr200531685ad.38.1750148416513;
        Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
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
Subject: [PATCH v3 3/6] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Tue, 17 Jun 2025 16:20:00 +0800
Message-ID: <20250617082004.1653492-4-wenst@chromium.org>
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

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2032b0b64ba7..a4d9c72d10c4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -302,6 +302,10 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+        items:
+          - const: google,squirtle
+          - const: mediatek,mt8186
       - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
         items:
           - const: google,starmie-sku0
-- 
2.50.0.rc2.692.g299adb8693-goog


