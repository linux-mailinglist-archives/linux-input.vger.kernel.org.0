Return-Path: <linux-input+bounces-11350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31997A753A7
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 01:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FF9A188FE40
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 00:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC9510E5;
	Sat, 29 Mar 2025 00:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0RJgnow"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128481E;
	Sat, 29 Mar 2025 00:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743207641; cv=none; b=olxhAj3OnIPJ6zB5vifUq8jBI4IG3VtY2Lls2GUCZ93duk0Anm5C58LO1l6VUlWcJS812FAbcNZFuCXCYyFCFi54N4v/asFaJxi3J5OohuJgNwYtqNWODx8JGLdOjrynDgXMPvGNE1SZm0UQdG2GQMkyCjyMoICS+0m9DwBI9CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743207641; c=relaxed/simple;
	bh=vscDnaPItvr7zH8XKaPQs7uJp5KM9DGeo51cc2vs3L8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dNQWyl82W7AikfWVat/9g7wzEA3A0PWEfocBvplw37EeX1cjRLrHvMUBETw3ZxBubOP9g+tt5hZ+F2gDm9qvdOm/OaBgohkeop09n3JtiH7Y+wGGUznP7vsGvnYHtN9PwwS5oyP++j+FBz7FDbDlMJVXyXY/KyopN4AjtN5oB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0RJgnow; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2307460f8f.0;
        Fri, 28 Mar 2025 17:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743207638; x=1743812438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJvJ5LypNl2aozLm0/fCcPxuzmDnaIAd4eDQJEWC6LI=;
        b=C0RJgnowUpKlkWmovD2HAGRtM/n88kUgVvCBIVs92OGrg9LL3p7A8BQQ+aQLKuKiuQ
         +Aohf1n/FIHNQtoISdiJT4RK7JhI5P6bhpG3IFPEETXk9IVOohC6TlPMSTbAiYZNfqhy
         grMCg+OcpSBTaceq4y65LidssAz42+sYd+Msm4WsTaWg1xsZbEK3rB/+MaLWYbWvv0w6
         4qAjAvIjcZd3obU3cTKxc5kxaC/jUFXCOfZPKMlChJzqLTpUVkR3xcVTMkTIBNFx/Wxa
         R6EhAWlk7BVlzOogCK866v77NIrDIInbVVe9HqY0vvp0TLsBKhov6v9tBfvlEean7aZy
         Ru7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743207638; x=1743812438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJvJ5LypNl2aozLm0/fCcPxuzmDnaIAd4eDQJEWC6LI=;
        b=NflZNA+JO2meVRdK7d7VkvZV7I9635Y6f68JiMPBMpTrV9F7PrcYX7Dj3E505ZFUUx
         UrdOnK/TU6Bk1PHmWWX2P9Ss539932HITIAFydcwDInjIm3eyDCWztdo2ppAsvRvsrNh
         8OCRF7m7e2FgoJvvrYydRlfFxkIZVfmHS2y6NRhOaaYcRIjYhZGs6HVn2Ksu4GApswq1
         wC+wzy9KEmskzGI1QVgpujzCnXqhaft/cfaayAh6d1KccAT60qjI3Ztpud8IqeZKTIz9
         7abM+Mbni+NdEWYwNPuxj89GPN+vwyIzlQnUFNcV2GGke7TPm/GdCAPhpfC/hqD8zBUf
         reEA==
X-Forwarded-Encrypted: i=1; AJvYcCW0TIDonkK+UZ2lJD/xKnMtreMeGJNZoXQUXWKt9EFI4X/LpARQhp9279PjGLEZ4r2gGsfqQ9oRvHCRTds=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMfIrBNPhrEOg954QBdDp8plMQlYA6enhY4+wvL25Soit3YuS
	sz6KKTJcrKCfzRyujcZdzeleixQKzrQ/KByZfLQinW5GTur1zQsE
X-Gm-Gg: ASbGncuSN6hoBNDvJtdgYXUcroP5j281CVn6ufsdW4J7JxB4TxhORT0L8CbmvgeKYAN
	d43+nZ6S/+6HV7uewkDXTfBvcnNtvdeW/1xNWdVG3dwCQ/M4HWlhd2IP7Qs7de4suTn6NcJcgio
	NzPtE2l6VRD9xjlf+MMViTLXbNmDJHy3AyxYmPcw+FDk8+RDvtr9MDUm4XGFbdoWoy4Y4ru9keQ
	/7qkNHKuJnCF4lbsbw56SlxSYr5487QOe6mkVjbPuDeVAFNruExVR75kqapdOGlqT4Un8t4i+73
	SS29BfjtYiU4r13MdW4p2KbKGTf7Rq849lA1NcIc66YuCs6YGizlSxWIE1ZzEOt1FAw=
X-Google-Smtp-Source: AGHT+IHsEpe/tk/RH3++MCAq6GYBH825kMn0e3JgAFIai6sMRjXiKhhqA6v3ik7ZXdaKrILbX3Thtg==
X-Received: by 2002:a5d:5982:0:b0:39a:c80b:8288 with SMTP id ffacd0b85a97d-39c120f7a32mr713127f8f.33.1743207638029;
        Fri, 28 Mar 2025 17:20:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:6696:8300:158:857:9a4c:d969])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe389sm86253635e9.19.2025.03.28.17.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 17:20:36 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: wacom: handle kzalloc() allocation failure in wacom_wac_queue_flush() 
Date: Sat, 29 Mar 2025 00:20:03 +0000
Message-Id: <20250329002003.36600-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During wacom_wac_queue_flush() the code calls 
kzalloc() to allocate a zero initialised buffer 
which it uses as a storage buffer to get data 
from the fifo via kfifo_out(). However it does not
check kzalloc() for allocation failure which returns 
NULL and could potentially lead to a NULL deref.
 
Fix this by checking for kzalloc() failure and skipping
the current entry if allocation failure occurs.

Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/wacom_sys.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 97393a3083ca..666b7eb0fdfe 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -70,10 +70,16 @@ static void wacom_wac_queue_flush(struct hid_device *hdev,
 {
 	while (!kfifo_is_empty(fifo)) {
 		int size = kfifo_peek_len(fifo);
-		u8 *buf = kzalloc(size, GFP_KERNEL);
+		u8 *buf;
 		unsigned int count;
 		int err;
 
+		buf = kzalloc(size, GFP_KERNEL);
+		if (!buf) {
+			kfifo_skip(fifo);
+			continue;
+		}
+
 		count = kfifo_out(fifo, buf, size);
 		if (count != size) {
 			// Hard to say what is the "right" action in this
-- 
2.39.5


