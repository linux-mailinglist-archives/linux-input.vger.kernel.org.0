Return-Path: <linux-input+bounces-7550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF99A4A6F
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 02:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D46281FC0
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 00:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CDD17FD;
	Sat, 19 Oct 2024 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXFphR7a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3836D;
	Sat, 19 Oct 2024 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729297074; cv=none; b=r76xVYF6OVw5ZMBRULUVyYyQsQlg0AY/W7DB9ynItbLHmNavlczR8AhUfuAVd7+i8vKC94l9LGJbtnU8UiIg5fWFfrv1a/4GbaiwnehzEGj/8Dwb/5v/ZUzpxcQGFEVI4sdIxksjQaqDawtQRFJbsrka39GgrGntrkzHM8LQXJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729297074; c=relaxed/simple;
	bh=tlY43JdjyV9axML2Cr8ljY1YNibBQDW552pvjjR2y2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UIrWXXQBKMrvB8J2qsOU3oO4+QsyZURzeN1oFvmp9BJJVQR/YCM44foB3Jr0noZYAmXG6u53NqaLunrJli2Wc7tVFMapq1UnJa8jNETgfbpzLq/ZcbJhfZqKMCuWKTwOsuTPeEHr4S0i/nL+v7gQx2uI0/20yDXGSQ3lyUabK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXFphR7a; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e7086c231so2042971b3a.0;
        Fri, 18 Oct 2024 17:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729297072; x=1729901872; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7RF0iiaJKXm5pkfZ7lhDtquCyKsXt73L2NkYBEIh1M=;
        b=HXFphR7aRD954bE0UvSxQ1QG6ZKJRnXvENZwftxNk5HPpm23Xqfwkn4DDu0kPOOUbB
         qdcDA5v4fyyNxeasorBXMES/lNTYgAHiyfIzY4lsRz/ts1VvQKb8ziYJUWVsPTQmgNdr
         znCxsjIincSpf9RtCCSNa6ZPYD6AJIF2NAJjH7Vy1R2GCBhHeEx7VKP9SlImBnkxNoWW
         Iv7uBAxsy16UBL1/5VUhfEUaWO1kDhFyIQlz5DZqRGV6o/w6ZV5Re8rMnQT5elm8dzhF
         ETJ+Rfvkmoz/6iMsnqZw2is0svtKgpYqTVhvZCkJDR3cFb1r9r2Vj1xp+5L3AVrLXmXh
         6I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729297072; x=1729901872;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7RF0iiaJKXm5pkfZ7lhDtquCyKsXt73L2NkYBEIh1M=;
        b=SHba4r47BUjZv1a90Rc774psb8/DT+sJ+qfjOX4HRQzn7C46a7DtwF2eUqeVqXlfOQ
         3nh55xuzz7ivUds7AxzVTjOnKilvluls1Tr7DZYt5C/rH2xl8NTTxzmyPAAKwszckf/K
         FBnaFJGjiNsSDeD5dQz7B1Wnju0d7QHNmHhfu6/yk46Skz896XG+iUo8kik07i2WIOCp
         6dN1W1R56QMZVIs+ow/vGpEpJldksraagg9i3PD8PshuBZ/y01LNaMXe1O59pq12tJsy
         8x91qaEa4CdZohL6l0bFQfJ++DnAbAsj5hfYsCk0D5J5NT+jkFajgLBey7IG+7+smSb7
         G6uw==
X-Forwarded-Encrypted: i=1; AJvYcCWrnGx/tcvW/df6v0GWwfeHa7XSYLLP9q64UGlukCVm+dWNEY9igOhJnYz6+cX6xpV6GvWbL+FVIu6MVNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuj7Rzm7GKVyHLyx4I9btKo59KbsSahhoxawtZOecW/0ies1Q2
	nu4DBARvaEwTD5GqorHMB6Ka+qDoHy8YmeGYmzRdHoXfHao0iUIXw6lPkg==
X-Google-Smtp-Source: AGHT+IGKFwEzolzTkzQOBaAfATzsSX0XJ+paTA5NvABrHpfnr6bFHD3In7H+gx+VOiga6XQgDzEFgQ==
X-Received: by 2002:a05:6a00:1954:b0:71e:6c65:e7c8 with SMTP id d2e1a72fcca58-71ea33542b8mr5895410b3a.23.1729297071497;
        Fri, 18 Oct 2024 17:17:51 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:351c:e27f:10e5:484c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea33ffccasm2075771b3a.132.2024.10.18.17.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 17:17:50 -0700 (PDT)
Date: Fri, 18 Oct 2024 17:17:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Oliver Graute <oliver.graute@kococonnector.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Felix Kaechele <felix@kaechele.ca>,
	Andreas Kemnade <andreas@kemnade.info>,
	Li Zetao <lizetao1@huawei.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: edt-ft5x06 - fix regmap leak when probe fails
Message-ID: <ZxL6rIlVlgsAu-Jv@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The driver neglects to free the instance of I2C regmap constructed at
the beginning of the edt_ft5x06_ts_probe() method when probe fails.
Additionally edt_ft5x06_ts_remove() is freeing the regmap too early,
before the rest of the device resources that are managed by devm are
released.

Fix this by installing a custom devm action that will ensure that the
regmap is released at the right time during normal teardown as well as
in case of probe failure.

Note that devm_regmap_init_i2c() could not be used because the driver
may replace the original regmap with a regmap specific for M06 devices
in the middle of the probe, and using devm_regmap_init_i2c() would
result in releasing the M06 regmap too early.

Reported-by: Li Zetao <lizetao1@huawei.com>
Fixes: 9dfd9708ffba ("Input: edt-ft5x06 - convert to use regmap API")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index ed9b71c11f71..2f4d66957969 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1096,6 +1096,14 @@ static void edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 	}
 }
 
+static void edt_ft5x06_exit_regmap(void *arg)
+{
+	struct edt_ft5x06_ts_data *data = arg;
+
+	if (!IS_ERR_OR_NULL(data->regmap))
+		regmap_exit(data->regmap);
+}
+
 static void edt_ft5x06_disable_regulators(void *arg)
 {
 	struct edt_ft5x06_ts_data *data = arg;
@@ -1129,6 +1137,16 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 		return PTR_ERR(tsdata->regmap);
 	}
 
+	/*
+	 * We are not using devm_regmap_init_i2c() and instead install a
+	 * custom action because we may replace regmap with M06-specific one
+	 * and we need to make sure that it will not be released too early.
+	 */
+	error = devm_add_action_or_reset(&client->dev, edt_ft5x06_exit_regmap,
+					 tsdata);
+	if (error)
+		return error;
+
 	chip_data = device_get_match_data(&client->dev);
 	if (!chip_data)
 		chip_data = (const struct edt_i2c_chip_data *)id->driver_data;
@@ -1322,7 +1340,6 @@ static void edt_ft5x06_ts_remove(struct i2c_client *client)
 	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
 
 	edt_ft5x06_ts_teardown_debugfs(tsdata);
-	regmap_exit(tsdata->regmap);
 }
 
 static int edt_ft5x06_ts_suspend(struct device *dev)
-- 
2.47.0.rc1.288.g06298d1525-goog


-- 
Dmitry

