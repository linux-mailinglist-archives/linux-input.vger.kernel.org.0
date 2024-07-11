Return-Path: <linux-input+bounces-4957-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D296792DF31
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 06:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92AFE1F23742
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 04:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922EA29CF0;
	Thu, 11 Jul 2024 04:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHtlmTCt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A884EB5E;
	Thu, 11 Jul 2024 04:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720673357; cv=none; b=Bu8MUfDet1pSXU5sfj8fdD2TFdROxGz1VLjSOuHikzW5x0wkARqzD8aSbG3wh1G2+spvsCWLIrvi9H+nmGB4W91L8SIJaQ2jjKE+mhGys0vJM4F1IeJIga0n/drjbzI3RbzLYFqduK7HzIYgBBIU3Bb+flOF8cvvuzwKESFBB3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720673357; c=relaxed/simple;
	bh=A+GL+DQ0W3Z8F3zz4hajTGhmESz64sMc4GF/S80BIX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OGh9lzDoMGw5KRLlpANxKHpCnPbZTzG2p/Kiwt2N4n7ezkLwYMPBSkDodVMWCWWg+966bx2K3QE7D8+NvxCLcYzeKKsulr59/ANSc25/SK6U8BWX9pdBF1NwbAJwcb5EGhcJvIMQCAP3bn4ZGViiexAz6ng9ZGmQU5/EbxpkDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHtlmTCt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f9de13d6baso3127265ad.2;
        Wed, 10 Jul 2024 21:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720673355; x=1721278155; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XOZfEW7/Dw1Tb9JRghP+fl+yR0g4HbVp8B1sS6cyzbU=;
        b=XHtlmTCt+FWFc4nfFEbapI4dSvlWF8hy8KxG1IgS1V19VUUeputRlCnmwUm/xKrtb+
         VrACTWK4lg2o13Oj6IZLtnfvLvkrihAoWNuXyYqXV+assq3odzLIq0A8Vx2rgYGsyb3a
         /4l7djMi8KePyZ/vYYMOthNidCO7E8ClDEIIhSE58NImPeFf8k+ERcKnLOpNni1uFF1v
         ufkYl2NdxjPkIstfgNEcM1ZQkaV8dh2nq86s3ma9CEFQJ2bmtxRaZZeIjMHUiLa49FBP
         9F7DIH5/6kGJxFtLAz4bvAW5xDf0aSlNARqFuwGCf5RrAjFc67iF8gHA4w7MaAOHgptD
         Hz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720673355; x=1721278155;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XOZfEW7/Dw1Tb9JRghP+fl+yR0g4HbVp8B1sS6cyzbU=;
        b=lmURdZtLZq+UeusBlcV9wXBwH2UeaKAYTMR7mWGLDlJc7H4I6CxwIz5vAbeTaa+6U3
         bL1Ac3Ruf8Msk2jpVs2VR5+JS/2+OslzRnBPUEQ3mGO1DGgVkGZIuLKj9xXqhkFxarZh
         brMaOz9NZ18a7xtxclgbqjmVIwfFtrfuHrPFMy0YtacVwwp0WwOwsXyL54t5Dh1R2sTJ
         4ocz+Y4pD6EX1Qt9pguaxtnmShdaVQQLbrpQKOXGbrFjdESDViyF5Z279pF1ir42v5PW
         2vBVYS6NxsoKQSYmVmpG+97ACjvPl8QN0UekeZQva+yBLIE0OzBxbU24qvKuIa9PCfqd
         iLPA==
X-Forwarded-Encrypted: i=1; AJvYcCWsJlcTzVhrNNFT9qZn+KSQp8c54vyULwm2k1TahC5JnCvK6fH0MbIZLS9Na2ZtaWQuz/bBzoGJSwNoGsO+ZnQbgh/7pbbcB0ZLAYlF
X-Gm-Message-State: AOJu0YwjiKOlGXHaLcgjung8czsM99tOMWsFjp+ytkGPSMpl28CxDUA3
	W78BRqs628eN04wZzGFEi3REURHf2OGBgZt/6GDf3OSicuW2z5OdPqDEDQ==
X-Google-Smtp-Source: AGHT+IFnm28GG6iqyz3+ZJN67zSmfMgCSoVlz9huNYKcZGGfZNDjBHLYYSE+XgA9NAVYpTf5wabOUg==
X-Received: by 2002:a17:902:e5ce:b0:1f9:f3c6:ed37 with SMTP id d9443c01a7336-1fbb6cd19a0mr61660455ad.14.1720673355049;
        Wed, 10 Jul 2024 21:49:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a0fbe5sm41621925ad.11.2024.07.10.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 21:49:14 -0700 (PDT)
Date: Wed, 10 Jul 2024 21:49:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Nick Dyer <nick@shmanahar.org>, Greg KH <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: atmel_mxt_ts - use driver core to instantiate device
 attributes
Message-ID: <Zo9kSFeGOZB9b3rq@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Instead of manually creating driver-specific device attributes,
set struct driver->dev_groups pointer to have the driver core
do it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 8a606bd441ae..cfc92157701f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3069,9 +3069,7 @@ static struct attribute *mxt_attrs[] = {
 	NULL
 };
 
-static const struct attribute_group mxt_attr_group = {
-	.attrs = mxt_attrs,
-};
+ATTRIBUTE_GROUPS(mxt);
 
 static void mxt_start(struct mxt_data *data)
 {
@@ -3348,18 +3346,8 @@ static int mxt_probe(struct i2c_client *client)
 	if (error)
 		goto err_disable_regulators;
 
-	error = sysfs_create_group(&client->dev.kobj, &mxt_attr_group);
-	if (error) {
-		dev_err(&client->dev, "Failure %d creating sysfs group\n",
-			error);
-		goto err_free_object;
-	}
-
 	return 0;
 
-err_free_object:
-	mxt_free_input_device(data);
-	mxt_free_object_table(data);
 err_disable_regulators:
 	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
 			       data->regulators);
@@ -3371,7 +3359,6 @@ static void mxt_remove(struct i2c_client *client)
 	struct mxt_data *data = i2c_get_clientdata(client);
 
 	disable_irq(data->irq);
-	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
@@ -3455,6 +3442,7 @@ MODULE_DEVICE_TABLE(i2c, mxt_id);
 static struct i2c_driver mxt_driver = {
 	.driver = {
 		.name	= "atmel_mxt_ts",
+		.dev_groups = mxt_groups,
 		.of_match_table = mxt_of_match,
 		.acpi_match_table = ACPI_PTR(mxt_acpi_id),
 		.pm	= pm_sleep_ptr(&mxt_pm_ops),
-- 
2.45.2.803.g4e1b14247a-goog


-- 
Dmitry

