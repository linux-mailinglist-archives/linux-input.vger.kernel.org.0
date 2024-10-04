Return-Path: <linux-input+bounces-7082-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86134990550
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 16:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 200831F226CC
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 14:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165DE2141A1;
	Fri,  4 Oct 2024 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9bnCF9b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16001D365A;
	Fri,  4 Oct 2024 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050834; cv=none; b=h5mGynEVFmiuyuTFdTOSXlE43KD4DdhCpW0sIA3hacFPgOtgqKDCeAuHgIJs+2fD/6bR61A2+0F+vINeuVOckqRkE3u+eMUXarpMUqmkCoA3+jhFNEGBbmIugFVqLSjkMtRxy1dF2Wfet5bIMv9z7tDUl5mdNzf9R7E0++/JXGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050834; c=relaxed/simple;
	bh=rr76t+eNUFUu22tXb5MX5QD++j2YLcuNv+jV/Zy6IE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SVPZ/X7eDDfSZRyQL6BTEqZj6kX8P3ChjSAt+britrgBf/s7RkLpTeO2zO1zh/3tCWd4jTgNWGAseJrDkRfHWRw4UzlqI6aFWSWdALzhPr9W2InFBVuVa6gAo/7EMbzq/CdlR2YuIiU9pfnSsfMgJMIHiL7SpGUlC4LLvm5RrJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9bnCF9b; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71b8d10e9b3so1664392b3a.3;
        Fri, 04 Oct 2024 07:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728050832; x=1728655632; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cCrO2ENXGB+obQ8ppHzPkSfNMb0RVRrSN6ueUlMlRkE=;
        b=j9bnCF9bVaqggkgNCjrPhFGcsIQ2wsqxILTfCoVdQ4uHZKPTt5/HfBOHheQfODHfXT
         jj2cDAN+Xij+RRK0GlUSChyYAgWki74pOxDYVZSj/OwOFs3MS2QSQKNzOcSVJP26nYc8
         JmU+OGCqOCsdocaug+D0py2DmMTg/Paprj2twZZXxnf1QUDCXa8Nz6dJNdw57ueA3dYa
         FXbGENh8Ao/fj9e71ERdz3QkyB7p+fhozssRJjl5StgvoR/NlDBCOfgZgsLGUTdtjGRJ
         zNHAKAqAR0tltSs+MV8IWgUEHolXcvvy4t956ROVeaG/sw6EUXNa22S9ExgvfBK+9gv0
         1z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728050832; x=1728655632;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCrO2ENXGB+obQ8ppHzPkSfNMb0RVRrSN6ueUlMlRkE=;
        b=UEm93BVYfgbxeZboIXOygvtRXeYUIaJj0GEKNI2JlxeOnXMHfUWihOhyxsIFiLCzbJ
         8XUh5UK3N8CiZzKUWzxiD0EM6GBD+YKn0DdedkvP3m404TMLC9n9peTM0wxtjwvUeDog
         pj0moi/dM30eTipxDGfJNaWTuJpLLHiJaSyYAQeLlX8pgsL7k/3aHcjjpVLw8i0qQTZ0
         4KVqLXXMkHULe9gw77LAG/dT6YdeWRwFZgopjV/OvdvgcJpIDaPz4IiQo1d5gSRWRTcR
         jJRVUOBjFmY8RzyDf5Ll2jL8jWeKelkPj/xQ6T8rPG1jj/E2yKMg67281vxrMmYC0DRy
         p2dA==
X-Forwarded-Encrypted: i=1; AJvYcCVKf0TE6Y2XEdz3NQiS8N2fH0ZmU9WO8ZZNROjCAn6mNxpCM5BOXI6kXz9tS3JaLtrJeS8Nr1V2pXzT35jD@vger.kernel.org, AJvYcCXOk3IMGImDBinv8T4kTWVAat0jm9mB7k6YkhW3fhV9Vep11zoEu29gP1QU0I2R1a3ui62deo3sQEt5Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr3xJKEFaaSqk2up9kxF7qKxWvxgKXSWV6hk6nwxixjGarVJU1
	hpjN4zoSlo37esVtAwO085bd+vhGfdye95E4gOuSKoqq2tnS7RNGb1LiZ4Al
X-Google-Smtp-Source: AGHT+IHrf7BKXWDRmVPpd9hRJMmRKjPvLv+YOwYBaIHsB0oterAf1OB7S4lryeDYv456lAWVsOcd3A==
X-Received: by 2002:a05:6a00:23d4:b0:714:1bd8:35f7 with SMTP id d2e1a72fcca58-71de23e8e45mr4349226b3a.15.1728050831799;
        Fri, 04 Oct 2024 07:07:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1b2:add:2542:c298])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dedcdb3d7sm662238b3a.26.2024.10.04.07.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:07:11 -0700 (PDT)
Date: Fri, 4 Oct 2024 07:07:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Nuno Sa <nuno.sa@analog.com>
Cc: Utsav Agarwal <utsav.agarwal@analog.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: adp5588-keys - do not try to disable interrupt 0
Message-ID: <Zv_2jEMYSWDw2gKs@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit dc748812fca0 ("Input: adp5588-keys - add support for pure gpio")
made having interrupt line optional for the device, however it neglected
to update suspend and resume handlers that try to disable interrupts
for the duration of suspend.

Fix this by checking if interrupt number assigned to the i2c device is
not 0 before trying to disable or reenable it.

Fixes: dc748812fca0 ("Input: adp5588-keys - add support for pure gpio")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/adp5588-keys.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index d25d63a807f2..dc734974ce06 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -822,7 +822,8 @@ static int adp5588_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
-	disable_irq(client->irq);
+	if (client->irq)
+		disable_irq(client->irq);
 
 	return 0;
 }
@@ -831,7 +832,8 @@ static int adp5588_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
-	enable_irq(client->irq);
+	if (client->irq)
+		enable_irq(client->irq);
 
 	return 0;
 }
-- 
2.47.0.rc0.187.ge670bccf7e-goog


-- 
Dmitry

