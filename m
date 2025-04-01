Return-Path: <linux-input+bounces-11467-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C51A78420
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 23:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35A083A6A76
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 21:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C93A1EA7C8;
	Tue,  1 Apr 2025 21:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkC38HzC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BC31E571A;
	Tue,  1 Apr 2025 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743544060; cv=none; b=XprjmZPLFOKKp/HdMagpci5ekr6NcRbkGkFYXIWuM8pTvK7FSJCeVFl4ijZLcLiUhdWym8EyEF6BN4kpF+iHkHQ95x9XOD4vidYn9GZtaCfOtc7S8TUD4CDOGzNpeTyJ/aoGLWaDkUY7pQWbc/BJ+Kr3+BPZ1NycmNj7BEnm7gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743544060; c=relaxed/simple;
	bh=CvA6UwveG3bS2kf2hFjNracef5KDX97VUsZ0lmH+bfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TXVPxl8HyaGin32T6H/gdUWVUMwIwax5rWv3uSx8SJ8cY8ktREKwZqCjGmy7GRLrSL6BDfBLJCkdpiMY44JubTo3a0TAeBDlrHDcVfLB/2m45ce+cgOdTm8h7BdyuJ+14NpYMEuvJBiZNnbxgzQpWa4wWV7HzgEeI4li7EfiAxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkC38HzC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4608228f8f.3;
        Tue, 01 Apr 2025 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743544057; x=1744148857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sMvJif03h5Plq8yKKl4hxQHkJT/0k2MiFgQENlo2UEg=;
        b=gkC38HzCPzgw3j+HS5eEBsZ+tDGXSwdSV7sLulAnzocVjkmYmm1cvOVmBBspeY1IS1
         EwHQOxlhkOv8emYctTIslXswheal5VMEfj35Gdg/Qqjf50vdLI2AtRKxuyZgtAwx9tdn
         EVO6wqZP1hqL3tNx925M1OV/bkgCc0IqG03J03weHHVdM9QfopORK0XDbJfzEW8E5ePO
         eI5Nm7FOpC/12bv0RR5pVmBUgZoKRJoKQ8wZhK8Nh6jw7L30DU9T9yxksSchPY0JDj8X
         iaWklnNy3eeaqGxfhCBoOGzRRRCDnfc87ciYgqQ8qNB3om+7NRwmuNnDVTUb1IZixwOY
         wYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743544057; x=1744148857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMvJif03h5Plq8yKKl4hxQHkJT/0k2MiFgQENlo2UEg=;
        b=o1TUKqsHG9PyNya9dknzfLGTxP0jQNJbp0+Jr6dYpm3i7b0M9Yfqa7S4HEBdCbXkoO
         CzrKwsBqeoNF4+nlNpf9m5pCPhQnT4O8/rsn9JUMIC1REeK/1Y29qx1NTObZfXImL7As
         DWUlyDXDTRxC/0rUz00V/kX2hUOGpC3+658rcbSfgm83mK/KEu4Je5hnh6+t9EfIAnpY
         AAFdfqBmi7JCauUItxCTuQT6ZB/7cBwf8F0Ig3da6TQFKRxbiIhNlsiw6kmX7RPaUQk4
         193hvFHXbBuoKkqrPSlduEY49o0PaQLLq4TIfSIbRo6oWrGqmU5qIjLwymlLUkQj81QY
         RQuA==
X-Forwarded-Encrypted: i=1; AJvYcCUt5W8YjHGe4rgmFDdDaHbwjeCGNmFVgkTtupi2DsTNNMNkgKLfb1wjYxseOZKhQ9dZ7wZlcu3W@vger.kernel.org, AJvYcCVrd/21nAyzhsL1DXXqF9g4XZk3ayLpfRkbukyB1mKVRQz9TNZGnmm0REmsx4yGU4FywQxxNfzXprQ2f80=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDW5F7zlsYyFomkQxpH0xtbY5BAXSZT51sAsmJCG1Vp3psYkVE
	K6WV2gtSPbdi1RKtJhqPL0PmvAeVwYWOOmcsQLheOgt9DUWETMYr
X-Gm-Gg: ASbGnctANi8aRgTpU/5UjGyC++iVvERouKjZtdCmjDR3Qx+UEgL1wQXlM4UmgDFQnh1
	opO5hQ+RV0qQMwH+BWJTCBQzZo3KkXjFofeMr9P6V3spWf9IgIhMSQhcx15wR285O1V4spDNluq
	ImhIhVXD3d6i+bW0b02XDwjteL2usrgkY+Osa03z/PTcpbkbA9oAxf5MRVjHmYtJaqwBht7aQ/n
	Fsm2+lsHCmcLRrPx96D7uSK6cBQPzFDZXJMyXgfQgf5JSO9sbg6zVEGplGW9PDvL1XBSeuxaNAl
	qIPmSJ3wjFn7RQky/+ccZ415SgPUEN64kpnJJ7VjCaf9qVbr7f8GwP5juA==
X-Google-Smtp-Source: AGHT+IGu50MAktN7TpMx8eFMcnMTJh3E1UYjvLI4/mCGVHm4ePbf3RP+pkDt5QEIb1mt3Y9NaSnJ5Q==
X-Received: by 2002:a5d:5f91:0:b0:39c:d05:3779 with SMTP id ffacd0b85a97d-39c29806115mr68057f8f.49.1743544056564;
        Tue, 01 Apr 2025 14:47:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:6696:8300:e7ad:5b60:9085:6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a8e0asm15043178f8f.101.2025.04.01.14.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 14:47:36 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot <syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] HID: wacom: fix shift OOB in kfifo allocation for zero pktlen
Date: Tue,  1 Apr 2025 22:47:03 +0100
Message-Id: <20250401214703.7809-1-qasdev00@gmail.com>
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


