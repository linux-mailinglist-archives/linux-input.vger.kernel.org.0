Return-Path: <linux-input+bounces-16985-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E323FD13EB4
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5CF03027A7D
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA0A3644BA;
	Mon, 12 Jan 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UEyeL73N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37336402C
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234459; cv=none; b=aTD4mLovjitqhHrTgF1JXCs6PNiRTs4KYOSav0qQrStMwjKSnKNi/+pkQnwTMR2r+xGAMNitQVz2qAY510cyaZ1c4S4dNP5b7vgSCvBRQwCFQwx/zH35TjPKnXbt6sy+9RWNL/HzK/hkDtROcU/P052dyzPjMSk31zSmmTNcZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234459; c=relaxed/simple;
	bh=JgPGUs2ClrapeF4Nxdqjsg+HqL0Eaw56uzMx74Kdpvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hTks2rcezGoyfwNX7ZFjq6y18g64t4yJn6X0xYGyMp9hbahvCZGeUtkAgOTuYhIP6K5b9U9p0ZAsd21ZA/e5C31mTTH18qoMwQOTFvzuti0h2hytMLUbevOpwgOgcI++R+Mq/oY5hnK4g866RhdedqSdbYsjANHC9MgpaQVne24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UEyeL73N; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f57cd471so3244035f8f.0
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 08:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768234455; x=1768839255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lt/EjrD1KFqOXgTLsz92tjRbsWNHSTATnwKQelwH1D0=;
        b=UEyeL73NKm+DR1bON5kz+KsCkHR9Yk3OeMdTgtfxmNSr9C4Z3Op3q8bvK2oIfBpyxh
         EAIBiimziBwpJGw9pdmq7USFgG7ZvMUvMJPjc63DnaTDmA6uvoFX4R00j3TRE8LXQr5k
         dJ2OF5h7sua8lbcPoI3jdyBboV1Y6IjLwr5rwEq2Vjpgj5lNAG2+oez81FbYsBFjjkMA
         LyJPd9GGwAuwsWyvGD5iWPjidoK+4nM8jDiwERfshG60ZtW/jHpEbh49n/8dL9YLMtGp
         ehm3p5/E21Yy/QFnMd8GMIShAwsijyvUoX6O/5vcqpXp1/71x6Wzr5h6cUIPFqxQPLwD
         d8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234455; x=1768839255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt/EjrD1KFqOXgTLsz92tjRbsWNHSTATnwKQelwH1D0=;
        b=dzu7kU/AMec9d0QAGIGjwz9x/2J20zADdM4rcQPJU5DL38PhGd9++fGRuFzfLIsSPR
         Q8DTkoJhm0AzVHLi6gicJFc/ms5ZKPWTH+QS76cA7TdrTCV4rUwp5aYvDz6dfnU3nklV
         yQS6Jzsi1kU6A2Fj9s2p7wwEd84HY/rpzWaprqRWxx/R1jg1wUUTn6+hLHdhL5/Tot+N
         P0HM9QbvHwvQ+2bJH3AXo3CB0+r0xEL6cLBL8am1elq+8lD0/oy7OxBGEMfvmMrY2/Kw
         QhaE++aXZfFDsWrqZAuYU3HefY/1KwTZC1J0185Itfc4o/Ot7lIqWdPdHpAsTiVDJEME
         +Rfw==
X-Forwarded-Encrypted: i=1; AJvYcCU3+R8vH69fYS1WVDg2EYYhPKFGO1cxbH/YADksB0Kc0Pr4RAiiVLO7HyIpMrvKAbakSti1x+V5L+HZOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUGhUptm0jIQmPIGmD4soZge/Cax2uc+IhOE0btODJmGQJOpY
	uQtwuyMsmSTir2X1nyI8k/nbE7EnPlANTyJmUQfGpiXGLvRH5rZn3t+8Iqb7He3ytvA=
X-Gm-Gg: AY/fxX4vK7/nQ6u9Wi0c8N4HMM1TFMjuyC+GgN/vdCEc2TXv+6oNuIGWY/BFz7xcLdv
	3wIEhCcVP63SKb3qqlUoXcXfqiSSqYh6S3vZyRdwxMPAqx5Jm24bE5zCvYEoCgFt0WdxVUTq3rW
	jFY9lqCwFJTIcYeyaWlm421LG16RrLdXvW3xA/+S8yHajEsHcvD/YGUyJNVPiMOuXLXFhuM6t5b
	EkJrgo4TfGk1QfD5onmEKwYL4AOg8fDoJxMSVYYlsj5uTUNxaRbFka+K3UCXwcB5ACcLY5LfWwk
	VuBHNggqabVteL7f9xjkozhdVvVAoWsRHbEbkL6SaubeWe1Yu/q9pi64V6g5ANn/QbXYun5ChS9
	pYi/S/s9HTPbu7e4ESBLKyFzu2yFVvFShYAQRyc7yx3P2Y138LebbTZtFqrrfWvQjFFCT9sB2T4
	7h5rvLcIqMJs3nlzJvnAVRr0SAhLIOISNuw3/Hozge1sYGVCzexWY4jqmUCb40RpABj9QXKztQz
	EWv/yBsLHY=
X-Google-Smtp-Source: AGHT+IF6PHiO9nsU8BRKbqPH151Up8vtTo+xip3LVKygILBasPhnI43PRY5l4yoYD5gxonWMYSA35Q==
X-Received: by 2002:a05:6000:2311:b0:430:8583:d189 with SMTP id ffacd0b85a97d-432c374ff9fmr22868067f8f.39.1768234453677;
        Mon, 12 Jan 2026 08:14:13 -0800 (PST)
Received: from localhost (p200300f65f20eb047d7efe6100b35af4.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:7d7e:fe61:b3:5af4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0e16d2sm40758108f8f.13.2026.01.12.08.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:14:13 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Samuel Kayode <samkay014@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sean Nyekjaer <sean@geanix.com>,
	imx@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: pf1550 - cope for CONFIG_PM=n
Date: Mon, 12 Jan 2026 17:13:59 +0100
Message-ID: <20260112161401.3751275-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=JgPGUs2ClrapeF4Nxdqjsg+HqL0Eaw56uzMx74Kdpvo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpZR3JG1tRfxfhYX6WbciOFKzU0FgncyvEKv1Sq Dscvdzp4MGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaWUdyQAKCRCPgPtYfRL+ TmchB/44VFtexresg8hgP66UocHD5WoPy75nbK4j0R6Mw0p3uQenYFqVjv0IANlrLEbDxIM2/tJ MsUZi6c2o4Xnxux0Lvb30Y6UeP0vsz7iIacrEKQZ1cG6npx9N9fX2LRmiSkE6UhtCumjEd6zs+a saAcEH3z6fb0mKj7ntNyX6R/95boZ5foiJMV+aEIH/V1NyYccICE1s9yhyImMH5+cnCzjjnLJ5E 1jclIKKWWHaH09FZLcfAs8Ti9iIxm9QonweRKTOXBe8v6P13kB3CEZ3dH+ENzWOdZBAemixjYVJ KcHcpOrEa/HfP/HbuYwe5sUZ0RjoqSxJYX++HtvRD90FEZSX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This fixes the following build failure with CONFIG_PM disabled:

	drivers/input/misc/pf1550-onkey.c:154:12: error: ‘pf1550_onkey_resume’ defined but not used [-Werror=unused-function]
	  154 | static int pf1550_onkey_resume(struct device *dev)
	      |            ^~~~~~~~~~~~~~~~~~~
	drivers/input/misc/pf1550-onkey.c:133:12: error: ‘pf1550_onkey_suspend’ defined but not used [-Werror=unused-function]
	  133 | static int pf1550_onkey_suspend(struct device *dev)
	      |            ^~~~~~~~~~~~~~~~~~~~
	cc1: all warnings being treated as errors

Fixes: 9acb215cbebd ("Input: pf1550 - add onkey support")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/input/misc/pf1550-onkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/pf1550-onkey.c b/drivers/input/misc/pf1550-onkey.c
index 9be6377151cb..a636ceedfc04 100644
--- a/drivers/input/misc/pf1550-onkey.c
+++ b/drivers/input/misc/pf1550-onkey.c
@@ -173,8 +173,8 @@ static int pf1550_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
-			 pf1550_onkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
+				pf1550_onkey_resume);
 
 static const struct platform_device_id pf1550_onkey_id[] = {
 	{ "pf1550-onkey", },

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


