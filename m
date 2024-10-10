Return-Path: <linux-input+bounces-7269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FB999464
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F3221F23AB6
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B43E1E572C;
	Thu, 10 Oct 2024 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWY9iM3H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB851E2317;
	Thu, 10 Oct 2024 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595566; cv=none; b=IxresxcbuDubKB5zgfXCjUR5sZZgGgZRD9hXxRAyfGC8senkub/jZC4MfQOcorRBdFXQzNztqhN0Xvd3kxav+nWD8fCrrIvT9ja7Hie1RZ8Cf846pSyZlJ2JlF9npJAzYBpVxXijSpnlcu18ihCtCY7W4vh4kooJHFWrAk3i698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595566; c=relaxed/simple;
	bh=VnsjVhq/mttVM6JYsQsLgW4CuzOsRfVPLIHizOJxOgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IbOydjSjs36esoMEPqA+T5g+UMc835F7/J7DvkU4FU9dqrHgfMLWS4OISm0f5I9x3fl4ZoT+wRm+jkdigHcM9mJsXRjV9JbmAQcWX4/Wzd+RncLRZpzzQtXIlN4+SKylbZTC7Vrm0eGXdRrsZT8aDXrmKZjqVW2nZSGgUbKaW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWY9iM3H; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d461162b8so850820f8f.1;
        Thu, 10 Oct 2024 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595563; x=1729200363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82HiPSULHr+FUteMSvvyK8noRcXFrMRkdAs1zK1bpjI=;
        b=IWY9iM3HSKIwMavySQMAYzo9M6ihDashvYIeZgkuKx9wQ02OO7kPlvrnCVbtX1QzDy
         n6Zd3XgPudVws9HRICd23Gibhl1D8FJEC5+JPpCDqNgI4Bptkw9+VbSSYKoWsPQRS2mc
         apCV9ATzvXxtQZ6g18HUkQEbZ33JIQSKsvLAIX+UCnmB7sPUYOvS/cm419welkeNu60n
         0TJRHAzwlkvuMzCzAGJNJ48VR9gt/9FBzOL/dbcLC71OEXhOAgSMRYocnKkE1V0+ozW8
         bxJzsu113qMBXDW13BgioLdBjsXp1/wH8SNWYNF3hwzvWwdiYcKCzy/kc5zj6yVM/pVj
         MTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595563; x=1729200363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82HiPSULHr+FUteMSvvyK8noRcXFrMRkdAs1zK1bpjI=;
        b=gOgKxObgZ1G+/nlr+st3EXwdql2C7tna2t9jSeskgWT1KXRGErgQwweXsScOfnTqKq
         XWA8MGsfzSlMJ2KGU1tu0c3EwodNauIHjCaBAzMM9z9p8NC9mupOp7jH6CiGgk8N8PxM
         NeEUM7xCwY0IKfV2gAnuLhBs24sfYY6lDaVR6kjOfLkFGz4lYx+pqX5KB3HmR0dOTxKU
         ltU/YwXSlgtrE+gvKPGYdUHb0vTxwWW2Nzsi2addRb6KzUQZ/qfOcY4WARSjtRSLTlse
         2etfCWYGz6pkgcx0ZHQxstUFdtOrE2C4dSyEe3Jnosem86HUYlEzd9Zdq3R0XyBHOsmu
         tWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6RuO1CUrydlNRXFwlLWOUgRk7U5Q2pN2N3fwC7+aZG406AiuJjJzpgGJfJPIpE1hntTxoD/T3VPGc3mU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA8U3CZt+QiyntJ3ZzJDAVhzwCwiYalQe7T4uixD1Y6DU3qTg5
	k1mtlUFx+WgNSYVW4v4kdYIm7PwzjdN3c+c4lTD6qKGXKKw9jsJZ
X-Google-Smtp-Source: AGHT+IGXFqB+Zazmp7zehHYuM+XL6z61pYXfmG/3rSEoRILp6KFB73i+GbynVFHLtM/y3xRgpb0hmg==
X-Received: by 2002:a05:6000:459b:b0:37d:37b2:385d with SMTP id ffacd0b85a97d-37d5519118amr285252f8f.12.1728595562834;
        Thu, 10 Oct 2024 14:26:02 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:02 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:52 +0200
Subject: [PATCH 02/10] Input: mtk-pmic-keys - switch to
 for_each_child_of_node_scoped
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-2-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=2458;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=VnsjVhq/mttVM6JYsQsLgW4CuzOsRfVPLIHizOJxOgE=;
 b=ZS797SMZjCf7D8Lm77tFOx/ESKZizmB8NLX/9NtgZRCNy1/Qe09aBZ6jGgwJT+aYB75Bagai0
 S9JU5B7IeC2D7sgZK2eq4Xtr8wWKCnkMDiB1XWjLJ0wpWwKDsfmLIhB
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the scoped variant of the macro to simplify the code and error
handling. This makes the error handling more robust by ensuring that
the child node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 4364c3401ff1..5ad6be914160 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -307,7 +307,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	int error, index = 0;
 	unsigned int keycount;
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
-	struct device_node *node = pdev->dev.of_node, *child;
+	struct device_node *node = pdev->dev.of_node;
 	static const char *const irqnames[] = { "powerkey", "homekey" };
 	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
 	struct mtk_pmic_keys *keys;
@@ -343,24 +343,20 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
 		keys->keys[index].irq =
 			platform_get_irq_byname(pdev, irqnames[index]);
-		if (keys->keys[index].irq < 0) {
-			of_node_put(child);
+		if (keys->keys[index].irq < 0)
 			return keys->keys[index].irq;
-		}
 
 		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
 			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
 									  irqnames_r[index]);
 
-			if (keys->keys[index].irq_r < 0) {
-				of_node_put(child);
+			if (keys->keys[index].irq_r < 0)
 				return keys->keys[index].irq_r;
-			}
 		}
 
 		error = of_property_read_u32(child,
@@ -369,7 +365,6 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			dev_err(keys->dev,
 				"failed to read key:%d linux,keycode property: %d\n",
 				index, error);
-			of_node_put(child);
 			return error;
 		}
 
@@ -377,10 +372,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			keys->keys[index].wakeup = true;
 
 		error = mtk_pmic_key_setup(keys, &keys->keys[index]);
-		if (error) {
-			of_node_put(child);
+		if (error)
 			return error;
-		}
 
 		index++;
 	}

-- 
2.43.0


