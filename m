Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9685A621F
	for <lists+linux-input@lfdr.de>; Tue, 30 Aug 2022 13:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbiH3Lib (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 07:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbiH3Lhw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 07:37:52 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BB3F8EEA;
        Tue, 30 Aug 2022 04:36:19 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 045554000D;
        Tue, 30 Aug 2022 11:36:15 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: [v2 1/5] HID: core: Export hid_match_id()
Date:   Tue, 30 Aug 2022 13:36:11 +0200
Message-Id: <20220830113615.4414-1-hadess@hadess.net>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Export hid_match_id() so it can be used in device-specific drivers to
implement their own matching with open-coding a match function.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b7f5566e338d..72f8d8835b34 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2088,6 +2088,7 @@ const struct hid_device_id *hid_match_id(const struct hid_device *hdev,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(hid_match_id);
 
 static const struct hid_device_id hid_hiddev_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MGE, USB_DEVICE_ID_MGE_UPS) },
-- 
2.37.2

