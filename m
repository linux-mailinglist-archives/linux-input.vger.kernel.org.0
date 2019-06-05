Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3B7E35D21
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 14:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbfFEMoi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 08:44:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60860 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727870AbfFEMoh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 08:44:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 9814683F51;
        Wed,  5 Jun 2019 12:44:37 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-164.ams2.redhat.com [10.36.116.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E91F360CD6;
        Wed,  5 Jun 2019 12:44:35 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 3/4] Revert "HID: core: Call request_module before doing device_add"
Date:   Wed,  5 Jun 2019 14:44:07 +0200
Message-Id: <20190605124408.8637-4-benjamin.tissoires@redhat.com>
In-Reply-To: <20190605124408.8637-1-benjamin.tissoires@redhat.com>
References: <20190605124408.8637-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 05 Jun 2019 12:44:37 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This reverts commit a025a18fecd4429f4ca66b1746001263c052ecbb.

This patch and 4ceabaf79 are giving extended timeouts
on boot for at least Ubuntu and OpenSuse.

Revert them until we get a better fix.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=203741
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-core.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index fd9e7a4c107d..210b81a56e1a 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2361,14 +2361,6 @@ int hid_add_device(struct hid_device *hdev)
 	dev_set_name(&hdev->dev, "%04X:%04X:%04X.%04X", hdev->bus,
 		     hdev->vendor, hdev->product, atomic_inc_return(&id));
 
-	/*
-	 * Try loading the module for the device before the add, so that we do
-	 * not first have hid-generic binding only to have it replaced
-	 * immediately afterwards with a specialized driver.
-	 */
-	request_module("hid:b%04Xg%04Xv%08Xp%08X",
-		       hdev->bus, hdev->group, hdev->vendor, hdev->product);
-
 	hid_debug_register(hdev, dev_name(&hdev->dev));
 	ret = device_add(&hdev->dev);
 	if (!ret)
-- 
2.19.2

