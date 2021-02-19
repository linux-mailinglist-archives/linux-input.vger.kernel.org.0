Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2F431F442
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 04:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhBSDoH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 22:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhBSDoG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 22:44:06 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BF4C061756;
        Thu, 18 Feb 2021 19:43:25 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id cx11so798521pjb.4;
        Thu, 18 Feb 2021 19:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=yR18M88sJrip23NYIQuAemSwHx/lrgpktrErgKBS3fE=;
        b=tsE1wY0cSe9H5WiGeRjtbtNWvd0GoLpHyQ0GkLymnKGMTS8JVIcnatZEGYEpASaIcz
         Z+IBh7R5WMiXHn+fTRDL907TKQnXimEgVFhzv5f9T2ah+WGXY0RWM4zgT3eJ+V/Dfe6M
         8gUAj+gEt0AXHl6NPHVzQVquCd+bmfKteShhQmUgMemx9erAwE8KqYar4g1fcuuRuceJ
         /l3crPmStACGqqobsX/giggZNR7fNwhKcLT/0Y2QEbAW0sDhEFHDZw8q2jtutzFl91LB
         ubDl+EW8qTHVDhLIszX4MxgAs5fQWgYmu8s2Vy57TSXbCWmStPZmOOZhGKqb8hGewlgq
         ImzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yR18M88sJrip23NYIQuAemSwHx/lrgpktrErgKBS3fE=;
        b=mx9NtkCiLA+rz89Iv7tzhiOGON9/K/dAtQohYrOb/N2rqwUvn4pzxff8NkejU/RXCJ
         k+6rcuYO3TfMHTWYTbnTXCfbxlD4lA+w5dRlM2X7OGyEJPPjK02QF6XOaBjeTX3RNIrx
         7xOWiyMiSVzQGmEOzZZuSUGzvFdtzHaWg8Hkmzs4F3SrU0eSNa8fSti4R8yZVBvYR81l
         0NEbhycS+G1XhAPhI7EMMpzQSgZNU1A23bGollaS5obTJzQSV38T3XowVSaSiyj5h75l
         whWG6DOi10MWp6DlchUlZZm29y5fltJSnpB2xath/P71Ygf3W5PhoAs5baGvjbwG+eAt
         Ksow==
X-Gm-Message-State: AOAM531C6PS2Mfgl0XG+1frc+nEe01V1hOvS3EnOb1eAECjpF/srkg67
        OdEu3Qo9ubnZxuuNplqVWKw5TRW8wkg=
X-Google-Smtp-Source: ABdhPJwXw0/52z48AsOUiv3fs44Jy8h/pcUPFV7kReK1oHuBkJWRD8jncabg+WqqY9dGuzdnIlrMJA==
X-Received: by 2002:a17:902:7402:b029:e3:95e7:b983 with SMTP id g2-20020a1709027402b02900e395e7b983mr6928724pll.58.1613706204865;
        Thu, 18 Feb 2021 19:43:24 -0800 (PST)
Received: from google.com ([2620:15c:202:201:8d20:87b2:91b7:7f7b])
        by smtp.gmail.com with ESMTPSA id b3sm7004146pjh.22.2021.02.18.19.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 19:43:24 -0800 (PST)
Date:   Thu, 18 Feb 2021 19:43:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Michael Srba <Michael.Srba@seznam.cz>, lkp@intel.com,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: zinitix - fix return type of zinitix_init_touch()
Message-ID: <YC8z2bXc3Oy8pABa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

zinitix_init_touch() returns error code or 0 for success and therefore
return type must be int, not bool.

Fixes: 26822652c85e ("Input: add zinitix touchscreen driver")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zinitix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index f64d88170fac..3b636beb583c 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -190,7 +190,7 @@ static int zinitix_write_cmd(struct i2c_client *client, u16 reg)
 	return 0;
 }
 
-static bool zinitix_init_touch(struct bt541_ts_data *bt541)
+static int zinitix_init_touch(struct bt541_ts_data *bt541)
 {
 	struct i2c_client *client = bt541->client;
 	int i;
-- 
2.30.0.617.g56c4b15f3c-goog


-- 
Dmitry
