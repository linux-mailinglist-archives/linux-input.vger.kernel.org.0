Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF1670DFF0
	for <lists+linux-input@lfdr.de>; Tue, 23 May 2023 17:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236358AbjEWPLF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 11:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbjEWPLE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 11:11:04 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB76FA
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 08:11:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
        by baptiste.telenet-ops.be with bizsmtp
        id 0FB02A00N0Jkz7G01FB0AQ; Tue, 23 May 2023 17:11:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1Tew-002swO-7G;
        Tue, 23 May 2023 17:11:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1TfA-00CkN0-KM;
        Tue, 23 May 2023 17:11:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>,
        Daniel Latypov <dlatypov@google.com>
Cc:     linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] HID: uclogic: Modular KUnit tests should not depend on KUNIT=y
Date:   Tue, 23 May 2023 17:10:59 +0200
Message-Id: <f325bf521f1cdc498dbd48b14191d186bdf7b602.1684854545.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While KUnit tests that cannot be built as a loadable module must depend
on "KUNIT=y", this is not true for modular tests, where it adds an
unnecessary limitation.

Fix this by relaxing the dependency to "KUNIT".

Fixes: 08809e482a1c44d9 ("HID: uclogic: KUnit best practices and naming conventions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/hid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4ce012f83253ec9f..b977450cac75265d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1285,7 +1285,7 @@ config HID_MCP2221
 
 config HID_KUNIT_TEST
 	tristate "KUnit tests for HID" if !KUNIT_ALL_TESTS
-	depends on KUNIT=y
+	depends on KUNIT
 	depends on HID_BATTERY_STRENGTH
 	depends on HID_UCLOGIC
 	default KUNIT_ALL_TESTS
-- 
2.34.1

