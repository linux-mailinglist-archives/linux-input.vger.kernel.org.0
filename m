Return-Path: <linux-input+bounces-5764-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B9F95CCDE
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 14:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07558B21599
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 12:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8A1185E4E;
	Fri, 23 Aug 2024 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZoUL26R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86094186607
	for <linux-input@vger.kernel.org>; Fri, 23 Aug 2024 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417496; cv=none; b=Y5AGLRS578pvw5OUHgeDXQnMk7xsObmbDMJo6MsKLuG1I/A3J5KQf2Sia/G8XMv/ywF80dY2GNmylFnJ7OiE5nSFXOswAuzbzGrS8+LH7KCj6fPof9co1zypv8EPVTRYyFIMrmTAl92lyGqdkOp7+77WTkWzjp7imu/+n8lNI4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417496; c=relaxed/simple;
	bh=TyzgdhWB7wc4Oocm7h8CUf5+ccWAlJpS6Qze8g7MVCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WK4wcelQZCk1LWtH6BdIhr+Gc+decWvUQLoh7h+sKDv5l1By0y81PoDMvHXzGynBjqG7TcctT4zfBY07KdzRo86x5wzRREWfckEqVNtjRCY/fsHWlTY8NdhpQZnU3F7fjX1qZtwVJgV0ud30mI1LUXETaQvhx9cUiOGLCQyotYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZoUL26R; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42812945633so14876285e9.0
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2024 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417492; x=1725022292; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxEehQwCYE19lD5kSpNMOUjLeWoaZ9JR6aNfHSrkYjI=;
        b=KZoUL26RujwmTqGbIfsLemWF7phJGhDTslGQ3umr6jdd2rNEEEtYfAsvxVZk34pO9Z
         MKElc6ZiPKwDsGSw2g8UrXgjL6pd8tx6S3Z+HqroQLtRxInxFC+roZpg6giiVO7QWhj/
         L92RzZDXyTgX+gDzYYaVPCiyM510xGXiShr97QwfPx6ugU1U7ZbjIDjEGBQXghBZiUn2
         Mv1Yan8wBxP9ewEx3BY6TiayRSp0lC2ZftwR0hbYopKTjL5gaGcmEWalSFkLwSOMsYy3
         HGhbQRpTiZrwm6lrNvDyEdwTxAwBL+EdeLByeTfwK14/xLETd4JpWTNzqU8qH7L812sn
         UsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417492; x=1725022292;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxEehQwCYE19lD5kSpNMOUjLeWoaZ9JR6aNfHSrkYjI=;
        b=F7um4E3sKIvfAY0wfV4Wc22sUhAmyEl5M9IvJS/+bIr9nzVIsi5N2HgYvZAK9dlZbI
         Bit+xEQn8WNOJVeL4DbcShdfGZcN4BfCjLyaNPSI8gwoNGG30utL+409YV57WoHcFX3p
         5kErHDHNqQO7lkv1Yv/g/FQqIHeYk+R1vVckyir5NLoESWP5mXl/y4jDxVz/pN6cwaH9
         yq6tYlH2Nqs+ooXhG2celo3npJoXEraTz4bMxFSyt3Tp6/488YKKSiwciayDV/49Iqzi
         EKR72d1WUReoCa1Ky94oQCcalj7oYXua2GLpviu9PAwDy01Fh94AHgSQX/hcaPTlE/+K
         +sAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKp26dKQotMF5AIrxuuXTWjGL1UK/MGe+xO3D0RuWTknoV6WA8sYmRcq7nvYjQZY/mV72rPVQBGQBuAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqql64g8v6Y2jgBPPeqsTX49of4d6j0D6LN7uohgMuG6tEDj7M
	Sso1BTwQ6cs71DYsDWRz6/vuaMu+t5ncUqjqGEqSZxmrsj1Fe6eRDjLZpr3E1QI5mYquG6DGUp0
	ZmQD8uA==
X-Google-Smtp-Source: AGHT+IFhHLlc095ixSKUu6CrmrIUdCI1EJL4zfC+W4OjuIo9Se2eQ/YR+U4xra16yh9krliC8NQqAg==
X-Received: by 2002:a05:600c:470d:b0:426:6921:e3e5 with SMTP id 5b1f17b1804b1-42acc9fe1e7mr16108185e9.24.1724417491866;
        Fri, 23 Aug 2024 05:51:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm4095492f8f.53.2024.08.23.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:31 -0700 (PDT)
Date: Fri, 23 Aug 2024 15:51:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] HID: hid-goodix: Fix a signedness bug in
 goodix_hid_get_raw_report()
Message-ID: <8e6fe9f1-fcd8-4264-b28d-a1ee99b592b8@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

GOODIX_HID_PKG_LEN_SIZE defined as sizeof(u16) (type size_t).  If the
goodix_hid_check_ack_status() function times out and return -EINVAL then,
because of type promotion, the negative error code is treated as a high
positive value which is success.

Fix this by adding an explicit check for negative error codes.

Fixes: 75e16c8ce283 ("HID: hid-goodix: Add Goodix HID-over-SPI driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/hid-goodix-spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
index 5103bf0aada4..59415f95c675 100644
--- a/drivers/hid/hid-goodix-spi.c
+++ b/drivers/hid/hid-goodix-spi.c
@@ -435,7 +435,8 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 
 	/* Step2: check response data status */
 	response_data_len = goodix_hid_check_ack_status(ts);
-	if (response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
+	if (response_data_len < 0 ||
+	    response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
 		return -EINVAL;
 
 	len = min(len, response_data_len - GOODIX_HID_PKG_LEN_SIZE);
-- 
2.43.0


