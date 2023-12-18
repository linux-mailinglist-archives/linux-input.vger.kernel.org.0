Return-Path: <linux-input+bounces-837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86144817868
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 18:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36590284CD2
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 17:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81A15A845;
	Mon, 18 Dec 2023 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGP1nzPD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B43C4878F
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 17:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3ba04b9b103so2825924b6e.0
        for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 09:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702919820; x=1703524620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcoFvkRRAMHorB5qgARlfIQdf2kHl0ZFg7YERePi0LY=;
        b=RGP1nzPDyxhKh/MOXSecU9jP6GzwwIkx6sJY6rP/oygp+MhHh+73ibUoq7MKUNNr/f
         Qoprvhz+jBnUI/8XUXA9KLYQR6q3PUVHDsy7OAWlPW7/cW1Bht1TCB8cwCteSV/s6xS3
         KkebI6woLkSamcDTLvIJulNXVcndV5fTMdJYLigjX8NMhBTS1HNP2rjmTWb78l/1Up0P
         5YYeTCzN2mu1Q/OlwLatr0NHlCZl9R5zBvHOe3UUcZeUyycF0wvK7FSJImSNbmKT+yB6
         L/PfXbQTgk0yn/1s13VaoukwD0AxrLrQnMtwruivUn5t3ku44q1Xzuf9ZXNSsL0z/ZwY
         WmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702919820; x=1703524620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcoFvkRRAMHorB5qgARlfIQdf2kHl0ZFg7YERePi0LY=;
        b=NtFt9cKAlGgB0SKCgusa9gp4RUQYa/+z0dge7UdqtnuSWLgKxQ1xv6KLSqCi55d5/i
         VczpWwTeydwO3qeynSoda5KoNzbgZHby7wRYKeBQufbzIEkS5LkobETrU4fUg426+G5g
         jBAotWY7BPXe9jRfZ0/9np278gp2VwLjHHRluLYb41Ehdabh6NyMd9RvYoc20TFpEqFl
         b983p4ruMlL4srb1z15A1TXzlkROMfN3aEpUmAwLlgkObwatWZFx0gN36RXRNnzG//EG
         wVRgZowEsGI322D6pif8oa7XsN4pzGj7JSnO0fc82cV+dzAQtatkVbWGOE5rV/qmSzQM
         kMbQ==
X-Gm-Message-State: AOJu0Yzp2l7hhiYhvdweQPKukxM087kknIS4fAKxP3UElDuy32ffXE5T
	OtuTa2ja+jXUQKSHGOKQYFp906CV+bA=
X-Google-Smtp-Source: AGHT+IFMncVQ2aIMD2VNGDYnSvhrYmtuqXxT/iEi6KFSesLwXRSpokGM2kKK4kFF9OBUgB/AMBLUGQ==
X-Received: by 2002:a05:6808:6493:b0:3ba:d81:8408 with SMTP id fh19-20020a056808649300b003ba0d818408mr17758313oib.41.1702919820187;
        Mon, 18 Dec 2023 09:17:00 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id c6-20020a056808138600b003a40b3fce01sm4844773oiw.10.2023.12.18.09.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 09:16:59 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	svv@google.com,
	biswarupp@google.com,
	peter.hutterer@who-t.net,
	paul@crapouillou.net,
	contact@artur-rojek.eu,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] input: uinput: Drop checks for abs_min > abs_max
Date: Mon, 18 Dec 2023 11:16:53 -0600
Message-Id: <20231218171653.141941-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Stop checking if the minimum abs value is greater than the maximum abs
value. When the axis is inverted this condition is allowed. Without
relaxing this check, it is not possible to use uinput on devices in
userspace with an inverted axis, such as the adc-joystick found on
many handheld gaming devices.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/input/misc/uinput.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index d98212d55108..e90dbf2c0b34 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -403,14 +403,7 @@ static int uinput_validate_absinfo(struct input_dev *dev, unsigned int code,
 	min = abs->minimum;
 	max = abs->maximum;
 
-	if ((min != 0 || max != 0) && max < min) {
-		printk(KERN_DEBUG
-		       "%s: invalid abs[%02x] min:%d max:%d\n",
-		       UINPUT_NAME, code, min, max);
-		return -EINVAL;
-	}
-
-	if (!check_sub_overflow(max, min, &range) && abs->flat > range) {
+	if (!check_sub_overflow(max, min, &range) && abs->flat > abs(range)) {
 		printk(KERN_DEBUG
 		       "%s: abs_flat #%02x out of range: %d (min:%d/max:%d)\n",
 		       UINPUT_NAME, code, abs->flat, min, max);
-- 
2.34.1


