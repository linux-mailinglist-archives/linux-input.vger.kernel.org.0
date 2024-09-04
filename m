Return-Path: <linux-input+bounces-6133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F38596AFEE
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C8A0287205
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971EF84A3F;
	Wed,  4 Sep 2024 04:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rc1/nP7B"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D75823AF;
	Wed,  4 Sep 2024 04:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424985; cv=none; b=e7HB6Y0pBDs07Vj05Jo6tnk14NZrbOrjNUNqxeacrF6VFaH+G0lqPNZcZSvuD1CavB9OL3gk19GmefMlXLg3Z/EBaJn9t+KAzdNVghYgv9KKcK5fVVWvcbxSa8nhO6vwJxXGOsdFy0Ie5m/SqLgNQdFSZohxMT0N4DsPeYSjNDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424985; c=relaxed/simple;
	bh=Z7nsIGt5YhOtj9TKDzIi/YcNVdcAY9ONCb+aIMRoifs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTpQzRkHBJ5PPCPSHDMYV/rQAUv2A42MJ5WOUTQpqh3xlfRkm+ui/BQdA4AvjnL21OLV6dJOhrkrdk38QB4CwWrX0gknO5gYdCRqkJEmR+wcUkKeEurcUJLLoNz5+ERzb1ki2F7a4zVeCgDihtpjU0Dwv1bEHO0PHrYNu9YYkbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rc1/nP7B; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20570b42f24so28760645ad.1;
        Tue, 03 Sep 2024 21:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424983; x=1726029783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQjFNREllbEtpcW9yUf75en1G/awvfMmLJq7sa9fQM8=;
        b=Rc1/nP7BScWjw+nq9uXeeBX/fy3ybto+fVELz0OOHTynqvp9An+j2k7sayTNZkg0x8
         LjSFc4tTu+oi0EqPgIV+gFUuJbSEur3u0KQ+Vy8zrYQ9A+IQ/naqIn9e23vEpRUyya9v
         4yIDme3ue44vpzWrW1P76gIWlmpVRRZrN+yAwaXFQSQLe8hmYjUnD5H6GoFuqDixchN8
         VoGjhCpLLRw0w0DtkPPzhfp8TAbVo/Vz3zsPAI27FXyoedsUkRf15bfOHvhzDV2obi8U
         Z8oZXXXZON2dt+lQnAgsP5SRSgAv10QH+u512wLo52NSJYRF91cZ/2SxszpoCQpIUgNx
         vnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424983; x=1726029783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQjFNREllbEtpcW9yUf75en1G/awvfMmLJq7sa9fQM8=;
        b=OePAR00/5Ts5MW+l7Z338X5WO+pSudFVpXn6daXb63PsftemcJQ4H+BqnTXi0pZ5wJ
         AklC0BMWA9lZoWvPRMxNI6+coB3SRhlHyc1AdAzemL2GfGnZvGtMNOAsOLsTZr6/9RUc
         vhiTrz+TaGyaNYvm4U/IfFpROLnCgdIxiqIA/SlQS/noCkPu+TRDmUQ7ngwRS7LPn9jo
         BduGPcYYHZg8/LCDa+rIAi+CYpE4ZiyUyTnQUEQNueVyMxUH4Qg61HGejRotC8uTPbbZ
         6CkaEsvYhxmpSNFlQcpFe2Y9gnrgo/1Lvl9PXTgHs6ii40jt75zlmYcXsFSrssPo3mXN
         IHrw==
X-Forwarded-Encrypted: i=1; AJvYcCVLcoBODV5VH9RIl8J6KCTTmlL0IKV0wqM+tIwh1WtaJUmmXIyGBBjzv/P/Dafp7ZCDSVgEj7GKHRbZrxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpfrNiIGXA8+mrfwfJbcTq3q6oQj/bxQc8gmEes4WeEEwpvoBa
	drktu1gMqDqowNw8y0zOKvP8m1sEdJ+JOu6EQzWWkx7S84XqDVA3Qko1QA==
X-Google-Smtp-Source: AGHT+IFz2IBREdG4bnpMKSTq9/1/sHY92r6ILi9UHKnQwI3cSc41SJgB8oji0+T//1jl3dDmedPW3A==
X-Received: by 2002:a17:902:ce07:b0:206:ac11:f3bb with SMTP id d9443c01a7336-206ac11f49cmr33072625ad.47.1725424983330;
        Tue, 03 Sep 2024 21:43:03 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:43:02 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/22] Input: cma3000_d0x - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:42:24 -0700
Message-ID: <20240904044244.1042174-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/cma3000_d0x.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/input/misc/cma3000_d0x.c b/drivers/input/misc/cma3000_d0x.c
index 0c68e924a1cc..cfc12332bee1 100644
--- a/drivers/input/misc/cma3000_d0x.c
+++ b/drivers/input/misc/cma3000_d0x.c
@@ -217,15 +217,13 @@ static int cma3000_open(struct input_dev *input_dev)
 {
 	struct cma3000_accl_data *data = input_get_drvdata(input_dev);
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	if (!data->suspended)
 		cma3000_poweron(data);
 
 	data->opened = true;
 
-	mutex_unlock(&data->mutex);
-
 	return 0;
 }
 
@@ -233,40 +231,34 @@ static void cma3000_close(struct input_dev *input_dev)
 {
 	struct cma3000_accl_data *data = input_get_drvdata(input_dev);
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	if (!data->suspended)
 		cma3000_poweroff(data);
 
 	data->opened = false;
-
-	mutex_unlock(&data->mutex);
 }
 
 void cma3000_suspend(struct cma3000_accl_data *data)
 {
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	if (!data->suspended && data->opened)
 		cma3000_poweroff(data);
 
 	data->suspended = true;
-
-	mutex_unlock(&data->mutex);
 }
 EXPORT_SYMBOL(cma3000_suspend);
 
 
 void cma3000_resume(struct cma3000_accl_data *data)
 {
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	if (data->suspended && data->opened)
 		cma3000_poweron(data);
 
 	data->suspended = false;
-
-	mutex_unlock(&data->mutex);
 }
 EXPORT_SYMBOL(cma3000_resume);
 
-- 
2.46.0.469.g59c65b2a67-goog


