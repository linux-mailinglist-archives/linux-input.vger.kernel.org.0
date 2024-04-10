Return-Path: <linux-input+bounces-2909-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49C8A0272
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 23:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0551E287D3E
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 21:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFF0194C7D;
	Wed, 10 Apr 2024 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dj0O1aJc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327E190679
	for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712786092; cv=none; b=ALsIfGFExvrmBAJ8ICkNbeaVeSftc+zDxozjcknfKiYzlwt6b1ZDvWb+lnjl85rIb5M4aJjr+H00SHA+346Lq2Uo8kn3elRFd6nzKxIUkm8W8yQNUK36fGkLDLeGjEQtXbbF6X6hFkQI/eImNPu10R2+jPFy4lCdoycuG7oGzV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712786092; c=relaxed/simple;
	bh=erFijxCE7zR4MV8ri3c+dXbrtlOTrRZHHMfpIM9iaXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bE1brcADA2+GlvwOWeKpkN6Mwcx7aGFwz5FFSwoMic7swmRy6bJPOx+I+t9NhrMKY6KB1hNkwbHS+mk3+Km3ZrkhtQBj01oAHGcB6YT30POCzrRfnSaJsRT5L/m09wpHgCisFiBqo7WAndOwKKgY99baTuHgcMzJQ3AQFvaKxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dj0O1aJc; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-436433a44bcso4289181cf.1
        for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 14:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712786089; x=1713390889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qecfLVtRY76Bzg8oTSRe9RiU8Ab1ycKtqOn34KzQpM=;
        b=dj0O1aJcd8aLrfFIDPAHRcIK0AoBdX/2TG3hNhzkW/pkpX4cQ3HNqIG32rAX5V/c++
         2yBq0kx0oOgpcQOcbBwtKsm72jiUIrvuG+hPgJzmhpmEhO3fnnihkkOwqfSY6viUeqVR
         Mch4HjnRyMWJkzTxbKkEdsmEatC4ucBWeHFG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712786089; x=1713390889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qecfLVtRY76Bzg8oTSRe9RiU8Ab1ycKtqOn34KzQpM=;
        b=HDLODew+vtBZDZg5j6z1mpcLziAJoVn3L1RtXLGvOq9t78PqpVkIFqJkDulpvaencc
         F9uA5H4GluSZ7/DiSE9xYeqNUI6Qm7V0GS6Ew2JipkOnDObNUqcbU84tJp5u9Dx/Eead
         2RmO82iUNa3m6iUl7cM64REJsxOxuuHRTUFJqRIVF/1jmdLyhULXfJyxk2KvR0wffo4R
         WcjayXmrnaL+aAUZlDXzyp6DBvyl3rO5vdH11teyGwGAQ9y9EMJgKB0TxSjBXgSnchVk
         /45vehrOUph8gR6W7t+AuUFppz6azyCFdxEXOKuyKVp9r3mtbL1Mty/7FUkx5obl9/ul
         ApdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzhOeIYSgjTnb6LJ6QOyPGnIIuYKckJ/FwnYTYkc9njYKj0+Yxu4jbveIUqGkEGjNA7rjRe6bp/9pGpCy+7N9hF+sLDlNqRX+DeK8=
X-Gm-Message-State: AOJu0YyXL+eyMZRhC5xMrGg7ClJyfQxP5XKSLNOdOpizSzjNw4DKtY7J
	uhPGqfkQjCM7IwHE/gqajhZFVA39kZCjSsvJKof42QqKR4XRTcLSM2Pqljz9mA==
X-Google-Smtp-Source: AGHT+IHWRJcHJfSG5kAL0HKOg8jZfMWKObhg9YFida2UCaj9AtmVdqisiCqcJB1326MCtC9PfVIBrQ==
X-Received: by 2002:ac8:7f42:0:b0:434:8cf5:b274 with SMTP id g2-20020ac87f42000000b004348cf5b274mr4147900qtk.59.1712786089349;
        Wed, 10 Apr 2024 14:54:49 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id kg26-20020a05622a761a00b00434c1eedb0esm67330qtb.36.2024.04.10.14.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:54:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Apr 2024 21:54:42 +0000
Subject: [PATCH 5/6] media: adv7180: Only request valids IRQs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-smatch-v1-5-785d009a852b@chromium.org>
References: <20240410-smatch-v1-0-785d009a852b@chromium.org>
In-Reply-To: <20240410-smatch-v1-0-785d009a852b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

i2c_device_probe(), seems to assume that irq = 0 means that there is no
irq to request.

The driver also believes that on the clean path. So lets be consistent
here.

Also make smatch happy.

Fix:
drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 4829cbe324198..819ff9f7c90fe 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1486,7 +1486,7 @@ static int adv7180_probe(struct i2c_client *client)
 	if (ret)
 		goto err_media_entity_cleanup;
 
-	if (state->irq) {
+	if (state->irq > 0) {
 		ret = request_threaded_irq(client->irq, NULL, adv7180_irq,
 					   IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
 					   KBUILD_MODNAME, state);

-- 
2.44.0.478.gd926399ef9-goog


