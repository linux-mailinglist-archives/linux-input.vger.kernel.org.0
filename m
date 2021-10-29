Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49EF043FF87
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 17:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhJ2Pbw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Oct 2021 11:31:52 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:49145 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230078AbhJ2Pbu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Oct 2021 11:31:50 -0400
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635521356;
        bh=Ce5DxgP/kBEplR9HOobeUaGFgTryud+39iLlnv3yVjk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p6yb5Qn1+y6Uhgwh9Hhn1G9OCMjxFp9herrBAvpgp6+56qp+GHNrVRhh3a5ryzf8Q
         2NPLOzeM0ilzyzfX3h0+uiO9kwKs4+QWXU/IA9OOR61n3jVAH2n5odeNFs0ykTdx4B
         9e2jQkDjZwW/xzfJsKDL+z9p6AgGtV92v66UjIXs=
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 4/6] HID: intel-ish-hid: hid-client: only load for matching devices
Date:   Fri, 29 Oct 2021 17:28:59 +0200
Message-Id: <20211029152901.297939-5-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029152901.297939-4-linux@weissschuh.net>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
 <20211029152901.297939-3-linux@weissschuh.net>
 <20211029152901.297939-4-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Previously it was loaded for all ISHTP devices.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index 91bf4d01e91a..fb47d38d1e87 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -952,6 +952,12 @@ static struct ishtp_cl_driver	hid_ishtp_cl_driver = {
 	.driver.pm = &hid_ishtp_pm_ops,
 };
 
+static const struct ishtp_device_id hid_ishtp_id_table[] = {
+	{ hid_ishtp_guid },
+	{ }
+};
+MODULE_DEVICE_TABLE(ishtp, hid_ishtp_id_table);
+
 static int __init ish_hid_init(void)
 {
 	int	rv;
@@ -981,4 +987,3 @@ MODULE_AUTHOR("Daniel Drubin <daniel.drubin@intel.com>");
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("ishtp:*");
-- 
2.33.1

