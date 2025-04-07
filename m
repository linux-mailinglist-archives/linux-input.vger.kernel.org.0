Return-Path: <linux-input+bounces-11554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB918A7D714
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 10:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08731420598
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 07:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D80225764;
	Mon,  7 Apr 2025 07:56:56 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCA5225A59;
	Mon,  7 Apr 2025 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012616; cv=none; b=KuMI1fQMoUoLOio0ZjauPBYdDmShw4aXRxe3jjW/Y1YC+1niRw0aoAsOa7sFqHOhXRAtvJUSYSyvLl1cerXLKaK+zI0SunugI7eduP3TsUBVlHndj0JgSDp7Y8awTHwII91R8VUGjg7nLYd01ctg31a0Y5hKNpROAHwIoOas7VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012616; c=relaxed/simple;
	bh=bgb3RtcIX109EqyDM7YuECrGBh7ekcYG0hUEaq8XMfw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CijOncvtB2LDlvBjY2f+ugdXDqOMJHGmjyRJuSWxf6LhQAHUxAEqhVLmEc/QqfI3CDttCJ3bYCcDDMJhznpmAjl1o6PE5t6KuPcPcNP/tmxXJ9pH6j0HkyNg85xM1mIDR/ifY6uLwQ8eEUO/dd424fFP+t9RuvzCXB7SWgICu5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 365FA23388;
	Mon,  7 Apr 2025 10:56:42 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	linux-input@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH 5.10/5.15] Input: pegasus-notetaker - check pipe type when probing
Date: Mon,  7 Apr 2025 10:56:42 +0300
Message-Id: <20250407075642.530797-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Soumya Negi <soumya.negi97@gmail.com>

commit b3d80fd27a3c2d8715a40cbf876139b56195f162 upstream.

Fix WARNING in pegasus_open/usb_submit_urb [1]

Warning raised because pegasus_driver submits transfer request for
bogus URB (pipe type does not match endpoint type). Add sanity check at
probe time for pipe value extracted from endpoint descriptor. Probe
will fail if sanity check fails.

Fixes: 1afca2b66aac ("Input: add Pegasus Notetaker tablet driver")
Reported-and-tested-by: syzbot+04ee0cb4caccaed12d78@syzkaller.appspotmail.com
Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
Link: https://lore.kernel.org/r/20230404074145.11523-1-soumya.negi97@gmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
[1] Link: https://syzkaller.appspot.com/bug?id=bbc107584dcf3262253ce93183e51f3612aaeb13
[ kovalev: Added the "Fixes" tag and moved the link to the Syzbot report. ]
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/input/tablet/pegasus_notetaker.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index 749edbdb7ffa49..e79621fd84af39 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -296,6 +296,12 @@ static int pegasus_probe(struct usb_interface *intf,
 	pegasus->intf = intf;
 
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
+	/* Sanity check that pipe's type matches endpoint's type */
+	if (usb_pipe_type_check(dev, pipe)) {
+		error = -EINVAL;
+		goto err_free_mem;
+	}
+
 	pegasus->data_len = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
 
 	pegasus->data = usb_alloc_coherent(dev, pegasus->data_len, GFP_KERNEL,
-- 
2.42.2


