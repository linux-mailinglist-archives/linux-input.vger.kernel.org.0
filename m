Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EA843FF85
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 17:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhJ2Pbt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Oct 2021 11:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhJ2Pbr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Oct 2021 11:31:47 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA1FC061767;
        Fri, 29 Oct 2021 08:29:19 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635521356;
        bh=1Vm+F5pQrRkCe+lCoWHHxZapkTVugC5Vo5k00o6uSQs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pTw43ohd3ZM+6WiTbXobzwlT84ZzVSewRGv1oJdM/4IkkFjii+2FaFVAU4bFVrGTJ
         qwcFiz+LyHrH9SJTIJJ08DlUToeVAXHnr/itYKYnAMscNWqpNoY+HR198JlaEuoMle
         LCPnra29Fh7vMXfqm9Ne0kQFA6WohYMU7eb0QRa4=
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 3/6] HID: intel-ish-hid: fw-loader: only load for matching devices
Date:   Fri, 29 Oct 2021 17:28:58 +0200
Message-Id: <20211029152901.297939-4-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029152901.297939-3-linux@weissschuh.net>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
 <20211029152901.297939-3-linux@weissschuh.net>
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
Cc: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index 1b486f262747..945a9d0b68cd 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -1063,6 +1063,12 @@ static struct ishtp_cl_driver	loader_ishtp_cl_driver = {
 	.reset = loader_ishtp_cl_reset,
 };
 
+static const struct ishtp_device_id loader_ishtp_id_table[] = {
+	{ loader_ishtp_guid },
+	{ }
+};
+MODULE_DEVICE_TABLE(ishtp, loader_ishtp_id_table);
+
 static int __init ish_loader_init(void)
 {
 	return ishtp_cl_driver_register(&loader_ishtp_cl_driver, THIS_MODULE);
@@ -1083,4 +1089,3 @@ MODULE_DESCRIPTION("ISH ISH-TP Host firmware Loader Client Driver");
 MODULE_AUTHOR("Rushikesh S Kadam <rushikesh.s.kadam@intel.com>");
 
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("ishtp:*");
-- 
2.33.1

