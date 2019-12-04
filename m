Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15CCE112175
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2019 03:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfLDChU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Dec 2019 21:37:20 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:52842 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfLDChU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Dec 2019 21:37:20 -0500
Received: from localhost.localdomain (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 0174FCEC92;
        Wed,  4 Dec 2019 03:46:27 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Fabian Henneke <fabian.henneke@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hidraw: Fix returning EPOLLOUT from hidraw_poll
Date:   Wed,  4 Dec 2019 03:37:13 +0100
Message-Id: <20191204023713.3983-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When polling a connected /dev/hidrawX device, it is useful to get the
EPOLLOUT when writing is possible. Since writing is possible as soon as
the device is connected, always return it.

Right now EPOLLOUT is only returned when there are also input reports
are available. This works if devices start sending reports when
connected, but some HID devices might need an output report first before
sending any input reports. This change will allow using EPOLLOUT here as
well.

Fixes: 378b80370aa1 ("hidraw: Return EPOLLOUT from hidraw_poll")
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Cc: stable@vger.kernel.org
---
 drivers/hid/hidraw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index bbc6ec1aa5cb..c25e95c19cad 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -252,10 +252,10 @@ static __poll_t hidraw_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &list->hidraw->wait, wait);
 	if (list->head != list->tail)
-		return EPOLLIN | EPOLLRDNORM | EPOLLOUT;
+		return EPOLLIN | EPOLLRDNORM;
 	if (!list->hidraw->exist)
 		return EPOLLERR | EPOLLHUP;
-	return 0;
+	return EPOLLOUT | EPOLLWRNORM;
 }
 
 static int hidraw_open(struct inode *inode, struct file *file)
-- 
2.23.0

