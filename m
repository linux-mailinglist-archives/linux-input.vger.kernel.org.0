Return-Path: <linux-input+bounces-4893-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8D3929CEF
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 09:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F8161F21AC9
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 07:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648593218B;
	Mon,  8 Jul 2024 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0QQnOem"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A712824211;
	Mon,  8 Jul 2024 07:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422973; cv=none; b=crhATqh6fRgyNpKesUghySBSAz5JLALJf+yeBxW2w1oEnCAD7ekUSmocbo8DEKGO0++8znnOe1qkf77h89t/t3Eax3Tdte5Sy5RtsYArri++4rBtzpr4xBjtsD/BFUDwsfh/7adbl8hK54nLzpJt+GI8C5mKd8GEhOkxXvr6I6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422973; c=relaxed/simple;
	bh=sHT2gejI7g0XKR+lt1K92pFzxyjfVxJww2AwZ7KOL3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDlDwR1fcHoZZuioI/QVP03D1T8uBoG/KlvQTWFVqwiIGbCA1fCyhWeM785c3u9xAD2ojiuPUsslWZ+m9eaFtAxcrU8UROogSfRLVO2+SVa87UvTBFSOdbTG8efwZYR/uMqVumweMhuc9Ug4yYn9zKXob6yBVJ0/4T8chW7XQnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0QQnOem; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e99060b0dso3909819e87.1;
        Mon, 08 Jul 2024 00:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720422970; x=1721027770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFhWGLjXxrpIBhuvDdpT6ZAZC88NAS6103pgQHGSnqI=;
        b=O0QQnOemrGczHhi28PCYTynks16LBdkcerRRDr5PnDqsx4ND2I333D45Z0iC29hMqR
         BPnS635V73AUset61ks/BR9Nzb4gz3rBo/BgDfDPXThMt87l1zfsdX9uUeXgOsfxnqmR
         vw5JnkCiPlqWeg2l7qgTWIaX5KVVXmfZNw5f43wfJiKMSzYTNnHIRJQpixxoK0ql8Z91
         xdgIOKe0KsfdE6R+N0A2liBXm4L0MCGmXs0vskfMr49i880aT0Z2g3iZoFZD6R+IDi4z
         U0T8qw7VZQ96UysUwPcoIqx93r+gXfqcbMtNY6+gO8k0pjwYlMW62YaEN8jjsLnLEuNL
         Rw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422970; x=1721027770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFhWGLjXxrpIBhuvDdpT6ZAZC88NAS6103pgQHGSnqI=;
        b=NQEttUdiZ3n1rDeBNddVol8nw2GsKfesh0mU3+S5noxcq4h56kJ3SUWjj4/jidoWby
         icogWOzNvHn3iAauSPm5wQQQwD2dT9qnPb/uqQpuzHG6jrmxM4EONsuW2bB5a0D1I9G7
         4I1b0LjZ5c4HWeQeXiAGB+AX+KuOv4GyXba/+5c7EFGgu6j+lFVkMigFxRH5IPH+HAwR
         FHzcVAoj9QfIcfqQUYZJhwxmX1n9RqsJ2KdCJUyeIdAzMXCcKiV/hZi5/oD0EYpMQ4iV
         ojSn1WbzCDJV7Dt2FjmFllDO5zkH8TGY6pGwyVe216ASYr/IALmnOD/7IZy+g2UFTjqJ
         g1cw==
X-Forwarded-Encrypted: i=1; AJvYcCWkZ8sHffPsmTqv7mFvJrLDPl5EFzx11ho+mNyX93f2sEpMcUh+80320lCvGlCO9drbznmYHKk0LbKiCyKz0psGx/iSKqGdV9H2pXGulB5dAPXcwVcF2s0jw6sDJxYSrUweWZW9sWfr8A==
X-Gm-Message-State: AOJu0Yy+5bMsXb9gsDtg52E9M3k65zwgfYcB9T6KHqGjkKSH5lIS9ryA
	RlvLQyKQXMKhQZU4d+U8U5ztByeU9bj8inIJNIByrnfxXPETfYAd
X-Google-Smtp-Source: AGHT+IHcUMix5VO0zk46X4Nnwk0P0vgPnVPmSZzcgZqI6KRivT5tw5aOfPyuvEsFnIqmFpIZxb0+Ug==
X-Received: by 2002:ac2:5a50:0:b0:52c:dbc6:8eb0 with SMTP id 2adb3069b0e04-52ea0632ac0mr8398974e87.21.1720422969742;
        Mon, 08 Jul 2024 00:16:09 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a786:d603:1c55:ced1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679dd5ea09sm9994564f8f.65.2024.07.08.00.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 00:16:09 -0700 (PDT)
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
Subject: [PATCH v5 3/4] dt-bindings: input: atmel,maxtouch: add poweroff-sleep property
Date: Mon,  8 Jul 2024 09:15:50 +0200
Message-ID: <20240708071601.7571-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708071601.7571-1-eichest@gmail.com>
References: <20240708071601.7571-1-eichest@gmail.com>
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


