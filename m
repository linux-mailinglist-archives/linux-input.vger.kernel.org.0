Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A532DEDDD6
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 12:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbfKDLoz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 06:44:55 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54673 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfKDLoz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 06:44:55 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iRan0-0006tb-4I; Mon, 04 Nov 2019 12:44:54 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de
Subject: [PATCH resend 1/3] Input: synaptics-rmi4 - fix video buffer size
Date:   Mon,  4 Nov 2019 12:44:52 +0100
Message-Id: <20191104114454.10500-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The video buffer used by the queue is a vb2_v4l2_buffer, not a plain
vb2_buffer. Using the wrong type causes the allocation of the buffer
storage to be too small, causing a out of bounds write when
__init_vb2_v4l2_buffer initializes the buffer.

Fixes: 3a762dbd5347 ("[media] Input: synaptics-rmi4 - add support
                      for F54 diagnostics")
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/rmi4/rmi_f54.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 710b02595486..4841354af0d7 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -359,7 +359,7 @@ static const struct vb2_ops rmi_f54_queue_ops = {
 static const struct vb2_queue rmi_f54_queue = {
 	.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
 	.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF | VB2_READ,
-	.buf_struct_size = sizeof(struct vb2_buffer),
+	.buf_struct_size = sizeof(struct vb2_v4l2_buffer),
 	.ops = &rmi_f54_queue_ops,
 	.mem_ops = &vb2_vmalloc_memops,
 	.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC,
-- 
2.20.1

