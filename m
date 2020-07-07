Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB0DC216473
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 05:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgGGDJQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 23:09:16 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:56310 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726961AbgGGDJQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Jul 2020 23:09:16 -0400
Received: from ubuntu.localdomain (unknown [124.16.136.99])
        by APP-05 (Coremail) with SMTP id zQCowAA3hSRR5wNfQg+nAw--.53614S2;
        Tue, 07 Jul 2020 11:09:06 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] input: misc: remove needless check before usb_free_coherent()
Date:   Tue,  7 Jul 2020 11:09:05 +0800
Message-Id: <20200707030905.3123-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAA3hSRR5wNfQg+nAw--.53614S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWrZw4UGr47GFWDGr4kZwb_yoWkXrXEv3
        yUuF9xuryq9F4Ykr4UKwnxZr95tr4I9ws7urn8tFW5XFWIg3s0vr1UXFZ0yw4DXa9rWFW5
        t3s2grWFkw4rWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb28YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r48MxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jxXocUUUUU=
X-Originating-IP: [124.16.136.99]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwIKA102YlrYZQAAsi
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

