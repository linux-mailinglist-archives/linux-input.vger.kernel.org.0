Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0AB633E26
	for <lists+linux-input@lfdr.de>; Tue, 22 Nov 2022 14:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbiKVNxm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Nov 2022 08:53:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbiKVNxl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Nov 2022 08:53:41 -0500
X-Greylist: delayed 308 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Nov 2022 05:53:39 PST
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2165B66CAC;
        Tue, 22 Nov 2022 05:53:38 -0800 (PST)
Received: from localhost.localdomain (unknown [124.16.138.125])
        by APP-05 (Coremail) with SMTP id zQCowAD3_Owo03xjp0jmAA--.15220S2;
        Tue, 22 Nov 2022 21:48:24 +0800 (CST)
From:   Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH] HID: intel_ish-hid: Add check for ishtp_dma_tx_map
Date:   Tue, 22 Nov 2022 21:48:23 +0800
Message-Id: <20221122134823.540-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_Owo03xjp0jmAA--.15220S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFW8Aw4rXFyDCr43tF43Wrg_yoW8GFW5pF
        4rJFyYkryjvw1xu34xJ3W5u3WruwnYgrW8GrZ7Kw1UZ3W3tF1UG3WDJFyYgr1vgF45J34I
        9FsIyay3CF48XaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkS14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Xr4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUjyxRUUUUU
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As the kcalloc may return NULL pointer,
it should be better to check the ishtp_dma_tx_map
before use in order to avoid NULL pointer dereference.

Fixes: 3703f53b99e4 ("HID: intel_ish-hid: ISH Transport layer")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/hid/intel-ish-hid/ishtp/dma-if.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ishtp/dma-if.c b/drivers/hid/intel-ish-hid/ishtp/dma-if.c
index 40554c8daca0..00046cbfd4ed 100644
--- a/drivers/hid/intel-ish-hid/ishtp/dma-if.c
+++ b/drivers/hid/intel-ish-hid/ishtp/dma-if.c
@@ -104,6 +104,11 @@ void *ishtp_cl_get_dma_send_buf(struct ishtp_device *dev,
 	int required_slots = (size / DMA_SLOT_SIZE)
 		+ 1 * (size % DMA_SLOT_SIZE != 0);
 
+	if (!dev->ishtp_dma_tx_map) {
+		dev_err(dev->devc, "Fail to allocate Tx map\n");
+		return NULL;
+	}
+
 	spin_lock_irqsave(&dev->ishtp_dma_tx_lock, flags);
 	for (i = 0; i <= (dev->ishtp_dma_num_slots - required_slots); i++) {
 		free = 1;
@@ -150,6 +155,11 @@ void ishtp_cl_release_dma_acked_mem(struct ishtp_device *dev,
 		return;
 	}
 
+	if (!dev->ishtp_dma_tx_map) {
+		dev_err(dev->devc, "Fail to allocate Tx map\n");
+		return;
+	}
+
 	i = (msg_addr - dev->ishtp_host_dma_tx_buf) / DMA_SLOT_SIZE;
 	spin_lock_irqsave(&dev->ishtp_dma_tx_lock, flags);
 	for (j = 0; j < acked_slots; j++) {
-- 
2.25.1

