Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10B9812224A
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 04:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfLQDC2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Dec 2019 22:02:28 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:34812 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726446AbfLQDC2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Dec 2019 22:02:28 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id C96DBE269370C8643418;
        Tue, 17 Dec 2019 11:02:25 +0800 (CST)
Received: from huawei.com (10.175.127.16) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 17 Dec 2019
 11:02:19 +0800
From:   z00417012 <zhangpan26@huawei.com>
To:     <zhangpan26@huawei.com>, <hushiyuan@huawei.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drivers/hid/hid-multitouch.c: fix a possible null pointer access.
Date:   Tue, 17 Dec 2019 11:02:02 +0800
Message-ID: <1576551722-16966-1-git-send-email-zhangpan26@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.127.16]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

1002     if ((quirks & MT_QUIRK_IGNORE_DUPLICATES) && mt) {
1003         struct input_mt_slot *i_slot = &mt->slots[slotnum];
1004 
1005         if (input_mt_is_active(i_slot) &&
1006             input_mt_is_used(mt, i_slot))
1007             return -EAGAIN;
1008     }

We previously assumed 'mt' could be null (see line 1002).

The following situation is similar, so add a judgement.

Signed-off-by: Pan Zhang <zhangpan26@huawei.com>
---
 drivers/hid/hid-multitouch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3cfeb16..368de81 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1019,7 +1019,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
 		tool = MT_TOOL_DIAL;
 	else if (unlikely(!confidence_state)) {
 		tool = MT_TOOL_PALM;
-		if (!active &&
+		if (!active && mt
 		    input_mt_is_active(&mt->slots[slotnum])) {
 			/*
 			 * The non-confidence was reported for
-- 
2.7.4

