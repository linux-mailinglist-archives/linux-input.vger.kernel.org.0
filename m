Return-Path: <linux-input+bounces-11460-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BD6A77B8D
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 15:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 621493AEF5E
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 13:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95E22040A6;
	Tue,  1 Apr 2025 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMSCtp1l"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9202040A1;
	Tue,  1 Apr 2025 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512394; cv=none; b=eVQn0jxAZggrhwayOfIB0yqqQDO0HMAflGZUBfkTfkpip5dTJ4zgaat0DgNR0FaBoTnIgB5ipspLmr4aDHFZwB3GU8gbht5XR0B5m7wooszuAxsXbEl8Yyp2hzDv7V8FDKlTWZzAo8jjnQ3xCyAiKg0ljIVaTaOZ0nDWD6CBrls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512394; c=relaxed/simple;
	bh=j9Ea+bGDlsx72Z+0qw+iSlhE73mDYKtBDLMBr82GFeU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HuTitAubs9OL1VOOmZl9YxqnSe5n0fj3Ow6HTdQSUffnkGLNQo1qXNV9FA0+P4Rv+SNkLR7oi7+QNpEWbjvnITR5mWBv26VhDsLI7gX64WZxeb5GT+k+m/gh03B7g4xcMM/yiG27uQc2TPyZbGrz4s08geva8TEraN52x+zlW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMSCtp1l; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so29093005e9.1;
        Tue, 01 Apr 2025 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743512391; x=1744117191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTjMam3B4j2k7paZIQkl/YwqiiiVRaZIkBuTe1yGXLk=;
        b=fMSCtp1la//8XkfKjvMyQM3+iZ6m7kNQadjd/0Sb+5FKf3JXEeaqY9KnbeWtcd2Kbg
         RYHo9AiONZ9gsIiPko5V4ezKoudVFHLfhLdXoDRp4cOlzsyed/HxwcE+uuQ8d3wYVkWF
         1t0Lr5l1+n11qXttqcibRQ20gBvpzNqWhQJy3cuhHqim2rekPb4Bm8HTt638cFQhkhi+
         z5o6Mjl1BBn7D97clGzz1Fx4W34nFqBjMINDGudhbovnxE06XIlmz89NEYgFDRi6XF+s
         VbPNSw78lP0Lh1XxUpWDU3zbKh3CTMXg56pS+0PqDw4T/f1A0ntLjq9wC54yrgdjzzag
         G1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512391; x=1744117191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTjMam3B4j2k7paZIQkl/YwqiiiVRaZIkBuTe1yGXLk=;
        b=er9NaD/SGSjZwyF9YerYE/knydUumEEd7qk6yRmLVHLGxHeUc0fgr5Ir1rdKFIEHcg
         OYHfjA/L9NrPprZ9t7RZnCKkqb05c9/LHI5l87yco99LkTCM6C3TIKJD6g7ql2cTPZBD
         F7XYpQJv9IE4d7Ah5PSf4XlvU05vbH/GAtHhu9j7CXvW27sJl10DsQ6DtMOKywvO3t7B
         mvxh/0f6zH3+aYV4fjSsMP1C3PElUvWtnP/VLkEeoEpSEi5I5Gp4OcRK9/0Xofwreq4K
         Y+0EeLdqnurj9TZp8iCLNcSNxNYcgspDPSmm8SUsPkqz8Kr5lH0I3UqZwUfIQgKrjkEN
         6k+w==
X-Forwarded-Encrypted: i=1; AJvYcCW3T/IrUeVn5nJlJDNvup8LQlPzqISg+JWHx9dhuA3/fYZ3zDdko/Hgb+tjwjJXxctB2VGV1fAT@vger.kernel.org, AJvYcCWwhSRpvBYedsp5pSdmvxWfks0LTPUq2ZrxGyf5giPBdSS3SrezRXNwKcKDiftpyVe46AT/b2qxD2u1HF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQS0BKNPyFavdjf7THgaAI09Ulcz+Zbf8Ll47QroMoUB7NOVL
	NFgYTLCfYGmImZe2S0xCr82wjxlj8vLV1FYNyDV2VDv38LwsfgJX
X-Gm-Gg: ASbGncvsSX7WvJPyvpQp/6RpJiVrbZn5krlKvq2pBCNIJbUiAF/3ZBHYKLpn2Wz3dMv
	gxGnYUOBiIbggVBdxTFuXy94d/PiWz326CtEnCZEU1MH3OS3/gZ7y93m12XuLiIuXDf/fD2WNr3
	ZOFhjpkmELb3ZTy4Eiy8jliuTEaCIe4Va7U4I8P5rXOQmxYlp/hbux+vM44jUAoHYo4f3jdPytG
	TcGC7u0cDBt5GuCh8xYEWnecFXbwDdFPdE7A9hVzGcd83Bg87SnfXZpQHAMsVkxrM/MK4Li8VET
	jki+VKr5PIhg+GD1oIdPX/6uKgDaxHd6XOyGUAaVA8kL5xpR4xr5CQ==
X-Google-Smtp-Source: AGHT+IF418b6NVmuSPIOsaUq9V0yNXF5CwKyASr7hgcL1/aD11X/ysF6LRsihYCLdVncwG0TZ6ba9w==
X-Received: by 2002:a05:600c:198f:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-43db61d8326mr124424215e9.3.1743512391249;
        Tue, 01 Apr 2025 05:59:51 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:19:d895:ffa3:4fcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm154715445e9.28.2025.04.01.05.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:59:50 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot <syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] HID: wacom: fix shift OOB in kfifo allocation for zero pktlen
Date: Tue,  1 Apr 2025 13:59:12 +0100
Message-Id: <20250401125912.73044-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During wacom_parse_and_register() the code calls wacom_devm_kfifo_alloc 
to allocate a fifo. During this operation it passes kfifo_alloc a 
fifo_size of 0. Kfifo attempts to round the size passed to it to the 
next power of 2 via roundup_pow_of_two (queue-type data structures
do this to maintain efficiency of operations). 

However during this phase a problem arises when the roundup_pow_of_two() 
function utilises a shift exponent of fls_long(n-1), where n is the 
fifo_size. Since n is 0 in this case and n is also an unsigned long, 
doing n-1 causes unsigned integer wrap-around to occur making the 
fifo_size 4294967295. So the code effectively does fls_long(4294967295) 
which results in 64. Returning back to roundup_pow_of_two(), the code 
utilises a shift exponent of 64. When a shift exponent of 64 is used 
on a 64-bit type such as 1UL it results in a shift-out-of-bounds.

The root cause of the issue seems to stem from insufficient validation 
of wacom_compute_pktlen(), since in this case the fifo_size comes 
from wacom_wac->features.pktlen. During wacom_parse_and_register() 
the wacom_compute_pktlen() function sets the pktlen as 0.

To fix this, we should handle cases where wacom_compute_pktlen() 
results in 0.

Reported-by: syzbot <syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=d5204cbbdd921f1f7cad
Tested-by: Qasim Ijaz <qasdev00@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/wacom_sys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 97393a3083ca..9b2f3dbca467 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2361,6 +2361,8 @@ static int wacom_parse_and_register(struct wacom *wacom, bool wireless)
 	unsigned int connect_mask = HID_CONNECT_HIDRAW;
 
 	features->pktlen = wacom_compute_pktlen(hdev);
+	if (!features->pktlen)
+		return -ENODEV;
 
 	if (!devres_open_group(&hdev->dev, wacom, GFP_KERNEL))
 		return -ENOMEM;
-- 
2.39.5


