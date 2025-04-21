Return-Path: <linux-input+bounces-11868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E09AA94F3C
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 12:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74624189226A
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 10:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95872620F5;
	Mon, 21 Apr 2025 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EI7lMEoC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB82620C6
	for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230394; cv=none; b=cJ3nhYSg2qyQ60wnWi52q6sJ20Iu9M8wBNpf/hMxqyvHK3SeJlgVAUpphXcCzGQBHlVZSjms/wBw74eawETCztodVGjs2VQdJUdb05aMFtB2YkDtLmkbEFmub4N/YL/vV+7Hf7g1ECFwEBCkaIHR8BsAsKvTSADoPlrVaMlktyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230394; c=relaxed/simple;
	bh=FR04IaMx5M3reYvC9Ul0vGkqy5dkFbswq922BLXpjDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmPY9zF28x+IGbW7VT06ahiyOHh9dSdlIoI5BjDQRbu/uSXst0t3Kfta+rKPDObhsjZt6L2st3gPQqI38GAg1XYDMRuRvOkcIqZayW/bYILiworqy2rtv/tEVnAbLCSeh3BUz4AIblsEPUn1jlfbn5zVsXrEewkcqkqg35Ui+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EI7lMEoC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22401f4d35aso41611475ad.2
        for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230392; x=1745835192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=EI7lMEoC4eos4V7Mtya/yyQHK8GjlXRZkOM9WyEVG1h2dOGy9uNgh/SVB1j3fTtP0N
         iRm4W1dQfuhufPcv7QpNFmJBAyS5dAa6aALvoW5EKWgD3gfA9Rhjprgw7G8ecUSnsrRX
         AverPwptbkKKCMF5Yo9Mr5JR03gIlGw/PdtUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230392; x=1745835192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=lDo8C33icfW7zidJfRc/IpfGjN9B6xLJrZm0V5+k6efOEo9NeY9ci8r/crkRFT7pOY
         Bh5xgIntK47Z0ad0nXvKfuXduXYPEmyDv9lPl0lvcv5IzLaSuRsuYRVYIxLI9Yl8gXqG
         uGS96q7YsYfwuxDC0WCYxjfe1xP5FC6RXvlMsGCu6aLaomTOO2LX1Nr3uBlKs3JEY7tL
         oIelCoEGqop8GbhvBRDO5Rdk7a8oxURJ3gZObHqpT0DWfvXU2P/1MpTTzX2zaB2NxTXO
         0B3/EuukVgOSwHQXbTLx6dn9FdXeP6Ji3+AnSdgqfkskUSlL2QBWbDt/+KVnaKJdawJa
         Xbpg==
X-Forwarded-Encrypted: i=1; AJvYcCXQvAfvhTlx7lzvlSGcsQSctGWn8n9HSWKLuDVwtfyqZG1d8f/hQZUkYn5neHPSUKhcQXlffH5Nuurseg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX6nRvRizGdaKw61amEHI4hxmahwyl9JUCOUCZxlXPnY4Ls7oM
	xG7K3DVgMIrHngrQ2q+v/d5Kn8pI4gdIUJ4JVbjyldspePBsErRnCRJYQEN61w==
X-Gm-Gg: ASbGnctMC/NIiCfxMledAJ5uYcoETawADvhhaXeeo1j6fZd/7qaos5DonxfN9jsfN3u
	vApERqCvFTFB5djlxIvCNTL0PVEcCI7rGwGhZX/f6YbkoQ6Hi9ybKfE7nnMDVxfux3aVQX78EJa
	rR+agoQupioFFzG5IaNsgkSm0jeSP8QyguS7wunE/fjxox0FjoxEeoXLhNuBgLXvssrfXuBXCPn
	EN0bo/U6KFtoGBajohgzUgth22zZrmhSuvKZlPvuj77utgW5Rs3to988nc8UGOc8owaLTV2qVIH
	AiUBWT8nYRmz7hh4OIhJnk9ED1zGqCwuoAyS13XPIDyFMNQPD0Kcs16qE30=
X-Google-Smtp-Source: AGHT+IEzP8P3BuI4W7WctpJECwx8nzR8w2GBK/ppnOU1J4/hN4o5Y1Q6ZPLjik3RIkoMMrSDGxWajA==
X-Received: by 2002:a17:903:19eb:b0:223:5e56:a1ce with SMTP id d9443c01a7336-22c536063e3mr184062165ad.32.1745230391767;
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
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
Subject: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Mon, 21 Apr 2025 18:12:40 +0800
Message-ID: <20250421101248.426929-3-wenst@chromium.org>
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
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
2.49.0.805.g082f7c87e0-goog


