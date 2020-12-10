Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CA62D5923
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 12:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgLJLYN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 06:24:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgLJLYN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 06:24:13 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35F9C0613D6;
        Thu, 10 Dec 2020 03:23:32 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id t7so3753355pfh.7;
        Thu, 10 Dec 2020 03:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zaKvT54if7xfnOe8Pws4rx6qrrav4fU9s8iBDlsbdOY=;
        b=h9R78oZ6wmxDv74QeQtadY+okXk7nsPwRNP5VTVbjohsKYxEr9aE77qk/6E1IZw3K0
         9L5hQcb8umwvZTG0r11xeNBxt62+Rb9dG/OAUBfH/t8qASe0onv9Vet36c2g/gTy4jzx
         YoH7ovbEDdi/neG4AfW3onfXTBHNJGfx+haY13HyVtT8JqDs3JqiuJOEmOYSdDG8bt/R
         qLgyduuMNKJuPMaQ2uebmuLZ8MA+CIYWJdofyT6agwOATnsAHwkB2Jb7m+dca2EC0Qlu
         dSVHjDFPsq/e4hPRhzn8J337KQJZFqkMg3c53Fc5lQa8IFhLKf7/v21xKT/+M9A+6Owd
         LnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zaKvT54if7xfnOe8Pws4rx6qrrav4fU9s8iBDlsbdOY=;
        b=DnRuQL3xwjUl5t/z22NKieBQUGVKAYj5+qUDkWcKjLKmzpA7TspliOwuY+CKRZo5cg
         TlPzLCTxRTmDeFIJRgI9kI9ULswc4qaMFEfLhzzadJPUTkjPU8aC4aqDE/6P9uEQNbtE
         8/N5ejtRDYv2Duzoj1BUp4CuIBQ0OmvLuNkF/dbYMj842Nhb7facYJ3bK/2knP1WpoDk
         rMnAk3LDMvjsfS26dZ8Uj148ZFrEyFZ9q7avuerZN0D1q66PrSMwe2egl8Q2RISs5oAy
         Y4Afgao03tVYB+fvBe3so7f0zc8OX0o3m2dRvHxIqpYr9HVeJCHB98rCUADJkAz8IYzt
         w19g==
X-Gm-Message-State: AOAM530i97Em89yfxleJhwl5GjeN8b20vJilxLOBprMnjsLzP6pj5G1b
        agIDcUiMYeJ0F6vyGmZoRL/3kYZJNol704U=
X-Google-Smtp-Source: ABdhPJyhEyo7Smwvkddlx7qdKfHgwO1xy6XKtorVbwd0qbMYpArfA3QCjXg/KumoMzD9yfinXn1TfQ==
X-Received: by 2002:a17:90a:df13:: with SMTP id gp19mr7095831pjb.235.1607599412531;
        Thu, 10 Dec 2020 03:23:32 -0800 (PST)
Received: from localhost.localdomain (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
        by smtp.gmail.com with ESMTPSA id u25sm5468773pfn.170.2020.12.10.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 03:23:31 -0800 (PST)
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Phong Tran <tranmanphong@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peilin Ye <yepeilin.cs@gmail.com>
Subject: [PATCH] HID: wacom: Fix memory leak in wacom_probe()
Date:   Thu, 10 Dec 2020 06:22:58 -0500
Message-Id: <20201210112258.477636-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

wacom_probe() is leaking memory. Free `&wacom_wac->pen_fifo` when
hid_parse() or wacom_parse_and_register() fails.

Cc: stable@vger.kernel.org
Cc: Phong Tran <tranmanphong@gmail.com>
Fixes: 83417206427b ("HID: wacom: Queue events with missing type/serial data for later processing")
Reported-by: syzbot+5b49c9695968d7250a26@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=3ce164d1f22d112c0bb0ef379a2656b5ca401583
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Hi all,

syzbot complained about another memory leak issue [1] in
rxrpc_lookup_local() while testing this patch, which I think is
irrelevant.

Thanks,
Peilin Ye

[1] https://syzkaller.appspot.com/bug?id=80b2343d6c19226dfa59e33b151c168d96253420

BUG: memory leak
unreferenced object 0xffff888117db0500 (size 256):
  comm "syz-executor.4", pid 8886, jiffies 4294944028 (age 432.930s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 c0 79 17 81 88 ff ff  ..........y.....
  backtrace:
    [<000000001169b470>] kmalloc include/linux/slab.h:552 [inline]
    [<000000001169b470>] kzalloc include/linux/slab.h:664 [inline]
    [<000000001169b470>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<000000001169b470>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<00000000e579837f>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000200580c7>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<00000000be70b129>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<00000000449cb763>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<00000000efe39ea0>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<0000000080bf9a14>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<00000000fd18ae2f>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<000000008a230dcc>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<00000000e5c837ae>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<000000006188dafa>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<000000006188dafa>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<000000006188dafa>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<000000008705de4b>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<0000000058e35946>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

 drivers/hid/wacom_sys.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index cd71e7133944..fc14fe6d677b 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2744,12 +2744,12 @@ static int wacom_probe(struct hid_device *hdev,
 	error = hid_parse(hdev);
 	if (error) {
 		hid_err(hdev, "parse failed\n");
-		return error;
+		goto fail;
 	}
 
 	error = wacom_parse_and_register(wacom, false);
 	if (error)
-		return error;
+		goto fail;
 
 	if (hdev->bus == BUS_BLUETOOTH) {
 		error = device_create_file(&hdev->dev, &dev_attr_speed);
@@ -2760,6 +2760,10 @@ static int wacom_probe(struct hid_device *hdev,
 	}
 
 	return 0;
+
+fail:
+	kfifo_free(&wacom_wac->pen_fifo);
+	return error;
 }
 
 static void wacom_remove(struct hid_device *hdev)
-- 
2.25.1

