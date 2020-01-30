Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E637014E30E
	for <lists+linux-input@lfdr.de>; Thu, 30 Jan 2020 20:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgA3TVa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jan 2020 14:21:30 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:55963 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727538AbgA3TVa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jan 2020 14:21:30 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 4170F5CD;
        Thu, 30 Jan 2020 14:21:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 30 Jan 2020 14:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=iX2uq3EabRfxdrtIMEfdJAiCAY9bG
        HOu8Zg5dRDKJpU=; b=PYwDb2UnTSAu3YsV2FSLVuKD/FW/MYN8qAJoIwPBmF8Tj
        e2aBPMf76jqyAFb9517QxM7ytyZQwZrw+7jHWDzUo08wJIc9VenbAmu07Lq+OES6
        GAEXhLwbgGDDRkhixpQgqTm9wr3cDl9rr1SyvwxmlIsUIpyGe9IswXAv1HVF9X7l
        Ro/DYGrI3PFp98DksXeAj6RGLghUTbM7jlg3wKvvQ/kDmuDKQ3UuI7+GzZm2AZ4m
        /uDxTVkci5xhyHn0NW+tv19//NJz9np0wawjvH4FPh/tYQH16xTpLotHiMmIZaHI
        tbvHOAwmsbOsNBGzSNHjb2dPO+f0xHuWFRG9wtrVQ==
X-ME-Sender: <xms:uCwzXhRJfabid4dwtdFYn7Gw3u6SL-weiQ6TX4YvOgyECgHISZZPGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeekgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
    dtvdenucfhrhhomhepffgrnhhivghlucfnohgtkhihvghruceohhhisegurghnihgvlhhl
    ohgtkhihvghrrdgtohhmqeenucfkphepvddruddvvddrgedurddvtddvnecuvehluhhsth
    gvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhephhhisegurghnihgvlhhl
    ohgtkhihvghrrdgtohhm
X-ME-Proxy: <xmx:uCwzXm5gTjRtOXTJWj8l_SackoS1BqKvCMFX5Wq51WNfb6_7tlMcRw>
    <xmx:uCwzXgH_vrbWAjBc8xIfj8lhBtjQkIynqX6Zr4lEghLWyO_qhYN-TQ>
    <xmx:uCwzXoHePK8DL6VWQzHNH7sXTc29Ao_4WzMaSDgqgK5HGfk4gDaORw>
    <xmx:uCwzXk_SkQUT5OquxG7XJlOXYN1eRxvoCyMQ04HDEb1puB3BPnlMiQ>
Received: from localhost (unknown [2.122.41.202])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4E1043060840;
        Thu, 30 Jan 2020 14:21:28 -0500 (EST)
Date:   Thu, 30 Jan 2020 19:21:26 +0000
From:   Daniel Lockyer <hi@daniellockyer.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: [PATCH] HID: Add quirk for Apple Magic Keyboard over Bluetooth
Message-ID: <20200130192126.GA101099@ariel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Apple Magic Keyboard works flawlessly over USB but has weird bugs
over Bluetooth. This patch adds the missing quirk.

Signed-off-by: Daniel Lockyer <hi@daniellockyer.com>
---
 drivers/hid/hid-quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 0e7b2d998395..6d68a9201e1d 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -280,6 +280,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS) },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
-- 
2.25.0

