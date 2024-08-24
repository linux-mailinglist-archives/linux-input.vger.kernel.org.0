Return-Path: <linux-input+bounces-5819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CDB95DC0F
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 667101C20C8A
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF8D1714D3;
	Sat, 24 Aug 2024 05:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3utMy3i"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F55D1684AC;
	Sat, 24 Aug 2024 05:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478668; cv=none; b=i7nfmHKgySM4VZNJJ3iynIS8+Zt4YmNIvHnYfcsM/i811S48nFT3p8uLSraehu20mAIW6ROaCsiXpGBen76uTgzm/OG+n3WZ0YNX+POLv3ZmjyR0P6mzP4UP08c8vaN24xugywt1Kd30Iqj22Akvmc+7K06imgM0XcmLjrCbhL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478668; c=relaxed/simple;
	bh=LH7J6vBS32ha3ew9nxayD5gynd3RoOLPuosE9anBCXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1EMbkAMib8g5B3/s2F29jY2smZWdV3ImYOXAMkR00TPKH5JEL1/WBdiZAVDYwXehe57kkv7b36k93Hp9YhIjyofPI/9gCNdXXP8BHWP7/CyWbVXsPhAia2OrgSyt/Z3FnF/oihPBIRbzFDsxjSGOiX2P7gmEfEojMhxZJbKlks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3utMy3i; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2020e83eca1so26741175ad.2;
        Fri, 23 Aug 2024 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478666; x=1725083466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKtUQ3HzVmiQ6+VbR9hd5Nt80Xys/tTNaSD1W/KzOkI=;
        b=b3utMy3ikEQ9ciY1Z0eGPivjSowZzkiZ1CMulxrxnNNgDsrFlzKlvTA7wYU1u0Z2fd
         pgxj9kMDBBFwnjxDjySx6aXvaCrf/Gb0qxaxbYnUxg0UWROWR/IBaeh6mDvwbzC1EPou
         Tw2ltXtzpxp4KjPvFtuNZQAGvgkcdyEmZHT7T2wjQHTL+Bb3lK5KBuvCDompL9BOlfKt
         Whz3PleZxCm6DAZJE0Cgf9EQ4lK0EThYqFgJSU0EHAuDP4UX3n7SwYuOU0bnULrTeL1L
         raUPXgP4gODPoTNZ8exaBovlBjOyEhZMTckf1QvK6vUiuCOUVUMV66PoRy4oTTUGJ2WY
         EVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478666; x=1725083466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKtUQ3HzVmiQ6+VbR9hd5Nt80Xys/tTNaSD1W/KzOkI=;
        b=JqA2VWH6FvyP8YW5ilxSmhoc22ziYkPTO5ReNp5zMt+Ty7iOfvQtBdIh7IwGqsGzly
         rMzSosyrcD2oLJIBx7dE9gSpqdQV1Q4h9Yhipekk82skTSfy7MEAXxpp6aJspba04Q46
         +0qLGlKHT1I2p5xRogMTWtKcBGgYJZb3xNRpDZC/nE/e26D8s0+hr1CEW08ZzfMQfDKI
         3Hy9HmlwGmMuF0Hbxk1aMEYSkYa8rWqpnyFvAyZJBysHUCDQEP3CHtCA4V7WxZ5XEM5c
         vXa24EILFenBXA5bn8NR5/4NjbmXCgeTTqL6GOg+36NUnjysyu4RxMi22nni6tgWhpZp
         KVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTM5ZvAyuewLyOL6a18au+zMs++bPPILpcIaFY/jV6IJQvw5tgWQkMC6kFZoAUj6MqQ38eqcsIq1GXfg==@vger.kernel.org, AJvYcCUrBcu/Kh14S8dhP/wDcut325vnLcA8KFC2U2yksyS42rbqFR5at4n8mzKwYv4gQWyqPkrne99VAxE2tUYl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0LzfmPiwMZBtoreTIMoLwyg5wyWlNa1dx4pdYgtawGkqW/yAV
	lPvTEzZhYj7Dr3J7u26mIMtElXbfUpjeyUFxiP7ll/H3M0IWXqii
X-Google-Smtp-Source: AGHT+IF5KCoB6pj3hiWa4LcaH5wpgJV4z2oTS4dorpkOJV5VFkOVNEE3VQh2jR3TO0zipICA/ol0Cg==
X-Received: by 2002:a17:902:c404:b0:203:a0f1:3400 with SMTP id d9443c01a7336-203a0f134f2mr48429025ad.0.1724478665796;
        Fri, 23 Aug 2024 22:51:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/18] Input: zforce_ts - do not ignore errors when acquiring regulator
Date: Fri, 23 Aug 2024 22:50:35 -0700
Message-ID: <20240824055047.1706392-12-dmitry.torokhov@gmail.com>
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

We should abort probe on any error besides -ENOENT which signifies that
the regulator is not defined in device tree or elsewhere, not only
when we see -EPROBE_DEFER.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index c5b4c85359b4..0d06dda311d4 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -753,7 +753,7 @@ static int zforce_probe(struct i2c_client *client)
 	ts->reg_vdd = devm_regulator_get_optional(&client->dev, "vdd");
 	if (IS_ERR(ts->reg_vdd)) {
 		ret = PTR_ERR(ts->reg_vdd);
-		if (ret == -EPROBE_DEFER)
+		if (ret != -ENOENT)
 			return ret;
 	} else {
 		ret = regulator_enable(ts->reg_vdd);
-- 
2.46.0.295.g3b9ea8a38a-goog


