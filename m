Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6CB668BF09
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjBFN7R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjBFN7F (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:59:05 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D94EEB46;
        Mon,  6 Feb 2023 05:58:22 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 68B246000A;
        Mon,  6 Feb 2023 13:58:18 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [PATCH 3/3] HID: logitech-hidpp: Add myself to authors
Date:   Mon,  6 Feb 2023 14:58:08 +0100
Message-Id: <20230206135808.8840-3-hadess@hadess.net>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206135808.8840-1-hadess@hadess.net>
References: <20230206135808.8840-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-logitech-hidpp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index ef497a82fe4e..fa0c8d1a89e3 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -30,6 +30,7 @@
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
 MODULE_AUTHOR("Nestor Lopez Casado <nlopezcasad@logitech.com>");
+MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
 
 static bool disable_tap_to_click;
 module_param(disable_tap_to_click, bool, 0644);
-- 
2.39.1

