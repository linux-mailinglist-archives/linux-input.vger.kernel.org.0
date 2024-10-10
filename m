Return-Path: <linux-input+bounces-7276-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C479999473
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B260AB21C59
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A951EBA1C;
	Thu, 10 Oct 2024 21:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCD9zTj8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127571E47BB;
	Thu, 10 Oct 2024 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595582; cv=none; b=FmvbMFw2EeE0ussao/RxF4RcudSfa0p6DmA7Z5kDEXwGEHtqrJxDvK6V87Qwrs8ZHDpzk3f8CAZvOuGW9if84/Fvumr7XZ0lj+iFMqwwB/P9Se1xyDqtiLoFm7AcssTxVk34DDexoglScPFIYJXvfSH4Ktxi0THagWeQbYlcTv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595582; c=relaxed/simple;
	bh=qaHmN1vj3OJMngtAh5LlltSL6miuty/pRQh556o6ku0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7YuRB32qsmwptWrcDVlI/4hizr+PiW8vWtTYJePfXdepYSVDSGpW+H9TOSHxhbqYElamuTvezgZxB96XxxHvij4UAU3O0axnzsGvaa2ZYghMAOG6HqJHfpEEiOU9rpJk3nPcMIaAmpzuhfoQe1S9gxI3w6RcnQdEmLveBQadr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCD9zTj8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37ce9644daaso884664f8f.3;
        Thu, 10 Oct 2024 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595579; x=1729200379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmicnpp9cd9JtqZFSnHyB6Y93ime6LMtu/deyDIKcMk=;
        b=iCD9zTj8aR87YnTpTXaqLQYAtjcsGN9NIlBG4jSVR6O3AiPu0XXNOOmMHJbejMHsG3
         TMVCca9KU2PJOragwrXVdbCmLAOrlI863645c7Pb6G1OAxnqxPUEdptcnISitsUWtsq0
         HCba+4tT4+16BHzgbgMzKzV52z1E6Nc8/FwpWxF60pMSt/uXyM9Qw0LV5lUcD7KjjJu4
         TBUxfVOGYGBD2QjGHB7blc+h5Rg3i64BqkT9c1VSbJb1YanvxLLroCNBWEk66InXUGHm
         0U9omlknRR/Y8XX0mN6QFzx5rjS7fxmFqx25yfwpF+VKuI+9OP+AcRQJaijWCmy+0GcV
         bEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595579; x=1729200379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmicnpp9cd9JtqZFSnHyB6Y93ime6LMtu/deyDIKcMk=;
        b=Gyc+Er3kgAYOA0jUPvDxblIX/HMcfULJcvbCeX3jonODJ+NlZhj0tA0PFXxvuV94qJ
         eXPGUBy3Jypg74mNoNQnT24W/m6YmOMjNhgrmaM2jH92cOytFAb/6Jc1guYPZJvtXmH1
         7HSr5cBQAtc0bOKVoTGUK47lbtlXWsc5M/wcJlgHwhP5quTVRTd6bdvCgFutKpPY61uC
         4ZZA8FcDuB45YK90lIg/bGQL1DYJylRiJnmeZfNteXMZS/OZWvt67dMi76YW4K0m31M/
         +lWyQr12aQ5cZ+nrm5RSpFiJ/VOKJIX3+af6p82T1cyqPFK8DRnevcDAH0Su1NL6Df3H
         z0Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUgtS8CChT3BfOSMV+zKu+o66JJnJRfD/kqqdAOxlPrCHV6omUM4MMer09S1KCobj/hM1yEP4dHcomrJr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxal/nfph9Dj7CCBTTf4UvDSEY307FmZUaIlIDGzf7doFSkTqDI
	GERVP4ANvjcFp3dRycS/atsSp8FyHEXJuKbQmYGifFEbsRXYDvyA
X-Google-Smtp-Source: AGHT+IF35HrnKs7WD26F1nGHKplWO56RdKrMZQ7OOp7vbg+9vF8z0Burx6lY8GWTwDksnELnrk9jIQ==
X-Received: by 2002:adf:e90f:0:b0:37d:50f8:a801 with SMTP id ffacd0b85a97d-37d5531323bmr302685f8f.47.1728595579251;
        Thu, 10 Oct 2024 14:26:19 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:59 +0200
Subject: [PATCH 09/10] Input: raspberrypi-ts - use cleanup facility for
 device_node
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-9-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1209;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=qaHmN1vj3OJMngtAh5LlltSL6miuty/pRQh556o6ku0=;
 b=e1/0RKq2raIunj/4RBLVw/Zc3mleb5v6VF2G0Gas11OFUKozTrqrF4MulYBCUvD857OzZgntV
 dW/x3ybOLxPDEqlxp2QL8JWTqTMc0scMnU0b57l0w0WuOer7yfMUZp7
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the '__free(device_node)' macro to automatically free the device
node, removing the need for explicit calls to 'of_node_put()' to
decrement its refcount.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/raspberrypi-ts.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
index 45c575df994e..841d39a449b3 100644
--- a/drivers/input/touchscreen/raspberrypi-ts.c
+++ b/drivers/input/touchscreen/raspberrypi-ts.c
@@ -122,20 +122,18 @@ static int rpi_ts_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct input_dev *input;
-	struct device_node *fw_node;
 	struct rpi_firmware *fw;
 	struct rpi_ts *ts;
 	u32 touchbuf;
 	int error;
 
-	fw_node = of_get_parent(np);
+	struct device_node *fw_node __free(device_node) = of_get_parent(np);
 	if (!fw_node) {
 		dev_err(dev, "Missing firmware node\n");
 		return -ENOENT;
 	}
 
 	fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
-	of_node_put(fw_node);
 	if (!fw)
 		return -EPROBE_DEFER;
 

-- 
2.43.0


