Return-Path: <linux-input+bounces-1218-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DDB82C1EA
	for <lists+linux-input@lfdr.de>; Fri, 12 Jan 2024 15:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF0C285078
	for <lists+linux-input@lfdr.de>; Fri, 12 Jan 2024 14:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9E56DCF4;
	Fri, 12 Jan 2024 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QSxNKtH0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDBA6BB48
	for <linux-input@vger.kernel.org>; Fri, 12 Jan 2024 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e69b31365so351195e9.0
        for <linux-input@vger.kernel.org>; Fri, 12 Jan 2024 06:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705070057; x=1705674857; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMAozsps9KhdnPC0gC/CqjxcAys0VIF1YUv+72UuGdM=;
        b=QSxNKtH0L5ny97b8ubTtPuslm7pNmNynFnHnzGI/mk4exHOX4oaK6f/LzjXq4m4Pgg
         S2PttR0ATVEnHHRuqAQ/hszkFViYWkW29xxS4hpqduKzbbE0KmkTN7Bv+XmNrZOz922v
         JFt9J4fTpVVMk7QEygpR3hHUoDTzQF6Hi1SzEXFWh5877WesQ1pZ6W54e92A+k+74k5F
         Jg+MDlwuDGu0zpZKLXxXtpmimmiwuPU4zs2BQxsAZTZbqcpSOk4PanE6D5B81vvrkooY
         vTPWxCu5EgZV07p640BUWol6qiBj4+Rdb2B8oEw4atT+ZZjkmhyKJIOC3rxPd729dIxO
         A0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705070057; x=1705674857;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMAozsps9KhdnPC0gC/CqjxcAys0VIF1YUv+72UuGdM=;
        b=FUwlo6Es0NOyipMTSeRPXFbYLsFjnTVulq+7/sIlDAfolnFmNy/Y3esnEmTs8itwVt
         MiJ/h7ibUuLAu3okAjsa8Z3eDPbG+eslRArlzfkzcFdAzLmvlyhwAGPB1ZmOOeL0fwwp
         xkfwfoRUvjoLgACoU4FXcXpRyRUfoLoqaoOb6gp5hjp8j9sQAtP9wY/eQiDmJhPOflpY
         0SmZK/vXfQ1lcq3pjHDTutYiz0xAYemMAsywAMGSJEhrX22huLmr7eXDUk+gdfPB6Fxw
         TI67dWsFqIVQo8S82AWE7lKvXD2TCZr1CPZBLX30Eipp6tPM2FbIicJNvFHfM9/bs34+
         tc8w==
X-Gm-Message-State: AOJu0YzHytnooJAPsuIf0jlOtWDvZRoFgH5OhsPeaTPfVxB/jRPuqm6S
	foSxhuWtDtqBHKEAsJFiYGCBMr/Kt1/3AQ==
X-Google-Smtp-Source: AGHT+IEo2mOleVaYUfc9j4l2dY3+TK3k54YTZMybDNjOmwmfLYfAMTaWAKbDYx/jgnOTy0AsBo3okg==
X-Received: by 2002:a05:600c:1705:b0:40e:4832:9fab with SMTP id c5-20020a05600c170500b0040e48329fabmr886892wmn.143.1705070057428;
        Fri, 12 Jan 2024 06:34:17 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600c1d1100b0040e4a2b36bfsm9849022wms.22.2024.01.12.06.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 06:34:17 -0800 (PST)
Date: Fri, 12 Jan 2024 17:34:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] HID: hid-steam: remove pointless error message
Message-ID: <305898fb-6bd4-4749-806c-05ec51bbeb80@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error message doesn't really add any information.  If modprobe
fails then the user will already know what the error code is.  In the
case of kmalloc() it's a style violation to print an error message for
that because kmalloc has it's own better error messages built in.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/hid-steam.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index b3c4e50e248a..59df6ead7b54 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -1109,10 +1109,9 @@ static int steam_probe(struct hid_device *hdev,
 		return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 
 	steam = devm_kzalloc(&hdev->dev, sizeof(*steam), GFP_KERNEL);
-	if (!steam) {
-		ret = -ENOMEM;
-		goto steam_alloc_fail;
-	}
+	if (!steam)
+		return -ENOMEM;
+
 	steam->hdev = hdev;
 	hid_set_drvdata(hdev, steam);
 	spin_lock_init(&steam->lock);
@@ -1179,9 +1178,6 @@ static int steam_probe(struct hid_device *hdev,
 	cancel_work_sync(&steam->work_connect);
 	cancel_delayed_work_sync(&steam->mode_switch);
 	cancel_work_sync(&steam->rumble_work);
-steam_alloc_fail:
-	hid_err(hdev, "%s: failed with error %d\n",
-			__func__, ret);
 	return ret;
 }
 
-- 
2.43.0


