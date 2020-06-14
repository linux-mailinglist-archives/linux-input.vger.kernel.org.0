Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0141D1F8728
	for <lists+linux-input@lfdr.de>; Sun, 14 Jun 2020 07:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgFNFwQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jun 2020 01:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgFNFwQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jun 2020 01:52:16 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41965C03E96F;
        Sat, 13 Jun 2020 22:52:16 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id t9so14452645ioj.13;
        Sat, 13 Jun 2020 22:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DrRx8Zqr7BVJdF/cPBdEuNzCrZbPY6/lXdY8DcQfBd0=;
        b=gHJcDHokOuZmGsg5abwkL5iIohsrcNbRBJaoLak+UNIbjeBv64Lo7aFTWoLm0kqyS5
         7O5vfIzn7My8JRAaTRwzwmkjBRSVDXgr09mA8IuuYj4vPgWuhw/LXX3k7cheOXDTfWxj
         z8CnWXYi5Hsqcqsfl4JEczOAu10P5ojxMm5uXn8tQaGBzga9ZlE0YPml/KORZAnKPkjI
         AZRkpmZsnpxByEZXFv7aLHPLu6ax3q5IRyr5dIF9/U/w8AmN/V9ZIEn11jXBiTuHM0Us
         zKNAYfF4Jl073ZsW/NirPVZ/HzHb458j5HcS0LfP/NNAHu7nrhgb1WAZ1mAhyu6QeFUa
         neSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DrRx8Zqr7BVJdF/cPBdEuNzCrZbPY6/lXdY8DcQfBd0=;
        b=fOHkVxjMW9wvd/mYI1mj0IyxA+YOMKccrJ6C5JQaVKaS8CkHYo5Cvh1KVtxbF0fB6N
         KF7dmCNcdbiUgwas0z8JHu7+hw86VASU7yGTvhtwTBE+UpjD5h7dBZxWlF0FhKWvUOm4
         jnKXJXNJBafAU+L0/r/hIvMuZ7S8Rl0zp0nCsfjk8NInALxV9dZ+SWmOLgJAeMjLfOnV
         gmIIYSKuupAUJPF+EWYi0PvZm3+9/3mMOaTrfmyoHAAMCipIh3OraOGmOghl3dn2nqTY
         1xDknTVzUxJxMkzBUV6gorsuVGRIyDLJRyLD7XITsYE96+w0nmYTjHe30YPncckGZhKy
         UsZg==
X-Gm-Message-State: AOAM531YvJ5xq7E+txReUDRoJ8OlTQN5aLf8hm9yFpRvKGzPaSmdZ34v
        AAf30Vn4/6taNSxErDPlRI/NasUM
X-Google-Smtp-Source: ABdhPJwJtaIxmPQUl4KOSBjiOtloCbM9S8kwpMw+evLIx92Lrhn4c9Q1B/8LYohocQRTlo/TDt81BA==
X-Received: by 2002:a05:6638:101c:: with SMTP id r28mr16361556jab.84.1592113935503;
        Sat, 13 Jun 2020 22:52:15 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
        by smtp.googlemail.com with ESMTPSA id v11sm5864945ile.61.2020.06.13.22.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 22:52:15 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu, smccaman@umn.edu
Subject: [PATCH] Input: omap4-keypad: fix ref count leak if pm_runtime_get_sync fails
Date:   Sun, 14 Jun 2020 00:52:07 -0500
Message-Id: <20200614055208.86350-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

calling pm_runtime_get_sync increments the counter even in case of
failure, leading to incorrect ref count. In case of failure, decrement
the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/input/keyboard/omap4-keypad.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index 94c94d7f5155..35ac788d9fa0 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -280,7 +280,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	error = pm_runtime_get_sync(&pdev->dev);
 	if (error) {
 		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
-		goto err_unmap;
+		goto err_pm_put_sync;
 	}
 	rev = __raw_readl(keypad_data->base + OMAP4_KBD_REVISION);
 	rev &= 0x03 << 30;
@@ -372,7 +372,6 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	input_free_device(input_dev);
 err_pm_put_sync:
 	pm_runtime_put_sync(&pdev->dev);
-err_unmap:
 	iounmap(keypad_data->base);
 err_release_mem:
 	release_mem_region(res->start, resource_size(res));
-- 
2.17.1

