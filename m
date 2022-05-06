Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0309151D22E
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 09:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352462AbiEFH2k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 03:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240161AbiEFH2j (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 03:28:39 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BDD674C8;
        Fri,  6 May 2022 00:24:56 -0700 (PDT)
Received: from localhost.localdomain ([172.16.0.254])
        (user=dzm91@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 2467ORJS001331-2467ORJV001331
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Fri, 6 May 2022 15:24:31 +0800
From:   Dongliang Mu <dzm91@hust.edu.cn>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        syzkaller <syzkaller@googlegroups.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: bigben: fix slab-out-of-bounds Write in bigben_probe
Date:   Fri,  6 May 2022 15:24:25 +0800
Message-Id: <20220506072425.1121900-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dongliang Mu <mudongliangabcd@gmail.com>

There is a slab-out-of-bounds Write bug in hid-bigbenff driver.
The problem is the driver assumes the device must have an input but
some malicious devices violate this assumption.

Fix this by checking hid_device's input is non-empty before its usage.

Reported-by: syzkaller <syzkaller@googlegroups.com>
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
v1->v2: modify return directly to goto error_hw_stop;
 drivers/hid/hid-bigbenff.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index 74ad8bf98bfd..e8c5e3ac9fff 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -347,6 +347,12 @@ static int bigben_probe(struct hid_device *hid,
 	bigben->report = list_entry(report_list->next,
 		struct hid_report, list);
 
+	if (list_empty(&hid->inputs)) {
+		hid_err(hid, "no inputs found\n");
+		error = -ENODEV;
+		goto error_hw_stop;
+	}
+
 	hidinput = list_first_entry(&hid->inputs, struct hid_input, list);
 	set_bit(FF_RUMBLE, hidinput->input->ffbit);
 
-- 
2.25.1

