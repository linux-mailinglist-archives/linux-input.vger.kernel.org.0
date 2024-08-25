Return-Path: <linux-input+bounces-5834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C1295E1E7
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 710072825C2
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0194374F6;
	Sun, 25 Aug 2024 05:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVxVBhKP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF43308A;
	Sun, 25 Aug 2024 05:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563006; cv=none; b=WvLfAm+RaBYiwt+0D5xZ3kdSCH+/ZW/qbw0npdVVwJTKfffBMvcSoKZo8itStS+vcNYFaUPf2V4jRH/KqWbZzYwRZl1fQAkiiFWIQwxZmlIJtalnUtNjr3bcEN14Iia5+q89KKf+Lv4XT78ayWGEOq43BDlXTAfid2YqB1IBRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563006; c=relaxed/simple;
	bh=QuTUzvL0NRGEdr7cl4+DB5x/Lu/7uSJ/TteYcsbBaMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvvdeo2AVs9GK+ivVkRq7BxJ2La6zkKDuxwiLNklhkSYrZamXLwEIbLdORibH1X+QuphN6bNORptdwkpvETVkpbYyvwf0Ucg8JF2GnVdVvDPUkwD7PkcCdmcyPKCBl9wfe2aLaSUgMbjGR1cUmqAI3fJUzrB8fqdx/yfsGdVhIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVxVBhKP; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7094468d392so2671528a34.0;
        Sat, 24 Aug 2024 22:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563004; x=1725167804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7WxrWJ62hQ2vKyvroZvAzkaBumF7Y0KoLKrYpStuCE=;
        b=OVxVBhKPRAndiMzYXArVerrajLNcMF7V3omucrU01/qyuAnpp0YmUZxzCZGhgxqF5B
         iAGdH/DblbVtQ9l+CoaPom/Uy+z8i9R4zNxgMvCtGrLpy10N3lZjukIMKziKrh5ZVCMU
         sVrHEtNkK+d3XJonQxTduONTgPAjnvY4mtYKYN0Vb+H/gVTKUWwWhZFfl31ZK/NLNPxI
         kNs1JpdXCtt89JNVGb6JqwBfRdiiqd+b5WOYsXBibI3sNay6LpH5/fQgM/U8ZhLST9ry
         uQcn5aZ+trDen8gqfh31LlAKMMZxQDADEDEsuhH8zswBpCe6chfBwmy/uzgVQhosAsh/
         30IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563004; x=1725167804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7WxrWJ62hQ2vKyvroZvAzkaBumF7Y0KoLKrYpStuCE=;
        b=wXmgpdl4Oo91bNes+veoIoItPzifzvKuO9P8Xcxg+o04BOxlPSshPbb9uOiJC7Bz4Y
         d8QehhroCzam32BgkwnLUXWCS3hUAWjT+TFR8XDnNjeCkM+UVHvo3OR3AojGZL4faq3L
         nt7LaOF+9ZE0Kq6DXI6WDAo1Qo9yIn2knr0VZe1K1ssqZHMwl2di8vY3M4mhuM1Z8s5n
         nCuGsJoisMBqN/ynl5/xLa/SSylmnPAvNMfDPhOox2qCsCfEk57omLp0ZVijErcmDrTU
         6szzmFaaXd4un6EGc6UoDx5VsUpuNxShPXxJUBzm81P89xxJvAUpvSOEbxr97wpV2yIi
         8W5g==
X-Forwarded-Encrypted: i=1; AJvYcCUK97tNBObbrZrwoocTVF7MjdNAnk8Adc0mf+x6Hyu0hXOhnW9zrEXIGsD3LBeblY4fVzi0+urAU51+4DQ=@vger.kernel.org, AJvYcCW0to6r36GUIyhRM4YcLpLLFZ/zINrf23TU+9JMiTIUGVSynxJLZEbiJUnfdIDJG5eBzpRYncRgLeFMavw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy90rygv7YrI13jrv4Zd65ssU0kQxqSKQEnqFRNEocC5wUgNWRh
	6KuOI4x3GZ5phlePn9gIn0XSM6YaXgFllBm0EugWHDuo9XB4+cv7iMx+5g==
X-Google-Smtp-Source: AGHT+IH+QpbfxDnkPKJFQfMCjn2cIc8LsR3+E1IY+zf3Sg3+FogfeIFria8bka1eODj7ExYmhpbLgw==
X-Received: by 2002:a05:6830:2808:b0:703:6ab8:1fe3 with SMTP id 46e09a7af769-70e0eb31f1amr8578138a34.15.1724563004054;
        Sat, 24 Aug 2024 22:16:44 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:43 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 04/17] Input: ep93xx_keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:08 -0700
Message-ID: <20240825051627.2848495-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index 6b811d6bf625..a8df957ef261 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -184,15 +184,13 @@ static int ep93xx_keypad_suspend(struct device *dev)
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (keypad->enabled) {
 		clk_disable(keypad->clk);
 		keypad->enabled = false;
 	}
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
@@ -202,7 +200,7 @@ static int ep93xx_keypad_resume(struct device *dev)
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev)) {
 		if (!keypad->enabled) {
@@ -212,8 +210,6 @@ static int ep93xx_keypad_resume(struct device *dev)
 		}
 	}
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
-- 
2.46.0.295.g3b9ea8a38a-goog


