Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1922443FF81
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 17:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhJ2Pbs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Oct 2021 11:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhJ2Pbr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Oct 2021 11:31:47 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9126C061714;
        Fri, 29 Oct 2021 08:29:18 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635521356;
        bh=XxyRlnq+8Zc9pSgLZiODQgMlckpzCuye+ovfYvG2PuA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HkYi4Lv4nTe7azOKDX6LqRgCI6kwsbcdj53Oi32uJql2r9PrVa6MKVHABoD0jsKji
         JqKG9ycRY388aRsGrCqmdxTlHtbd04lMjrWaCVF9y2gcoIdb//FmZrbcBrn0c6hj46
         p/V4T+ffUXSKr8VIoM0f3a1PA6lZ26a7/StqDPLs=
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 2/6] HID: intel-ish-hid: use constants for modaliases
Date:   Fri, 29 Oct 2021 17:28:57 +0200
Message-Id: <20211029152901.297939-3-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029152901.297939-2-linux@weissschuh.net>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index 334eac611774..e159cd1c5f37 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -350,7 +350,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *a,
 {
 	int len;
 
-	len = snprintf(buf, PAGE_SIZE, "ishtp:%s\n", dev_name(dev));
+	len = snprintf(buf, PAGE_SIZE, ISHTP_MODULE_PREFIX "%s\n", dev_name(dev));
 	return (len >= PAGE_SIZE) ? (PAGE_SIZE - 1) : len;
 }
 static DEVICE_ATTR_RO(modalias);
@@ -363,7 +363,7 @@ ATTRIBUTE_GROUPS(ishtp_cl_dev);
 
 static int ishtp_cl_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
-	if (add_uevent_var(env, "MODALIAS=ishtp:%s", dev_name(dev)))
+	if (add_uevent_var(env, "MODALIAS=" ISHTP_MODULE_PREFIX "%s", dev_name(dev)))
 		return -ENOMEM;
 	return 0;
 }
-- 
2.33.1

