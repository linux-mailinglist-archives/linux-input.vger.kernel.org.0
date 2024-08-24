Return-Path: <linux-input+bounces-5824-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7622695DC1A
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 338652817B4
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8710D17C9A3;
	Sat, 24 Aug 2024 05:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCPQ6wGy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5017BEA4;
	Sat, 24 Aug 2024 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478672; cv=none; b=NPlqLVVHqtHEE+zzagxuXinEJctE30qLXv9QCYEfEKn/9PKOa4nCecSM4vBptPoqjYXE6hXxfaMS6gpT/EMhvQ1ZjwZCvngF4/AWLAf+zFl2hmk7w0yqc6CUUx4c01d8BixtEcp+PYLkPg0bKgtvMQT4tSBAww6MkZzUGLwOtnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478672; c=relaxed/simple;
	bh=biuMi/gbrrCwuR4GWg0PW/N/pUp23XaffWaY9uhrlwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4ijSJwUdfWexxx4Fo/yA2XuBu7zpbwSRxUVtGwAmLkLjh1ZbsuqZyAjJpaq3mZydNORWlI5/nus0ljchtSJ4CMwzftwzFG+3pqywguKYN7gMDE2RKvlpQ/MlMCrToaWugc7JXs0YbExMLP/zDPRpkOSatsyBi1hE1NA16fLXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCPQ6wGy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-201d5af11a4so23871895ad.3;
        Fri, 23 Aug 2024 22:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478670; x=1725083470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFBECxeMkNVzyITrHm0p33ljFGf8aAYIteFTrI/Vc5k=;
        b=RCPQ6wGy8pqkkpc2Wd5honK0fImY2pSuPb2g++iP6xzALSOKUfmGqGLm5soajDGMnH
         5IhEVijDR5408xllfjfq6n58AqurCyi3PFrbkdF+j6cmQX0+79MiBXYS3YOSiLlM1jbj
         rofbFCuE4uIrByLrSDGXiwLAMCdo6ngU1VyvLg8nj1M8/NhiOpM4rfz00ITwEOOkQm8S
         RGXiF/q/Hbzz7RxFd3oLRK3YZ+YucA/7Tq/nrDA036CdHWyAOME7fmIbP/HJzoWbnmg1
         25ixN7IMYKjBenFjAigRnsH7uukxT8nVDdnld1xhINzTDLT1uvIwUVrJ1Y29Sa8Blgnm
         WDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478670; x=1725083470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFBECxeMkNVzyITrHm0p33ljFGf8aAYIteFTrI/Vc5k=;
        b=kKO+iU90fKx7upLTc4vZW0nNczPSeXjUt56ObJuSSdQ5HPwLOZ/ONqP7F8RLYy9xc+
         RSMVgu7XmMatH/niXFoyMYM6M+WHKpCBRIplazxM1lq/zSGf1I7Nht5UYzTyfF1/6V7V
         Tdes64YojSioAPSlrF3q326NEuz8ZYQTqkALsDU/7rjX/xMqPXumcIJPqrKRji2awQ9k
         oUkFATKjcvAE0LBHyNDoGFUrpLtjZYXu+PgUa7zOebz2vOGc7w4ba6vfmvXPVxG5RRXI
         i7dhU7dbph44qAuexM/0w2++nnJDQbp7gUIgsCmnmv24SX3GAvpun+gLsWlieAToDKhA
         vDog==
X-Forwarded-Encrypted: i=1; AJvYcCUwAn/GpVUUqHaQjyEXF21I23mZo+MENiqBmm1B2ncqdncUeRnB8k6X4oGOooNz869UvgwW7iNBKgCkKB/A@vger.kernel.org, AJvYcCWigDpNasVJj5SAhJ+eERgX/2erxEwIKomOOmnegAJcOC+R9dVGgJcLvvnAJXN+l09sbnXGWO2OLovwJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3txyi5miVw9nRWXHxk+yhRBRQbbjzml2Pg3xhiHdc7OLNeBLP
	lBb/X6684h1UL0AKDnAsYskgvdDR+Xd+DGaMWRm4hyjwo5y/R/JY
X-Google-Smtp-Source: AGHT+IHaF2YPGMKn/yJGBL8uSFY3B2qExObhXX4JSXda6BY3M3uKLk9gHAyN2YDi1zITSZaLqpwofg==
X-Received: by 2002:a17:902:e889:b0:202:1db8:d9aa with SMTP id d9443c01a7336-2039e4cefb4mr47259765ad.30.1724478670176;
        Fri, 23 Aug 2024 22:51:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/18] Input: zforce_ts - do not hardcode interrupt level
Date: Fri, 23 Aug 2024 22:50:40 -0700
Message-ID: <20240824055047.1706392-17-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop forcing interrupt to be low level triggered and instead rely on the
platform to define proper trigger to allow flexibility in board designs.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 316901c751c0..116f3aa6350c 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -799,8 +799,7 @@ static int zforce_probe(struct i2c_client *client)
 	 */
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  zforce_irq, zforce_irq_thread,
-					  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-					  input_dev->name, ts);
+					  IRQF_ONESHOT, input_dev->name, ts);
 	if (error)
 		return dev_err_probe(&client->dev, error,
 				     "irq %d request failed\n", client->irq);
-- 
2.46.0.295.g3b9ea8a38a-goog


