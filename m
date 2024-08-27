Return-Path: <linux-input+bounces-5902-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDEA960C91
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 15:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E2BB1F23590
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 13:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AAB1C2DDE;
	Tue, 27 Aug 2024 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="USNwJ7uo"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED541BA270;
	Tue, 27 Aug 2024 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766730; cv=none; b=UAoE8sGtXtC1DiM7/hQIHABeEZmRDl2TkXpWQTjpqT/1WLZX3jWmALsh+dEPML2W6OpWAGBlpdHXBidn0H4tzSqdNRK43G+HSvF3cxnaTq3vIkamM3iwqFU5lFb+ThPOvxSPZvcMefIlIaOU40DYc1rj8Rwd3+Wtuglx/ndhenU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766730; c=relaxed/simple;
	bh=+gmAbsCFEEXoQYR4dv4vzQS4b30HnHo4cr8BMw5Wkmw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=SmLfBTahRaxurySNXktYPouVPqPd0FbLYexp7yE2jzVZ3bC9V4oFi98lULw9WmVdVnTI4zaDNO6mMrpir4PCOqsCPAFrOhfLVXCCfuAuuLV6Edq51Y6RA7kMT3RoaHjxx2YkARx32VgD3mT+O0kvJz8F8LADG/iQlMHTZ2fOd20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=USNwJ7uo; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RCBj2C031016;
	Tue, 27 Aug 2024 13:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id; s=corp-2023-11-20; bh=s853O7
	j1UBhNfoqUbpxiatGOFyzmxPWED0zlEAgrm8I=; b=USNwJ7uowOnpGbFM8iNet0
	PdXvmlTfBOTgZSV9VdTgELxT33KjYEgbv1AW0EnB5Zwqt+cc3zV5xOI1OTFsQkIi
	Z+eov6gDu3Ut9kHRepfqcRFtUqnRv8bnTcXkHvrEw22gSpHd9ctsnCZbIIoSht2i
	2+Du2i2QOIPFdjrd+ooKCJjODLsagHNNGcYb2lhVBTRouc0PO0XzM2zF2G01PHnw
	g6trfuEORmOZhosljY4OmUUO2ueSeqvrbktqFlDWsq0RJobkV+nhGJzJsyXh4s4e
	4o7z0Jq7vhWscWcSIahjmL7ZGiCznmBwGwIg2RzOPK/QaUOnToU+ihD/33RcrGcw
	==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177kswhy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Aug 2024 13:52:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47RCcYm8010503;
	Tue, 27 Aug 2024 13:51:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894mydjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Aug 2024 13:51:59 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47RDpxng029431;
	Tue, 27 Aug 2024 13:51:59 GMT
Received: from gkennedy-linux.us.oracle.com (gkennedy-linux.us.oracle.com [10.152.170.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 41894mydhg-1;
	Tue, 27 Aug 2024 13:51:59 +0000
From: George Kennedy <george.kennedy@oracle.com>
To: stable@vger.kernel.org, rydberg@bitmath.org, dmitry.torokhov@gmail.com,
        penguin-kernel@I-love.SAKURA.ne.jp
Cc: george.kennedy@oracle.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, harshit.m.mogalapalli@oracle.com
Subject: Backport request to fix a WARNING in input_mt_init_slots
Date: Tue, 27 Aug 2024 08:49:07 -0500
Message-Id: <1724766547-24435-1-git-send-email-george.kennedy@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_07,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408270102
X-Proofpoint-ORIG-GUID: eJJntbfIBSU0yaC56IjpnqaiHlLWU-au
X-Proofpoint-GUID: eJJntbfIBSU0yaC56IjpnqaiHlLWU-au
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

Hello,

We have seen a WARNING message while fuzzing with syzkaller.


Kernel 5.15.165 on an x86_64


------------[ cut here ]------------
WARNING: CPU: 1 PID: 1592 at mm/page_alloc.c:5398 __alloc_pages+0x4aa/0x5b0 mm/page_alloc.c:5398
Modules linked in:
CPU: 1 PID: 1592 Comm: syz-executor777 Not tainted 5.15.165-rc1-305-ge122be7431ef1-syzk #1
Hardware name: Red Hat KVM, BIOS 1.16.0-4.module+el8.9.0+90052+d3bf71d8 04/01/2014
RIP: 0010:__alloc_pages+0x4aa/0x5b0 mm/page_alloc.c:5398
Code: 00 48 89 44 24 58 e9 fa fc ff ff 48 89 f2 48 89 c7 44 89 c6 e8 77 32 f2 ff 49 89 c7 e9 72 fd ff ff 80 e7 20 0f 85 d8 fe ff ff <0f> 0b e9 d1 fe ff ff a9 00 00 08 00 75 48 89 da 80 e2 7f a9 00 00
RSP: 0018:ffff88801c18fb58 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00000000000400c0 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: 0000000000000017 RDI: 0000000000040dc0
RBP: 1ffff11003831f6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000017 R14: 0000000000000000 R15: 0000000000000000
FS:  00007ff8aaa97740(0000) GS:ffff888107080000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff8aa38a520 CR3: 0000000022534000 CR4: 00000000000006e0
Call Trace:
 <TASK>
 alloc_pages+0x21e/0x3d0 mm/mempolicy.c:2185
 kmalloc_order+0x31/0xb0 mm/slab_common.c:966
 kmalloc_order_trace+0x19/0xa0 mm/slab_common.c:982
 kmalloc include/linux/slab.h:596 [inline]
 kzalloc include/linux/slab.h:721 [inline]
 input_mt_init_slots+0xf6/0x620 drivers/input/input-mt.c:49
 uinput_create_device+0x1e6/0x6e0 drivers/input/misc/uinput.c:327
 uinput_ioctl_handler.isra.0+0x46f/0x15e0 drivers/input/misc/uinput.c:870
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x199/0x220 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0x90 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x6c/0xd6
RIP: 0033:0x7ff8aa38a53d
Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1b 79 2c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffc7eebe838 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff8aa38a53d
RDX: 0000000000000000 RSI: 0000000000005501 RDI: 0000000000000003
RBP: 00000000004017a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 431bde82d7b634db
R13: 00007ffc7eebe960 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
---[ end trace ced5c0b641032976 ]---

Fix commit: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=99d3bf5f7377d42f8be60a6b9cb60fb0be34dceb

Can you please backport this commit to stable kernels on 5.15.y (and 
other stable kernels 6.1.y, 6.6.y)

commit: 99d3bf5f7377 ("Input: MT - limit max slots")

author	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>	2024-07-29 21:51:30 +0900
committer	Linus Torvalds <torvalds@linux-foundation.org>	2024-07-29 10:44:48 -0700
commit	99d3bf5f7377d42f8be60a6b9cb60fb0be34dceb (patch)
tree	78dd9dff2065f2eaf5a9e981f84d56eed2346d10
parent	3894840a7a11aa06cc3b0d5a2d1b5f6878127903 (diff)
download	linux-99d3bf5f7377d42f8be60a6b9cb60fb0be34dceb.tar.gz
Input: MT - limit max slots
syzbot is reporting too large allocation at input_mt_init_slots(), for
num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).

Since nobody knows possible max slots, this patch chose 1024.

Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Diffstat
-rw-r--r--	drivers/input/input-mt.c	3	
		
1 files changed, 3 insertions, 0 deletions
diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 14b53dac1253bf..6b04a674f832a0 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -46,6 +46,9 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
 		return 0;
 	if (mt)
 		return mt->num_slots != num_slots ? -EINVAL : 0;
+	/* Arbitrary limit for avoiding too large memory allocation. */
+	if (num_slots > 1024)
+		return -EINVAL;
 
 	mt = kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL);
 	if (!mt)

