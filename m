Return-Path: <linux-input+bounces-5317-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE29471E5
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 02:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABE88281035
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 00:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CC2EA4;
	Mon,  5 Aug 2024 00:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brRL1+nc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A8319E;
	Mon,  5 Aug 2024 00:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722817058; cv=none; b=SdcZ2mIUb+riOly3UDx0G4tWQ28yv0AJBg4I3bprebt8HOr0CUQWBqmNZj7R3pNOXmZukiWD+nAencfIIJmpuoi+MJ1AUQxK3Gj+WGHzgh5lp3UK20aLgCvQCvMXQrIJTZB8nJxPc94yd2vQQag9A+e0FIJ3kM7eWxIUGBb9s9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722817058; c=relaxed/simple;
	bh=jZpsNXWRThcqSBVuat91cwJ4zEUx4Lfj/8Pyo/Hlrcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vB+Q4wUntTBaDJfv4B+Y+T4ekjZbiDb2sSONTXJ2trUFhOx46pQj7Wu/r10TFdYWM8WLJMJxH4l2C8RS77+zhdzY8IluSh5nUzZKInXN5Y8SeNSqQ727qkUs6E9njB7o0RJwMZvWO2DB5mSAwMvi0y5jDcQ3tGJtMjMZleuXSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brRL1+nc; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7aa7703cf08so7344789a12.2;
        Sun, 04 Aug 2024 17:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722817056; x=1723421856; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9K7M8X3jWnjiM/PfIPEVo9zblRONHQuCKu/gqyXUvnU=;
        b=brRL1+ncFR2WWgmus4fKoQqQvSVK0Hf3xir0mvVnp3FusdUGGbsobX+Am9Lm9lKYIN
         DzDik0xL+x5iJmcwuTd8iCutPQYPk/iNxhUr2ANhkEkbKiEMLxPz5MTH6GgDXo4pp/sR
         Us2I2Br17unULLPZQD6lUF6YezUqwKSQbA0lY8FPJ0e1GVuPQnalG8plciFxVYDv/v9r
         TXy5YwCDoC6g8UuzufVdmq2BET6vVBGABte2Q4EbC1H5+snXWoel8vCV1yJSwrdqC6w+
         J+zbvahP1K19mFFalWOhg33N/dWA88TjtbhdR9iTDnsXAKIAZSD1NpSNRcSvlzKLRRl6
         qS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722817056; x=1723421856;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9K7M8X3jWnjiM/PfIPEVo9zblRONHQuCKu/gqyXUvnU=;
        b=OZ3xiYO9hC0xT0JTj65lgZMR9bXiy4KHuHgwp0CATCYy9eZny2TAinCk9EkriL442/
         I9Rj/c+FqpSaGnXJsaHolPnf/qYcoJ48/f8pgqvHvpiZMKbycINle/mkg4MSts0/6VqK
         W80ZYynXl8S6P1+KrJv0Ajhn/WERzkI0QdtxsfyKnNHthKwJuHjFxt8prpqPNjqErSUB
         ULZd7xFfvHwLgSmwiMQuDHxt5M4QXkAjlNeuqajZ/unVFQiUodO/SfrACR0UvQJxqwX1
         d5P6PKi/BqcGpBAKLftMSp+3lHR/wdm1l19GHBx71cNvAU8u3txyXXjwAFB8pRqOc/lU
         YVeg==
X-Forwarded-Encrypted: i=1; AJvYcCWSGr977K7OlsUZLHjX7ylBYb6cfj59LnzJcF7yzYu5+PScaLY14uo8H/prqqfE3S2FpZe95UKrm2wzikTFfLrDfEeMrdHCd2hPSOLF
X-Gm-Message-State: AOJu0YxrVkY1nhf6AZpzMlXrlHUpRFZ62G1f51RUxpHz0lf/QEkAAOaS
	NPAUwcGCK8eeSMMyAJhGxivCHb7RLF1DnB7awn5z16lp9ZV07Q8bgGoGKg==
X-Google-Smtp-Source: AGHT+IHfF5XY+K61sgk7aPj+rV1ImYzMLOa9ug630OOOsHoF87CzetLHBT9p9SsZe4kD1OBoCH15tA==
X-Received: by 2002:a05:6a20:6a0a:b0:1c3:b102:bfd2 with SMTP id adf61e73a8af0-1c699580a4cmr15104090637.14.1722817055874;
        Sun, 04 Aug 2024 17:17:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b7653b4a44sm3690479a12.81.2024.08.04.17.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 17:17:35 -0700 (PDT)
Date: Sun, 4 Aug 2024 17:17:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: ilitek_ts_i2c - stop including gpio.h
Message-ID: <ZrAaHWNvaAfDlDfI@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The driver does not use legacy GPIO API, stop including this header.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ilitek_ts_i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index 3eb762896345..ea244d023b77 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/errno.h>
 #include <linux/acpi.h>
-- 
2.46.0.rc2.264.g509ed76dc8-goog


-- 
Dmitry

