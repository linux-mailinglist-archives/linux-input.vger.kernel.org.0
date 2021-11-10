Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A56A44CD8A
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 00:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234187AbhKJXDk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 18:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234182AbhKJXDj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 18:03:39 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA334C061767;
        Wed, 10 Nov 2021 15:00:51 -0800 (PST)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1636585249;
        bh=JNTYqQ2cqHeyvdtglZHIL3kmDnAz5/OnGEDYq81CnOg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gdF0b8DxjCDbSGQinTCpxRSnAPUmwWFG/0LOw3UrBSVruA6YtOg/QEAaeF7theQ1e
         AcbYbWwf5zYAlzORmA2mFdEbC7q7Lr/m2Jo5xk6ap97V4HHOt8yAUB8ZifNtuXFpF0
         gfsfRDZRYrCIUydW5XYjQEXjZSjm4wJNtP25DV54=
To:     Nathan Chancellor <nathan@kernel.org>, linux-input@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>, llvm@lists.linux.dev
Subject: [PATCH 2/4] HID: intel-ish-hid: hid-client: constify devicetable initializer
Date:   Thu, 11 Nov 2021 00:00:41 +0100
Message-Id: <20211110230043.701167-2-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <YYv22iWQ7yTfMNC5@archlinux-ax161>
References: <YYv22iWQ7yTfMNC5@archlinux-ax161>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Previously the compilation broke on clang and gcc < 8.1.0 with errors like
"error: initializer element is not constant".

Fixes: 0d0cccc0fd83 ("HID: intel-ish-hid: hid-client: only load for matching devices")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index fb47d38d1e87..cff7da0578b6 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -12,9 +12,9 @@
 #include "ishtp-hid.h"
 
 /* ISH Transport protocol (ISHTP in short) GUID */
-static const guid_t hid_ishtp_guid =
-	GUID_INIT(0x33AECD58, 0xB679, 0x4E54,
-		  0x9B, 0xD9, 0xA0, 0x4D, 0x34, 0xF0, 0xC2, 0x26);
+#define HID_ISHTP_GUID	GUID_INIT(0x33AECD58, 0xB679, 0x4E54, \
+		  0x9B, 0xD9, 0xA0, 0x4D, 0x34, 0xF0, 0xC2, 0x26)
+static const guid_t hid_ishtp_guid = HID_ISHTP_GUID;
 
 /* Rx ring buffer pool size */
 #define HID_CL_RX_RING_SIZE	32
@@ -953,7 +953,7 @@ static struct ishtp_cl_driver	hid_ishtp_cl_driver = {
 };
 
 static const struct ishtp_device_id hid_ishtp_id_table[] = {
-	{ hid_ishtp_guid },
+	{ HID_ISHTP_GUID },
 	{ }
 };
 MODULE_DEVICE_TABLE(ishtp, hid_ishtp_id_table);
-- 
2.33.1

