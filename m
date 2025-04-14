Return-Path: <linux-input+bounces-11754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB0A88B6D
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 20:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A0D317D319
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 18:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06A72918C5;
	Mon, 14 Apr 2025 18:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvGThh7+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4528DF09;
	Mon, 14 Apr 2025 18:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655605; cv=none; b=pevNp2muGAQftuS+x9b1sYSsnqpqO6aj3oq9+URap5s6fWWtPNrWRe4Mm68ErjAKXmHg062bVhtNfxXdTGNI2PTjn3b5jd9akLE8RrrjU9I7n3mgqlVLvnooZOsbR+Q1hgH7JK9y4rSU1goNdBRaPnQxRCdxaeqgoIqkDXmYswc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655605; c=relaxed/simple;
	bh=ZunjNYFnI7JxoSGkJJ1EQ4iGF1wabxw0aCcA7Ph4hm4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PZhiVoiTgHWvOPqy/dS205KKZHegf1YlR2m/AFg2QScGsI7U3jVDfc8n5zHzojh5Hzrqvj6+JPkprKlQAhauaptgjpoh4Am2Cp3txejfcZA3rghqaWEvaLrbDPhowD5Y7TdjRizU24Vx+5d6zR078lIVdoT6yOOWQEvvHko04K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvGThh7+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39d83782ef6so3711684f8f.0;
        Mon, 14 Apr 2025 11:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744655602; x=1745260402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sMvJif03h5Plq8yKKl4hxQHkJT/0k2MiFgQENlo2UEg=;
        b=HvGThh7+uNOXSQaljona5wz+E+KVQYm/ZlcupM9Jq0XAwHX9w44nO2Ttv5WiqGX9Kd
         1BiBvaZq0fllqen5q3QZPYZgSAFg2vdBZeJVSjO1a7Nw5orBKGvRrK+g48x2dWnEGrXd
         UlM3pXzekYtBfyXrsFRsYGyS+s70/B8aPO01yMe1/KBV0288sS4JRPscZjVA2KdiNiiA
         yYvG3Tzvuf/BPIaJtMYc+9gg49CVEuNKdj5Gc/bARpQ54A9x/lfL8uxwgzN2HgE2KDZf
         f72OvkNhwCeJhQiAc66nGC7NiyXlmkZgDW7fA9Zlrn9XD0Xf+z3Re8kRlGnkCm2PupB5
         M5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744655602; x=1745260402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMvJif03h5Plq8yKKl4hxQHkJT/0k2MiFgQENlo2UEg=;
        b=J3ksvp0jVzYjZKmwTTQmnUEszcykTqmfGCchgvo1CLLK4RwSz/AI31aoZ3HcWzpMYP
         J5dKJz4YhdmPA9qlYbCadIlKSUMtLg+HqQmFSNG4oVuycd28BW2VM1/+t9u6mnCyKbaK
         AzubvWmTjn79NEIyvOPErgpMOITOd/uKlixAAs8LMzUjDm4YB7s2jvxtFeoE3yJZKazx
         Her4yYRx7d4EYuq10XkJ++vFetQMxSE6cOQce6A424E8nqb5k3TUw13l9L3Nioxa76+e
         qHMWy5K+86qg5SaUQRqa/7QLRZiWeJ1t2PJiOQqnYcAM7Xlf//NGpKoDJv0Exu6G1fLz
         G21A==
X-Forwarded-Encrypted: i=1; AJvYcCVyscq5SAqodFPWW9wWSO3yR17p02yk8HaFeW+WXDlFvjiatI4/UPcPGiVWtwrLsDEwVJ1rk1zgi5vRlgo=@vger.kernel.org, AJvYcCW5XPNBmKtqk89lc+UpO0NbD31+0J71FLko8f3t79nrKZ0rAdIfKFo4UNHPVGnKuTFEUcych/Rw@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAAXfGV/21D0eDTSm5mx8YynLwP93rXt5Q7EyvQlJGaMXZ4Ed
	lcwjQWkP8lmIwQY+BXEs2nw0hpJyGBP2vXmo6Bh2Xtw3JrGsUIrL
X-Gm-Gg: ASbGncu66qpM/NC3eu9rNLy4EoOSiTSVixP9gbJfIJ34lVcr7ssHh/BwyjZPTNCVfts
	rECdyDsisWlAvGuq8oy8PCAqpu/L1c09dQmLF4RuN/aZW235Bks2fAEiA5R1ugKzrDfum9XkzXi
	sOhGjeZ2U6C0wJ0KTfpWhTuh3U2ZoTOTr+PKWph19UwoINoa3FPJbkq6Q2f2WF96kRYJQb9hH9j
	G4bL7etqInAeMQKoH1z9b+sFLXOboFn6F1MmsqoGBpwxi/BIWwD6l6zty6kJv++dGSBnYKk7i66
	xfnWCDKNHFvbjdQO3GOOidIgFLXOlHVlfhwD0+OtmvnY1JRX80dz
X-Google-Smtp-Source: AGHT+IHa7BlNKNs9GPmoBr8JI6RAbn9nU/ijM2HYizj2vYjbNw2hMoAzVfhZQUc2ygmwT4a2gw9nUg==
X-Received: by 2002:a5d:47cb:0:b0:39c:dfa:e86c with SMTP id ffacd0b85a97d-39edc30b175mr426912f8f.13.1744655601870;
        Mon, 14 Apr 2025 11:33:21 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:2c4f:a30a:c7f7:acf7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d046sm12043150f8f.63.2025.04.14.11.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 11:33:20 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot <syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 RESEND] HID: wacom: fix shift OOB in kfifo allocation for zero pktlen
Date: Mon, 14 Apr 2025 19:33:17 +0100
Message-Id: <20250414183317.11478-1-qasdev00@gmail.com>
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
Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
Tested-by: Qasim Ijaz <qasdev00@gmail.com>
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v2:
- Added Fixes tag as suggested by Jason Gerecke

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


