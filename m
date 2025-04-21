Return-Path: <linux-input+bounces-11869-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E913DA94F3D
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 12:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CECCC189034F
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 10:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D02F262D0C;
	Mon, 21 Apr 2025 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P7wHBAdW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9EC2627EF
	for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230397; cv=none; b=muG40uGhqL6FckubkmMOTcNGFH0h5j8nlnPSpOgy44APW4MiDFNFGLPr2lc58t5q9nxyQYTXXTh0wq9+9kXmG9ZAjlmcdThqGxPFgNanGoTbw14K9UsqXWd8DTUCk/WxgvWoWnQEQuM+bypeqclNqKPtTxSq4F752QL6kdXGkEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230397; c=relaxed/simple;
	bh=34zm+yxWUtR/Lbc2SeD4Q2rTlj6zy2/A2wbsfBG4WVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qdh98ezaikMRyyvlkmsPdF28hFsKC5EHqOhgn5EtB8FLrXy0ApbQVZpjhGGxTwmhIQ8vO7YVxIL7Q2j9O4d55z+2edtGQJDQO1n0OuLF3xmhpQOjJAHO4kWRlP5VxB+pvTe20PYHfNE5WhVND4IepQUmg82PPMcjBcN+2zkb2qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P7wHBAdW; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227c7e57da2so33315605ad.0
        for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230395; x=1745835195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=P7wHBAdWO1tsY4cly0bqVuhDJ36LA1IrNEPqKwfouHhpFonk1iv4xJEdC+d5gQ3bp7
         5oI+pzdpdXwrgLJsgKFRATSxVbAbBEjjZi9r0B6YasUvVAfNliKGGzwQHkzg7HpqUm8b
         ilLjtMdWwFEi3LjjGf49JbAjU4pt3XhdjW+l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230395; x=1745835195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=IWP3lYSXKk3VQSE7p6S2JOqhn50ppAf3LKEEIdbgmsC+G9VaEDiGWOtAvBpvVdnWOq
         dPoud0SGqnIdJXb1AYzSQRFuf76A/Yj+7zBXH3h0lIPwboi36erpydAMwczZYaEFS7FW
         0cgtSmgNcoyEK5RpLfTRb4muVDKjUnSAcepzuZfr7abuT48UJ1Zg0LJu2EPvSdQ46n0q
         w216/+ivwyzFj0pOAskgZSjZ4c98Gwg4rBhJk6Nmx2kJp047v2l5bKjWQISqBJnphxtl
         oTtbsppYhTtyGb7KudoVUsJ6/Q/odrD7Om6L5nc1w3DYCX+0ud7qaLsu207w9bHvjoez
         R8vw==
X-Forwarded-Encrypted: i=1; AJvYcCUDKwhM4kL5TmFCUH/I4SOxOg0eSe07reYKbvG/z8qFMjx4zbbtD2GWp7JeG92fRtlHdA5jlvcPeLkQqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws76sYcRIm4rvb6GNM3hWpig96BJYzuDJFfjx0XJ33RYW5a4ln
	Y+hQVN0bRkzLnoE3cwu/+9mMAapGU45yTxZin+8i84TEOZi3cj3Ur7T0QhEcWQ==
X-Gm-Gg: ASbGnctg/YkapyUxagD9+VBSt/dXUGkj88lb4RPpF4C3s+fSNSWj6uuiS8oVcVNIEpI
	SNESIM1E8SvPM0sVs39oVNjkm/HGYvM49mUGYpUJJlzMfd6pmoKH3ktZqYW7Wf7N8XPDvwTWj9X
	3Ni6HhRqr1NixT6N0xGS4m/zpfLYFDxg/u8EKqwmYtTOZMxsc2FchfP2Mo5Ivi2E/vzKLJ0Rf11
	c/rT17osv0RDqB6ItWyd15mIjU3UchsRVRcTIN22zJmiuI7DVvvNJz6pPeSnN58FYbW6XNh40uF
	41rykgI6hET4Ijl3uz1gQtGew0x9jEXuAr49b367TbwqC8E5bkVqG1R79uI=
X-Google-Smtp-Source: AGHT+IF+AnZFOOLJPlbiAxkDb/YuGPI7JP89xIJch2irCDOD6BFYAkiFyfLLQWgKCePZd7wiHYd+Wg==
X-Received: by 2002:a17:903:3c6b:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c535a7eecmr173618945ad.25.1745230394801;
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
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
Subject: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Mon, 21 Apr 2025 18:12:41 +0800
Message-ID: <20250421101248.426929-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 49ddc504c160..f0b4ccd81c4d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -291,6 +291,10 @@ properties:
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
2.49.0.805.g082f7c87e0-goog


