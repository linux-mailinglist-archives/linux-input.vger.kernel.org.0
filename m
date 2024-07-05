Return-Path: <linux-input+bounces-4877-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4248928D18
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 19:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FA3E1F238F8
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 17:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1DD16EB4D;
	Fri,  5 Jul 2024 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCcFpDHd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BCB16DC02;
	Fri,  5 Jul 2024 17:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720201145; cv=none; b=QnWopXSl6iAQExh355fmT+O3LawiDKnKRGHhkgmqjRA8dZlB+VJ/m096UnCCgdY525sFoCsy6f/pK+Wd0QYr8lPbBDqUlj5UU7jQ9noLGd21T1FaDjVgCtoA33Q+j/MZ4iO8dgFDLBp5nPSx21r51ERq2wXC5j2N8mLFOinAs1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720201145; c=relaxed/simple;
	bh=mVgTE6Tr03GmKnHHkpuO3Mvjmm+k16ybrIW11uRgrJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omwrzyq7OCXlGYwtYuKc7gSwK3wDal/UgMzpXb0pQGN0Gdz0aG7v7SoQd9ebbaCmPkHttAM9z/ckROvr+WiLyOAUi7S7kXJpPM//czNkQq04gDfgTCXceYjZeCdLW2DImZ1yK2iC/HbEbWIt7uNHqlhau29usYLEfk+NXCakR4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCcFpDHd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-425814992aeso12671385e9.1;
        Fri, 05 Jul 2024 10:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720201142; x=1720805942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5cL1Ju/EnizCBwzcplcXLkNB3ZwaJ1qWpxsE9WHe5I=;
        b=ZCcFpDHdtaL7dFXFFQ+uNg/8KD1m21k5PUEV4+l+IxHSyxYizHavaY15zLdi4bMmyp
         0WLIASzYX1OvKyzIqZN59rNGDJyOwZmAb+r4mDVeqd1XD2Va4OPQ5EGoJQHbwYcW7x3F
         yHXAnVupLxEipfsf9I4L0GH16cGVbXtTv/KGkQIS5oXrdpoN5Yv/nlSzl8rfncsnAf9M
         4WKvieAHLHxKiGGOnlUybk9SaH04VWB9pvtCNM42lSH9PMooQ5RLT6YchugoO8mYJgqe
         YtEF2lB+61oUlyG48i52Krjb63VZn42rVvuVzNQgnqGKHsUF9f5+Kj8wjQophHSoTdE2
         ZaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720201142; x=1720805942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5cL1Ju/EnizCBwzcplcXLkNB3ZwaJ1qWpxsE9WHe5I=;
        b=c65SQmyYLKZ1qNx4EdpNp6lzR0g5SdobNJD8UCJaVF/9rqKotpWOnbHeDpDSai7F1g
         wb4AmFeFPMeCdwmNDLvVzuLrnL3EBA3RYWvO1zMyv4NX/7OuXkHlKOXsSbfEPnsZMaK5
         3IcsRCZCEN+g0JIWdycp7Pik4FQa6N/OqISUd1sznmsOTGoqmzjKaHMDQ+wzj2hWT0kd
         HRCmRb+QFEn4dJfS+rezK0EpmWQvzEcp5hLLVi14bc0fxNjIeGt4YxZKcv9Ojcn7u9Vp
         jnzzoVuLgbJC4Y1Xjxiq4NLxP+gJD9W6SAIkds1oHTV/2afiWJd9N9Q7r5fPTjiQNz1X
         aq9A==
X-Forwarded-Encrypted: i=1; AJvYcCXfCsGzzioK8TZL8DZLEGeDSa4E8EO7DcpBVcr+4r8tdacTs2FxJOt/qLW03t7rGn6nEkUcjbfFbNSyeMFiYPT1qJNkrqoyUtLpcLbp
X-Gm-Message-State: AOJu0YwiLwifBNycmahZN0VEPD6a1136Gzx52mIptUwPLIZD1q4zw1EJ
	uzuyheZjaGtxYbBtbw+RK9GMP0tUva5ekHTgRJLZs/Q6evfBAupA
X-Google-Smtp-Source: AGHT+IENnZ31Fhfxo1qbgLtZ4Qj/fNq9I79lumyu1cAhEbDMqCkW20hYNV/o+7mX8LgMIuYOdSrO8Q==
X-Received: by 2002:a5d:60cc:0:b0:360:9d4b:5b82 with SMTP id ffacd0b85a97d-3679dd66ebbmr3262790f8f.47.1720201142404;
        Fri, 05 Jul 2024 10:39:02 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-4adb-3312-ca75-bf55.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:4adb:3312:ca75:bf55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679b1e5f31sm4850466f8f.33.2024.07.05.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 10:39:01 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 05 Jul 2024 19:38:51 +0200
Subject: [PATCH 2/2] Input: fsl-imx25-tcq - constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-input-const-regmap_config-v1-2-f712a4494883@gmail.com>
References: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>
In-Reply-To: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720201137; l=785;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=mVgTE6Tr03GmKnHHkpuO3Mvjmm+k16ybrIW11uRgrJc=;
 b=YpVzo0oa9gxnfpyIdCxM5sn9qo6yghDA/RAiEqND/2sS9iEP6Ju2WAMETewxVsxjUP1V2C7z9
 lsiDsntgMXSAo9kOzC7mZCDUN+i38dHKfPALPTtN9EVGjZ53BpYpkbv
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`mx25_tcq_regconfig` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/fsl-imx25-tcq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
index 60a7246c5157..a32708652d10 100644
--- a/drivers/input/touchscreen/fsl-imx25-tcq.c
+++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
@@ -38,7 +38,7 @@ struct mx25_tcq_priv {
 	struct device *dev;
 };
 
-static struct regmap_config mx25_tcq_regconfig = {
+static const struct regmap_config mx25_tcq_regconfig = {
 	.fast_io = true,
 	.max_register = 0x5c,
 	.reg_bits = 32,

-- 
2.40.1


