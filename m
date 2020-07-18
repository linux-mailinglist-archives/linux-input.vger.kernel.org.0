Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 709FA224E3E
	for <lists+linux-input@lfdr.de>; Sun, 19 Jul 2020 01:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgGRXNv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Jul 2020 19:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbgGRXNv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Jul 2020 19:13:51 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFEFC0619D2;
        Sat, 18 Jul 2020 16:13:51 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id l23so4253369qkk.0;
        Sat, 18 Jul 2020 16:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JR52wllqEcVbigAnzPQp6schXz+q2ggaNIrnkwe/pus=;
        b=G/CMfwOQ1tJWt20onssCm1mlA/3Watsw6BWBn2KcUuOsAkGQ/SEcj0R+9nbQIoBOnP
         TRcf86OV6YVbtqdgNRJQ1YDAtks6iXYjhQ8HhTBvo9Dh81uBzDD+Tt4uAjmwPpnKpN1I
         IbzPvzrpcW/FIjArvecktUXHiJjweNAbW3VBNfH9k9NM+0w7rFNpPkH9qS9J90ab7wPv
         j9691qrmFh4FGsSmxkRX+oCNMuFv8QBZG4/rmKH9ixSkqhcFI4ItI4ew4whnKfBv1e9g
         EsqZv3QCdd4kt+8mmChTzkCbSANlBvn7kpQ/jhTrWUD+9FrNilr1+CF7ILcuYbn1d92Q
         ClJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JR52wllqEcVbigAnzPQp6schXz+q2ggaNIrnkwe/pus=;
        b=ld3mLwSl3MrlH38VGksnNZjcRAshQ4rUA9XzFJKmCMl66K3WGwyPRvtAHnQ29yQnFG
         kr/2TTg59lEaWzqgRuzmJ1ATRFYOXXzxRZTy/tT0Vmg7PsclvSSfsS03kpQhFMbNrcbF
         PXBg6xKCbnxkocDxNGbDai/7CAdBxhyCQ1z95P63RYcy4RFUn79XHICXcqtp1FylEmQP
         7i/HACkMDt+zH6bQvla7LIrvyv56rWcbOUYQaSA4xn8d3F+E/z2xVV+KiC5I8jfOo8uA
         NrjaZLcpIg8PZ/qytMw2JxX2VfAxipweUSYqpKiu9GcFEp1hqrg5Ql59lmqD5MQHiIFW
         lx+w==
X-Gm-Message-State: AOAM5305zgdCexPRO/ddITXXETbZbakbIeDBmgwqcTcNCcJaH3YGgz5y
        AnsfeaNKJkAYe/QSCnr9Xg==
X-Google-Smtp-Source: ABdhPJxr+mxv1zNImr7SJejb20D1SraPf6Y3xVHqBzITtkhVUKed/JmubAzYGZcbI+wxuYp7mSBfdw==
X-Received: by 2002:a37:b56:: with SMTP id 83mr14515911qkl.362.1595114030225;
        Sat, 18 Jul 2020 16:13:50 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
        by smtp.gmail.com with ESMTPSA id w44sm15998462qtj.86.2020.07.18.16.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2020 16:13:49 -0700 (PDT)
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v1] usbhid: Fix slab-out-of-bounds write in hiddev_ioctl_usage()
Date:   Sat, 18 Jul 2020 19:12:18 -0400
Message-Id: <20200718231218.170730-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

`uref->usage_index` is not always being properly checked, causing
hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.

This patch fixes the following syzbot bug:

    https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802

Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
This patch fixes the bug, but in an ugly way. Checks on `uref` are already
being done in this code:

			if (cmd == HIDIOCGCOLLECTIONINDEX) {
				if (uref->usage_index >= field->maxusage)
					goto inval;
				uref->usage_index =
					array_index_nospec(uref->usage_index,
							   field->maxusage);
			} else if (uref->usage_index >= field->report_count)
				goto inval;

However it did not catch this bug since it's in an `else` bracket. Should
we move the above code out of the bracket? Would like to hear your opinion.
Thank you!

 drivers/hid/usbhid/hiddev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 4140dea693e9..c63d07caacef 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -525,6 +525,8 @@ static noinline int hiddev_ioctl_usage(struct hiddev *hiddev, unsigned int cmd,
 			goto goodreturn;
 
 		case HIDIOCSUSAGE:
+			if (uref->usage_index >= field->report_count)
+				goto inval;
 			field->value[uref->usage_index] = uref->value;
 			goto goodreturn;
 
-- 
2.25.1

