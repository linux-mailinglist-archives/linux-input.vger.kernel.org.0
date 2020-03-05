Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3775C17ABB8
	for <lists+linux-input@lfdr.de>; Thu,  5 Mar 2020 18:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgCERPs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 12:15:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:42652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728241AbgCERPs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Mar 2020 12:15:48 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBBF620870;
        Thu,  5 Mar 2020 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583428547;
        bh=hpF8zznMm4m0JJ0G+TbKS/PfMRfN2OuwKsWCkHwXLbs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hkJNPkHXYFPyZCrwjsuWG7rNYxpznNC8VgHetNKvjm9kgllVsf0FRE+MPKuCYohrZ
         9v+s81Mrd73RZs2rJI1BQGK2XVOjForsNhG+CaaGxIQuWTGM3RShE5WNZdNas9tShx
         EmgCkxkzleTRA7fDFsci4MxLzC+EsXQEw+MJAeek=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 05/19] HID: hiddev: Fix race in in hiddev_disconnect()
Date:   Thu,  5 Mar 2020 12:15:26 -0500
Message-Id: <20200305171540.30250-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305171540.30250-1-sashal@kernel.org>
References: <20200305171540.30250-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>

[ Upstream commit 5c02c447eaeda29d3da121a2e17b97ccaf579b51 ]

Syzbot reports that "hiddev" is used after it's free in hiddev_disconnect().
The hiddev_disconnect() function sets "hiddev->exist = 0;" so
hiddev_release() can free it as soon as we drop the "existancelock"
lock.  This patch moves the mutex_unlock(&hiddev->existancelock) until
after we have finished using it.

Reported-by: syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com
Fixes: 7f77897ef2b6 ("HID: hiddev: fix potential use-after-free")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/usbhid/hiddev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index bccd97cdc53f9..d9602f3a359e1 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -954,9 +954,9 @@ void hiddev_disconnect(struct hid_device *hid)
 	hiddev->exist = 0;
 
 	if (hiddev->open) {
-		mutex_unlock(&hiddev->existancelock);
 		hid_hw_close(hiddev->hid);
 		wake_up_interruptible(&hiddev->wait);
+		mutex_unlock(&hiddev->existancelock);
 	} else {
 		mutex_unlock(&hiddev->existancelock);
 		kfree(hiddev);
-- 
2.20.1

