Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD00DD39C
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2019 00:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404386AbfJRWTK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 18:19:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:39192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732372AbfJRWHF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 18:07:05 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0BBC222D1;
        Fri, 18 Oct 2019 22:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571436424;
        bh=RKoO/50WWCrVLJkafaQkr4EOtCU9gOnnE+awNfgmwaM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J3+7DCEgDu76lCxX0/yXQ2HimHN6oeP1QcoDi1P2XowE6syFIeuFZlghUvx8Gp8+r
         UxsM+W8DlGRVZm6VZiP9wiSpC3g95nS0FK/5GHgzUoV3ujKfeVtV7YLn5DKNIa1Ks2
         E9RAmRlXTq3BjTquugO7AjTGLx7Zpmsq9sCVE8Bc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dexuan Cui <decui@microsoft.com>, Jiri Kosina <jkosina@suse.cz>,
        Sasha Levin <sashal@kernel.org>, devel@linuxdriverproject.org,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 066/100] HID: hyperv: Use in-place iterator API in the channel callback
Date:   Fri, 18 Oct 2019 18:04:51 -0400
Message-Id: <20191018220525.9042-66-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018220525.9042-1-sashal@kernel.org>
References: <20191018220525.9042-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dexuan Cui <decui@microsoft.com>

[ Upstream commit 6a297c90efa68b2864483193b8bfb0d19478600c ]

Simplify the ring buffer handling with the in-place API.

Also avoid the dynamic allocation and the memory leak in the channel
callback function.

Signed-off-by: Dexuan Cui <decui@microsoft.com>
Acked-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-hyperv.c | 56 +++++++---------------------------------
 1 file changed, 10 insertions(+), 46 deletions(-)

diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
index 704049e62d58a..4d1496f60071f 100644
--- a/drivers/hid/hid-hyperv.c
+++ b/drivers/hid/hid-hyperv.c
@@ -322,60 +322,24 @@ static void mousevsc_on_receive(struct hv_device *device,
 
 static void mousevsc_on_channel_callback(void *context)
 {
-	const int packet_size = 0x100;
-	int ret;
 	struct hv_device *device = context;
-	u32 bytes_recvd;
-	u64 req_id;
 	struct vmpacket_descriptor *desc;
-	unsigned char	*buffer;
-	int	bufferlen = packet_size;
-
-	buffer = kmalloc(bufferlen, GFP_ATOMIC);
-	if (!buffer)
-		return;
-
-	do {
-		ret = vmbus_recvpacket_raw(device->channel, buffer,
-					bufferlen, &bytes_recvd, &req_id);
-
-		switch (ret) {
-		case 0:
-			if (bytes_recvd <= 0) {
-				kfree(buffer);
-				return;
-			}
-			desc = (struct vmpacket_descriptor *)buffer;
-
-			switch (desc->type) {
-			case VM_PKT_COMP:
-				break;
-
-			case VM_PKT_DATA_INBAND:
-				mousevsc_on_receive(device, desc);
-				break;
-
-			default:
-				pr_err("unhandled packet type %d, tid %llx len %d\n",
-					desc->type, req_id, bytes_recvd);
-				break;
-			}
 
+	foreach_vmbus_pkt(desc, device->channel) {
+		switch (desc->type) {
+		case VM_PKT_COMP:
 			break;
 
-		case -ENOBUFS:
-			kfree(buffer);
-			/* Handle large packet */
-			bufferlen = bytes_recvd;
-			buffer = kmalloc(bytes_recvd, GFP_ATOMIC);
-
-			if (!buffer)
-				return;
+		case VM_PKT_DATA_INBAND:
+			mousevsc_on_receive(device, desc);
+			break;
 
+		default:
+			pr_err("Unhandled packet type %d, tid %llx len %d\n",
+			       desc->type, desc->trans_id, desc->len8 * 8);
 			break;
 		}
-	} while (1);
-
+	}
 }
 
 static int mousevsc_connect_to_vsp(struct hv_device *device)
-- 
2.20.1

