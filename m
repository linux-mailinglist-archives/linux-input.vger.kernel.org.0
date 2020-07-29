Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20314231D72
	for <lists+linux-input@lfdr.de>; Wed, 29 Jul 2020 13:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgG2Li3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jul 2020 07:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgG2Li2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jul 2020 07:38:28 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05ACC061794;
        Wed, 29 Jul 2020 04:38:27 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id e13so21801825qkg.5;
        Wed, 29 Jul 2020 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kq86ugZ9Kh4uvA8FGJVxsQ+ntooQ4buHazTmCg4C02E=;
        b=OugQUVzjgJHFzjAaY04UeeW/f2lFj6q18wj/s6NeyGmXMYVBGC3HBg8OANBrExC4pu
         mWq6CmVr+2tY6l83HfJlAquylDRJqXkr01Lakt5ttkOPv+Mdbklyze+Rnjzizv2n5eia
         m1vbgF3jlB/ICPiYPKySvDDOz/sNBONWbBt/gc2rpwKTmudPpoTaZzGmMRhDX0B8/DxY
         u/cUVpQJv+HdEJFGzwy1A8HPtWVTPNrXGuVebR8iwrcHfjeWw9OsIstqAF0+cC/ExnE2
         Kyg92WKivbuwrRp+tV+CWLkWbJHWz+TvANJu8/mfMVq3nR9Rc5WoVu9te07DnWGPYuwb
         Gcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kq86ugZ9Kh4uvA8FGJVxsQ+ntooQ4buHazTmCg4C02E=;
        b=pdjPRwGXDNaWkOWXmxIXq8fuVp+/kaaXs99lM02kNpwcpe9IcETj2DdVs3qWEPUKdR
         O9Y1iypv6JhMuwol2SBLnG7NddVxaH7Zwk8wyJcCEdmPsKWqjYSRcN9vtAXYX59ATvy5
         Z/yTp0SWZGlJ+kDzYDlp3/sQzr2HT/aEOgTr8pLP5JVjboKyEsdoZJ/mAIBJx/dYNOs/
         hLrm21ntr+spWtB3Xp3alxY7XIQAmvNMobLaPeQoWGDUXZKBn70U46iTz8TVs2IaaJnQ
         7mEjcZIZrBRgk2HhduY+1bw3epn7uB/wuqG60TZSYo0oH67mI+KhtCdMGN4/ySbt6VRh
         vLoA==
X-Gm-Message-State: AOAM532fHvF28egRJUKSuJh2pvYF5aSYQ4owcdKPtsgYIgKZmH+XjGpe
        8RABVMz2ZX0ht3G6dnf2EA==
X-Google-Smtp-Source: ABdhPJw9BUCTIZt9eRkU3uKUsVVckjWP0KInvHs1YXHSPKjeWDir27IpG2UJ4zddVfZscf1Vj3OQnw==
X-Received: by 2002:a37:4048:: with SMTP id n69mr30825844qka.421.1596022706871;
        Wed, 29 Jul 2020 04:38:26 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
        by smtp.gmail.com with ESMTPSA id k134sm1377330qke.60.2020.07.29.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 04:38:26 -0700 (PDT)
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 RESEND] usbhid: Fix slab-out-of-bounds write in hiddev_ioctl_usage()
Date:   Wed, 29 Jul 2020 07:37:12 -0400
Message-Id: <20200729113712.8097-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200718231218.170730-1-yepeilin.cs@gmail.com>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

`uref->usage_index` is not always being properly checked, causing
hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.

Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - Add the same check for the `HIDIOCGUSAGE` case. (Suggested by
      Dan Carpenter <dan.carpenter@oracle.com>)

 drivers/hid/usbhid/hiddev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 4140dea693e9..4f97e6c12059 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -519,12 +519,16 @@ static noinline int hiddev_ioctl_usage(struct hiddev *hiddev, unsigned int cmd,
 
 		switch (cmd) {
 		case HIDIOCGUSAGE:
+			if (uref->usage_index >= field->report_count)
+				goto inval;
 			uref->value = field->value[uref->usage_index];
 			if (copy_to_user(user_arg, uref, sizeof(*uref)))
 				goto fault;
 			goto goodreturn;
 
 		case HIDIOCSUSAGE:
+			if (uref->usage_index >= field->report_count)
+				goto inval;
 			field->value[uref->usage_index] = uref->value;
 			goto goodreturn;
 
-- 
2.25.1

