Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C099444FD0
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 08:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhKDHsp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 03:48:45 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:41936 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230084AbhKDHso (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 03:48:44 -0400
Received: from localhost.localdomain (unknown [124.16.138.128])
        by APP-05 (Coremail) with SMTP id zQCowAD3t_Spj4NhSIdBBg--.50132S2;
        Thu, 04 Nov 2021 15:45:45 +0800 (CST)
From:   Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH] HID: wacom: Add parse before start
Date:   Thu,  4 Nov 2021 07:45:44 +0000
Message-Id: <1636011944-3424006-1-git-send-email-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: zQCowAD3t_Spj4NhSIdBBg--.50132S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryDurWDWFWkKr13Kw4UJwb_yoW8Xw17pw
        17C3s8ArZrtr4jva17AryUJry5Gw4xKryxuFy5G3WYvFn5Jr1UAa1xKF1Y9ry8GF48G3Wa
        kr45ta4DKF1UZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUh4SOUUUUU=
X-Originating-IP: [124.16.138.128]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It might be better to add  hid_parse() before
wacom_parse_and_register() to ask for the report descriptor
like what wacom_probe() does.

Fixes: 471d171 ("Input: wacom - move the USB (now hid) Wacom driver in drivers/hid")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/hid/wacom_sys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 57bfa0a..48cb2e4 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2486,6 +2486,9 @@ static void wacom_wireless_work(struct work_struct *work)
 
 		wacom_wac1->pid = wacom_wac->pid;
 		hid_hw_stop(hdev1);
+		error = hid_parse(wacom1->hdev);
+		if (error)
+			goto fail;
 		error = wacom_parse_and_register(wacom1, true);
 		if (error)
 			goto fail;
@@ -2498,6 +2501,9 @@ static void wacom_wireless_work(struct work_struct *work)
 				*((struct wacom_features *)id->driver_data);
 			wacom_wac2->pid = wacom_wac->pid;
 			hid_hw_stop(hdev2);
+			error = hid_parse(wacom2->hdev);
+			if (error)
+				goto fail;
 			error = wacom_parse_and_register(wacom2, true);
 			if (error)
 				goto fail;
@@ -2710,12 +2716,18 @@ static void wacom_mode_change_work(struct work_struct *work)
 	}
 
 	if (wacom1) {
+		error = hid_parse(wacom1->hdev);
+		if (error)
+			return;
 		error = wacom_parse_and_register(wacom1, false);
 		if (error)
 			return;
 	}
 
 	if (wacom2) {
+		error = hid_parse(wacom2->hdev);
+		if (error)
+			return;
 		error = wacom_parse_and_register(wacom2, false);
 		if (error)
 			return;
-- 
2.7.4

