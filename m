Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BF82DDEBD
	for <lists+linux-input@lfdr.de>; Fri, 18 Dec 2020 07:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732720AbgLRGvG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Dec 2020 01:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgLRGvF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Dec 2020 01:51:05 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD610C0617A7;
        Thu, 17 Dec 2020 22:50:25 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n16so761133pgm.0;
        Thu, 17 Dec 2020 22:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=b4kCDwFWNF5hPUlvRHjYLakA1FMegus+Nk7UxmXikCA=;
        b=Rj8Fx0pjuCn05N0wUNH6bS4OEJsHawUv5HtAL5CbCob/eqJ384TGNADaH2oN2CIWXC
         9V2Gn0gbbKdHRicEk1jjDSQ1ecehUWs6FefcEr5FvIVXzZtLbQyk8tX5q6430PiCSk+d
         F6gmnfiE/coPmAhOO25mOfzjyjuNBAirCtjBUxIIz9W9PSjfud1x4jfUyBFsgjzaIGZ8
         yiVJfDKnzG3ffzsQuTQe5yB6CnqQBsVxQZvZ9+p4GOzhN5GqPObfL9XkJXBHkH9Ic6jk
         Flk3AKGC/taSYM9preiHGL4s0LQ6MJEWrOhMS07ZdQRGyDQpZzUxSg8z1/eJoC0TNtbl
         B2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=b4kCDwFWNF5hPUlvRHjYLakA1FMegus+Nk7UxmXikCA=;
        b=QNibmlOEisXo+cYY4Qt8aQ5mt+4VaPMUy2cXiaQd9Bl8Uar5iQiO+2VD88gEfFG5zT
         L9TTzAv9DcaGLkOK0It9D2o/nmNGzDBHz/WqsLenXLNANlLjmttd/EloUEVHtd9lhIZe
         9vVtucbZnvjziE5wCwzCw7s+Q4OAPMN3H6Vi+E7pCl9cank/KEUpCJ6+5/Nmy59GGQ3O
         XS6A+NDlrO6rzelrBzKDUMcUmL2YCb1KvmRfZO7JsIQGMc1TLdPly4KzEztOyTK7GLJ5
         C1ZR34+ui3BA6fje9FQL1rAOj7jB3SkEinLylmVDxo8vQpPiHCymMOT702mszHUVAfRV
         wijw==
X-Gm-Message-State: AOAM532daqqqAxwxHt4vm+LROHL8vY4ka7n0fGf/J9osdoKjt+g5C5uU
        puxHl32i7UdgLoQysJVkG3BoWN3aEXE=
X-Google-Smtp-Source: ABdhPJzj06f5M+uabAAmqT3gYZwpe05f8lxua6Gqisvqffqd10ddzuyjJ268CLSy/lhAsYPyQ2PZzg==
X-Received: by 2002:a63:2f05:: with SMTP id v5mr2885864pgv.3.1608274224975;
        Thu, 17 Dec 2020 22:50:24 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id r14sm1597070pgi.27.2020.12.17.22.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 22:50:24 -0800 (PST)
Date:   Thu, 17 Dec 2020 22:50:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Roy Im <roy.im.opensource@diasemi.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: da7280 - protect OF match table with CONFIG_OF
Message-ID: <X9xRLVPt9eBi0CT6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The OF match table is only used when OF is enabled.

Fixes: cd3f609823a5 ("Input: new da7280 haptic driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/da7280.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index 2f698a8c1d65..b08610d6e575 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -1300,11 +1300,13 @@ static int __maybe_unused da7280_resume(struct device *dev)
 	return retval;
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id da7280_of_match[] = {
 	{ .compatible = "dlg,da7280", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, da7280_of_match);
+#endif
 
 static const struct i2c_device_id da7280_i2c_id[] = {
 	{ "da7280", },
-- 
2.29.2.729.g45daf8777d-goog


-- 
Dmitry
