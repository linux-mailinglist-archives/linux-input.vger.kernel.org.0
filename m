Return-Path: <linux-input+bounces-7598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112F9A912C
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 22:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C6EA2835D2
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 20:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AAF1FDFA1;
	Mon, 21 Oct 2024 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeYE+809"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F231FCF78;
	Mon, 21 Oct 2024 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542512; cv=none; b=qCRagDA4aokXk51IlOmNniGdKNesQ10uFztzedOE5Pvw4aebL2IoD6ZE9Ee/ZOC4f3x27Ho1eYilT7mE6zKXKcOcr+JdKzqzM/qouFoGKZojbJfWtwZNcOwRUl1fGonPyzHcD+Rt05dPX25XZ4x9v5/i6KTPbcW+56fMtRJPw+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542512; c=relaxed/simple;
	bh=M/Qr46XFwQ4/bdir1XHUmm8htVq32+gFJnABKw/M8Is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GTo+NkRqBl+8QTTfnXp5sKHoafiOazqCPOOCbtyqv+GugexCXm0oaPAywrXlnBYzLaWr3PFzJMBcidkkO5BZwaVkLnPvfR0aYHAXWFO0IPfPPTUnlYKzHaIGL+iarfsRIpaHhDziUQfs9M7hguIaBKAYwpMWD9pO/5EHkyEursY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeYE+809; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d5aedd177so4063639f8f.1;
        Mon, 21 Oct 2024 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542509; x=1730147309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bnt+KzLj0gBtQtESfccDhJlW0AjYZvv3WXxt0v6eRC8=;
        b=eeYE+809bjlHcd8b6cfXRnmEKckg99R2sjUd37kCBdGC0cSGcCzAh613gS9k6TiDxM
         LR8k09gQwTW2MLAivb8HnQ06Jnt1LJ49dWjms84pD2Jxp3E90K4O9mOR9JvCLqbJsAhX
         pxvYE9Pct+nznX1JpvKAtDxWVal4PVgep3naV5IbVxxYMajLKVAp52LICWesWq4db1fV
         hZWXy1qcvZezJQzfJJirO9T7c+EjKOJE7/CfkHpXdyUhZvwoRi8nGgGFWDmRAJ50YPWZ
         iURdZplTVhD/J0vHJFi5s6zarF65von7U8Ie5eNiijaMOf+IGREvjdLR8WdyGK3VZ4L5
         nPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542509; x=1730147309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bnt+KzLj0gBtQtESfccDhJlW0AjYZvv3WXxt0v6eRC8=;
        b=VoBeL9mzqLRbY+TvuyoJoAsJio55+1qmzbwnIAMwhTw5Tk6+GirrNRXF1A4lnKqigV
         qF4WKGehNkYs6UGpzPvpFh5mf03JBs17om53vZkzD8f3t+KY6zWX4B5d90BXAp4ctyxc
         pzqt8MPYdaypxGwIbmKnAEav0F57N1w3RrLVOfaXrFK+uY7W8iXT5SquqHR1p7JnEsFQ
         Ejeys0GWPhGS9nhZCpgH8NaHCltdJQ4djIadtfH1LvVHOLjc6A2iu+6Ebkv5eJ9icnFf
         joQskwHYZL4OrAC7gknCl9MPflOD5J5cAy05zZSQ/X0JexpzSjOfwka0KPcl+H8Uvsmr
         Sl+w==
X-Forwarded-Encrypted: i=1; AJvYcCVcXIHm/p14KGB16We0H0KEJpxqZe9dnz7jXnOD1SGhy/vqLvQfU7z38GAd77R9gx2Hezj7/5i0EHKta/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUqso4KGvxlBcCNFCV6YKjM1aF17pG/vD5KHGVB5+usVRT0ZPW
	TZaOElLyAHYScVhzsjfUCw2j7DLpYO2XNytKrbzXcAjDz6ES/DX2
X-Google-Smtp-Source: AGHT+IHcUlF/WH2MPR2lAsWY2YWdvWUxpJiy03CKuMiiIgxGTQhVcc8bGyCYchZqxExzbbX7v1K48A==
X-Received: by 2002:a5d:5287:0:b0:37d:4d6c:e0ef with SMTP id ffacd0b85a97d-37ef21ac2b1mr254788f8f.43.1729542508922;
        Mon, 21 Oct 2024 13:28:28 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-023d-d91a-ee8e-da73.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:23d:d91a:ee8e:da73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a5b98asm5093263f8f.61.2024.10.21.13.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:28:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 21 Oct 2024 22:28:23 +0200
Subject: [PATCH v3 1/2] Input: sparcspkr - use device managed memory for
 'state'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-input_automate_of_node_put-v3-1-cc73f636e1bc@gmail.com>
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
In-Reply-To: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729542504; l=3463;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=M/Qr46XFwQ4/bdir1XHUmm8htVq32+gFJnABKw/M8Is=;
 b=eLC/YTa39ljswAiRUJSjizOUy7uUis4Qgy9tB8DOpHiJSwZttYfbyRD7PSLEhYAB/prbxqkQ9
 6T2OZDUN2oUDuKXvYkBEaNCIezAe0U9OtpB2rKi/1gTULR3vtmiQa8B
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use devm_kzalloc() in bbc_bee_probe() and grover_beep_probe() to
automatically free 'state' when the device is removed. Drop the
kfree(state) calls from the probe error paths and the remove functions
accordingly.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/sparcspkr.c | 41 ++++++++++++++---------------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index ff7b6291894a..e484d79b5597 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -183,46 +183,39 @@ static int bbc_beep_probe(struct platform_device *op)
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
 	struct device_node *dp;
-	int err = -ENOMEM;
+	int err;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	state = devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
-		goto out_err;
+		return -ENOMEM;
 
 	state->name = "Sparc BBC Speaker";
 	state->event = bbc_spkr_event;
 	spin_lock_init(&state->lock);
 
 	dp = of_find_node_by_path("/");
-	err = -ENODEV;
 	if (!dp)
-		goto out_free;
+		return -ENODEV;
 
 	info = &state->u.bbc;
 	info->clock_freq = of_getintprop_default(dp, "clock-frequency", 0);
 	of_node_put(dp);
 	if (!info->clock_freq)
-		goto out_free;
+		return -ENODEV;
 
 	info->regs = of_ioremap(&op->resource[0], 0, 6, "bbc beep");
 	if (!info->regs)
-		goto out_free;
+		return -ENODEV;
 
 	platform_set_drvdata(op, state);
 
 	err = sparcspkr_probe(&op->dev);
-	if (err)
-		goto out_clear_drvdata;
+	if (err) {
+		of_iounmap(&op->resource[0], info->regs, 6);
+		return err;
+	}
 
 	return 0;
-
-out_clear_drvdata:
-	of_iounmap(&op->resource[0], info->regs, 6);
-
-out_free:
-	kfree(state);
-out_err:
-	return err;
 }
 
 static void bbc_remove(struct platform_device *op)
@@ -237,8 +230,6 @@ static void bbc_remove(struct platform_device *op)
 	input_unregister_device(input_dev);
 
 	of_iounmap(&op->resource[0], info->regs, 6);
-
-	kfree(state);
 }
 
 static const struct of_device_id bbc_beep_match[] = {
@@ -266,9 +257,9 @@ static int grover_beep_probe(struct platform_device *op)
 	struct grover_beep_info *info;
 	int err = -ENOMEM;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	state = devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
-		goto out_err;
+		return err;
 
 	state->name = "Sparc Grover Speaker";
 	state->event = grover_spkr_event;
@@ -277,7 +268,7 @@ static int grover_beep_probe(struct platform_device *op)
 	info = &state->u.grover;
 	info->freq_regs = of_ioremap(&op->resource[2], 0, 2, "grover beep freq");
 	if (!info->freq_regs)
-		goto out_free;
+		return err;
 
 	info->enable_reg = of_ioremap(&op->resource[3], 0, 1, "grover beep enable");
 	if (!info->enable_reg)
@@ -296,9 +287,7 @@ static int grover_beep_probe(struct platform_device *op)
 
 out_unmap_freq_regs:
 	of_iounmap(&op->resource[2], info->freq_regs, 2);
-out_free:
-	kfree(state);
-out_err:
+
 	return err;
 }
 
@@ -315,8 +304,6 @@ static void grover_remove(struct platform_device *op)
 
 	of_iounmap(&op->resource[3], info->enable_reg, 1);
 	of_iounmap(&op->resource[2], info->freq_regs, 2);
-
-	kfree(state);
 }
 
 static const struct of_device_id grover_beep_match[] = {

-- 
2.43.0


