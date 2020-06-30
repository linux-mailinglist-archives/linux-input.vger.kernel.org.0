Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0590420EEBA
	for <lists+linux-input@lfdr.de>; Tue, 30 Jun 2020 08:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbgF3GnM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jun 2020 02:43:12 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:58288 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730002AbgF3GnM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jun 2020 02:43:12 -0400
X-Greylist: delayed 405 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Jun 2020 02:43:11 EDT
Received: from localhost (unknown [159.226.5.99])
        by APP-03 (Coremail) with SMTP id rQCowACnr_Ni3fpeCzNNAQ--.45316S2;
        Tue, 30 Jun 2020 14:36:18 +0800 (CST)
From:   Chen Ni <vulab@iscas.ac.cn>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Xu Wang <vulab@iscas.ac.cn>
Subject: [PATCH] input: misc: remove needless check before usb_free_coherent()
Date:   Tue, 30 Jun 2020 06:36:16 +0000
Message-Id: <20200630063616.8060-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowACnr_Ni3fpeCzNNAQ--.45316S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWrZw4UGr47GFWDGr4kZwb_yoWkCrXEv3
        yUuF9xuryq9F4Ykr4UKwnxZr95tr4I9w4kWrn5tFW5JFWIg3s0vr1UXFZ0yw4DXa9rWF45
        twn2grWFkw4fWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
        1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
        cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26Fkl6r4jowAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8AwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjMmh7UUUUU==
X-Originating-IP: [159.226.5.99]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiAw0DA13qZLQOjQAAsq
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Xu Wang <vulab@iscas.ac.cn>

usb_free_coherent() is safe with NULL addr and this check is
not required.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/input/misc/cm109.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index c09b9628ad34..e413801f0491 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -663,12 +663,8 @@ static const struct usb_device_id cm109_usb_table[] = {
 static void cm109_usb_cleanup(struct cm109_dev *dev)
 {
 	kfree(dev->ctl_req);
-	if (dev->ctl_data)
-		usb_free_coherent(dev->udev, USB_PKT_LEN,
-				  dev->ctl_data, dev->ctl_dma);
-	if (dev->irq_data)
-		usb_free_coherent(dev->udev, USB_PKT_LEN,
-				  dev->irq_data, dev->irq_dma);
+	usb_free_coherent(dev->udev, USB_PKT_LEN, dev->ctl_data, dev->ctl_dma);
+	usb_free_coherent(dev->udev, USB_PKT_LEN, dev->irq_data, dev->irq_dma);
 
 	usb_free_urb(dev->urb_irq);	/* parameter validation in core/urb */
 	usb_free_urb(dev->urb_ctl);	/* parameter validation in core/urb */
-- 
2.17.1

