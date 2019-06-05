Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F105235D29
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 14:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbfFEMon (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 08:44:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46574 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727848AbfFEMoe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 08:44:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A515330860A3;
        Wed,  5 Jun 2019 12:44:34 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-164.ams2.redhat.com [10.36.116.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F1C3061984;
        Wed,  5 Jun 2019 12:44:31 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 2/4] Revert "HID: core: Do not call request_module() in async context"
Date:   Wed,  5 Jun 2019 14:44:06 +0200
Message-Id: <20190605124408.8637-3-benjamin.tissoires@redhat.com>
In-Reply-To: <20190605124408.8637-1-benjamin.tissoires@redhat.com>
References: <20190605124408.8637-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 05 Jun 2019 12:44:34 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This reverts commit 4ceabaf7909d109db6afbffc4ed182741fc32043.

This patch and a025a18fe are giving extended timeouts
on boot for at least Ubuntu and OpenSuse.

Revert them until we get a better fix.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 205d6b82a706..fd9e7a4c107d 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -27,7 +27,6 @@
 #include <linux/vmalloc.h>
 #include <linux/sched.h>
 #include <linux/semaphore.h>
-#include <linux/async.h>
 
 #include <linux/hid.h>
 #include <linux/hiddev.h>
@@ -2367,9 +2366,8 @@ int hid_add_device(struct hid_device *hdev)
 	 * not first have hid-generic binding only to have it replaced
 	 * immediately afterwards with a specialized driver.
 	 */
-	if (!current_is_async())
-		request_module("hid:b%04Xg%04Xv%08Xp%08X", hdev->bus,
-			       hdev->group, hdev->vendor, hdev->product);
+	request_module("hid:b%04Xg%04Xv%08Xp%08X",
+		       hdev->bus, hdev->group, hdev->vendor, hdev->product);
 
 	hid_debug_register(hdev, dev_name(&hdev->dev));
 	ret = device_add(&hdev->dev);
-- 
2.19.2

