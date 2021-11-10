Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6B744CD8C
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 00:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbhKJXDl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 18:03:41 -0500
Received: from todd.t-8ch.de ([159.69.126.157]:39497 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234180AbhKJXDk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 18:03:40 -0500
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1636585249;
        bh=jgSV9Z9MqHjSxHGGmmXPD4jqhlmIQznQK2wX8feu1ng=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tiGqZQ5v1W5buGFpAkz4UgDOJRJ6NtK/pMnlsP/XLKEQjIZh6plDL7oAFRq1UF05m
         nxIC05QrIK2nYJpNEcpVtAP8mNzBCBDwOZt754TT5Hmw7ec60Wo8Rer8nttEBrSy+T
         kjbkoi2J88VSnBhFJANyrbGS31+Is03mo4CrX6co=
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
Subject: [PATCH 1/4] HID: intel-ish-hid: fw-loader: constify devicetable initializer
Date:   Thu, 11 Nov 2021 00:00:40 +0100
Message-Id: <20211110230043.701167-1-linux@weissschuh.net>
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

Fixes: 44e2a58cb880 ("HID: intel-ish-hid: fw-loader: only load for matching devices")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index 945a9d0b68cd..26f376faf0e6 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -76,9 +76,9 @@ enum ish_loader_commands {
 #define LOADER_XFER_MODE_ISHTP			BIT(1)
 
 /* ISH Transport Loader client unique GUID */
-static const guid_t loader_ishtp_guid =
-	GUID_INIT(0xc804d06a, 0x55bd, 0x4ea7,
-		  0xad, 0xed, 0x1e, 0x31, 0x22, 0x8c, 0x76, 0xdc);
+#define ISHTP_GUID GUID_INIT(0xc804d06a, 0x55bd, 0x4ea7, \
+		  0xad, 0xed, 0x1e, 0x31, 0x22, 0x8c, 0x76, 0xdc)
+static const guid_t loader_ishtp_guid = ISHTP_GUID;
 
 #define FILENAME_SIZE				256
 
@@ -1064,7 +1064,7 @@ static struct ishtp_cl_driver	loader_ishtp_cl_driver = {
 };
 
 static const struct ishtp_device_id loader_ishtp_id_table[] = {
-	{ loader_ishtp_guid },
+	{ ISHTP_GUID },
 	{ }
 };
 MODULE_DEVICE_TABLE(ishtp, loader_ishtp_id_table);

base-commit: 64355db3caf6468dc711995239efe0cbcd7d0091
-- 
2.33.1

