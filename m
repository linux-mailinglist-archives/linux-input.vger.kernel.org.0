Return-Path: <linux-input+bounces-5590-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B35E953A4C
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 20:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01D16B24258
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 18:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D96F5A117;
	Thu, 15 Aug 2024 18:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjVCgEhH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F49476;
	Thu, 15 Aug 2024 18:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723747318; cv=none; b=dE+wXRbl6pFdtJv2US+AOBp+qvv3lrk/oCgvGUp0BRhGaIXcxpusVIBqVQkkr0p4McCCpH5hEyJcLzsWbsxA5eZofA/3EvR9HXNfsagFjpIt741KAOCSryPoo62QyWyOhdRcAf9xVut7LNsFDMAUxYtI5hr3WAoxlf7k6OpdHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723747318; c=relaxed/simple;
	bh=fJxjOf2MfGSK/AT/Ea1N0ZQk5bOuxtfJpyomWoZ4dKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQbWZcrrqe6T46XMX2w93quPNinBBHfeJkk3m5pKzvtpQrt/cQDId+3zwZq9PDi5PZEGRJdaWWxl615T7WVlaBenFtzktQxG8rqxKskVLWGDt52HgZ3lniDA34Avjo9MFjDh+7Dq9bolapYh59fLKe733LvVp8ONvvj5AnYRZ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjVCgEhH; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d1fe3754f4so921641a91.1;
        Thu, 15 Aug 2024 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723747316; x=1724352116; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nudRwsYKSTD0hk/5DSgrxE/mZ2qKAs3hXnjaPSiojfk=;
        b=QjVCgEhHzvsHC0X+KW3Q4zdAiYf8tZQ6iLmPZvbh1op6giFK1qTO21C6lnGYrK8v83
         i574/nxUvqZalOiLbN7LAt9zkakph3s6yhhK8NAnWJNn15GQJRdPPtW1WgR54vCKMkUP
         nnki70Uc7x5pGNGrSZpKEQBbMDPtw0NtxA4vwBpvJ8xbd2Gijuo+wLtZXaC1VyPIdGJH
         nISOt0kDu1uw/YXBNM59lTyDxu83Ee7h+mlL91nJURcyAPqLuguNiKI6pQzkIbahueOb
         2SwKOUJNfEl7KMbsqlv/pv/+k0xuPG7UhCakCT/BttHlLUW+kCv9ObtSbRfYXFwethIt
         c2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723747316; x=1724352116;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nudRwsYKSTD0hk/5DSgrxE/mZ2qKAs3hXnjaPSiojfk=;
        b=Qw7jwaqcUlksWmvkcwIdyDl5SdJ7EK95bGf7SomgC9cwKFscJ9qukp7Ah8YnaSaWgF
         sG23JUm+HBaFDu7Im/1MkISOzVXFOMb2iXIrE+IISSiO2FIVDOBcUldIsIN637iSu03R
         GpcXz+zOhej86HhwSrUuNvRLhidj0h8gspQBYi9ZBXA2dH81FBnDJRC0qlC7Jx7gwqdu
         n8PxaAxn9ZWeOzMFCFaD0WDTl2FhuYl76f9ztDKTfXXt+rHQMKdkL6EVbCQ2aFElNF/L
         EczUVUqnkmZg7rAQGHqazrdmVGEzfL8CnGf1vIqy/Phr+2v+5eac8g8RcdGXfBcEpBVH
         n45A==
X-Forwarded-Encrypted: i=1; AJvYcCWlUmd5Ufi7nNrJwayO6cIfLHNTrwiFG4S+H8wHfVmxPFb7B/yjZ/PpTpZ/41NCtcMzjcG9irrMcSWFg2lN1IshZYQQXMZ4DmZMT507
X-Gm-Message-State: AOJu0YxHRsOofpC6ZHsRUfyWQpaDeDrwWUhq+Jh7NLzckCoVLiy2HiRU
	7edY4xVNkLtclZjQdQ8SqDXTFzsfwEBaPdgMKY8N6s2w6nQS2qrzTcii0Q==
X-Google-Smtp-Source: AGHT+IFuME9oQtZtMkOeAb6ToaT8paZRdzoGAc4uXJ53mRhHFxE01+m/GuQjsSeIonmUskhydbKQ7g==
X-Received: by 2002:a17:90b:8c:b0:2d3:d68e:e8d8 with SMTP id 98e67ed59e1d1-2d3e040f199mr503942a91.40.1723747316086;
        Thu, 15 Aug 2024 11:41:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1ffe:470a:d451:c59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e2b65aa7sm113540a91.5.2024.08.15.11.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:41:55 -0700 (PDT)
Date: Thu, 15 Aug 2024 11:41:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Jeff LaBundy <jeff@labundy.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Peter Hutterer <peter.hutterer@who-t.net>
Subject: [PATCH] Input: evdev - limit amount of data for writes
Message-ID: <Zr5L8TUzkJcB9HcF@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Limit amount of data that can be written into an evdev instance at
a given time to 4096 bytes (170 input events) to avoid holding
evdev->mutex for too long and starving other users.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/evdev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index a8ce3d140722..eb4906552ac8 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -498,6 +498,13 @@ static ssize_t evdev_write(struct file *file, const char __user *buffer,
 	struct input_event event;
 	int retval = 0;
 
+	/*
+	 * Limit amount of data we inject into the input subsystem so that
+	 * we do not hold evdev->mutex for too long. 4096 bytes corresponds
+	 * to 170 input events.
+	 */
+	count = min(count, 4096);
+
 	if (count != 0 && count < input_event_size())
 		return -EINVAL;
 
-- 
2.46.0.184.g6999bdac58-goog


-- 
Dmitry

