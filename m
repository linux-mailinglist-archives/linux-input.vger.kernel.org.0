Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D182A61491D
	for <lists+linux-input@lfdr.de>; Tue,  1 Nov 2022 12:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiKALcn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Nov 2022 07:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbiKALbr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Nov 2022 07:31:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D001AF33;
        Tue,  1 Nov 2022 04:30:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BBD9FB81CC3;
        Tue,  1 Nov 2022 11:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891DDC433D7;
        Tue,  1 Nov 2022 11:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667302197;
        bh=2aw4lyjmEGeiSkjajOJZd+NWq6sF6awRiAj9M6Ot8TI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bBpW6f0BPwMG/W0R8OqeOQaMruWXKhKLaV0a4HBC0bHfXrI/BZ5bKo4MdeMZg+uNA
         WwfmWixaq7LGQZDTSN2Ks7hpzT/5kmlL9Oa2fmyiRQyTUkPcKcew424SzK17+c+jdu
         mZHNmvIy5dgXbxMopvy0YemIdnn5OcoI5X/JmaYQphTZMafk+K/oJHFQmZW4lDW3Rz
         ljy+vFmeM59haTtzm4WUJFCeWi2JE7n+sjB0jOltCiWuh+kQ3wguKJhJgboh64OqY8
         S5YF0dhppy1vGhXPqjqILQ0YJ3YeeZV9uc+8K/OZAFoYhx/EPtlEKSmMT8GbgvElT3
         giWZb9fwA03NA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Samuel Bailey <samuel.bailey1@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 16/19] HID: saitek: add madcatz variant of MMO7 mouse device ID
Date:   Tue,  1 Nov 2022 07:29:16 -0400
Message-Id: <20221101112919.799868-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112919.799868-1-sashal@kernel.org>
References: <20221101112919.799868-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Samuel Bailey <samuel.bailey1@gmail.com>

[ Upstream commit 79425b297f56bd481c6e97700a9a4e44c7bcfa35 ]

The MadCatz variant of the MMO7 mouse has the ID 0738:1713 and the same
quirks as the Saitek variant.

Signed-off-by: Samuel Bailey <samuel.bailey1@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 drivers/hid/hid-saitek.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index cb2b48d6915e..2c83151334ab 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -845,6 +845,7 @@
 #define USB_DEVICE_ID_MADCATZ_BEATPAD	0x4540
 #define USB_DEVICE_ID_MADCATZ_RAT5	0x1705
 #define USB_DEVICE_ID_MADCATZ_RAT9	0x1709
+#define USB_DEVICE_ID_MADCATZ_MMO7  0x1713
 
 #define USB_VENDOR_ID_MCC		0x09db
 #define USB_DEVICE_ID_MCC_PMD1024LS	0x0076
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 544d1197aca4..8d36cb7551cf 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -608,6 +608,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_MMO7) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_RAT5) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_RAT9) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_MMO7) },
 #endif
 #if IS_ENABLED(CONFIG_HID_SAMSUNG)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAMSUNG, USB_DEVICE_ID_SAMSUNG_IR_REMOTE) },
diff --git a/drivers/hid/hid-saitek.c b/drivers/hid/hid-saitek.c
index c7bf14c01960..b84e975977c4 100644
--- a/drivers/hid/hid-saitek.c
+++ b/drivers/hid/hid-saitek.c
@@ -187,6 +187,8 @@ static const struct hid_device_id saitek_devices[] = {
 		.driver_data = SAITEK_RELEASE_MODE_RAT7 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_MMO7),
 		.driver_data = SAITEK_RELEASE_MODE_MMO7 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_MMO7),
+		.driver_data = SAITEK_RELEASE_MODE_MMO7 },
 	{ }
 };
 
-- 
2.35.1

