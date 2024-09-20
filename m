Return-Path: <linux-input+bounces-6626-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E785B97D787
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 17:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A261F2167D
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 15:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9942717BB3F;
	Fri, 20 Sep 2024 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mA4gFQXQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F2CF4ED
	for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846514; cv=none; b=jr9GF7l7uFqkYg+nZuxo4AQnxROg5/UfLaPQnuNsld7yOZimwxkbVbru5+gvRWwMM0AzwH2DiFJk0E/15yX+MO1I9+Ft4mdyE3oxWVd4Z82Ger7NkjVMWLLQ2POV35va3Kgl7Lh58K2hcMIRnXVLWXJnjjygLPRf1/nPQZNqFZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846514; c=relaxed/simple;
	bh=/BtmwqZsz0UmckM5biM6wsthwrx8zUdW40Lyotvyy7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VqYDrBEB7biz33/Z6+ZXEBJ2HDKC0vZClspDcoBFAZ1HeKYXdsgjgLSPKcnpCaBpNGOTwR4Ji9PZW+FAf8VrwM5KMWEHt8qSrbKYqYoL8y6Ku8YgE/TQB3zz1nzyeCSM7VPj/yfce89qVYBmZ4SWfyAQIbtgCJFa+77XBL0xKxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mA4gFQXQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374d29ad8a7so1406785f8f.2
        for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 08:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726846511; x=1727451311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LwHG4lvOA/K8mKSvlD813br78EUMxCFPc6SYxzaPWT8=;
        b=mA4gFQXQGyfPybyYgSKIkCCpR5DFiZRE5wkf24TbLntNuzdeSV5ZYDj24SGYd77F+t
         T6UoY9XBaH9o/qBKQca9aZUbSMWMLdFI+oNr+fVed+uula+MLtbx5CPn+3YTcaIOlUZx
         WinwfteTPms28TvppaTh0xoGJhwrArVEgLFMyFik8Jt7F6t9uc7Cne2WdiVX3j9yrZzJ
         MTb2r52SN5XHVS8OW0/tAo3W/CdaT7+bR7WUAJCGs02Ynt+KiY0LDWTm5JsV83MtDYYZ
         zWlNsYx2GUmNleV2Vm6CF8sip3KfD3JoU3elBs8IFghWe/W0kTtfc4IsCmXCrnpH8XL3
         cm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846511; x=1727451311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwHG4lvOA/K8mKSvlD813br78EUMxCFPc6SYxzaPWT8=;
        b=PDKz7dt4ieIhmtFOIdySiG7QzS2+zsxhogdNriLu/6vy3uyMEzdldPS0vbHbRIPo5X
         j02CVWBi5PQXplluVsueR5Qt+5Yo8OnliZtkt9UH+vTvZPtnjdywedTK154oUGR7Fi5z
         GI5xVaaJDJYQclvg/Tbv7uhLb3NdY8x7QG0OFnEpR3nPE3KcTadZ7kmK/XjfDP6FMsGP
         PALhWxLZeMxB7jbsUF97Wi/CSsgSLFaEXdE4P0hJz+skyA56Yf81GI6tMBA++aAcrAZQ
         yzzLC/fR1rYBcTrLWjGcGwLQrFpXPBi+KHDWeErFWdukky0HY9I6jCfcpEU3CcjguUA4
         3VRw==
X-Gm-Message-State: AOJu0Yy2LGxi4XlbyxBuSMImfCBwhgjW0UgvaUyR3gY7h9hr5/g2hLSI
	M1efYvCvhltkyiggRrcN4kolE2ZZNdkI80e7fGdTeeJOulPYOLEYzRP2UmKHkQU=
X-Google-Smtp-Source: AGHT+IG3Hkdb5y6Yaq/hFE4APJMBMliawb3GzjjKpdkyWU3L/lThm12eUZfZ3PiYgai1kEIOp3UC1Q==
X-Received: by 2002:adf:cf0d:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-37a42271b1fmr1932098f8f.19.1726846510901;
        Fri, 20 Sep 2024 08:35:10 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71f0683sm18033772f8f.13.2024.09.20.08.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:35:10 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [PATCH] Input: hynitron_cstxxx - Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:34:30 +0200
Message-ID: <20240920153430.503212-12-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=/BtmwqZsz0UmckM5biM6wsthwrx8zUdW40Lyotvyy7g=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZYMOosW+7oJqqWNoIgt861I5RNi6vcesGnMB d7XTtH7466JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2WDAAKCRCPgPtYfRL+ TjswB/jNzharFCFzJ+WY5d36Lng+taE7vPteMk5H9NPRbnYhQuuY3f/qGg01w8Upu4uIktgh0nj v9C43CfdEPr9SHNZqiFDQ1y80r0NgmNNufFHAbWesjrBfQtQQ1GBvkqicgB6UD8jQ9NG8/X1qpJ 0RITBC0f3ouErje5eUoeO2VVlUp+kSB4RUE+IDttElDGm500T5udpteoyC+B/keUnsZP/tyDBlh FgoJzv+/WAj+spyuyL/t6rsfsvmU2eL+xfAcwH27EDFJ0MrMRPiToLm7qIs5p6K5E1qqaLmUt7R DtWrwzXRlSSJ456Dknd+PIyvFOXbU4UvVipIyrnkBsSqySA=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/input/touchscreen/hynitron_cstxxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/hynitron_cstxxx.c b/drivers/input/touchscreen/hynitron_cstxxx.c
index 05946fee4fd4..f72834859282 100644
--- a/drivers/input/touchscreen/hynitron_cstxxx.c
+++ b/drivers/input/touchscreen/hynitron_cstxxx.c
@@ -470,7 +470,7 @@ static const struct hynitron_ts_chip_data cst3xx_data = {
 };
 
 static const struct i2c_device_id hyn_tpd_id[] = {
-	{ .name = "hynitron_ts", 0 },
+	{ .name = "hynitron_ts" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(i2c, hyn_tpd_id);

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2


