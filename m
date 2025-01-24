Return-Path: <linux-input+bounces-9500-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C85A1B162
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 09:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92854164CD4
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 08:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF241DB154;
	Fri, 24 Jan 2025 08:09:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F453C00;
	Fri, 24 Jan 2025 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737706181; cv=none; b=cEIC24sL0RRbtIuYJc5gxx0LqvcyXzLKhdkzE+YTZdNK2ORutWVj1XWGBjeHdWc9jbZrW6bwsBLRotxpCeD7QMIv5Pb6pN679ddHNmSDY4Xt/oYqjXg5Bv+JsOFW3YHzasWuIfOGtD7AECoRUk04Wohf6080/Mj48F2Ds0niFRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737706181; c=relaxed/simple;
	bh=U1XDyoWFFMO8bGJdH/EoKDoK3NF57vgCCkP3PuZMWlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LB7ixxkq8Pq1WG7ypiIQHmznN/JVf1n/PDgZpe+FpZoZsDVrpeVGsUrlvp/QQibAOgHxn6euVfwrHqpqZgZkRI0L7+2p6Zzo0wgCiyh1cUVuu9dlkj307bwv16JJzJSR3IlD8keR3l3MDHi6e8cQLHMsUx6hAtejtG8OahCaOSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O6gMWl029944;
	Fri, 24 Jan 2025 00:09:20 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqjgand8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Jan 2025 00:09:19 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 24 Jan 2025 00:09:19 -0800
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 24 Jan 2025 00:09:16 -0800
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <syzbot+cf5f2dd02bbd4d2d411c@syzkaller.appspotmail.com>
CC: <bentiss@kernel.org>, <gregkh@linuxfoundation.org>, <jikos@kernel.org>,
        <jkosina@suse.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <rafael@kernel.org>, <stuart.a.hayhurst@gmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] HID: corsair-void: cancel delayed status work if device removed
Date: Fri, 24 Jan 2025 16:09:15 +0800
Message-ID: <20250124080915.419680-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67923cb2.050a0220.2eae65.0006.GAE@google.com>
References: <67923cb2.050a0220.2eae65.0006.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mCDX__YojqOROdevaLrI2rIAl02EA4Je
X-Proofpoint-ORIG-GUID: mCDX__YojqOROdevaLrI2rIAl02EA4Je
X-Authority-Analysis: v=2.4 cv=d7QPyQjE c=1 sm=1 tr=0 ts=67934aaf cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8 a=lCrHF3M8to3SV3RDAqMA:9 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_03,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 clxscore=1011
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501240058

syzbot reported a WARNING: ODEBUG bug in devres_release_group. [1]

Missing a cancel delayed work for the "delayed_status_work" in
corsair_void_remove.

[1]
ODEBUG: free active (active state 0) object: ffff8880286e09a8 object type: timer_list hint: corsair_void_status_work_handler+0x0/0x190
WARNING: CPU: 1 PID: 5847 at lib/debugobjects.c:615 debug_print_object+0x17a/0x1f0 lib/debugobjects.c:612
Modules linked in:
CPU: 1 UID: 0 PID: 5847 Comm: kworker/1:4 Not tainted 6.13.0-syzkaller-02526-gc4b9570cfb63 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:debug_print_object+0x17a/0x1f0 lib/debugobjects.c:612
Code: e8 4b 10 38 fd 4c 8b 0b 48 c7 c7 40 1e 60 8c 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f8 ff 34 24 e8 bb 3e 92 fc 48 83 c4 08 90 <0f> 0b 90 90 ff 05 28 de 4c 0b 48 83 c4 10 5b 41 5c 41 5d 41 5e 41
RSP: 0018:ffffc90003e3eeb8 EFLAGS: 00010286
RAX: 3d29b0c77a543200 RBX: ffffffff8c0ca540 RCX: ffff88801213da00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffffff8c601fc0 R08: ffffffff81603132 R09: fffffbfff1cfa638
R10: dffffc0000000000 R11: fffffbfff1cfa638 R12: 0000000000000000
R13: ffffffff8c601ed8 R14: dffffc0000000000 R15: ffff8880286e09a8
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff5312cda0 CR3: 0000000034840000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
 debug_check_no_obj_freed+0x45b/0x580 lib/debugobjects.c:1129
 slab_free_hook mm/slub.c:2284 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x115/0x430 mm/slub.c:4761
 release_nodes drivers/base/devres.c:506 [inline]
 devres_release_group+0x328/0x350 drivers/base/devres.c:689
 hid_device_remove+0x250/0x370 drivers/hid/hid-core.c:2779
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x4a9/0x7c0 drivers/base/dd.c:1296
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:576
 device_del+0x57a/0x9b0 drivers/base/core.c:3854
 hid_remove_device drivers/hid/hid-core.c:2958 [inline]
 hid_destroy_device+0x6a/0x1b0 drivers/hid/hid-core.c:2980
 usbhid_disconnect+0x9e/0xc0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x25b/0x940 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x503/0x7c0 drivers/base/dd.c:1296
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:576
 device_del+0x57a/0x9b0 drivers/base/core.c:3854
 usb_disable_device+0x3bf/0x850 drivers/usb/core/message.c:1418
 usb_disconnect+0x340/0x950 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x1ebc/0x5150 drivers/usb/core/hub.c:5905
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
Reported-by: syzbot+cf5f2dd02bbd4d2d411c@syzkaller.appspotmail.com
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
 drivers/hid/hid-corsair-void.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index 6ece56b850fc..bd8f3d849b58 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -726,6 +726,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
 	if (drvdata->battery)
 		power_supply_unregister(drvdata->battery);
 
+	cancel_delayed_work_sync(&drvdata->delayed_status_work);
 	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
 	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
 }
-- 
2.43.0


