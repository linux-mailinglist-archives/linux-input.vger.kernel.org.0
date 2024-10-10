Return-Path: <linux-input+bounces-7268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A01999462
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76C5A1F242CB
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C6C1E47A7;
	Thu, 10 Oct 2024 21:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOLqmQMq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E761E2841;
	Thu, 10 Oct 2024 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595563; cv=none; b=Skroe7M3kfbnjrBI6TZX+hxhygofcF73v8YJ5i23sEHhzJk7tk8nzMJ71sCuV3gZxjQwBZNdpA+clXyvZgTz7nFmgmxtcSNKRTXYVKLKfOzYZ07G3rX89graUfB29h9sNwrDtS6/nJh0lI0vJL07KnVji739N5OFL9rBOw9WMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595563; c=relaxed/simple;
	bh=t9fa1o1a5Sgyy/pkELwXsraoor0CZUbJK+3ORgewgNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJ1pko8TZXtgNiNxCdipun22CUcJgAGfk4g8cyTBBt9KFMybGNl3kVPstqgMYlZpVDkP3bYAWChhZ34ErK5ofoIxoKgqu/iuObUqpNa5UnN+m491X3RJ5WQW0HLP1eEqY70p+3NplLnqJQTjiEsjeHLw9iI1O9horM9kPr9mKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOLqmQMq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43117ed8adbso11821965e9.2;
        Thu, 10 Oct 2024 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595560; x=1729200360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NP8lfF3+tt2bERQMe+43qAzEv8h11+8hyUY3IsdG9dE=;
        b=aOLqmQMqdSamYsfthRnWg+yuD0U4OPVRH9TvnSRurf4N+NdL2ZY+oISxez4atTorWO
         1qCN4l5DQEHgqK5FObQ6/qb5PtZVfvUO40+IkZRfA1ccvbkzsurBlFwxpmSLOs7TvYYN
         DNpBTryZLItXnRBeG1hKovD2e554wlowleSMKOkUwrpKu+rgYhya15/2buT08GxN/C+U
         tK0JRd7KduwyG1QIaSihwm3iKetbw8aNsLlvZnDOcAOy0Hm81FZCTJLeg2ACgDeMkUgp
         BTc1eWLau/ifXigAWt4Qu+xI6qSpvG+3/6xEU+triXjsRfg6zVuZaSjFfGPELo5SV862
         tAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595560; x=1729200360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NP8lfF3+tt2bERQMe+43qAzEv8h11+8hyUY3IsdG9dE=;
        b=f6fNST3+VBM2plj5IhPQ2xBR52sU/ETg3VkHckpzJQ+fGBr7HahMaDK57z9LgWP+7T
         eofcDZyw4xfDChrR7ClKO7uL5iZYyCvSauL8Yo0MJYRAiqdhWD7jFVCMZZ0/aE3qG93t
         F5UjHM7zehDoqB7Yzuu4+GNqFxfM8HwCoHNa2ebUcc8Xh73aIa7x9r9PNUusqgS+tiOr
         Q9x/oissdHV1+pOb9sbMv0HGTEci77gXwXG4bDL5ao1onzJMkOs7doczIofP0IOdOmkc
         3X0cB+LcMzHf2iNFazi1SbGAiMJ8PdLAAIiiA5SqTCEOw9NCq6OYPaSEJiwAjH+JDkxY
         7p2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUg31Zfs+bUXDBhj+6QgZsFzR6hwOxMhmKuFsazwaeNxU1jFQ0+q6JpL4JmBiUdR6Z9HciVbv1GWdKRX+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlx6tL+GB4izT76LL6ZyCmSGnvG23A2NZ4Mug/flKO2XiGOye8
	7Q6bJ9DdKJnQfYY833WUsYpKbw43SGDxqRR3Ohfom7dY8TnMYIIW
X-Google-Smtp-Source: AGHT+IE4KFtceqWgFI5Exk1ggU7gG6fN1lLUM7411oUgT6YiAdrbwe1U80pIh0+6rzapsH7z+JsyYQ==
X-Received: by 2002:adf:f585:0:b0:37c:d1ea:f1ce with SMTP id ffacd0b85a97d-37d551d53dbmr354861f8f.25.1728595560283;
        Thu, 10 Oct 2024 14:26:00 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:25:59 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:51 +0200
Subject: [PATCH 01/10] Input: cap11xx - switch to
 for_each_child_of_node_scoped
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-1-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1675;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=t9fa1o1a5Sgyy/pkELwXsraoor0CZUbJK+3ORgewgNE=;
 b=b31gP7WKvaxSGCe8LGxC0VFmrQkeU9+dZDzn0FUk6fhSEtR5GsZSn0RkT3Hsunh8on+1vLtSE
 bY5XwOwbB/8CemBxLFfFlFJk8eGyd/NjIzj/SvQvHebIoHP0HzSadpD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the scoped variant of the macro to simplify the code and error
handling. This makes the error handling more robust by ensuring that
the child node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/keyboard/cap11xx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index b21ef9d6ff9d..0c17cbaa3d27 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -416,7 +416,7 @@ static int cap11xx_led_set(struct led_classdev *cdev,
 static int cap11xx_init_leds(struct device *dev,
 			     struct cap11xx_priv *priv, int num_leds)
 {
-	struct device_node *node = dev->of_node, *child;
+	struct device_node *node = dev->of_node;
 	struct cap11xx_led *led;
 	int cnt = of_get_child_count(node);
 	int error;
@@ -445,7 +445,7 @@ static int cap11xx_init_leds(struct device *dev,
 	if (error)
 		return error;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		u32 reg;
 
 		led->cdev.name =
@@ -458,19 +458,15 @@ static int cap11xx_init_leds(struct device *dev,
 		led->cdev.brightness = LED_OFF;
 
 		error = of_property_read_u32(child, "reg", &reg);
-		if (error != 0 || reg >= num_leds) {
-			of_node_put(child);
+		if (error != 0 || reg >= num_leds)
 			return -EINVAL;
-		}
 
 		led->reg = reg;
 		led->priv = priv;
 
 		error = devm_led_classdev_register(dev, &led->cdev);
-		if (error) {
-			of_node_put(child);
+		if (error)
 			return error;
-		}
 
 		priv->num_leds++;
 		led++;

-- 
2.43.0


