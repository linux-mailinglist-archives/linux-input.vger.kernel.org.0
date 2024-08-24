Return-Path: <linux-input+bounces-5818-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BCF95DC0E
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71D61C21BF1
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A23C1714AF;
	Sat, 24 Aug 2024 05:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJYODFVo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E059815B155;
	Sat, 24 Aug 2024 05:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478667; cv=none; b=IRIm6H43MQk3cdYWG+IKl2hUtkUiBDuaSf5fARrZ10hZOB6fMoV3I4sx0i//37Z1ckAADwGT8KMbeggV+xHcj/l8XribEfb9Xk1sDdW7vekPlgl8WIsjHiYfPfFTtPHctk7DMv3nNJYhX0C5h+mOcL5u+UabxCUh7Ufk6a7FXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478667; c=relaxed/simple;
	bh=Xp4qfeTlxk2eTt/LR4WhGao5XwYHTSzWfxlA1JG37LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZczM7SV20/CD6FjkaggSQ2QrPAv7RdnmFTYuz6WjNjeWQ2EDQgIk1U4Uh76m2NBLTsut/zqDJxlF5czpiM/LZtGoj/CY5XGxUStmIybfHIS/dc0XSxagWLBPhPawUMXr0skA65WirCz6g0vxv3XWWcxrptL+cDoikhcJg3gW1mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJYODFVo; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso1989520a12.2;
        Fri, 23 Aug 2024 22:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478665; x=1725083465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWx4S/yyQ8tATVGsDpSEMMNoZAbZjpUFwOWTe/DcQKs=;
        b=XJYODFVoYHN7AnNozDGb0tsxsoT8TVHZoiD1qF0nJ0mDY5NZ3ZLFTkcGPVMVRra9ek
         ov4jnRMwxaNhC1Vc9uTeS/kCs4c1GPMl+qfC8l4S/Mvfe0C7mTNBId4rmFTCfxWm6MeL
         yLh8o0ZhkXTxPwlsSrR3UDg0VJHI4ILB/ISziCK6vtx4C69WIHDzVkAmcR8hIeahxva2
         qoEJhFT03NDOXF3GxYX7zllZQ1bTeHO+ugxMXmKuKYEMkRpxy2oQvi2EbtBIP1bsS8oz
         qplmXceD/oo7kvF0YktdMbh++K4fD4J75bkKnOi5TF2TVfMSJEIpWWQN1M+6UsBZt/kb
         OvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478665; x=1725083465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWx4S/yyQ8tATVGsDpSEMMNoZAbZjpUFwOWTe/DcQKs=;
        b=u0DVETLE/3ojFPAWnmP1GvsTRDbeO6r+BG43F/A8lwr/nhA7zANSOxzvoYReXtAO4h
         N2aCBWmubrGIxsIoWf1oSYksaSsNrZ+yHm8Ovj6vZ6kYRBqWtN++3XYxtc9YrJHAWWyO
         e+eZLuSEODSopZ+zK8ZN6+NsqTxZ0NAh8gN00YvWrIoUIvvvjl6x4pPFPEWnCZY5eLlE
         7YyvBMU7vz1G8FAgoty4UXq+0O2DuExc6ta+wx9kMnVtl3EPeRWnoWJFZEUASVt2v6ka
         yapZwKLfVAZQ+Az1cuEF8dxYKwru2g+5WNY4cDox4GWgrEVLR7g4h7T2d3RB4P73BBg5
         uDBg==
X-Forwarded-Encrypted: i=1; AJvYcCUwXohGpFAFSEYnrm2zWMOkrlDWkWAzZapZ8VQMb5/QT8SHHclTNFpkylHjOPFM5T3jps9zic6WALvOA1gm@vger.kernel.org, AJvYcCX/Vboxy/1XlOG8jZHqZqgvbvCT5Bs8p+pVDBHM4EwkgppomKfyQBANmzwA9cACB+k77PNyvIaJP3KDcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCcSI9WjR/xjK+cMA6QdRAlg7AvmFq5QbvHyo0KWdoOcyjLj0D
	PRaUSBgnJ7LeB+W42DUOBLuh04l0c5s69HYp17MLgMh+E8/UJpoNe7F+jQ==
X-Google-Smtp-Source: AGHT+IGXN3AOZT9KuNHhR9PsauJTI+NYuBD8Ia2mqI/h9yGRicbDAD6T5EJ2fs6qURarH2FaOecdQw==
X-Received: by 2002:a05:6a20:ac43:b0:1c0:f1cb:c4b2 with SMTP id adf61e73a8af0-1cc8b4290d5mr4610745637.4.1724478664907;
        Fri, 23 Aug 2024 22:51:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/18] Input: zforce_ts - make parsing of contacts less confusing
Date: Fri, 23 Aug 2024 22:50:34 -0700
Message-ID: <20240824055047.1706392-11-dmitry.torokhov@gmail.com>
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

Zforce touch data packet consists of a byte representing number of
contacts followed by several chunks with length of 9 bytes representing
each contact. Instead of accounting for the leading byte by increasing
offset of each field in contacts by one introduce a pointer to contact
data and point it appropriately. This avoids awkward constructs like:

	point.prblty = payload[9 * i + 9];

which makes it seem like there is off-by-one error, in favor of more
straightforward:

	point.prblty = p[8];

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 32f3d74bd339..c5b4c85359b4 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -318,6 +318,7 @@ static int zforce_touch_event(struct zforce_ts *ts, u8 *payload)
 	struct i2c_client *client = ts->client;
 	struct zforce_point point;
 	int count, i, num = 0;
+	u8 *p;
 
 	count = payload[0];
 	if (count > ZFORCE_REPORT_POINTS) {
@@ -328,8 +329,10 @@ static int zforce_touch_event(struct zforce_ts *ts, u8 *payload)
 	}
 
 	for (i = 0; i < count; i++) {
-		point.coord_x = get_unaligned_le16(&payload[9 * i + 1]);
-		point.coord_y = get_unaligned_le16(&payload[9 * i + 3]);
+		p = &payload[i * 9 + 1];
+
+		point.coord_x = get_unaligned_le16(&p[0]);
+		point.coord_y = get_unaligned_le16(&p[2]);
 
 		if (point.coord_x > ts->prop.max_x ||
 		    point.coord_y > ts->prop.max_y) {
@@ -338,18 +341,16 @@ static int zforce_touch_event(struct zforce_ts *ts, u8 *payload)
 			point.coord_x = point.coord_y = 0;
 		}
 
-		point.state = payload[9 * i + 5] & 0x0f;
-		point.id = (payload[9 * i + 5] & 0xf0) >> 4;
+		point.state = p[4] & 0x0f;
+		point.id = (p[4] & 0xf0) >> 4;
 
 		/* determine touch major, minor and orientation */
-		point.area_major = max(payload[9 * i + 6],
-					  payload[9 * i + 7]);
-		point.area_minor = min(payload[9 * i + 6],
-					  payload[9 * i + 7]);
-		point.orientation = payload[9 * i + 6] > payload[9 * i + 7];
-
-		point.pressure = payload[9 * i + 8];
-		point.prblty = payload[9 * i + 9];
+		point.area_major = max(p[5], p[6]);
+		point.area_minor = min(p[5], p[6]);
+		point.orientation = p[5] > p[6];
+
+		point.pressure = p[7];
+		point.prblty = p[8];
 
 		dev_dbg(&client->dev,
 			"point %d/%d: state %d, id %d, pressure %d, prblty %d, x %d, y %d, amajor %d, aminor %d, ori %d\n",
-- 
2.46.0.295.g3b9ea8a38a-goog


