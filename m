Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DE8226F4E
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 21:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730459AbgGTTxi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 15:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgGTTxi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 15:53:38 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48E1C061794;
        Mon, 20 Jul 2020 12:53:37 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id j10so14224700qtq.11;
        Mon, 20 Jul 2020 12:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vEZ6tAuto0AD0QvhHLUuGc6guN47wM0Ymb1QgCDxeVc=;
        b=uigLztwrN8+TW+Kg+TRURPBDbQV2uGy9aJLLJ4rWTw0gqW9xVOmyB3vfkbfoTROJCh
         vLr86t8NOOkhTW/JZqnSoxd5qVdRBowDasBjsYh1vuAo09tntlNd7cSqLkwxVsXbbREd
         +aphWvOcj/CMdaHyfwo+68U0X45to2COOASo2+VCGAXoxf4Y2IFLWcoPVCDpbG73+RUV
         XojbFRAkZ1JMgwADurb3MrJH/R6gYUwMCpf0zWSynpeVIBZS0Mcpv78EQoYh5ouAxdVx
         VMt0KziuHbA+bdZuPvRmBFEQA7EnvufoYnSXzqYXx3QatVIpZFLo2XYVWJnK3bQ7YlGm
         m0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vEZ6tAuto0AD0QvhHLUuGc6guN47wM0Ymb1QgCDxeVc=;
        b=rsreLKLCG6xQNXr/NSeAo/JXuRKHWS8CCpAEMsMcHSUqvyHufvD4wjfnpB/w9Tdp82
         7vwzSZ3s7X01i4DZM21q/e/A1fTuwXHj2HZyQy0joYJMvoIQCuAiG9+IZTl1dlBZhwBl
         dsNy1NiDoSYdQ+UhGVYWKBuhtwOjNzZQc8F1a0zzG3QtNKItub4eIvafkOJlf2b5iONi
         FVl78ijvkbrAHH5MVquxm8frsHm1/ksqCGWB12D8uWa6Hvwc/Wp8GuV2HZC18eTOcsS+
         jpjyUwFEVL6rWJ2jkIxwVc8rQ7Ylr4zTbT8JfEE0EzN7JIxBdovnCX1BcjWfdHiGt5u4
         mcCg==
X-Gm-Message-State: AOAM530azsr6Nwkk8+4XPZUOX/GmbaIRzPCEromT6UkVVx0KiQgHLDyQ
        m0eEUV01T+IwJwb4W5nzwg==
X-Google-Smtp-Source: ABdhPJz1QibfLhe6SZAZMObPcSE12BVsweLJvbfU6nGN0/7ar7KPnNgawvwZ6AgpvXjUc8gjTmk/KQ==
X-Received: by 2002:ac8:1a14:: with SMTP id v20mr1441898qtj.269.1595274817129;
        Mon, 20 Jul 2020 12:53:37 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
        by smtp.gmail.com with ESMTPSA id c70sm438566qke.109.2020.07.20.12.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:53:36 -0700 (PDT)
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
Subject: [Linux-kernel-mentees] [PATCH v2] usbhid: Fix slab-out-of-bounds write in hiddev_ioctl_usage()
Date:   Mon, 20 Jul 2020 15:52:09 -0400
Message-Id: <20200720195209.4365-1-yepeilin.cs@gmail.com>
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

