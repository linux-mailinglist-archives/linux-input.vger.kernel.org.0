Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2174144CD8B
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 00:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbhKJXDk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 18:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbhKJXDj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 18:03:39 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA205C061766;
        Wed, 10 Nov 2021 15:00:51 -0800 (PST)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1636585249;
        bh=Y5o2gmy5NesHvtQl0fjBOlhMoxRkLPEq9aVwfTh8pyk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jqHRX+PBkna5H1Npx+9oR6XosmPgl5IR7nTtv/OYKI7qD8YWkuHEF3XGdxUMss95w
         DyOx2oQiXxJ/vbzbgQgbtc1A4jb3OTVEzihrShWt4zae6r03y/z8w/8uyfNiywS2HS
         mK+0ww91l68kpTIBJHwfX+yPOoZ3C3Q+66QJGnio=
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
Subject: [PATCH 3/4] platform/chrome: chros_ec_ishtp: constify devicetable initializer
Date:   Thu, 11 Nov 2021 00:00:42 +0100
Message-Id: <20211110230043.701167-3-linux@weissschuh.net>
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

Fixes: facfe0a4fdce ("platform/chrome: chros_ec_ishtp: only load for matching devices")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/cros_ec_ishtp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 8c17358e84c1..2e635fee854c 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -41,9 +41,9 @@ enum cros_ec_ish_channel {
 #define ISHTP_SEND_TIMEOUT			(3 * HZ)
 
 /* ISH Transport CrOS EC ISH client unique GUID */
-static const guid_t cros_ish_guid =
-	GUID_INIT(0x7b7154d0, 0x56f4, 0x4bdc,
-		  0xb0, 0xd8, 0x9e, 0x7c, 0xda,	0xe0, 0xd6, 0xa0);
+#define CROS_ISH_GUID GUID_INIT(0x7b7154d0, 0x56f4, 0x4bdc, \
+		  0xb0, 0xd8, 0x9e, 0x7c, 0xda,	0xe0, 0xd6, 0xa0)
+static const guid_t cros_ish_guid = CROS_ISH_GUID;
 
 struct header {
 	u8 channel;
@@ -775,7 +775,7 @@ static struct ishtp_cl_driver	cros_ec_ishtp_driver = {
 };
 
 static const struct ishtp_device_id cros_ec_ishtp_id_table[] = {
-	{ cros_ish_guid },
+	{ CROS_ISH_GUID },
 	{ }
 };
 MODULE_DEVICE_TABLE(ishtp, cros_ec_ishtp_id_table);
-- 
2.33.1

