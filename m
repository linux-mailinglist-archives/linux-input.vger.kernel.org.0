Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF02649CA2
	for <lists+linux-input@lfdr.de>; Mon, 12 Dec 2022 11:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbiLLKnM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Dec 2022 05:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbiLLKlM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Dec 2022 05:41:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B6BEE33;
        Mon, 12 Dec 2022 02:36:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B3988B80C8B;
        Mon, 12 Dec 2022 10:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0556C433F1;
        Mon, 12 Dec 2022 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670841381;
        bh=FNDevMvDQYjJvIM61DJo57BWb/uarRZE4PxJGOZCs6s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gXjrNeDg5aNnIxrm11Uqi3p9zMszUJ7R7M2NDj1zb4kI3xbM9Dl/7EuCB41+Te5Lt
         VWpFB3AehcfSClAqapvhMNlf7KFCC3UJBHp3QWAyF5wOkmkDILOISs2doxO6OC2l9J
         6XiEcnQDgTHr98+HGzoQb87LC8iprB0VsR6Qzb4OxmfHp96RxVInstigU+sYq0/eqZ
         rctLvPDA7/A4sdkCOqJa2dMGPAPRXz6xHNo7oBGKmlgWN3fmQvE939hV5syOKqQez6
         NG8BJQsThNw44SKpu1m7D7mJ2/rsjA4e38ryvapRSLQiuGrjkG2ATg5JdNEyRkWJWW
         iBSW5ffMl7tTg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jkosina@suse.cz>,
        Sasha Levin <sashal@kernel.org>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 2/7] HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer Aspire Switch 10E
Date:   Mon, 12 Dec 2022 05:36:10 -0500
Message-Id: <20221212103616.300049-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221212103616.300049-1-sashal@kernel.org>
References: <20221212103616.300049-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit b7c20f3815985570ac71c39b1a3e68c201109578 ]

The Acer Aspire Switch 10E (SW3-016)'s keyboard-dock uses the same USB-ids
as the Acer One S1003 keyboard-dock. Yet they are not entirely the same:

1. The S1003 keyboard-dock has the same report descriptors as the
S1002 keyboard-dock (which has different USB-ids)

2. The Acer Aspire Switch 10E's keyboard-dock has different
report descriptors from the S1002/S1003 keyboard docks and it
sends 0x00880078 / 0x00880079 usage events when the touchpad is
toggled on/off (which is handled internally).

This means that all Acer kbd-docks handled by the hid-ite.c drivers
report their touchpad being toggled on/off through these custom
usage-codes with the exception of the S1003 dock, which likely is
a bug of that dock.

Add a QUIRK_TOUCHPAD_ON_OFF_REPORT quirk for the Aspire Switch 10E / S1003
usb-id so that the touchpad toggling will get reported to userspace on
the Aspire Switch 10E.

Since the Aspire Switch 10E's kbd-dock has different report-descriptors,
this also requires adding support for fixing those to ite_report_fixup().

Setting the quirk will also cause ite_report_fixup() to hit the
S1002/S1003 descriptors path on the S1003. Since the S1003 kbd-dock
never generates any input-reports for the fixed up part of the
descriptors this does not matter; and if there are versions out there
which do actually send input-reports for the touchpad-toggle then the
fixup should actually help to make things work.

This was tested on both an Acer Aspire Switch 10E and on an Acer One S1003.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Stable-dep-of: 9ad6645a9dce ("HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer Aspire Switch V 10")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ite.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 22bfbebceaf4..14fc068affad 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -23,11 +23,16 @@ static __u8 *ite_report_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int
 			hid_info(hdev, "Fixing up Acer Sw5-012 ITE keyboard report descriptor\n");
 			rdesc[163] = HID_MAIN_ITEM_RELATIVE;
 		}
-		/* For Acer One S1002 keyboard-dock */
+		/* For Acer One S1002/S1003 keyboard-dock */
 		if (*rsize == 188 && rdesc[185] == 0x81 && rdesc[186] == 0x02) {
-			hid_info(hdev, "Fixing up Acer S1002 ITE keyboard report descriptor\n");
+			hid_info(hdev, "Fixing up Acer S1002/S1003 ITE keyboard report descriptor\n");
 			rdesc[186] = HID_MAIN_ITEM_RELATIVE;
 		}
+		/* For Acer Aspire Switch 10E (SW3-016) keyboard-dock */
+		if (*rsize == 210 && rdesc[184] == 0x81 && rdesc[185] == 0x02) {
+			hid_info(hdev, "Fixing up Acer Aspire Switch 10E (SW3-016) ITE keyboard report descriptor\n");
+			rdesc[185] = HID_MAIN_ITEM_RELATIVE;
+		}
 	}
 
 	return rdesc;
@@ -114,7 +119,8 @@ static const struct hid_device_id ite_devices[] = {
 	/* ITE8910 USB kbd ctlr, with Synaptics touchpad connected to it. */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_SYNAPTICS,
-		     USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003) },
+		     USB_DEVICE_ID_SYNAPTICS_ACER_ONE_S1003),
+	  .driver_data = QUIRK_TOUCHPAD_ON_OFF_REPORT },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, ite_devices);
-- 
2.35.1

