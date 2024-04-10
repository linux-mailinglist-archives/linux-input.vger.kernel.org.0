Return-Path: <linux-input+bounces-2910-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A48A0277
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 23:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C02AB23698
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 21:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8343199E89;
	Wed, 10 Apr 2024 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dhuK/Gub"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B39B190691
	for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712786092; cv=none; b=kjg73HcyB0BcP6KJDi4oFt7ZPF60Umj3HHf2aGF5c1SpfZICYtaCOEIeNVqIIM32GANowxfxPzzXhexyMJfFdQHZLPiJHwkTFrUhMdXSEtdzA4FmQO1k4IMPj7ybFwCLhhxH2W+yH2znsO4H45CMCXdNidHwgjB2XnNZ6QATGLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712786092; c=relaxed/simple;
	bh=qYUzmqmdLZgDJPzb/J2uf6pd/pTz/IsAT54nGnkJH48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BoK90sURhn+/11xpgxfy+atxQ6u81RmkC1eDjRFwSvPL02TbZXX1OoQ1899nfNu46YYZ6x0a+2JZdvYjh6eGEcpwLIZ2dqt29DaesrJnm34dReAkNeh0qAX4J3GjgQKhcoy/yf7dLAlbnZvO3pPpKGNF6sF9feDPS94g6gAIV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dhuK/Gub; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-434925427c6so18721811cf.1
        for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 14:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712786090; x=1713390890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTzjP1Nv4ThzlLlE1Ju5kdcsL0LhZGtnYro6XcnlOmk=;
        b=dhuK/Gubb2eeHhJXl6V5/9G4V3kAKIumQyn5+PG8yTe1F1kXUknFJfB4MEs0hv/NNF
         RG3vjW0kOgl/N6Y+3wrt2JYaFoz6P9Lrb4NuWSKmU0m2g8P4ETz8YXxX9v1OkMK9363F
         GJFdE2D7ImvLiiCUQstdNFqD4iK/qQRpyefms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712786090; x=1713390890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTzjP1Nv4ThzlLlE1Ju5kdcsL0LhZGtnYro6XcnlOmk=;
        b=u7ABvh/dAy5m6/kuGFGDyRLMnT34rzkiBwSCVrWh3dlBYDhDRB13okElTLEBjS5inx
         j3xV5q9jDlEcnTqg8hz68r6UFOoF3m6wSWSZW5cFKkJnUJJ1/IEuD4AVVEdPZBqZ0Kgu
         kQlRuQnWHkqyFnN3gq/T1c3BxeXh86IBJdB73BaYJLo1inJns96OKSxLswIfhFZJs0qy
         vMGT2X1a0fF+fGK7n7r4/jEaPDUEX1Pzo0eFhCMughPf2WXtT4M1UYyLZRAMMeyDY/iP
         YobAO27S3iZGK7OA4rHm7QVj1H5v6IWpdC8+tUbKpVD7ALCLmyLp3eNDqcA1eGpC+rCh
         obag==
X-Forwarded-Encrypted: i=1; AJvYcCXg24scqABQbJhWgGSURRs0sWXo47oue2YdnbBWu4n3Z6iqQ6tkV+oGZ/4wqh6gQOfw4zhgFI8fgmW6eBhtQ2vsXjNx4AzCra15dzs=
X-Gm-Message-State: AOJu0YxfbZaVhMGGFJWIWbQqsr3PQw2moAFQ4LfscE1rY2yOy2F9SiDq
	6umvGSt5M8gGl/l2ouydiewLDQjDCVLhGHDqLj6PJr2FC6JHz/+/VZm6+CRC9A==
X-Google-Smtp-Source: AGHT+IHLvqSrxvThaEcLle6Xam6RG78CJ3NyLYmwXsqsdgP3jJ/C4bjd1BGbbwL3hfA5aXl4iG7EWw==
X-Received: by 2002:a05:622a:34d:b0:435:18b:d78 with SMTP id r13-20020a05622a034d00b00435018b0d78mr4122157qtw.29.1712786089958;
        Wed, 10 Apr 2024 14:54:49 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id kg26-20020a05622a761a00b00434c1eedb0esm67330qtb.36.2024.04.10.14.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:54:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Apr 2024 21:54:43 +0000
Subject: [PATCH 6/6] media: touchscreen: sur40: convert le16 to cpu before
 use
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-smatch-v1-6-785d009a852b@chromium.org>
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

Smatch found this issue:
drivers/input/touchscreen/sur40.c:424:55: warning: incorrect type in argument 2 (different base types)
drivers/input/touchscreen/sur40.c:424:55:    expected int key
drivers/input/touchscreen/sur40.c:424:55:    got restricted __le16 [usertype] blob_id

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/input/touchscreen/sur40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index ae3aab4283370..5f2cf8881e724 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -421,7 +421,7 @@ static void sur40_report_blob(struct sur40_blob *blob, struct input_dev *input)
 	if (blob->type != SUR40_TOUCH)
 		return;
 
-	slotnum = input_mt_get_slot_by_key(input, blob->blob_id);
+	slotnum = input_mt_get_slot_by_key(input, le16_to_cpu(blob->blob_id));
 	if (slotnum < 0 || slotnum >= MAX_CONTACTS)
 		return;
 

-- 
2.44.0.478.gd926399ef9-goog


