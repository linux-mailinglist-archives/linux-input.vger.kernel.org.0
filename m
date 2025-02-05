Return-Path: <linux-input+bounces-9807-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A68BA29C22
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 22:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEB3A166A14
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 21:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8E3215067;
	Wed,  5 Feb 2025 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDxM/jIH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1989E215061
	for <linux-input@vger.kernel.org>; Wed,  5 Feb 2025 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738792241; cv=none; b=W9ocvZXmR+/qM2VoG99hKofoVkdlI4a0Y3wv96NpxLef3NHBGRsEDn5H51zVjYUEI9AWc0Yph9mIf4qnbNFCGGqhW2qkmkBUUeLxSzxAL8SZb/arA4oBkWkA5bRSh2cv22uW9QVGogQhfBNbgroZvTGrrZSiVat8mTNsHwxLJRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738792241; c=relaxed/simple;
	bh=mRM3zHH5uRnttL2NVeVOgzUWV2zzNQlxJnbKJjZqUMg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FPQzDHRpuevyi5A8l+HxLLuHuclnKvRdx2KLhUF8sSGOAgC/vZ6YZN4+YrZ1OEDpL/1a14Bnsncy0syb/OwyhY/axyaqjqo41gNlbNK0dxIgpKsSbpXWPAjbdb6c8a1UjcegZVI6LYs8Z3AakzjWE8JQNPYkbX90+//KKiSJxng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDxM/jIH; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5f304ac59b9so137222eaf.0
        for <linux-input@vger.kernel.org>; Wed, 05 Feb 2025 13:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738792239; x=1739397039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvq0zvM+ZEFh4k+Sd8mEz15qlgRnyMRFvdqSUCvjXQg=;
        b=eDxM/jIHJJDRwTpFAi0fOjn/MgrFHz/v1w79pZkyAL+BJWDF5vkG55jtAQ3Jx1lfhU
         kZ4UHiAj8eAwOCo3i89+hIg7K0wYLitnxRM6vICY0slEgaw1ndGDlwUuUtZX775nv3Vz
         XqfvOsYF3nIIoGagi5vteP30rANIa/CWoZpUkCNmSn1YUQ9FJPr5DZFYmYsNr0yHo3FF
         VGPpVOsYK+HoeKJ/u5iARxMniPjguN8TtjfjwguWaUHlSlFY4IToGGEjQO2uQCHOSkny
         K91WTqPA/KZcN6IpVqwZM7myV+r75etQvQrtVqnxnKlx231GvaTq37pEpHLxZRMfXjVj
         /LOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738792239; x=1739397039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvq0zvM+ZEFh4k+Sd8mEz15qlgRnyMRFvdqSUCvjXQg=;
        b=BYNEZwxVeoVZqRNOlUHSEAj4HtJrSjF+7izu9Gin2X88fWVeYiiyvZ/LJDWY/SnqG6
         NHrV5suyzAiRVY9KHRRkld37W5M569cyOIbXO4GH3Nra6qYMV9LQvqDuSsXR4GaklGgL
         BEVGdzCWzWDUfIBWzoHKLkESMQwqQiA+540ad9rHm2CsOBu2rRfA1TLfYZR2nOVrUGLb
         Rk2h67MZZCu4ZLqcwWRQkOJvUA4d/MfTXaBbG+3Jras6rZZyr13KRTnCbkQ85xB4ZIfy
         KMF7LiB41Gda13vlKBW+bol/70csjZ51C6TMYFd0w73HtzqjxNG2Sjj8bbQkl3nZk1z3
         IYXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkSx4alhx8gvOb66qTROZbyYUxwD0oE2U4PmG8VzyvAb7MfPchUbyGH51YhcjE8rK5EolIcOKirVgPXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaBxonf8uBUUOlErAAGC51Pyw8RXtj24AmJPehKyJDW1V0raAo
	0tWX/mQCsY74lddL70kBONIBvt1sp3pAIuGiLE3/Hk7XqTHH+nn2
X-Gm-Gg: ASbGnct0uOj4sEDke1DHHGSLv6fNtRZ37Il5RhUQXqoWd6eqXO1eGryaNxDscgcKez6
	AbNdB8R65wabnsRita++zFKh1PEygkovJj3qDbi3T73al0Fp3zag6ziczBrR2JOmGZsEA85gNg3
	RCHq3GRxxuhfNoG89d8oOHfnxthPkhDrxHpiFfuE/eNK+zLsquofmhwmRCiPPA404/FoLDyVSgC
	0gfY0FsaNkVjujjsiA5gNB7z4/khc7jMiHxtP5Zdv+9eUZiXoXNqcVe/a2C9XFJbk0lQ0J0PgMF
	VyffqpVyOw1abVEMH5pRy6PeK3w=
X-Google-Smtp-Source: AGHT+IHsLJrq1/6jsjnL70pI6+IKN2WaOK9OTZJjSiTC0t6yFL3CqtJmkJsDvX6eeDca3Db1hN1w8A==
X-Received: by 2002:a05:6820:2289:b0:5fa:61b9:3e99 with SMTP id 006d021491bc7-5fc4798aa32mr3487824eaf.3.1738792239064;
        Wed, 05 Feb 2025 13:50:39 -0800 (PST)
Received: from localhost.localdomain ([146.70.177.76])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc1059a87esm3989322eaf.27.2025.02.05.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 13:50:38 -0800 (PST)
From: Tulio Fernandes <tuliomf09@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] HID: hid-thrustmaster: fix stack-out-of-bounds read in usb_check_int_endpoints by null-terminating array
Date: Wed,  5 Feb 2025 18:50:34 -0300
Message-ID: <20250205215034.51291-1-tuliomf09@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Syzbot[1] has detected a stack-out-of-bounds read of the ep_addr array from
hid-thrustmaster driver. This array is passed to usb_check_int_endpoints
function from usb.c core driver, which executes a for loop that iterates
over the elements of the passed array. Not finding a null element at the end of
the array, it tries to read the next, non-existent element, crashing the kernel.

To fix this, a 0 element was added at the end of the array to break the for
loop.

[1] https://syzkaller.appspot.com/bug?extid=9c9179ac46169c56c1ad

Signed-off-by: Túlio Fernandes <tuliomf09@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 6c3e758bbb09..3b81468a1df2 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -171,7 +171,7 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	b_ep = ep->desc.bEndpointAddress;
 
 	/* Are the expected endpoints present? */
-	u8 ep_addr[1] = {b_ep};
+	u8 ep_addr[2] = {b_ep, 0};
 
 	if (!usb_check_int_endpoints(usbif, ep_addr)) {
 		hid_err(hdev, "Unexpected non-int endpoint\n");
-- 
2.48.1


