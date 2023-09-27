Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 379217B0269
	for <lists+linux-input@lfdr.de>; Wed, 27 Sep 2023 13:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjI0LIV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Sep 2023 07:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbjI0LIU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Sep 2023 07:08:20 -0400
X-Greylist: delayed 545 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 27 Sep 2023 04:08:16 PDT
Received: from smtpout10.mo539.mail-out.ovh.net (smtpout10.mo539.mail-out.ovh.net [51.210.91.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9CEF3
        for <linux-input@vger.kernel.org>; Wed, 27 Sep 2023 04:08:16 -0700 (PDT)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net [79.137.60.37])
        by mo539.mail-out.ovh.net (Postfix) with ESMTPS id A87181FFC9
        for <linux-input@vger.kernel.org>; Wed, 27 Sep 2023 10:59:08 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net. [127.0.0.1])
        by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <linux-input@vger.kernel.org>; Wed, 27 Sep 2023 10:59:08 +0000 (UTC)
Received: from pro1.mail.ovh.net (unknown [10.109.156.173])
        by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4D70D1FE79
        for <linux-input@vger.kernel.org>; Wed, 27 Sep 2023 10:59:08 +0000 (UTC)
Received: from mikesz.helix.pl.com (213.238.85.40) by DAG23EX2.emp.local
 (172.16.2.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.32; Wed, 27 Sep
 2023 12:59:07 +0200
From:   Marcin Mikula <marcin@helix.pl>
To:     <linux-input@vger.kernel.org>
CC:     Marcin Mikula <marcin@helix.pl>
Subject: [PATCH] HID parser: change usages table allocation to kvzalloc
Date:   Wed, 27 Sep 2023 12:58:54 +0200
Message-ID: <20230927105854.541910-1-marcin@helix.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [213.238.85.40]
X-ClientProxiedBy: CAS6.emp.local (172.16.1.6) To DAG23EX2.emp.local
 (172.16.2.232)
X-Ovh-Tracer-Id: 791507635014336617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvjedrtdefgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfgtihesthekredtredttdenucfhrhhomhepofgrrhgtihhnucfoihhkuhhlrgcuoehmrghrtghinheshhgvlhhigidrphhlqeenucggtffrrghtthgvrhhnpeevleejveffvdeuveejledugefhhedvfeevfeetgfefieeiffehudegheeuvefggeenucfkphepuddvjedrtddrtddruddpvddufedrvdefkedrkeehrdegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehmrghrtghinheshhgvlhhigidrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehfeelpdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are devices which deliver buggy HID descriptors, repoting
Usage Maximum for particular Usage Page of max value (0xFFFF).

By decision of kernel HID subsystem developers such number will be limited
to arbitrary value of HID_MAX_USAGES (12288), and the following log will
be printed to warn about such condition:

"kernel: hid-generic 0005:057A:0087.001A: ignoring exceeding usage max"

but still the amount of memory allocated for HID_MAX_USAGES modified value
can be quite high as for kmalloc allocation.

On some systems with limited memory (seen in ARM based embedded system),
in high memory pressure condition an attempt to kmalloc() such value
can fail.
As a consequence this HID Usage Page will not parsed, so will not be
handled and the events will be ignored.

From the user perspective part of the input described with this Usage Page
simply will not work, which is a severe condition.

Change of kzalloc to kvzalloc makes sure that this allocation will
not fail.

Example of the kernel callstack when allocation fails for reference:

kernel: kworker/1:1: page allocation failure: order:7,
mode:0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), nodemask=(null),cpuset=/,
mems_allowed=0

Workqueue: events uhid_device_add_worker
Call trace:
  dump_backtrace+0x0/0x1b4
  show_stack+0x24/0x30
  dump_stack+0xac/0x10c
  warn_alloc+0xd8/0x158
  __alloc_pages_slowpath+0x2e0/0x914
  __alloc_pages_nodemask+0x1b0/0x278
  kmalloc_order+0x30/0x7c
  kmalloc_order_trace+0x3c/0xd4
  __kmalloc+0x50/0x188
  hid_add_field+0x160/0x250
  hid_parser_main+0x220/0x25c
  hid_open_report+0x138/0x278
  hid_generic_probe+0x40/0x5c
  hid_device_probe+0x130/0x154
  really_probe+0x274/0x3f0
  driver_probe_device+0x118/0x128
  __device_attach_driver+0xc4/0x108
  bus_for_each_drv+0xa4/0xc8
  __device_attach+0xf4/0x17c
  device_initial_probe+0x24/0x30
  bus_probe_device+0x38/0x98
  device_add+0x4a0/0x578
  hid_add_device+0x100/0x294
  uhid_device_add_worker+0x28/0x70
  process_one_work+0x19c/0x294
  worker_thread+0x1e4/0x274
  kthread+0xdc/0xec
  ret_from_fork+0x10/0x18

Signed-off-by: Marcin Mikula <marcin@helix.pl>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 8992e3c1e769..0886868ee176 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -95,7 +95,7 @@ static struct hid_field *hid_register_field(struct hid_report *report, unsigned
 		return NULL;
 	}
 
-	field = kzalloc((sizeof(struct hid_field) +
+	field = kvzalloc((sizeof(struct hid_field) +
 			 usages * sizeof(struct hid_usage) +
 			 3 * usages * sizeof(unsigned int)), GFP_KERNEL);
 	if (!field)
@@ -661,7 +661,7 @@ static void hid_free_report(struct hid_report *report)
 	kfree(report->field_entries);
 
 	for (n = 0; n < report->maxfield; n++)
-		kfree(report->field[n]);
+		kvfree(report->field[n]);
 	kfree(report);
 }
 
-- 
2.25.1

