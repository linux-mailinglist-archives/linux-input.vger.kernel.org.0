Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8D843FF8C
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 17:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhJ2Pby (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Oct 2021 11:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhJ2Pbu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Oct 2021 11:31:50 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0B9C061766;
        Fri, 29 Oct 2021 08:29:20 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635521357;
        bh=FKf8tXgSnIqBNyFmoaiDFzhK1fONHzMDls7JdRNe8as=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WSVP9NNHNBNe8yH1yGfOzFjDYa4H8n6qfLAhKXwoh4TKYLwimEIzA7uAvAnmKEe47
         roOnSmJ+MJ1JfKSqTU8Ob5DuvjelIPE5LfsfivZx/PVHdyQo/lUiLeXDXyzbrfOS5U
         +zcqdHZqiMpRIJ1KZ+lLYzmEiL7vNFmdJGZeksgs=
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 5/6] platform/chrome: chros_ec_ishtp: only load for matching devices
Date:   Fri, 29 Oct 2021 17:29:00 +0200
Message-Id: <20211029152901.297939-6-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029152901.297939-5-linux@weissschuh.net>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
 <20211029152901.297939-3-linux@weissschuh.net>
 <20211029152901.297939-4-linux@weissschuh.net>
 <20211029152901.297939-5-linux@weissschuh.net>
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
Cc: Benson Leung <bleung@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Guenter Roeck <groeck@chromium.org>
---
 drivers/platform/chrome/cros_ec_ishtp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 9d1e7e03628e..8c17358e84c1 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -774,6 +774,12 @@ static struct ishtp_cl_driver	cros_ec_ishtp_driver = {
 	},
 };
 
+static const struct ishtp_device_id cros_ec_ishtp_id_table[] = {
+	{ cros_ish_guid },
+	{ }
+};
+MODULE_DEVICE_TABLE(ishtp, cros_ec_ishtp_id_table);
+
 static int __init cros_ec_ishtp_mod_init(void)
 {
 	return ishtp_cl_driver_register(&cros_ec_ishtp_driver, THIS_MODULE);
@@ -791,4 +797,3 @@ MODULE_DESCRIPTION("ChromeOS EC ISHTP Client Driver");
 MODULE_AUTHOR("Rushikesh S Kadam <rushikesh.s.kadam@intel.com>");
 
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("ishtp:*");
-- 
2.33.1

