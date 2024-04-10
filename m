Return-Path: <linux-input+bounces-2904-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B28A0266
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 23:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8C61F23FE9
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 21:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7686C184117;
	Wed, 10 Apr 2024 21:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aen7zdVJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97BE184106
	for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 21:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712786088; cv=none; b=MFoZVPZHtGQ0isIy5jv/yCReYo0bF+9thKWmchYQFIBjFSG9frCyFCrBBbrhaTrs9mf3phnHU7OnVha7yKgMu/7hf5KG5sE2QUkqOV6dt8Ntu0k38Lvn2ykyZBQe2yz4zOpaKyYnyA51zZFK4MuVVogppDycs0UfuNAotHP7ynw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712786088; c=relaxed/simple;
	bh=WldA2f8yQgpM9J9A4jWFEWDnZYMzmdVHZlFTwD9iGQg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F+csOBbO1EGI5cnB/oy/sLD+nD3UaJJLh6MFhUTvD2zjuBwNmkirsu/01hTnsM2bOQ5vw/KqFp1N0/1M5n0591tBbkY+EAa8S2riJedTuOBaCugmMHYY1Ck+NHbpK5/ehcywjqlzvsZmAYTfnBOEGKKVyK22C5DZSBsBclQQDnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aen7zdVJ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-434a6024e2fso2646081cf.0
        for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 14:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712786085; x=1713390885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3iVdnB3oOZVaLmlPJQQH4pJkIi59EqpEToJXgPOjZk=;
        b=aen7zdVJoPcth+yR3iZbRA3aeUzn6QMzUTkwZmMnpCU0DE2PDMDfYKl9xEWCurOSLz
         uFnxcj5/o9/ko8TxWNai9E8XzDo2SOPJFX3cNvmVsm1lZodJMCbDMHt6oVwwTtlTz+Cb
         27OUcBzYTRNssyjcRmp2oHMGPgxekbpH/2TwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712786085; x=1713390885;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3iVdnB3oOZVaLmlPJQQH4pJkIi59EqpEToJXgPOjZk=;
        b=bAZ2mBCEkwAETON5Q2RRatCgOlYKMQX1/gfpqhBBjq5CX8GcZV9bG6qemvYY4I/i7B
         58RkTpoHeqyX2b615DmqzVKrnV5CsNFp51bqaSc9I87/mvnEHsW7wzTghQD7XUbSPfSf
         XewuQBLbYpGzSanO4NRu6XB4KED2eHMOiZ0KFMTjxVAgFJqsJPLVbB0VfjEltWoKEWIj
         +Gxq5fRMNr+dIRpKoRPEZLaY6u3Gk4YS8Yyf/OTxh9TdL5kr4k2w0wkhl8vMLpZD+PB6
         Kk5+fzDZ1eOSfc7lTtDSBB1tbNuY3bn9C8juRTGEfTrFxCYcd/1szkPAzyLRYhB3VJo9
         xAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVudCOL0GaodRZEuJ8qiCrbaPJN3SXFsmp5vCotRxbifpS0BuPgBx98bVrwOo4V6QiHbWu8S4ZiCcOA+7KG73h3M87Q613tijiLwsk=
X-Gm-Message-State: AOJu0YxGeXdaWDkRoorhzNA6YIeA8dw5e0Nqmt3QYMqgCvFCDobdJsAU
	zEw2acGIdyLWxAawlo/9RQBQnXHQfAHIa/+j+rGAgUF+xbIU7ycy+NGQllmWug==
X-Google-Smtp-Source: AGHT+IHkSCffIeV82iMuXSt95ORnuqOTMlmc0+iEbX7VC4BJBiSpoPCGCGpB1vyUQoatGxAicJXG/w==
X-Received: by 2002:ac8:5355:0:b0:436:5142:e031 with SMTP id d21-20020ac85355000000b004365142e031mr1511793qto.13.1712786085624;
        Wed, 10 Apr 2024 14:54:45 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id kg26-20020a05622a761a00b00434c1eedb0esm67330qtb.36.2024.04.10.14.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:54:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/6] media: Fix warnings for smatch and sparse
Date: Wed, 10 Apr 2024 21:54:37 +0000
Message-Id: <20240410-smatch-v1-0-785d009a852b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ0KF2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE0MD3eLcxJLkDF2LNCNj0xRTA3NT4xQloOKCotS0zAqwQdGxtbUA6YD
 lvFgAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (6):
      media: usb: siano: Fix allocation of urbs
      media: cxd2880: Replaze kmalloc with kzalloc
      media: platform: sti: hva: clk_unprepare unconditionally
      media: v4l2-ctrls-core.c: Do not use iterator outside loop
      media: adv7180: Only request valids IRQs
      media: touchscreen: sur40: convert le16 to cpu before use

 drivers/input/touchscreen/sur40.c          |  2 +-
 drivers/media/i2c/adv7180.c                |  2 +-
 drivers/media/platform/st/sti/hva/hva-hw.c |  3 +--
 drivers/media/spi/cxd2880-spi.c            |  2 +-
 drivers/media/usb/siano/smsusb.c           | 28 +++++++++++++++++--------
 drivers/media/v4l2-core/v4l2-ctrls-api.c   | 33 +++++++++++++++++-------------
 6 files changed, 43 insertions(+), 27 deletions(-)
---
base-commit: 34d7bf1c8e59f5fbf438ee32c96389ebe41ca2e8
change-id: 20240410-smatch-8f235d50753d

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


