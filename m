Return-Path: <linux-input+bounces-590-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA3808678
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 12:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD7201C21EA0
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 11:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD7B37D20;
	Thu,  7 Dec 2023 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIG/xV2A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D158F10D0;
	Thu,  7 Dec 2023 03:13:30 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3332fc9b9b2so720452f8f.1;
        Thu, 07 Dec 2023 03:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701947609; x=1702552409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cd1jhV+Kh/V8UGgnPN8H8ix4gV6UKpJNpQeBveVjzsY=;
        b=aIG/xV2AYhp7Od0dE99nZ9C9ooHTr6NN5Eo0hPCi5tbzTxei6XY/KI0QxNzYiIm3XD
         kllIo/067+HRjx5tUGy6l3od1wXrUuIBKraiNJi8dFb/f9vXnPzY2SffbWy/gi4T9WPV
         XilP+LQukW5SR+p1TBHUnOtrL+mwNTYFmbMG8YhJWhIh0rpJ5qIeK5n2WCwhgXLbAgv/
         MMZXkrR7iWWkm+XG3B4NrKFtL06PR6uzPacoCQfbGNFtMrvUXHIa8/omAXtBqqT5+4+C
         lqa62LunzrJgz97CU+OFdZF0KhqBNdJzvU+/Iz0bzBIPogDqmrqlBKv1qII0Y4jNApVZ
         +ICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701947609; x=1702552409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cd1jhV+Kh/V8UGgnPN8H8ix4gV6UKpJNpQeBveVjzsY=;
        b=dZ47I9ub2+te8GHqgfx4Tz9BRljT36bZYnkluc2vI60AzGXKA9sykyPj2TWVHFaJHS
         5NqVOCp6xMT2Z9xgCbm0nSXwIekbhqkxCvkUs/bmmcHLg2Y4y0GL+z/9lNHw/RX0/uN9
         k5LPXJx4/3A07ot1W5l5VlSwGc5cq66FjV8dZjiXRT0jS12P9BW3vDfpHT3V3mitsyjO
         5xuxGC0+LUeYyD0Dg+vjbolKcdtfN9GJ23ZN8bA9s0V84x+jNHzVuwep7fyJI3nTRXeF
         Vr90HR48pxcpt8xftRZbR0lOKYvcuE44RZzy3P6U5hc0RHiATpo5I+fCIRulLXOdfut5
         LGRg==
X-Gm-Message-State: AOJu0YzaswXCbQ5n8BHDDR+g43r/YXRX7hDAaM6jjKDgpmr9urerl5CR
	coyN6guHHhWnQTOtTggDyKk=
X-Google-Smtp-Source: AGHT+IFv1ebmCk3N1x3Mxx6fv83N1AAOGffRf8mBXwhKza7hBzguDpGV7NiDcl/L/wezk+ucRBqHfQ==
X-Received: by 2002:a5d:49d0:0:b0:333:4fd1:1c6b with SMTP id t16-20020a5d49d0000000b003334fd11c6bmr713944wrs.84.1701947609065;
        Thu, 07 Dec 2023 03:13:29 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:5036:93fe:290b:56de])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d550a000000b003333541a5bdsm1166096wrv.80.2023.12.07.03.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 03:13:28 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 1/2] dt-bindings: input: atmel,maxtouch: add poweroff-in-suspend property
Date: Thu,  7 Dec 2023 12:12:59 +0100
Message-Id: <20231207111300.80581-2-eichest@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207111300.80581-1-eichest@gmail.com>
References: <20231207111300.80581-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add a new property to indicate that the device should be powered off in
suspend mode.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index c40799355ed7..047a5101341c 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -87,6 +87,12 @@ properties:
       - 2 # ATMEL_MXT_WAKEUP_GPIO
     default: 0
 
+  atmel,poweroff-in-suspend:
+    description: |
+      When this property is set, all supplies are turned off when the system is
+      going to suspend.
+    type: boolean
+
   wakeup-source:
     type: boolean
 
-- 
2.40.1


