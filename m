Return-Path: <linux-input+bounces-3729-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C3B8C87D1
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2024 16:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5C96B209B1
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2024 14:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9415B1E9;
	Fri, 17 May 2024 14:19:35 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C054F95;
	Fri, 17 May 2024 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715955575; cv=none; b=jSOLwyviHtmC+7ShF4m1spPBOh1QxKWFjGjiQ8bLvW3m8nqT9MG148f1XNPUWAFAbnMwJqdpORpM5xahJ8Myv0jyR/MzRlomndbPB5tsrTzbQD99CQnWYUUL6rTju9uful7oGMoDW4Rwo+uSDli6jdunPXXr6szpYJto2iGyfCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715955575; c=relaxed/simple;
	bh=0Z19W0lYssVtBpmc2IGLBgu9eupgPGN+qoB0RUqW9UU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tYzdaW3pJ4ycA1MqGU5nH5JNbiwqFvZJhUNLowNm5B3O2T3ICCBYMTzWSyn/HCg1Vta6vRQlgchFzsT/+DTP79YozsKdG0Qur5ujJuapxOo9Il/Et0ZmNzvXODngVyVneKLnz4Z7ZbuAKpWkZnrwK5RymYyLeyElHH/swgLReKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 17 May
 2024 17:19:20 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 17 May
 2024 17:19:20 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Jiri Kosina <jikos@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Benjamin Tissoires
	<bentiss@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Douglas
 Anderson" <dianders@chromium.org>, <linux-input@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
	<syzbot+5186630949e3c55f0799@syzkaller.appspotmail.com>
Subject: [PATCH] HID: core: remove unnecessary WARN_ON() in implement()
Date: Fri, 17 May 2024 07:19:14 -0700
Message-ID: <20240517141914.8604-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Syzkaller hit a warning [1] in a call to implement() when trying
to write a value into a field of smaller size in an output report.

Since implement() already has a warn message printed out with the
help of hid_warn() and value in question gets trimmed with:
	...
	value &= m;
	...
WARN_ON may be considered superfluous. Remove it to suppress future
syzkaller triggers.

[1]
WARNING: CPU: 0 PID: 5084 at drivers/hid/hid-core.c:1451 implement drivers/hid/hid-core.c:1451 [inline]
WARNING: CPU: 0 PID: 5084 at drivers/hid/hid-core.c:1451 hid_output_report+0x548/0x760 drivers/hid/hid-core.c:1863
Modules linked in:
CPU: 0 PID: 5084 Comm: syz-executor424 Not tainted 6.9.0-rc7-syzkaller-00183-gcf87f46fd34d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
RIP: 0010:implement drivers/hid/hid-core.c:1451 [inline]
RIP: 0010:hid_output_report+0x548/0x760 drivers/hid/hid-core.c:1863
...
Call Trace:
 <TASK>
 __usbhid_submit_report drivers/hid/usbhid/hid-core.c:591 [inline]
 usbhid_submit_report+0x43d/0x9e0 drivers/hid/usbhid/hid-core.c:636
 hiddev_ioctl+0x138b/0x1f00 drivers/hid/usbhid/hiddev.c:726
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:890
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
...

Fixes: 95d1c8951e5b ("HID: simplify implement() a bit")
Reported-by: syzbot+5186630949e3c55f0799@syzkaller.appspotmail.com
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/hid/hid-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b1fa0378e8f4..74efda212c55 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1448,7 +1448,6 @@ static void implement(const struct hid_device *hid, u8 *report,
 			hid_warn(hid,
 				 "%s() called with too large value %d (n: %d)! (%s)\n",
 				 __func__, value, n, current->comm);
-			WARN_ON(1);
 			value &= m;
 		}
 	}

