Return-Path: <linux-input+bounces-7270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC2A999466
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D038284839
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906DB1E7C0C;
	Thu, 10 Oct 2024 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yce9kRrK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D81E6DD5;
	Thu, 10 Oct 2024 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595568; cv=none; b=T3RJTQRgJ3keZ1IsBodaI7acb1iZSzaZG8sRGLz1CRSR9pEdMSk9RF78urLl+TmbrGD1uDC4gGxjC8PeYOSV7ZXkApIOZjC886DA7hhjn9E1Ex219HfDKX78UiO6Ry5O3CtLK9XxBLdtMxQTzDnVe2hca7ofpBRt70hHHvYnGrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595568; c=relaxed/simple;
	bh=AF25XcLrg1gJJCZ0loQqPaYtp8vI7GzZlTAbicwO06E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXwSYIWxrJ0sQNWVNSis0rP3o4Hfb5gyU+nHiJgJbJ+96SN7DKyvpFRLT2NTqRdeMYdmzX+rZgBAo9D7QtbVVGtTAxvUmX1xubfyhD48hnpiA7S/YJZ3ddVdQQBFQNbtrJXx7nEXPddF3wt1CM5lc7ukh+yvx5MJd8BT9f1mjR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yce9kRrK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso806160f8f.0;
        Thu, 10 Oct 2024 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595565; x=1729200365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/PQS/8RbHWMjns+hXbfTHhQVRn54n1C6fHMniju3VI=;
        b=Yce9kRrKro57Dv1AHTtSNpYQ8ymjJPami85cCi9mI+aT5vdaCQrEGuMqyqEHDP5IHN
         +7Vk8TWuZMDPVn3vn2W54iGB1nXU17FgF6vkLut+6OAvzu357hwp7Xy6zjyPZNZtzR2h
         riXQRFAR5UMisfnLooh/QB2kTDRnfrDW7yVXj77SJnOHe5sDkzBRuaqhAy+y0nwDghuo
         iBNEr0jPKxA5KDbAP4oA0mTVLmAEeeBTQaqvVvDqGtJ3SV73Uq9iHurhCngM0AVtRLUp
         SIgm5w00xLOAO08a73kB2XCcvn4e3AZTb05+yEuX/KS0H5Vp8Tf4ucp2morbVGJEDWGb
         MsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595565; x=1729200365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/PQS/8RbHWMjns+hXbfTHhQVRn54n1C6fHMniju3VI=;
        b=SDbkdL/IennGbReuI+WDAJ72tfv2nLCc7smspfTQl4LWQqUHNWiQb4Adx3Pl8meYHY
         Uzk9UNQFBd00ZzwpgDqD8bFpOQhnT1SOqrsL8RRMuoKd+d0UGj/faH9WKenJY+U8pEBG
         GMsA3ZP5/RYpiLIHaNspBggSEFsEIVrUg3LMULvr1M4SSI2+X+pRSVaU7D+hfEw2IaH8
         jSivSZb3Tyzk/g1EyNqKlafRiT8YHegS/B4hfPi2eRtI1aVeA1jujTgbZZyJyskpCl2x
         KlUczVfKbjwo+Paaco7CEZUVcnVvh4r762oN4MD4x0UvuEKrm49jeBl/Dv/UzKHOuO85
         8rrw==
X-Forwarded-Encrypted: i=1; AJvYcCUGIz0uuqr7V/YR2/WxSWNGzoFL2Ck+nPyKziNghKjtfaYnNmhdpIN0vADdjJ4LgKSh4TWOCj5sO1TGnUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZyZ+v1a6qBuchwQ/EnDxNKugP8kRDbY7DwSHv/jmjfqMke2vn
	QWXz9bG6xbJzNSayI4yJ6emq+EZwD/lzR5l6p3sNWd4p6wiroD6C
X-Google-Smtp-Source: AGHT+IHTagaYiTqDEo8/KQexjkWrhnQ6PMf/Wmq6Gqr6clYP1OUl5dQgDZmTtwi4XEpJMk2I20xVwA==
X-Received: by 2002:a5d:4acc:0:b0:37d:54a0:d0a1 with SMTP id ffacd0b85a97d-37d552cdd6dmr236882f8f.56.1728595565212;
        Thu, 10 Oct 2024 14:26:05 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:53 +0200
Subject: [PATCH 03/10] Input: sun4i-lradc-keys - switch to
 for_each_child_of_node_scoped
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1723;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=AF25XcLrg1gJJCZ0loQqPaYtp8vI7GzZlTAbicwO06E=;
 b=wi6sf2KQfPxfVmYIPTgXn9ICUj6hhr2iRzOEK7JHXtgg5cLEOvCV7676G+F2C2arErdMBYj3d
 bSCk+w+kbPfAlODbaQuyP1b/Crwa0KT5OQkJ8a44SmYDIBq6lvZCcZI
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the scoped variant of the macro to simplify the code and error
handling. This makes the error handling more robust by ensuring that
the child node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index f304cab0ebdb..f1e269605f05 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -202,7 +202,7 @@ static void sun4i_lradc_close(struct input_dev *dev)
 static int sun4i_lradc_load_dt_keymap(struct device *dev,
 				      struct sun4i_lradc_data *lradc)
 {
-	struct device_node *np, *pp;
+	struct device_node *np;
 	int i;
 	int error;
 
@@ -223,28 +223,25 @@ static int sun4i_lradc_load_dt_keymap(struct device *dev,
 		return -ENOMEM;
 
 	i = 0;
-	for_each_child_of_node(np, pp) {
+	for_each_child_of_node_scoped(np, pp) {
 		struct sun4i_lradc_keymap *map = &lradc->chan0_map[i];
 		u32 channel;
 
 		error = of_property_read_u32(pp, "channel", &channel);
 		if (error || channel != 0) {
 			dev_err(dev, "%pOFn: Inval channel prop\n", pp);
-			of_node_put(pp);
 			return -EINVAL;
 		}
 
 		error = of_property_read_u32(pp, "voltage", &map->voltage);
 		if (error) {
 			dev_err(dev, "%pOFn: Inval voltage prop\n", pp);
-			of_node_put(pp);
 			return -EINVAL;
 		}
 
 		error = of_property_read_u32(pp, "linux,code", &map->keycode);
 		if (error) {
 			dev_err(dev, "%pOFn: Inval linux,code prop\n", pp);
-			of_node_put(pp);
 			return -EINVAL;
 		}
 

-- 
2.43.0


