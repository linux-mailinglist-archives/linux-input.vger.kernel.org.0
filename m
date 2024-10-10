Return-Path: <linux-input+bounces-7274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCB499946F
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F1AC1C21C36
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B301EABC8;
	Thu, 10 Oct 2024 21:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/fPJPBg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C111EABA9;
	Thu, 10 Oct 2024 21:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595578; cv=none; b=qKabPUce5dF0j0eu8+J99AZGoyqj3q9s6hIl8sJlIogFOAxnAgDVELShHfP2NNF8Jabc4TpK5DiudptfajCwNBubzXNjUDmBzBJC4eHUEDzjYV7J3H7Qcr6pOBDPYBujsp72O3kYbwBNjlxmio48zATt3FbCyiNKnGxbczuaJNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595578; c=relaxed/simple;
	bh=TCHsuzKnwrSzC8ELBgoH5r2aJODW1HU03jHewVR1CdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJE4VLJkVE2shWEhxH6xu/ACaFMHJNALxkoio9a6T0nufPQWEUj631NGjyx7uAadbXoIz29g7plACEz5BvkD21iB/KqwbAzUgdr9aaYwh5MscsJh/QMX2SsRFNye4JC1Vp4mkcrtOGGsQlpJOXuZoyDK+v8S2c9E4RlH+F1O+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/fPJPBg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d4ec26709so591915f8f.0;
        Thu, 10 Oct 2024 14:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595575; x=1729200375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDpMMaqPXUoFVzi9A3PDhKb1T42MjqvUb4kdLnoWycw=;
        b=F/fPJPBgaHjtRnE9RIb+Ni5D4E9jKNSBqh69KXYhXEcI5zJYOj3RNq+dxRbCOIxjnN
         WcJjWcI+BLgPWb/ZkM9QojGFvGvVUGFoY6UcMOd389GIqDcgBDfTH2U0PZrLCXt8wcL3
         s4eZy/qMwCwkFxAd17dfsEyqX4Ns3AIAN03zAjppxBLYTZ58RWb1OmRG6jrue7KJe9cV
         LjvV96FgiIy5iv/QB5wxDIhEY8I1/azQdU8KBFjWE9qt/KFE1kZaxUGjadoXTUe/R06G
         oUFvftou4cJU9imh44djc/FYkQUM2ZsJk4bo+w2XJwHNwOHMRyozKWYNn5rCWzkcQ9lW
         MpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595575; x=1729200375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDpMMaqPXUoFVzi9A3PDhKb1T42MjqvUb4kdLnoWycw=;
        b=FynAEudn4Hq7leGfrkMcMSJRlz/FBZRZkLRZ/e+yrYTKJzkxJETMpX+oTwFBK7S0w9
         soi5nC3KDToaJGh74UxJUOVOATAA0IlpW+8HmiCOFapKyScYhwGZBEOfx9jCXBF6cj2I
         CwGQ58OFCksI2SbvH/MEczrknt7i//DXmQPDcOd/qgkdoJi7UAEMi6nITS+7liVw1XQO
         Mn6Ux/h+kgK7OBxnjLWMAoLwa/QlqCOnpHaJkfEG+S6u5QrvOCG3Cpveoaml3s7/F5+F
         10ezRWlkFYPLSzrB7g6cNnvB1BVcqpYjy02v1PXJBT5AluPKP7L5gavgKN2Mygj92zQU
         Vbbw==
X-Forwarded-Encrypted: i=1; AJvYcCWJlslQYOzD/lvWCS7dzyIy/Xvm8C8/kJkbvZZgF9bsj7EYNstlJC63vRvuzKhUIGozP5VJG/qwaOmRyYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBo5/McZQEaB3lL3F0N0yh6vmjOWZAJnyGBSDGHpc0jhnDjz7e
	m1S5vbbssuUeqZx7l91+2nU1Oj6y/PpO0tn+xeB8j4L9v6wpy51j
X-Google-Smtp-Source: AGHT+IHdMahvsk2hiPcLQLFTajRterRsAVRoLlPSao00sFi2GHvdnhGLq5Smgs1qAUipDrz8egxq6w==
X-Received: by 2002:a05:6000:1203:b0:37d:4e03:635c with SMTP id ffacd0b85a97d-37d551d512emr359593f8f.21.1728595574599;
        Thu, 10 Oct 2024 14:26:14 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:13 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:57 +0200
Subject: [PATCH 07/10] Input: 88pm860x - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-7-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=2328;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=TCHsuzKnwrSzC8ELBgoH5r2aJODW1HU03jHewVR1CdI=;
 b=xHiUPq+0uEXEYbsSevTTOS03OD5A3ZbaOvxx2BJWcX2dzwkxmfC/OCrEYTRrgYVjPrjRoPxHD
 FE5yXQzgkTbBtgRrI9dLa6stp5BoMUgaC+F6ClAuNoxJm5fgiV8x+tC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to simplify the code and error
handling. This makes the code more robust by ensuring that the device
node is always freed.

Drop the first assignment to 'pdev->dev.parent->of_node', as it was only
a shortcut, and tie 'np' to its usage as a child node.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/88pm860x-ts.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/88pm860x-ts.c b/drivers/input/touchscreen/88pm860x-ts.c
index 81a3ea4b9a3d..0468ce2b216f 100644
--- a/drivers/input/touchscreen/88pm860x-ts.c
+++ b/drivers/input/touchscreen/88pm860x-ts.c
@@ -117,13 +117,14 @@ static int pm860x_touch_dt_init(struct platform_device *pdev,
 					  struct pm860x_chip *chip,
 					  int *res_x)
 {
-	struct device_node *np = pdev->dev.parent->of_node;
 	struct i2c_client *i2c = (chip->id == CHIP_PM8607) ? chip->client \
 				 : chip->companion;
 	int data, n, ret;
-	if (!np)
+	if (!pdev->dev.parent->of_node)
 		return -ENODEV;
-	np = of_get_child_by_name(np, "touch");
+
+	struct device_node *np __free(device_node) =
+		of_get_child_by_name(pdev->dev.parent->of_node, "touch");
 	if (!np) {
 		dev_err(&pdev->dev, "Can't find touch node\n");
 		return -EINVAL;
@@ -141,13 +142,13 @@ static int pm860x_touch_dt_init(struct platform_device *pdev,
 	if (data) {
 		ret = pm860x_reg_write(i2c, PM8607_GPADC_MISC1, data);
 		if (ret < 0)
-			goto err_put_node;
+			return -EINVAL;
 	}
 	/* set tsi prebias time */
 	if (!of_property_read_u32(np, "marvell,88pm860x-tsi-prebias", &data)) {
 		ret = pm860x_reg_write(i2c, PM8607_TSI_PREBIAS, data);
 		if (ret < 0)
-			goto err_put_node;
+			return -EINVAL;
 	}
 	/* set prebias & prechg time of pen detect */
 	data = 0;
@@ -158,18 +159,11 @@ static int pm860x_touch_dt_init(struct platform_device *pdev,
 	if (data) {
 		ret = pm860x_reg_write(i2c, PM8607_PD_PREBIAS, data);
 		if (ret < 0)
-			goto err_put_node;
+			return -EINVAL;
 	}
 	of_property_read_u32(np, "marvell,88pm860x-resistor-X", res_x);
 
-	of_node_put(np);
-
 	return 0;
-
-err_put_node:
-	of_node_put(np);
-
-	return -EINVAL;
 }
 #else
 #define pm860x_touch_dt_init(x, y, z)	(-1)

-- 
2.43.0


