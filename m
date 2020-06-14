Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9F91F872C
	for <lists+linux-input@lfdr.de>; Sun, 14 Jun 2020 07:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgFNF4L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jun 2020 01:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgFNF4L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jun 2020 01:56:11 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B11C03E96F;
        Sat, 13 Jun 2020 22:56:11 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id m81so14486600ioa.1;
        Sat, 13 Jun 2020 22:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HWTtSELZk3B/c/eLDXpjAtutg42doyiLctGP7zQlm7s=;
        b=c5ldnigWSGlAw/OZqVtWDPs1Vf/pl/8HaFmEyJl3Zntwky/chEpqbU5TlTIuCW/vV2
         mkIagLfJ9rwOSQ90odu0i9e7YN8VnKnLXayD2LXCADQr6t8IiaNHLqnyvVgfEUUUWwM7
         3+B9x2oabcOgsv3/TsZV80QjRfBuc8fo7wUohWPwNn/peIIQIbXQbr5aV/HRK4eY1yU8
         gcD2OILCb4EikF8Yci6NP0fGk5uLPnLMw5cCmEGNDJqMQ+XQOt9q3wizw2FMFJlho+OI
         M0XtdBafxNfdeY4riaD7YiKdhuCRk5yqn1OukBWHVRHSKBvSY/G5fg1yJnYwUxa1orEY
         nIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HWTtSELZk3B/c/eLDXpjAtutg42doyiLctGP7zQlm7s=;
        b=eg0mabyfgIgB0CkMUvzP4SlmtTWUMw65WCIy/UJveTsSWPI4yf3eQUOiuEwbwspMtZ
         V2caTXgC4LVJDzvy6Nh8Yjh6N5acThETmPQm8ZmR/NYG/nM4zWR3U7XimChZCJ+ASFpY
         n+SCi3ahilc0b0I0upab+1OAVWL7PlHo9hLGj61kjgFUEWcUlFAjQRZP4o47OBvcqWsA
         +eoCwEh9rE2hl4WaWjbF8sf4jm/ZvkPejEve1Q2kz0oZ6F1p9pJEscmY4F4mdefxo5w0
         yYPr+WPnGIOQ5ZNNFdFUgGgT5aJks2Q3yzcZQCi4wopqvL/5N02Wo7jZTUF3CF2vXYBI
         NeeA==
X-Gm-Message-State: AOAM531+brKCznCm0Wv/9WQxQ305FVAqvL5ErZW4udEx6rEPTwUXaf9p
        XBVP5NZNCGmozsWCSss77tsfmwRCT+8=
X-Google-Smtp-Source: ABdhPJxWvi/DSAfSgti0vxnnlJfddI6wMYfAMBJSHra7Iqkd4mhrUYY2JDo8Shg3F7hv8yYy993w+w==
X-Received: by 2002:a5e:c706:: with SMTP id f6mr21586067iop.186.1592114170290;
        Sat, 13 Jun 2020 22:56:10 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
        by smtp.googlemail.com with ESMTPSA id r17sm5916359ilc.33.2020.06.13.22.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 22:56:09 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu, smccaman@umn.edu
Subject: [PATCH] Input: bma150: fix ref count leak in bma150_open
Date:   Sun, 14 Jun 2020 00:56:02 -0500
Message-Id: <20200614055604.67969-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

in bma150_open, pm_runtime_get_sync is called which
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/input/misc/bma150.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
index a9d984da95f3..e2f1b05fcb2a 100644
--- a/drivers/input/misc/bma150.c
+++ b/drivers/input/misc/bma150.c
@@ -348,7 +348,7 @@ static int bma150_open(struct input_dev *input)
 
 	error = pm_runtime_get_sync(&bma150->client->dev);
 	if (error < 0 && error != -ENOSYS)
-		return error;
+		goto out;
 
 	/*
 	 * See if runtime PM woke up the device. If runtime PM
@@ -357,10 +357,13 @@ static int bma150_open(struct input_dev *input)
 	if (bma150->mode != BMA150_MODE_NORMAL) {
 		error = bma150_set_mode(bma150, BMA150_MODE_NORMAL);
 		if (error)
-			return error;
+			goto out;
 	}
 
 	return 0;
+out:
+	pm_runtime_put(&bma150->client->dev);
+	return error;
 }
 
 static void bma150_close(struct input_dev *input)
-- 
2.17.1

