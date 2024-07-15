Return-Path: <linux-input+bounces-5040-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE44A9317B3
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 17:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 770E0B2249B
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 15:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F062191499;
	Mon, 15 Jul 2024 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FovkSFN6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D070A18F2D8;
	Mon, 15 Jul 2024 15:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721057622; cv=none; b=O+e0eyiYqDB7UUQyifW4gLvwrQQUI8DKFSmy5sBrGkonDIKXgFGsG81tWqlUH9idCPDLbfft7h4F1Td2gWISMfR7c59Zjk1KAWR+K9t9DBDNqlfc8iWLNcLKWXgWNOfFWC96KKpASfK6UdfkYK5RdPq7QH2LOJMTgToxZs0j/dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721057622; c=relaxed/simple;
	bh=sHT2gejI7g0XKR+lt1K92pFzxyjfVxJww2AwZ7KOL3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlTv1nWiLXP/c9W26KLVfYsEr2E5YR0RclxDMCB0cpzZf8qKB//D0QIJzL0/dteZy0iZj6x3wLJbqpHb1k/6Wp+BsNdI7zIPDliO3opEvUZza21gxxTnQ/6AuBV5qmbDqONyaxik95O+wtTuK6nkGc8Svi8gIo2KnIXyrgBST2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FovkSFN6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266fd395eeso30388495e9.3;
        Mon, 15 Jul 2024 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721057619; x=1721662419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFhWGLjXxrpIBhuvDdpT6ZAZC88NAS6103pgQHGSnqI=;
        b=FovkSFN6grplptpuiBER0/cflvSm0vq0sqMY5HPzb362pu2tSrknPfa4ZrOecIcjFz
         QeckyS/NbQ9DQ/ss8SdHN7uRjh0MJBot7Hx7ZOZ1QS+abUpZAFFeWLOfyW7gzjhKGnDx
         vMYud8XplROF7e7QeVWIWyFAAOIcrCUmotKzUgsEPAJmds9+B+w2QJ5bhddjyfLuoaj2
         4I3DTt99PrYUCloyOQS8/xzTxW0s4WwsvQ8tq39d2ZuCTFmQVHHd8I7K7L6U5y7z2KM9
         ANUOmhBgS/eKTL0uGS991c+H7mlChGUwyb8Db5nd8P9NNHemoSBtwgQEaTXMRYFc1EOW
         45yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721057619; x=1721662419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFhWGLjXxrpIBhuvDdpT6ZAZC88NAS6103pgQHGSnqI=;
        b=AhCPBwLdSQjS8Kz4v4LJEtvNV4jOefQ8u652GkYEVRn1O88eUM5d7UwaWy0UDbBFvJ
         8zsiwUOpeOxUTDrOudvJY+2r1wgdTGmlnBmUBkyS+rh5BpXU6cY5eUlZR7X1RbmOAT/S
         Z37B1mirE6MUCx3V1F8ZEQt3VnomM+Dv4/EsT9Xrh9YUMxOPNX8eGTRBSV1tgXLpdI5b
         DOEkDA9zJNvmQ5y81zdC9X/qz8OC9E1hzbNNZwew4aNnhfeU7/A54Wm9Osjeb797yQvJ
         IItApLpUILDbzAzRxFgYPPovTtu+D5rKVDPgyTaI6//U8fCCOaX7oKuANxWzJmHtQvJ0
         cyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX69EddmS3dMEpc755h1HRHsVTd/hkzvdrMpsF6796+nMBM1ez8GiBxU4QTeV8p9cIZo/c52XFMvYg4EmI77vfEr6wTdIdvCYe3sOQBthJ5q8/DzRr8gQz5ery7o2zTYlzp2koH4YXUSQ==
X-Gm-Message-State: AOJu0YxM6UZKNj/iszeYOy6ZUj959sNf6i+tSqbp9VQmvPuWHPkPqP5A
	bj3K+nwjng+5zOAwsYxRCf6cQHYRyO25ZemmqDvJ30XHeZWio2mt
X-Google-Smtp-Source: AGHT+IFiyTZE/+oE0xkUmOA7iwowc7q5KaPBKgyHBKRziOql6qdP2VyoHmCNFAkNIJeEzlryIGaF3w==
X-Received: by 2002:adf:e5c9:0:b0:367:9639:66d3 with SMTP id ffacd0b85a97d-36824081d99mr79678f8f.5.1721057619043;
        Mon, 15 Jul 2024 08:33:39 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:564b:c18:f4fc:19ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbf4bsm6720866f8f.73.2024.07.15.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:33:38 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org,
	francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/3] dt-bindings: input: atmel,maxtouch: add poweroff-sleep property
Date: Mon, 15 Jul 2024 17:31:22 +0200
Message-ID: <20240715153330.91979-3-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715153330.91979-1-eichest@gmail.com>
References: <20240715153330.91979-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add a new property to indicate that the device should power off rather
than use deep sleep. Deep sleep is a feature of the controller that
expects the controller to remain powered in suspend. However, if a
display shares its regulator with the touch controller, we may want to
do a power off so that the display and touch controller do not use any
power.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index c40799355ed75..8de5f539b30e3 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -87,6 +87,12 @@ properties:
       - 2 # ATMEL_MXT_WAKEUP_GPIO
     default: 0
 
+  atmel,poweroff-sleep:
+    description: |
+      Instead of using the deep sleep feature of the maXTouch controller,
+      poweroff the regulators.
+    type: boolean
+
   wakeup-source:
     type: boolean
 
-- 
2.43.0


