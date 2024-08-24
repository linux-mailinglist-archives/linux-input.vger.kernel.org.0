Return-Path: <linux-input+bounces-5809-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3595DBFB
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02A8F28402B
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ECD14EC51;
	Sat, 24 Aug 2024 05:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrQNY+JO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD353B182;
	Sat, 24 Aug 2024 05:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478660; cv=none; b=KxB2rxQL9uZOFyjPvkk947uXGcZA60+eABCb7wZnKc4cUPmchZ3emZRU/Ytgiq/i3W/rK9S56xZxlJPJqXMLF/0mNhnQSC4FqpDGvAYc0ijM250G+uVlT138DbSgw9VpB5RRYGsGPejuDc0kOCjmLJA0pCN5KOW4SVW4T7hRo6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478660; c=relaxed/simple;
	bh=LrtWWKEh4GKx8Bxbh2O2jSGkgXnoUQ3ZTvu5p7QkV8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BB8bilE5poH4Abxraut5NPRjr7hMwBuQCISiY6rZwzWqpPP0K/kgcKVEzHt4DqbLCMUfDeppElVVji1jTP2YFDmWg75/qKIxVwtYVapbDbcsXov1z7qmJaOMfF4fppeLMZwI4dosaioDaeaPZWb+vCZI0DzMOV8qpIi1ldcFF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrQNY+JO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20230059241so23086395ad.3;
        Fri, 23 Aug 2024 22:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478658; x=1725083458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSAgrcjoZD7AJdof5h2n0SqHB3C3G8j8Ni3BDUX078E=;
        b=WrQNY+JOs+Kd3/QonyOush2b5V5RSBAwubwV/JenQkgNdZtZhfWXYQkyXC85fo4Vpt
         6Mw03s6j8ujVROdFg/JvU9pKRTzmkhhgx84WLTa3cI0wWvcNkbiUkjAWMJ50KtgWkxqI
         0iM146XF6XmGnVY6+jhjnmEk48s+VC6qsRYkv5+qy7GISb5emzPoWHK/0vvvdIOjHDTH
         Ild89B/+m3rSh7KNQvLjlO8VuvJAhaL+yJMOLXn7BpD/Y8uVK0S8Cu4Ux8GWqL8aUxtM
         jNMvnG8+EZA60TapcX0FHW8shJ0M4Y2nNnWhXoTCCtGupC6csng3q9Fuo7cGZLLg5e4v
         x7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478658; x=1725083458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSAgrcjoZD7AJdof5h2n0SqHB3C3G8j8Ni3BDUX078E=;
        b=P30AZ6bfauu+NkxYFBJYzg2SRhDIVWN016iYjTUoF8zVuuR8uv6IwMLMUzC2M0sXDZ
         db4lIJEvMTGUr7u3DlWcpQJ8+krI4JnHt66mwiANEqQUTmADQDRUxPGIhieTd31WItph
         4bXH1VvRZUw0S7ruMW0Fyh26dtPoG8P4wnNlqg3nPPQuNgS2/zU9qgD9DBxNPvUmRBm6
         P2WRATyYqwf2s5m3WSwb9O481nGc4ZA1SswMjBlh1wH2ZAeDEf93m5E2TUHBfFL6jAf3
         aqLC+iFUU/CS6lOxJAJ1tNs4+fcm5sEt+ChUt0g3jFFYCAMaoXkmxML9OF51UTaKMzO2
         Z7WA==
X-Forwarded-Encrypted: i=1; AJvYcCUBhwadXGFV2BuCWy6bz7oqxAd3+xjSG3FY5NSdwjTrTRly9PTGgTTvwu3ILEP9qz+GROsJ5QMe1qlI0Q==@vger.kernel.org, AJvYcCVnarG+5KfPEDGXVWsjyGkhtco//x0d11STaEZELYoNhAkZLgAoXiRUmckH5Pp2oNFWFMq77FJFaZ69H56M@vger.kernel.org
X-Gm-Message-State: AOJu0YyWzPjaXEmvVOgQIHeNHvNbXGYS0ge78NM4RPZtSZmRh/1GEkmF
	/tO0V63lhHxezgM8jLrWqi4IbLsHo5qm+3nfcClRBPU83quZFAaV
X-Google-Smtp-Source: AGHT+IHqqBlshmRtWi1clh1LkUbUw3h3QKiaChjsx4ZdjfZfI7bB5NtLgY5mG2lv2M4V1wk7Xjni2Q==
X-Received: by 2002:a17:902:e842:b0:1fb:90e1:c8c5 with SMTP id d9443c01a7336-2039e4b5193mr36024105ad.33.1724478657754;
        Fri, 23 Aug 2024 22:50:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:50:57 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Subject: [PATCH 01/18] Input: zforce_ts - use devm_add_action_or_reset()
Date: Fri, 23 Aug 2024 22:50:25 -0700
Message-ID: <20240824055047.1706392-2-dmitry.torokhov@gmail.com>
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

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

If devm_add_action() fails we are explicitly calling the cleanup to free
the resources allocated. Lets use the helper devm_add_action_or_reset()
and return directly in case of error, as we know that the cleanup
function has been already called by the helper if there was any error.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index fdf2d1e770c8..ffbd55c6e1d4 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -803,15 +803,12 @@ static int zforce_probe(struct i2c_client *client)
 		udelay(100);
 	}
 
-	ret = devm_add_action(&client->dev, zforce_reset, ts);
+	ret = devm_add_action_or_reset(&client->dev, zforce_reset, ts);
 	if (ret) {
 		dev_err(&client->dev, "failed to register reset action, %d\n",
 			ret);
 
 		/* hereafter the regulator will be disabled by the action */
-		if (!IS_ERR(ts->reg_vdd))
-			regulator_disable(ts->reg_vdd);
-
 		return ret;
 	}
 
-- 
2.46.0.295.g3b9ea8a38a-goog


