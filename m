Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48E0A5B49AD
	for <lists+linux-input@lfdr.de>; Sat, 10 Sep 2022 23:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbiIJVWF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 17:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiIJVVP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 17:21:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38054F653;
        Sat, 10 Sep 2022 14:18:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 710B360EBC;
        Sat, 10 Sep 2022 21:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F4AC433B5;
        Sat, 10 Sep 2022 21:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662844687;
        bh=AfdJmkxYl4fp0gaMB1jEJ0ekn7GLEIObkapGRoAp1ck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZKi/TT7CK8F4QKb64YNXTdXHk/C7XrZio+k6qZXW+dYuOS2ijDx1rSnVqsrx7sA8E
         6TFcx8MPEnpqncJPILjU7ATvDHoiQE/WOWDb7fa2kr+nL94/3PRh/pzoIyB+jUhjm6
         ePT/JyrpMwDcgupd5aBfIIzEeCM9v8YfUhqSLCN3Eg5tdtdd+DWQJEFxMqrJlUMIVA
         FFnjiAob9vDbxJOOGS/jovtAjH1eYZB6MCU1fWv9w/8yPFoVdQ+RVGRjMtctCoWiLv
         B2Ndp/FH+SeSqKjDDZtouuxTtwGK12lfiqtRSTuXN9fmGKXu4nYaqZaZEgsK0BciNj
         WbU6RR7mu9MSg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Even Xu <even.xu@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/21] hid: intel-ish-hid: ishtp: Fix ishtp client sending disordered message
Date:   Sat, 10 Sep 2022 17:17:39 -0400
Message-Id: <20220910211752.70291-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211752.70291-1-sashal@kernel.org>
References: <20220910211752.70291-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Even Xu <even.xu@intel.com>

[ Upstream commit e1fa076706209cc447d7a2abd0843a18277e5ef7 ]

There is a timing issue captured during ishtp client sending stress tests.
It was observed during stress tests that ISH firmware is getting out of
ordered messages. This is a rare scenario as the current set of ISH client
drivers don't send much data to firmware. But this may not be the case
going forward.

When message size is bigger than IPC MTU, ishtp splits the message into
fragments and uses serialized async method to send message fragments.
The call stack:
ishtp_cl_send_msg_ipc->ipc_tx_callback(first fregment)->
ishtp_send_msg(with callback)->write_ipc_to_queue->
write_ipc_from_queue->callback->ipc_tx_callback(next fregment)......

When an ipc write complete interrupt is received, driver also calls
write_ipc_from_queue->ipc_tx_callback in ISR to start sending of next fragment.

Through ipc_tx_callback uses spin_lock to protect message splitting, as the
serialized sending method will call back to ipc_tx_callback again, so it doesn't
put sending under spin_lock, it causes driver cannot guarantee all fragments
be sent in order.

Considering this scenario:
ipc_tx_callback just finished a fragment splitting, and not call ishtp_send_msg
yet, there is a write complete interrupt happens, then ISR->write_ipc_from_queue
->ipc_tx_callback->ishtp_send_msg->write_ipc_to_queue......

Because ISR has higher exec priority than normal thread, this causes the new
fragment be sent out before previous fragment. This disordered message causes
invalid message to firmware.

The solution is, to send fragments synchronously:
Use ishtp_write_message writing fragments into tx queue directly one by one,
instead of ishtp_send_msg only writing one fragment with completion callback.
As no completion callback be used, so change ipc_tx_callback to ipc_tx_send.

Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/intel-ish-hid/ishtp/client.c | 68 ++++++++++++++----------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/client.c b/drivers/hid/intel-ish-hid/ishtp/client.c
index 405e0d5212cc8..df0a825694f52 100644
--- a/drivers/hid/intel-ish-hid/ishtp/client.c
+++ b/drivers/hid/intel-ish-hid/ishtp/client.c
@@ -626,13 +626,14 @@ static void ishtp_cl_read_complete(struct ishtp_cl_rb *rb)
 }
 
 /**
- * ipc_tx_callback() - IPC tx callback function
+ * ipc_tx_send() - IPC tx send function
  * @prm: Pointer to client device instance
  *
- * Send message over IPC either first time or on callback on previous message
- * completion
+ * Send message over IPC. Message will be split into fragments
+ * if message size is bigger than IPC FIFO size, and all
+ * fragments will be sent one by one.
  */
-static void ipc_tx_callback(void *prm)
+static void ipc_tx_send(void *prm)
 {
 	struct ishtp_cl	*cl = prm;
 	struct ishtp_cl_tx_ring	*cl_msg;
@@ -677,32 +678,41 @@ static void ipc_tx_callback(void *prm)
 			    list);
 	rem = cl_msg->send_buf.size - cl->tx_offs;
 
-	ishtp_hdr.host_addr = cl->host_client_id;
-	ishtp_hdr.fw_addr = cl->fw_client_id;
-	ishtp_hdr.reserved = 0;
-	pmsg = cl_msg->send_buf.data + cl->tx_offs;
+	while (rem > 0) {
+		ishtp_hdr.host_addr = cl->host_client_id;
+		ishtp_hdr.fw_addr = cl->fw_client_id;
+		ishtp_hdr.reserved = 0;
+		pmsg = cl_msg->send_buf.data + cl->tx_offs;
+
+		if (rem <= dev->mtu) {
+			/* Last fragment or only one packet */
+			ishtp_hdr.length = rem;
+			ishtp_hdr.msg_complete = 1;
+			/* Submit to IPC queue with no callback */
+			ishtp_write_message(dev, &ishtp_hdr, pmsg);
+			cl->tx_offs = 0;
+			cl->sending = 0;
 
-	if (rem <= dev->mtu) {
-		ishtp_hdr.length = rem;
-		ishtp_hdr.msg_complete = 1;
-		cl->sending = 0;
-		list_del_init(&cl_msg->list);	/* Must be before write */
-		spin_unlock_irqrestore(&cl->tx_list_spinlock, tx_flags);
-		/* Submit to IPC queue with no callback */
-		ishtp_write_message(dev, &ishtp_hdr, pmsg);
-		spin_lock_irqsave(&cl->tx_free_list_spinlock, tx_free_flags);
-		list_add_tail(&cl_msg->list, &cl->tx_free_list.list);
-		++cl->tx_ring_free_size;
-		spin_unlock_irqrestore(&cl->tx_free_list_spinlock,
-			tx_free_flags);
-	} else {
-		/* Send IPC fragment */
-		spin_unlock_irqrestore(&cl->tx_list_spinlock, tx_flags);
-		cl->tx_offs += dev->mtu;
-		ishtp_hdr.length = dev->mtu;
-		ishtp_hdr.msg_complete = 0;
-		ishtp_send_msg(dev, &ishtp_hdr, pmsg, ipc_tx_callback, cl);
+			break;
+		} else {
+			/* Send ipc fragment */
+			ishtp_hdr.length = dev->mtu;
+			ishtp_hdr.msg_complete = 0;
+			/* All fregments submitted to IPC queue with no callback */
+			ishtp_write_message(dev, &ishtp_hdr, pmsg);
+			cl->tx_offs += dev->mtu;
+			rem = cl_msg->send_buf.size - cl->tx_offs;
+		}
 	}
+
+	list_del_init(&cl_msg->list);
+	spin_unlock_irqrestore(&cl->tx_list_spinlock, tx_flags);
+
+	spin_lock_irqsave(&cl->tx_free_list_spinlock, tx_free_flags);
+	list_add_tail(&cl_msg->list, &cl->tx_free_list.list);
+	++cl->tx_ring_free_size;
+	spin_unlock_irqrestore(&cl->tx_free_list_spinlock,
+		tx_free_flags);
 }
 
 /**
@@ -720,7 +730,7 @@ static void ishtp_cl_send_msg_ipc(struct ishtp_device *dev,
 		return;
 
 	cl->tx_offs = 0;
-	ipc_tx_callback(cl);
+	ipc_tx_send(cl);
 	++cl->send_msg_cnt_ipc;
 }
 
-- 
2.35.1

