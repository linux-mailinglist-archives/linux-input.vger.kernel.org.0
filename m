Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E7E444FED
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 09:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhKDIKw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 04:10:52 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:49640 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230229AbhKDIKw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 04:10:52 -0400
Received: from localhost.localdomain (unknown [124.16.138.128])
        by APP-05 (Coremail) with SMTP id zQCowABnSO3WlINh6e1BBg--.52292S2;
        Thu, 04 Nov 2021 16:07:51 +0800 (CST)
From:   Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH] HID: ite: Add parse before start
Date:   Thu,  4 Nov 2021 08:07:49 +0000
Message-Id: <1636013269-3433050-1-git-send-email-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: zQCowABnSO3WlINh6e1BBg--.52292S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw1kXw45Ww18JFyUKrWDXFb_yoW3JwcEkw
        48uwn7Gr98Krs2kF1xAr18Zr9Y9an7ZF1fZ3Wft398Ja47WasrZFZFv3s3G345urW8Z3Wx
        GrZFvryxAFnI9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8ZwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUIzuXUUUUU=
X-Originating-IP: [124.16.138.128]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It might be better to add  hid_parse() before
wacom_parse_and_register() to ask for the report descriptor.

Fixes: 3c785a0 ("HID: ite: Replace ABS_MISC 120/121 events with touchpad on/off keypresses")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/hid/hid-ite.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 14fc068..3c56f75 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -100,6 +100,10 @@ static int ite_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		return ret;
 
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
 	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 }
 
-- 
2.7.4

