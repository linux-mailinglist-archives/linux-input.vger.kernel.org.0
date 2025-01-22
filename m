Return-Path: <linux-input+bounces-9470-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41767A19132
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 13:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78485166169
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 12:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20528212B1F;
	Wed, 22 Jan 2025 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgiYPX0g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546C21F78E8;
	Wed, 22 Jan 2025 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737548067; cv=none; b=CiVlZlw0GAHfwPl9pWjN7DmAd3KZzZdqCCmqmeKirjTdbO/MfCW/t2qAk37uycDgcIyJhh0TRnn6cIIPcMr+XtoERklIqoM/OIRmBokFZjV/n36GYl4hYAWrFt9LO9XXEjhQ7/kBntc9R3BesdBSp4F0BLJ4bnxhVCGfJt1X7U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737548067; c=relaxed/simple;
	bh=LdX5gzPWWXWy4c4lv+fCqiIZRH5iBprpLLInt1P9mDE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A1r3Xx7iogAjbyDMx4GFdkDRhUSi/hh6PAsMI03rOCWPXxHdk3T8CnCVUSLJ2jVRAu60I1mpteoFRljYjqYZMvyPV6WtUMKkXWWICXO9sRVSE0QHG39pguakOl8Iu73izf2UxgmN9CNUHwSwjhwkBs7ZisSP/iuXfXsC8rALQ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgiYPX0g; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so63711601fa.3;
        Wed, 22 Jan 2025 04:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737548063; x=1738152863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJtQVsXd7DL/H5pNwMdayTtJgAP7RsD78pCeMq7QPvE=;
        b=hgiYPX0gpyQk2KByu9xab0gAvfl4R7PvbluzYfq4Mea+HyUKLKBfgqTFkDTkHSQsSj
         94W0dfUIeF1cNRMD3W18ubPQ5BeIvR+iUSzjTkbY18+J31p5F2nW7I7bj1FgMOzyXg+b
         ES4mvPmRTj9vEXM8fNjNn4ZgFIrX9dlDxP5nkgp+m4Q/Okn5u/UrZRIISNkFvFk6rmDJ
         vBSwoIfnl7QNQ/bxLqd04XL7fBfGjpuoEL609jAVTfEjqjqi61vrtzVqVLDf6dqg1M+v
         D3ki0qObqHDuQIz3rUyfK4EkLZBAce0ktjlXjsO7jTDmIIdu5dT3X1shiq7VWjPl4vPS
         RtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737548063; x=1738152863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJtQVsXd7DL/H5pNwMdayTtJgAP7RsD78pCeMq7QPvE=;
        b=a3LYQQ6MKMSH4Qi/FInv1cRDx5Ph+K1SSK3JOdaWhCCbMYe1iKOQHIdmrMvig+gcen
         /GwDKLFFwTb3W0wWWf4TiECd8GZgZPL6bC1CFEpzRiD8Carbh5deegG4R35LkQSY/sO2
         jz8HU/bV/O4cCZ3AEvlb5JCRG5A5PKs165Pk/xuOKhRkiV8TJ+nhdpa6166nekbtkxdw
         hZEv+PidyK0CJh/qcfwPGw5BoyyiQEwJlUXHv6xwCQ1V/Gnu343xtVZPp8/ryBRaTunb
         IXuR38XArRRrrv9/huLGYbqlPfYRQr+ixBy4qSVBq5IX0c3XU2RoM+bgYwnft9pG0peI
         JSfA==
X-Forwarded-Encrypted: i=1; AJvYcCXNKCRJKryueR4nEp/7fRPPHl5aQgLm/fVdpbYk9/q5EgPYkn2Z0uc45gTvkt60dbolBfzaCx0xSlc9YxuM@vger.kernel.org, AJvYcCXqqd8yYJMIcYkL/oSoq4afAZqMwGAx5JX6aVRsnAG5W5Qq5zYwKq69WB+EnOUA5iZbEx0k8napliR9Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq0gbUJl/kfyWb38L10luyXVU268nOU6usCQiqjneEpqIhtD5F
	+U1fdwnz3uH+UTlcl36LA3c4pX4C81GM9ZRigtgIb9Kor27iUV1D
X-Gm-Gg: ASbGncvKA2wyeTyGSDhIqVHjMoH9FUOZYMPyxHpr2csnLnGHpeb4Ej6bHRNzom0y6Zo
	RCBo0dC21h30LhluTgnzZ9CTqwdJrHuWW9sAGbrhfNiSZZ1dMEf7cGyM0xwrZrqLvgahDeFk9Yp
	L/8RI3FYvCz0K3PxO8LO18xlB2To8tOGM7ByWvG58PWilruJ8N1dbA0ykV8P5a5FT2w8zWVsBgg
	n0vM4ZENnAinBsv1bKCfrilgClwyEUCiuTMGAwF1d+GezXW6zJyJcA+r/3/e4/UNnqq+/300oI2
	P9WLrF4TyYvf+3UT3NN/Df7LFGaBzA==
X-Google-Smtp-Source: AGHT+IHUp3D8wcBZo805IDEZd3aCyXE7IL353HxB7rQ5mRHKRaXT17j5F2nVA0glKGTddSsMk2aclQ==
X-Received: by 2002:a2e:b74e:0:b0:2ff:56a6:2992 with SMTP id 38308e7fff4ca-3072cb81629mr68195661fa.37.1737548062838;
        Wed, 22 Jan 2025 04:14:22 -0800 (PST)
Received: from NB-5917.corp.yadro.com (avpn01.yadro.com. [89.207.88.243])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330cdcsm25980381fa.11.2025.01.22.04.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 04:14:22 -0800 (PST)
From: Dmitry Mastykin <mastichi@gmail.com>
To: job@noorman.info,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	felix@kaechele.ca
Cc: Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH] Input: himax_hx83112b - fix event stack size to clear irq correctly
Date: Wed, 22 Jan 2025 15:14:09 +0300
Message-Id: <20250122121409.1374602-1-mastichi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The datasheet suggests that the size of the event stack is 32 x 32-bit.
Reading less bytes did not clear the interrupt output. Extra interrupts
were called with zero himax_event_get_num_points() result.
Only every second call to himax_handle_input() cleared the interrupt
output.

Tested on: HX83102J

Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
---
 drivers/input/touchscreen/himax_hx83112b.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index 31f18860dbd3..fe7bdf8cec50 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -24,6 +24,7 @@
 #include <linux/regmap.h>
 
 #define HIMAX_MAX_POINTS		10
+#define HIMAX_EVENT_STACK_SIZE		128
 
 #define HIMAX_AHB_ADDR_BYTE_0			0x00
 #define HIMAX_AHB_ADDR_RDATA_BYTE_0		0x08
@@ -292,9 +293,9 @@ static int hx83100a_read_events(struct himax_ts_data *ts,
 static int himax_handle_input(struct himax_ts_data *ts)
 {
 	int error;
-	struct himax_event event;
+	u8 event[HIMAX_EVENT_STACK_SIZE];
 
-	error = ts->chip->read_events(ts, &event, sizeof(event));
+	error = ts->chip->read_events(ts, (struct himax_event *)&event, sizeof(event));
 	if (error) {
 		dev_err(&ts->client->dev, "Failed to read input event: %d\n",
 			error);
@@ -305,8 +306,8 @@ static int himax_handle_input(struct himax_ts_data *ts)
 	 * Only process the current event when it has a valid checksum but
 	 * don't consider it a fatal error when it doesn't.
 	 */
-	if (himax_verify_checksum(ts, &event))
-		himax_process_event(ts, &event);
+	if (himax_verify_checksum(ts, (struct himax_event *)&event))
+		himax_process_event(ts, (struct himax_event *)&event);
 
 	return 0;
 }
-- 
2.34.1


