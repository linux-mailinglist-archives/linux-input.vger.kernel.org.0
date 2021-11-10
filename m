Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32C044CD8D
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 00:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhKJXDl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 18:03:41 -0500
Received: from todd.t-8ch.de ([159.69.126.157]:59497 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234160AbhKJXDk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 18:03:40 -0500
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1636585249;
        bh=6kSupYZDrrsHghwFMyadPlA4UhiFyStheLD/192wm+o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o3y0RPznS/RR/KNrbekAGSaScQ/aOyHT6fGqZ1Ul0AwwNAjmOO4if6Lb0uFHA4kbx
         ZRpKFTBtIRsiiLZ8+C3Z2gWUlAdnbWIO4NY8tbUPi5tnFpkfG+TlVrAttngbM5kUv7
         HZvn/rVB/hj9dVT7TdIfAIvJ3H98J7bb8ii7P21E=
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
Subject: [PATCH 4/4] platform/x86: isthp_eclite: constify devicetable initializer
Date:   Thu, 11 Nov 2021 00:00:43 +0100
Message-Id: <20211110230043.701167-4-linux@weissschuh.net>
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

Fixes: f155dfeaa4ee ("platform/x86: isthp_eclite: only load for matching devices")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/intel/ishtp_eclite.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/ishtp_eclite.c b/drivers/platform/x86/intel/ishtp_eclite.c
index b9fb8f28fd63..d6709d5c77fd 100644
--- a/drivers/platform/x86/intel/ishtp_eclite.c
+++ b/drivers/platform/x86/intel/ishtp_eclite.c
@@ -93,9 +93,9 @@ struct ishtp_opregion_dev {
 };
 
 /* eclite ishtp client UUID: 6a19cc4b-d760-4de3-b14d-f25ebd0fbcd9 */
-static const guid_t ecl_ishtp_guid =
-	GUID_INIT(0x6a19cc4b, 0xd760, 0x4de3,
-		  0xb1, 0x4d, 0xf2, 0x5e, 0xbd, 0xf, 0xbc, 0xd9);
+#define ECL_ISHTP_GUID GUID_INIT(0x6a19cc4b, 0xd760, 0x4de3, \
+		  0xb1, 0x4d, 0xf2, 0x5e, 0xbd, 0xf, 0xbc, 0xd9)
+static const guid_t ecl_ishtp_guid = ECL_ISHTP_GUID;
 
 /* ACPI DSM UUID: 91d936a7-1f01-49c6-a6b4-72f00ad8d8a5 */
 static const guid_t ecl_acpi_guid =
@@ -682,7 +682,7 @@ static struct ishtp_cl_driver ecl_ishtp_cl_driver = {
 };
 
 static const struct ishtp_device_id ecl_ishtp_id_table[] = {
-	{ ecl_ishtp_guid },
+	{ ECL_ISHTP_GUID },
 	{ }
 };
 MODULE_DEVICE_TABLE(ishtp, ecl_ishtp_id_table);
-- 
2.33.1

