Return-Path: <linux-input+bounces-7271-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F33999468
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D2D2849E1
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016901E3DC0;
	Thu, 10 Oct 2024 21:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZSjMsam"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4670B1E7C2A;
	Thu, 10 Oct 2024 21:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595570; cv=none; b=Lu0rDAV7AwLkCZUDxsBOnRl5BhNfntel5pX195IwXEvgmVQ4gZdd2uHgLbY5brGk1M75CfRu2nhS17foSyFF8qE6HvdIy7n1MkEgL7JK9Ftc9AH6eCovmHMSs1HHziknC7vZkKwMlRo2IV7Rdg6++4vOFZa3AjBIL0VKmKrS0ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595570; c=relaxed/simple;
	bh=tDYGmTbXvdvpbRFG0IrCSIV47mvFQRYsGGj+NcIIddk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdSDbhK2368Cy/SLOSIbn8PVCdQuj/Z9wkHJLqrFhniWPP5m/B1PmQdY/nG3FBZZZ1ufkyCT+VbBoKrSlItyWw+ktA7EBxjcysd39PRgDGabwNDSK+n/mWkT2BlPloJgBd7b8egKwdj1CXIdSO8brLSZM2w41YZJhiINXd/u+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZSjMsam; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37cea34cb57so827778f8f.0;
        Thu, 10 Oct 2024 14:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595568; x=1729200368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHWRZlXxWyBjeMmMTHiCSMSAw8Pbb8irSTDpVqQUOvo=;
        b=SZSjMsamZn6r4xDPOWm+S+a1mZ9HNPqPLFNJqZvUwqRBG0jsztXblEeWzqqF8hXrcW
         rCs0EUiON82K6QlRgCdjnfWQ/LNmxVbMnxQgFVwqQWRS32Iacst5XiQRFKMn2vKGwa2Q
         sAKMl2oucMot3qzdrw6nEvHcIpev7XS5SFZt1saTbBLJQfSTLTdRTIZJsDFpm1KU0lGi
         iW+AF54lARmNlvl/LMqyjkDYkNxgqEZKNomJ5SyzANgf43pnmfixdR9RRyR3m7Egd5P2
         KI2cM3hiKQOp57szLvbR3YO1ikwp3Xah0ZfS7qVP+CFWZZyH2iFOkcJv83IP/ACQBnt9
         i7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595568; x=1729200368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHWRZlXxWyBjeMmMTHiCSMSAw8Pbb8irSTDpVqQUOvo=;
        b=avTNgZN3a8gT1XVpjE2bIgfTuhOa4j0/1DAVzh8ELVB3UWLiRgMjDmpGa3fvmDDsW7
         Z/p9XW1njKZQNmK8dfxiwzsNO3FaQso2IW6JPJ4Z8m31UXMmHiDamAz4UgQgLmT5K5BZ
         YSGECS6YHgjqKBxFuAlcXAZ4lSe4zrQT2lM7QC1ECg8YyCwiJu5aFtHlbDdaIhO4RQPx
         Wqy5OGVSSsrq2abxKS0mea6zzcOg5BkYU8y3pUvbQUsGGONA6oLFoD+ImcsPxiww6zQE
         WORqYMDoGH/9a4HF8tlJEB83WYyur4wyMVimIM21mQLJS2ycIO+gkjrWeb/4ntGNB8hO
         fL0g==
X-Forwarded-Encrypted: i=1; AJvYcCUSiYTI6WsKNiS8n7jwMRgz/W6Mdxf2XeaJXHt1anFDoYimTxKClD5Jn+pX39BK9d9GRGJzA2Z5HHprM60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNkUOUQH5Kh2xv2HPWOKDpkiK0g+XS+5Aq1UR2t53eaaiOKM09
	TyF3cXh1MZCrSeaiAarRbWYpLZWAarqsfinL4xxubg/60EqUVhT2
X-Google-Smtp-Source: AGHT+IH29d2ZIsfU/u9DFVW+6yCWUZ10F+EwzMZ6/EKx3GvDGWDTA3iS7grS2mWveZO8jUN402sziQ==
X-Received: by 2002:a5d:6843:0:b0:37d:43ad:14eb with SMTP id ffacd0b85a97d-37d551b7365mr236307f8f.14.1728595567520;
        Thu, 10 Oct 2024 14:26:07 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:06 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:54 +0200
Subject: [PATCH 04/10] Input: twl6040-vibra - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-4-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1953;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=tDYGmTbXvdvpbRFG0IrCSIV47mvFQRYsGGj+NcIIddk=;
 b=aQSM4gB2oKRbGTKDUnb+JrhfhsQ4SuW3g/7tQuRTKwxhS2Fu6V3AEwkunPJT91s0uiqLyuOB1
 PpjDY5LHIRBAvqrVdAPip7Uj9SnWp7iBwmBWmqkARDaPeBAPVRV8kuS
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to simplify the code and error
handling. This makes the error handling more robust by ensuring that the
device node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/twl6040-vibra.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/twl6040-vibra.c b/drivers/input/misc/twl6040-vibra.c
index 78f0b63e5c20..afed9af65bf9 100644
--- a/drivers/input/misc/twl6040-vibra.c
+++ b/drivers/input/misc/twl6040-vibra.c
@@ -229,14 +229,13 @@ static DEFINE_SIMPLE_DEV_PM_OPS(twl6040_vibra_pm_ops,
 static int twl6040_vibra_probe(struct platform_device *pdev)
 {
 	struct device *twl6040_core_dev = pdev->dev.parent;
-	struct device_node *twl6040_core_node;
 	struct vibra_info *info;
 	int vddvibl_uV = 0;
 	int vddvibr_uV = 0;
 	int error;
 
-	twl6040_core_node = of_get_child_by_name(twl6040_core_dev->of_node,
-						 "vibra");
+	struct device_node *twl6040_core_node __free(device_node) =
+		of_get_child_by_name(twl6040_core_dev->of_node, "vibra");
 	if (!twl6040_core_node) {
 		dev_err(&pdev->dev, "parent of node is missing?\n");
 		return -EINVAL;
@@ -244,7 +243,6 @@ static int twl6040_vibra_probe(struct platform_device *pdev)
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info) {
-		of_node_put(twl6040_core_node);
 		dev_err(&pdev->dev, "couldn't allocate memory\n");
 		return -ENOMEM;
 	}
@@ -264,8 +262,6 @@ static int twl6040_vibra_probe(struct platform_device *pdev)
 	of_property_read_u32(twl6040_core_node, "ti,vddvibl-uV", &vddvibl_uV);
 	of_property_read_u32(twl6040_core_node, "ti,vddvibr-uV", &vddvibr_uV);
 
-	of_node_put(twl6040_core_node);
-
 	if ((!info->vibldrv_res && !info->viblmotor_res) ||
 	    (!info->vibrdrv_res && !info->vibrmotor_res)) {
 		dev_err(info->dev, "invalid vibra driver/motor resistance\n");

-- 
2.43.0


