Return-Path: <linux-input+bounces-10733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D35CFA5DABA
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 11:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5179F1886E3F
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 10:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E54123F39D;
	Wed, 12 Mar 2025 10:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K2cmBkvS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F188E23F390
	for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776240; cv=none; b=c44G47PskiXzEQ3UCeNWUjFPGqyKeXrfPn8TCn0QVGfIHAW/sEjQfeQp2DkvFROF/SiGqcdMlIjlhMXYjxKinA5fDmAciK2vmkRHFdt9IjSbtwOotS+mU1YX2DPisFNqjlSR2qMCGWcch4YONYsqrC+tqEj6XhA7wC6bDtgKcDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776240; c=relaxed/simple;
	bh=0DwS99z488I3Fc/El27D+3T6XkxoLUUqA5oX8NRuukk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KM6lZRRuOsyWZhCmMFjltL3+XzYcTgMkEi7HIrINXSjwchEG1sllmOIVc2YRS54Q+nV7ZtT/lZ6GjixUsl3qy9tPjeBcvT3vtaSS0VzXWHlI54lKgbLHetYmPWt+MobxnOUghnF6rWFeVmWh153uaaY3DcO7lLJHdTyyXbo6V9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K2cmBkvS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224019ad9edso145426645ad.1
        for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776238; x=1742381038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=;
        b=K2cmBkvSH4sRqImh/4mGMwi1ag8jCpgdCnbfyaCPclwSA8F0MBXZdnIRTjokUI+Gn3
         0uGdhx3bWL6XRws4ecn1d3p0WRyJAr/UJmF3oDvMpaahe3Kh8+OnEMJFbZOVcHS9qXC4
         0w2CeW3lYWiWRyhjYsAuILzt6ExjagH83XXX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776238; x=1742381038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=;
        b=tkrRknqiv0vWL5LoxiQqnepkvSbK5MVS60yhBNCFl+648JAX57uw6KOpJtqif7swLf
         ovZh3UpudSR7LUnnmon5SuM+2DPJv/ryu+aYjas97gO2eKdG1l9zXL65glF1q0aNv++/
         6jsKNohQ9JRv4y67rLGhK2JtWBTKLFrexVdkZbsXcB/1kRZaijuqE9B66ZmZrPRNhbfr
         MdoS+6xRf89XtOlAfObxazTqFTQBD4iCADcE030M07x5eDateNEZ8Xm7BZUEWtNnT8g3
         0mKIj8c7rECRMQ9ADdSv/IMaBDHU8Il3WiGZTRmKrFy1NckzTzRhNZNH9Mkxyd1pTWZi
         XkQw==
X-Forwarded-Encrypted: i=1; AJvYcCXy/4JK9cqJKd1UzDV6L7WGDwWP0EU4xxE+BVK8nx+Bw/8XdCdlbSDsd3J3cT6MH94Qi7fTURu3o9F2SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3P7wk0GoMifIM0IhX3gGusp5NtVRZ/EJjoO62h2gSlowCYmV4
	DbKRDytCBUQ8whOO1KFpBG/uq8riwIsDn1wcr8aeD9nlSA5NtRSZ876uNPtQOA==
X-Gm-Gg: ASbGncvHfK8V6EBYTa3cF4oImnNCOKKWPnfzB8/orA7Xpx0pr3iBM/83+91UeNZeRit
	Kte08xQd8FlzLkNIYaiepCeM83V0Y4mu4Xs3JZ26H8z1NTvF4qjj0yK37uGyBWIY6bWs9TNs92Q
	2EF/H8ivYsQp5l3q1g+YU2rUF7JKNWHbR+9DLZLcdZUelWQSDcj3gXWVXX50GZU2iWkqyU8971K
	9otir4gvShx6EgabhbKBRjXWGuJc1FuFJWHdv8BOGIeQAdm3QGliLQ+7iCivGRz+KiJCZc7t8MD
	vTqnFvs23O9a3exdvNFVM8ybkDun+z72r7zIg1Ri0ANg5gEiawaLSg3iQKYhKF0=
X-Google-Smtp-Source: AGHT+IEi3t/oRgH4tgJIjV7dZt0tXAW1XWislifFGuRCmj9fEunpdxZYOlzBA/knNfUOTDyGKEKM4w==
X-Received: by 2002:a17:903:2445:b0:21f:52e:939e with SMTP id d9443c01a7336-2242899465emr387459965ad.28.1741776238354;
        Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Wed, 12 Mar 2025 18:43:36 +0800
Message-ID: <20250312104344.3084425-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..49ddc504c160 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -339,9 +339,6 @@ properties:
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
2.49.0.rc0.332.g42c0ae87b1-goog


