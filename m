Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E25C2DB365
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 19:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgLOSNX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Dec 2020 13:13:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727655AbgLOSNU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Dec 2020 13:13:20 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6A7C06179C;
        Tue, 15 Dec 2020 10:12:39 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id n3so285287pjm.1;
        Tue, 15 Dec 2020 10:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=WQapZIoz6pQlYWlJ8bxYqKs2bC0a07eICFhrlfIpXYs=;
        b=uU5/faAi3balQ222wBULAQQnmY1RyQwzOaqZ/ViZy4F8NaqRJWUxINaEmG4V2klTw2
         NF2q8e2QYBqC+S8SOR7K/abzH4YxjHVopYcLDe21zB21LWTq7VCbTavBH89RLvBXcXNw
         ukIAUr2SZXx8Pi9olVE8tCdEKu+wOfssCsQ5oqhURE4rhDnk86grm4GfmaK2kfL+dqfa
         4uu9ex/MmPYjiX/FLUCkMn84YTavbjueX3ClRqcYE79HR3HPXJgCPcM9az+DaRzFd6qB
         TTOwHUwbsfeq4r2NST/Oxp2kOO/pWJ8Vbnm4JOH4ssf6je3HiXbxY1nA/jrm2wiQmwzo
         Wz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=WQapZIoz6pQlYWlJ8bxYqKs2bC0a07eICFhrlfIpXYs=;
        b=aDu+wVzrpo9VJwn5LuGfvzu4cjL78QGpLzeCOAbLwyaJgpNlM+ERIiZRZy0BOWjHVa
         KmjinJyL1jHTIkT79WTCG/kWOq23psuYks2ZcSgf+7i5gtrK81waRswPwjD8XWYx9unx
         tayDKb4nIvNji0AiXNcv4sA75UXZJgPQIxgTRmq8siC4bfJ3hvbqxU3wHKOFLaFzwB88
         erZpMEfhPlWUthTtg47J2lZBqvUPkVdVQjuiBYvbDCrFsvOvej67IRexbP0olNW72BzP
         eK6GFUs6VugCdsFORA6M8EBovW78PvpgdAvfNre8Gwew2WbXsikOWmOEz+uzd58jVTDe
         z6fw==
X-Gm-Message-State: AOAM533e2ozS7SpZgsteoOmQSxY7Rj4dgdCevwU2IAhIIkOoAhJbKF2K
        kMHDQmXOr9mcp8AaH+IKhYw=
X-Google-Smtp-Source: ABdhPJwD1h5ZLQfjouy+Har5VJ1CdOVn0wSHC2eyvc6BxrXgzdx3pZ4or7NCmW8xq5suv9Nkp0RSqQ==
X-Received: by 2002:a17:902:eb54:b029:da:29d7:cffd with SMTP id i20-20020a170902eb54b02900da29d7cffdmr29067032pli.28.1608055959225;
        Tue, 15 Dec 2020 10:12:39 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id p15sm25273822pgi.40.2020.12.15.10.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 10:12:38 -0800 (PST)
Date:   Tue, 15 Dec 2020 10:12:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Roy Im <roy.im.opensource@diasemi.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: da7280 - fix missing error test
Message-ID: <X9j8lGFgijzHyYZZ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

An "if" testing for error condition has accidentally been dropped from
the code.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: cd3f609823a5 ("Input: new da7280 haptic driver")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/da7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index 37568b00873d..2f698a8c1d65 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -863,6 +863,7 @@ static void da7280_parse_properties(struct device *dev,
 		gpi_str3[7] = '0' + i;
 		haptics->gpi_ctl[i].polarity = 0;
 		error = device_property_read_string(dev, gpi_str3, &str);
+		if (!error)
 			haptics->gpi_ctl[i].polarity =
 				da7280_haptic_of_gpi_pol_str(dev, str);
 	}
-- 
2.29.2.684.gfbc64c5ab5-goog


-- 
Dmitry
