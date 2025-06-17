Return-Path: <linux-input+bounces-12924-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F89ADC482
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 10:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D1E91896B20
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 08:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B0A29114A;
	Tue, 17 Jun 2025 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z5GrbODi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA7E290BBD
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148414; cv=none; b=FdoMeMLoCxZrJM2Ck+iPqLn9ls+xes/or9CR42f34V/hbHjqQY736ee+N6GwxwhWITfcF5C0L/Hw76b0EhWgr15kU0CxAmFap27kdVcCAe4gFmEb7LnEbZ1044N1NJ+mH8kP2pCLrE6pz9tg1iGMY9WuAAUznNl6KMFO5eDUvfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148414; c=relaxed/simple;
	bh=QcClUm1ZLCCbAPKXN4VamHSf/5X+mE7f+yW0QnLfibc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9ObiPHqf42/AHsWTfxTRpi+25tltR4TYnTg6Z1xBHOnuCSSrit7YB6dMjQP9hJDbacSki7l+d9IRZGar3Pq45yAW2LuRNpRAcRgiHIAHCF+HtshDMt3ZNC7hR79YYkCTw/8oB0Tnod3Wlms0SbygA0jCWi+RpdGEAaMfF/S8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z5GrbODi; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so4680485a91.3
        for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 01:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148412; x=1750753212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=;
        b=Z5GrbODi1WmDHQ5CqiRF48yObpetmBImXfZromTQZwLuLyVaVCakAJt9VfyS9z7UF5
         P9m+opDF38wUnOlX5HIEJUPmhDgs1OPJiCF88akzNbOl0J2RIJI0SVRiGyarOuRRhZ8P
         etvmclvNRFmJXE5apB+/ayQcnaNY6cF2a2PTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148412; x=1750753212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=;
        b=kZlucxwn3WFHcQioZpAdOOe0ScJ+EYyNsky42U/3nOCLlRH9Yp63eGdxyO3CozyC1o
         HQiYQU4SOz9GLf8IssypiX5EkZ/9acR7A6Hsksls73dJublTnyxQqkybaBHWgIhIuKXY
         De8WeZhEboeLDPdhDrasmaW+7IU4s5k+KyPyPZQ4QXjwDfa4BsbPGBH3RPYS3PG+xahM
         isHgA9GAARzGZZ0DuccmOyvEhpJPW4NzehDKLI8sbCb5B8Zl1h0YogOtui6LcTIrB5Bj
         7GM0S0aZyh5mLf7PmOZj/uXlzzytMqd9Fb1iKIhQI1IP6foBpuF9gw8lq2cMt7WTsq9l
         W/xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVASSasiEjoez7jWunBUzXuMkekoAjpkgjZPeJQ+48PEGpcOdrkD2Rc4V1tPCvTWXQ33yC2bifE0sI0/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbtqlwf4CvWcuH/CWo2Tr18Nk7cB2EsWor2d/yu2gGsBLVrfq
	zOEVCWpjU8JNlzOp0quvtRVFVEoxzSBeQmOMzgCYBXDuSjzTSI/0iMWz94d+Z3WlMA==
X-Gm-Gg: ASbGncuw1wZva2wIGsah8en4mcX3GmDuzuj9mZZPZ56oL7XDin/TfV3C+P3vilnqEkO
	gWlTbMm0Q/9aYXJQyHjxOucIKjQOOkTK554KseRWx0D2X1krN2ytU5TLx/LzsN6PLBGjtZfReTd
	e1mPm8JCh/5WYHRLT40EC4K18dtwOH88uakZVRECsJgi5HRkogMkCPAIkF8VoblPynyF9HKZZ3r
	x5K8Vx2mDTaNcjzV6Y6jycMp4lJ9laAlB10TV5TqNRsJR/QmDhPOgxNRl2w6WEYvgq6g2fYDK3N
	gyfy51WEI5Bo1pVcuKaOhabQ5QDQh5j6Wt9H5/s3To35/pbbvGsoE+BVZmhA+t8OfYeNixG9tL/
	PCXug
X-Google-Smtp-Source: AGHT+IG3KNV6ixPiJvUtBGaYxn8qmkk4lCQcaXYtEk6THCxE8V+YIcx+EzSCVTlQvmABQC9D1Nc91Q==
X-Received: by 2002:a17:90b:4e84:b0:313:dcf4:37bc with SMTP id 98e67ed59e1d1-313f1dd74acmr15712251a91.34.1750148411484;
        Tue, 17 Jun 2025 01:20:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:11 -0700 (PDT)
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
	Douglas Anderson <dianders@chromium.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Tue, 17 Jun 2025 16:19:58 +0800
Message-ID: <20250617082004.1653492-2-wenst@chromium.org>
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

The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
longer boot-up time. Power sequence timing wise it is compatible with
the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
enumeration, both shorter than what the eKTH6A12NAY requires.
Enumeration and subsequent operation follows the I2C HID standard.

Add a compatible string for it with the ekth6a12nay one as a fallback.
No enum was used as it is rare to actually add new entries. These
chips are commonly completely backward compatible, and unless the
power sequencing delays change, there is no real effort being made to
keep track of new parts, which come out constantly.

Also drop the constraints on the I2C address since it's not really
part of the binding.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Reworded commit message
- Dropped the enum for the new compatible string entry
- Dropped constraint on I2C address completely
---
 .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..0840e4ab28b7 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Elan eKTH6915 touchscreen controller
+title: Elan I2C-HID touchscreen controllers
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
 
 description:
-  Supports the Elan eKTH6915 touchscreen controller.
-  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
+  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
 
 allOf:
   - $ref: /schemas/input/touchscreen/touchscreen.yaml#
@@ -23,12 +23,14 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - const: elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
-  reg:
-    const: 0x10
+  reg: true
 
   interrupts:
     maxItems: 1
-- 
2.50.0.rc2.692.g299adb8693-goog


