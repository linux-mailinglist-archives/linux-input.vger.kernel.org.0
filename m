Return-Path: <linux-input+bounces-4876-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC7928D16
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 19:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBC6B1C2246C
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 17:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F75916DC0F;
	Fri,  5 Jul 2024 17:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1NLQxfJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B1D16C42C;
	Fri,  5 Jul 2024 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720201144; cv=none; b=n8O+S+Kg2e13R5KAE3iJ/ruUMSXhi8Oh5hGAWT/h8vB4+EIox23KQ5lVZf+44MvUIedTvxd2rxqPVdTrpUm3hD78jJgvT2Kwi8kw17IJo4cc4XIzWA3DETgZ6VVIU8+bF9CKMwi8+Hs6ljtoqMf3FxbrTYGqhwbiaLLZd2Scy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720201144; c=relaxed/simple;
	bh=IXFZBV7X7UD8z2Ec7wO4f/8FrFuiezm5krPT0rMZ9L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctW/uGT/o5i+zcT6sInYMIOzR4GSRjd45DEUgNIeo05ePogAonhBQ+8rocsOq/o+DAvCsnmq+d8ssLVCQ2aUrWM6UUGvl8k2RlqHk8VEkfptraHK62F7ThQZeXhX59SMGYSGY/UcGRK9pKgXdsC9TLywX91RnNvgC2J8SoRpLBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1NLQxfJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-367b0cc6c65so308541f8f.3;
        Fri, 05 Jul 2024 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720201141; x=1720805941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iew4o23S0SIo1s5fA8BDbdRzSNNcENtGYU1X7JxtdB4=;
        b=L1NLQxfJ2QM1oIRzDbPNzqSwE6MTLQrpEDLMtW2GUlc7mU7SvYWv2JHWm3flNZI3vO
         LH5gAZceYqs+y5N3lHKG1v06N8IaSorbPmISVidb7P0BQwIWLPrIoGOOeBFeIel9N0JD
         19W9ftdAKCQgQ4ihIwdDPvIa6H2FcHeKg4o8QVE/KIBXwVhPm+coYRIbqrfdqzwaTUqA
         0GY2qXXsxgPxSTniYAePWXAPwvFH4nV4oMqH+aiB3Uc7sDpojZYhQxKIxKLvWnUKXW+j
         5yQo7L9+TIzXufR8gBo/XhdNmmrphyf4zcsUsH5NNgHICPBT/DWrDBiQZo5f20eRNszb
         5Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720201141; x=1720805941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iew4o23S0SIo1s5fA8BDbdRzSNNcENtGYU1X7JxtdB4=;
        b=olEnP5pueWP0ma6uopdUKqycnL7/7Ejmm5C8XQX3guG3Zt1ofh13TukL+eZyFB5aid
         Mu6BXE4EXdULbhH4xgg9qDkhyisL6aiKAtxQAP5Qb6/tXqw2davfQa42zbPqQLGrq6Yl
         CipLESG3OVBOZRSlLhRTZV48w/VibGSv3SiKJqEGlMVebX6nP1WSLfMEjVZZ/PGEcyRl
         ExlrWP9XsiQ1nKEQeCKhAy1Rwoci1sdnJxISgDYh339bVuhFjGfWxc5gVutYG4B+S0p0
         WdKBcMfESXfXRXJJLECp5D0eXPTepPFdzddNyRh3dckr40Rm5BPiocWJAlzyjVv75Kng
         PrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkCQUCrLkqs1izxrxNPe29hoJW7nLQ7WCw848ig2zr1CFJhi9KgmJIKlAP9WQ/hGf5RHHTe7qajO9/o065RjyvkVvummpzprxxQKxj
X-Gm-Message-State: AOJu0Yy+P750q6sHdCACanwFDo5hIjyF/+XGOURAteXZ7VzrucAoag6y
	byAgbhfSg8TE7lVV/cRyT+5+pezT+NyIW/f+n323FWwPccLkINsG
X-Google-Smtp-Source: AGHT+IGypPOezOlLUAdnk5U9hnwyjZQ97aV+o/cs5bl3Bj3+ayg7Dv/XHvxQr+q+0EJ48U3Pq14eIA==
X-Received: by 2002:adf:ed52:0:b0:367:96a0:c4b7 with SMTP id ffacd0b85a97d-3679dd73e11mr3992843f8f.62.1720201140854;
        Fri, 05 Jul 2024 10:39:00 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-4adb-3312-ca75-bf55.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:4adb:3312:ca75:bf55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679b1e5f31sm4850466f8f.33.2024.07.05.10.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 10:39:00 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 05 Jul 2024 19:38:50 +0200
Subject: [PATCH 1/2] Input: qt1050 - constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-input-const-regmap_config-v1-1-f712a4494883@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720201137; l=827;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=IXFZBV7X7UD8z2Ec7wO4f/8FrFuiezm5krPT0rMZ9L4=;
 b=F7aHw1h0iMTW/hjFSLwo457L6BLnNZd1u6FfUixPPfMbJ3UtjRCQ/BMlbC/PajAzO8YUQhRP0
 AtwRMNHazWGAvgt3UxZONxWOkkbN7HQ9+7hZZ4lhbL5N+CS2sr22J1X
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`qt1050_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/keyboard/qt1050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
index 056e9bc26026..5a2592e6293d 100644
--- a/drivers/input/keyboard/qt1050.c
+++ b/drivers/input/keyboard/qt1050.c
@@ -208,7 +208,7 @@ static const struct regmap_access_table qt1050_writeable_table = {
 	.n_yes_ranges = ARRAY_SIZE(qt1050_writeable_ranges),
 };
 
-static struct regmap_config qt1050_regmap_config = {
+static const struct regmap_config qt1050_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = QT1050_RES_CAL,

-- 
2.40.1


