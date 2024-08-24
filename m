Return-Path: <linux-input+bounces-5822-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0595DC16
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53D7E1C21742
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F8F17B4E5;
	Sat, 24 Aug 2024 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwz02THN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C74178CCA;
	Sat, 24 Aug 2024 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478670; cv=none; b=PiqGB3wkP4vPNss3ANmLGiuDP2rT8bJ5hLUemZpwl4XcmYvZem2EpQZGOOGwB8uh/hTUdGVrp0UI+Yalr+7gaJPJGwPN2WeNRTpvZbL2DwiuJJY69E/Jf+QBTy7PHq63GvpvxV+RAngHFELruZwp34J05msu2TxfWBhRR57497Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478670; c=relaxed/simple;
	bh=Rx6QObzW2tAkW8bZrjVRp7zSZg/oSBN82GNXbmEw5Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9n6o3gMwnV9LCYMuAVHT9sqspfnwgWP8oIGvYE4c75VnKGDPlrJCdA32jSA53cLGIx1hCEt7lUcNUY13Febj/YsD9FgdoCwZXhzhSnnXf5QbCuYo1207hNgFElaU2aPdwSq+4KxJmYWYL/PfH9zZCQNdZxYFkJHT5lzLCQPF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iwz02THN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-202376301e6so20829055ad.0;
        Fri, 23 Aug 2024 22:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478669; x=1725083469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsVMpTzQ0nHDzO6GBbmNnexPMjHwrZ6KxVxvGiXfL88=;
        b=Iwz02THNeP+n+sPs98481jD/IX0LkOucMfZyTr2/hXPlyHY9/7hgcHHhYmahXgCmTS
         bKBOmrI1QtYOertF7TDpJtRFY8HdciTkrDihIZNHsx+qL186Rn5OGJx6vci7+2gXh1gV
         hzqq1mnYtuZKVWnuQErONAWXY/D0CtGW+Q/+TmNKB9xY5P8HKWvOuTCYL5UGnWa5EZXO
         dAgZ7DovSbW78KvOrPhvf+Ew6tCSe9BFZk/YFvpUmb8XaIEJMpvoNIwOpUJfc1C8CdsF
         JwUZNSFdfX3ZFaknvjqusZ8o2IPUMatyfPJgaCbfNYlvYd+lRY0gziiicGnTOO/uXWjE
         5Sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478669; x=1725083469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsVMpTzQ0nHDzO6GBbmNnexPMjHwrZ6KxVxvGiXfL88=;
        b=aGtnO5Nv8MDAFT9Yd8Yefq8xtZfvITNTuh/SXg9gfLanfGwJRBzSV9wsTwWTk91kHS
         7o/LLdfvwXJ9oZ1FUHALVX/37hDVf7RO+dKRs2emkKEXPdilzs5L+cPMQdx4e0VYYaAI
         zzxvqM8mU7nUDm9l+yRVm1Im0w7unOAfCHkz0dNWRHK2nFuZbdDyLqEv23qvr6yR0sH/
         OTjxqStihwTO7STOEaY17vGZsZUA+ruEvHPm7BAoxfrZ6WyTmVxDV2ia6SMT/fgL4ggs
         h/YQ9Gh6ckIYfWDlrAfZCWGfwFn4JpwLwrrsRsnP6e+lxnUYRKaOhktPCRp+eu5CAtrX
         WGIw==
X-Forwarded-Encrypted: i=1; AJvYcCXV8URWni3jj8uXlSPDf0cxc6oatvVzYR8RodowQ3KSPFJgxCqbJB/WVPRpwygINF/TYlcSsVADsEnM8w==@vger.kernel.org, AJvYcCXnY0pWafJitM1CHItK/8QUyXoZ8Z04VD95q+04MYawuBGV3Fd2unlm6xuFKjWkrWUijJpGDJSG4OnJC5da@vger.kernel.org
X-Gm-Message-State: AOJu0YwKhVamYjdp5x+VwKjCKtTmQjeZvNvQIJ2TZBXAvEzwLx2EzRVn
	lMF8UVjycS9IH1CoKgce26CcgPyjz/+Yik/cJJK+x5iQxntQT3h+uIGVIg==
X-Google-Smtp-Source: AGHT+IFXBzMNq+Ocava/aFz53RhCxsfyIjsAXiFbUNUr+xPisSPAxbfWAS6HCUgLP0BnmBblqtFgdw==
X-Received: by 2002:a17:903:2444:b0:202:38ea:f60c with SMTP id d9443c01a7336-2039e44f0b7mr58067975ad.5.1724478668533;
        Fri, 23 Aug 2024 22:51:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/18] Input: zforce_ts - stop treating VDD regulator as optional
Date: Fri, 23 Aug 2024 22:50:38 -0700
Message-ID: <20240824055047.1706392-15-dmitry.torokhov@gmail.com>
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

This regulator is not optional from the controller point of view,
so stop treating it as such. For hard-wired designs that omit the
regulator from their device trees regulator subsystem will create
a dummy instance.

This may introduce unnecessary delay of 100us in case of dummy
regulator, but if it is important the driver should be marked as
using asynchronous probing to avoid even longer delays waiting for
the command completions.

Also use usleep_range() instead of udelay() to avoid spinning.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 28 +++++++++++++--------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 2ae079db8884..c6b506a01b2a 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -742,23 +742,21 @@ static int zforce_probe(struct i2c_client *client)
 					     "failed to request reset GPIO\n");
 	}
 
-	ts->reg_vdd = devm_regulator_get_optional(&client->dev, "vdd");
+	ts->reg_vdd = devm_regulator_get(&client->dev, "vdd");
 	error = PTR_ERR_OR_ZERO(ts->gpio_rst);
-	if (error) {
-		if (error != -ENOENT)
-			return dev_err_probe(&client->dev, error,
-					     "failed to request vdd supply\n");
-	} else {
-		error = regulator_enable(ts->reg_vdd);
-		if (error)
-			return error;
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "failed to request vdd supply\n");
 
-		/*
-		 * according to datasheet add 100us grace time after regular
-		 * regulator enable delay.
-		 */
-		udelay(100);
-	}
+	error = regulator_enable(ts->reg_vdd);
+	if (error)
+		return error;
+
+	/*
+	 * According to datasheet add 100us grace time after regular
+	 * regulator enable delay.
+	 */
+	usleep_range(100, 200);
 
 	error = devm_add_action_or_reset(&client->dev, zforce_reset, ts);
 	if (error)
-- 
2.46.0.295.g3b9ea8a38a-goog


