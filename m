Return-Path: <linux-input+bounces-4875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF49928D14
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 19:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F111C22652
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 17:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FE116D335;
	Fri,  5 Jul 2024 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCZ80TiL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C343A955;
	Fri,  5 Jul 2024 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720201142; cv=none; b=Jrc2D8sJLaATbOvfpccrvivoiruIguRpeUl4iR3/n1CUDPrvTYEQy4CBXvYpkdpEXX95OY0CY2cK3msHp2038eTuO4XtEnTM+Jh7sA5fAmMm4ZLhsNJ1QaZkc++SJNVg7Gx2TIY6/RTZEiyzqAflZdjb8LRyRnRkhlzRllngmUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720201142; c=relaxed/simple;
	bh=uLVfBqhE/F059/4NlG6w4dj5glhnxKMh93m/OyjAXcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fIs5rEh9TBrNxZxp2Xih+SZKgZDUqwWZD4aJaPLGaknwfCBm3V7YS5hMkE7YL5Ih8zvd18yTvV2U0XvCEn66+N82na9ucmXfjPFrfv9wnrFGrxGr4A1JGt+3pRjyJOhE35HD8z3CHhk549QDCNR7LrYvvcjjAfshrf0nLuvpfxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCZ80TiL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4256aee6d4fso11555925e9.3;
        Fri, 05 Jul 2024 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720201140; x=1720805940; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0uzQFhxd/mAUsK60UuDZbgZFzTMenSzsMSc4Ot7YaY=;
        b=lCZ80TiLgvKITS4n++w51nIGo2xPNf0U3mimPE2YCEqsplzSThLwIsxSZz8pQDsKon
         Zo6Kph9XWLZ8iSY4DlE+M8Bfnun6kBUDZYSRp2q22DhHn8XlhR7yCult9S5QQV23dnWC
         zMZkGhqiK2zfOyRIl/dnV6QEj5Yv4vCLTcQh46936qbDRcq796gx4f7N3cbJQDO4xH6c
         uY603H6/bR/x43RiX5GuEhY7i3RuAWDQZ81GMjNufPQ6XVrdSE3t+dPGPY0gc/Yztib9
         0kv6r6RUqD09Iy/1hn6AT9fEX0aE+lHMumoAtkVij64CC1+OgZaDI2QERwg4iYloaUde
         1AVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720201140; x=1720805940;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0uzQFhxd/mAUsK60UuDZbgZFzTMenSzsMSc4Ot7YaY=;
        b=ca6HDik7zDuOL4WHnQujtd5rh7T5wCsuSQk688iKz3MlkgQidLAlJb2crKc6o6H8VE
         HMQgOADV7es3jvZBFZYUFzPsJp6PQgoq0AjjaDjThbHI3RdcTZLhRq0Zf1r6TKV8oZIu
         c+Q9ajS0gJp8FH6F0A6U995JelsDEoTArGWrGmT9FyuNC100qeeHukndvvSaVqoQYQap
         TbW6Qgha8S730hCNJJ2J3hoJyI7GGRrvNmE9Qt8gGo3LHA8fLnEk4UsTO4jyMXAq9BLP
         P9CfhWYOpqsZ56B7lIsTVuO7m76BjXjf/mb9qwsmkclPOVwTOln4oIf9+3S3cHAFeR8W
         kz7w==
X-Forwarded-Encrypted: i=1; AJvYcCVLKYdmUqUyI/KDl2WLaD+4C9dJvwEdNqtYbNInq8Tz3WC4obY3D07abDD7QD2Z0nhQQJaVImhIBAT8JFkzGTAOCirSIhxer7yYGf8l
X-Gm-Message-State: AOJu0Yy6GEsz4+l/uZiHx1q5BOrqmU8CXLe8Rr73uf/WVl7Suzt07T9n
	9G2cegPZDenRbyAWb52WrMBkthRdFfCx6LxaJoXqStHulAp3UpFd
X-Google-Smtp-Source: AGHT+IFelT0b09dBTjSrUvzyoZ4ltSTetwb4SzRHnt1d+1Rcyah9yX6f1nUB59ZwR+67KzoW9MVjmg==
X-Received: by 2002:a05:600c:2059:b0:421:5609:115d with SMTP id 5b1f17b1804b1-4264a4566fbmr34869765e9.41.1720201139399;
        Fri, 05 Jul 2024 10:38:59 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-4adb-3312-ca75-bf55.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:4adb:3312:ca75:bf55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679b1e5f31sm4850466f8f.33.2024.07.05.10.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 10:38:58 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] Input - constify read-only struct regmap_config
Date: Fri, 05 Jul 2024 19:38:49 +0200
Message-Id: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKkviGYC/x3MTQqAIBBA4avErBtQ+4OuEhGVo80iE7UIorsnL
 b/Few9ECkwR+uKBQBdHPlyGLAtYt9lZQtbZoISqRScaZOfPhOvhYsJAdp/9lGHYYt1qZZZKSrF
 oyL0PZPj+38P4vh/4uvA4awAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720201137; l=761;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=uLVfBqhE/F059/4NlG6w4dj5glhnxKMh93m/OyjAXcE=;
 b=1Zm/Q9o4Brm2oxTFrNOWYYbIy25spad+FQanBfkmRw+ND/RqYbke2g3NvFy1O2+w1w4KZepJw
 ncYxNxch8OHDPT1T17ijj5Uu6ZT5l4grKqy1M+07eYj4zuewX4f2T+g
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series adds the const modifier to the remaining regmap_config
structs in the input subsystem that are effectively used as const
(i.e., only read after their declaration), but kept as writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      Input: qt1050 - constify struct regmap_config
      Input: fsl-imx25-tcq - constify struct regmap_config

 drivers/input/keyboard/qt1050.c           | 2 +-
 drivers/input/touchscreen/fsl-imx25-tcq.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240705-input-const-regmap_config-46d2fb3110bd

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


