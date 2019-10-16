Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 680C1D9590
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 17:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392996AbfJPP3U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Oct 2019 11:29:20 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34603 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391940AbfJPP3T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Oct 2019 11:29:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id y135so4936695wmc.1;
        Wed, 16 Oct 2019 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S/1dqToA8XGpZkcCxFWkcVVyKMmf6kZjWcs4ANWYCn4=;
        b=am4nu+nn4TwbCTLJcWb+upIfcpLvxM3QDO8JXWvqQJ+rW+TW2wBvxPphmPfkl/4Y3f
         gELAl25n0/pCO2Aw5wNzaAeSqBJEZp22CTLHX4N6TshM8R2HjrTFzbAzRUAcCXWPUw4v
         Er6zKKpBxCOdL1cP/jLPfQ08wBYAMZfgZk6MLNQsKM1X2G44OyjAqUo9pK0GxqvEX2Mq
         YPu6hJ4BGbLJIooWvAvFBW1ClbNU44bI7DezWq4UjuDGYm8dvJmaFkrLy6X19NdlVn9o
         99x4qgJc5ZDTdwWdOZVfuYnDOm/cBqaMtLbMCCwaVXhnCrasXQGafYRZh8m/M30ff3m7
         E/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S/1dqToA8XGpZkcCxFWkcVVyKMmf6kZjWcs4ANWYCn4=;
        b=lWPi4zyij/a3u3WxHmGD2u7bHbDv9w2fC4ASZwX6V1D77fWmma9KVs3cMtOV2J5dJ7
         ga5nKs6yBxYiZkdK8LApO0MWAR3+a7krwAQzi52EUM/RMmCI3tRPmc32YJqyz+m/1WsT
         /uZgDf89IJFfr9PqzdWYWaBuBfhKL5uQ7IgttWKWXTQnG9MQrG8ZJOxRNURNWaCSI25Q
         aDylsuHmiaTPxEA0sUzqGyzZMUNQv4EAqCCRqjj6YcmEFw7bI9qC3pIWpxjLm8rAUzrN
         DPkW0uafR3iqBC4wPJtZ/lyPndwLi/h1KomsJvOoQwXkGLXZrz8aXbX95JaSE0OWWt+C
         3e4Q==
X-Gm-Message-State: APjAAAWlgK5biwqJZnw2eRngG8sTgeNCfJAxZdYkdEnQeS2D+uvtgfPH
        mxdGtASa9ekOFIpKYwCAZS4=
X-Google-Smtp-Source: APXvYqw6EqT4M2clgLs8xjijQWocikRiSu7tOxNCKc20QmyqCO5u/WZHZnWR3u8dDHrm5IvLWAaeIA==
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr3879322wme.45.1571239757635;
        Wed, 16 Oct 2019 08:29:17 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id f18sm2959763wmh.43.2019.10.16.08.29.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 08:29:16 -0700 (PDT)
Date:   Wed, 16 Oct 2019 16:29:14 +0100
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Yue Haibing <yuehaibing@huawei.com>
Cc:     dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: walkera0701 - Fix possible NULL pointer
 dereference in walkera0701_detach
Message-ID: <20191016152914.ubzaluipboeku5zz@debian>
References: <20190423145637.35004-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bvhtikaycjjwg76b"
Content-Disposition: inline
In-Reply-To: <20190423145637.35004-1-yuehaibing@huawei.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--bvhtikaycjjwg76b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 23, 2019 at 10:56:37PM +0800, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
> 
> KASAN report this:

<snip>

>  
>  static void walkera0701_detach(struct parport *port)
>  {
>  	struct walkera_dev *w = &w_dev;
>  
> -	if (!w->pardevice || w->parport->number != port->number)
> +	if (!w->parport)

It doesn't look correct. This way the detach function will never know the
port number to which it is attached, and as a result it will try to do
detach() with all the ports in the system.
Please check the attached patch and maybe (if possible) ask Hulk Robot
to verify if it fixes the problem.

--
Regards
Sudip

--bvhtikaycjjwg76b
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-Input-walkera0701-Fix-possible-NULL-pointer-derefere.patch"

From 0338a89a873e7df57707852402f90bb0d6626f12 Mon Sep 17 00:00:00 2001
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 16 Oct 2019 16:08:43 +0100
Subject: [PATCH] Input: walkera0701 - Fix possible NULL pointer dereference

If walkera0701_attach() fails and input_dev is made NULL then we are
unregistering the pardevice but it still has the pointer to the dev
which has now been released. And as a result in the walkera0701_detach()
it will now try to do input_unregister_device() with a NULL pointer.
We should mark the pardevice as NULL when it is unregistered.

Reported-by: Hulk Robot <hulkci@huawei.com>
Reported-by: Yue Haibing <yuehaibing@huawei.com>
Fixes: 221bcb24c653 ("Input: walkera0701 - use parallel port device model")
Cc: stable@vger.kernel.org # v4.4+
Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/input/joystick/walkera0701.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/walkera0701.c b/drivers/input/joystick/walkera0701.c
index 56abc8c6c763..d8ae1329bf00 100644
--- a/drivers/input/joystick/walkera0701.c
+++ b/drivers/input/joystick/walkera0701.c
@@ -275,6 +275,7 @@ static void walkera0701_attach(struct parport *pp)
 	input_free_device(w->input_dev);
 err_unregister_device:
 	parport_unregister_device(w->pardevice);
+	w->pardevice = NULL;
 }
 
 static void walkera0701_detach(struct parport *port)
-- 
2.11.0


--bvhtikaycjjwg76b--
