Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E42C31F193
	for <lists+linux-input@lfdr.de>; Thu, 18 Feb 2021 22:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhBRVMF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 16:12:05 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53491 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230182AbhBRVL7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 16:11:59 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 1D3815C0131;
        Thu, 18 Feb 2021 16:10:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 18 Feb 2021 16:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qwJ04rMtMgSAuol/f
        anTXRFDGTV+7jpGQ7q9v0ZNc+o=; b=a9eOaqe0SeMeXTv8I9oq2W7p/ATS+bJaI
        P6J0QmwhMMMFNT+wIBlwv1IEG0VwgSpXxT4S8/DAWcLo0WFFCseXiW3M8EGrzQrb
        Openxj5WKumYiDcHksf1MLwp4Bm4aQnVFLrtgjHLQ6eG+v51sLNeOT1J41zwrPMI
        WTJpvDTJ14xx/EKq17IGSOncy32EqpuMA0lsAR/blzuiXR2u9aiX/x9xY6M6u4nz
        UGGmVoV02Xq0LkpbATnsSNGQM3979/Qq9EEcwBz5P8AcD2j31Ztx/i0esxYFRXV8
        oKk/tFQhcQT0stj+uFkC5ek25ZsJpTZ5byKwGWWXaYMnj6Slyb+rg==
X-ME-Sender: <xms:19cuYLICg5vlBnou4OSlUhmVeLKey-f-GHrXcZAUk9ReMK8kwJPIfw>
    <xme:19cuYPSS3c2HBzR1mM80KnhULanQC7XrAVkqWXNuEwhyBnRe5JlS8ZeojeFGzwBKu
    u6LWz2-dC-Co1Zp2Cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeggddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepnfhukhgvucffucflohhnvghsuceolhhukhgvsehljhhonhgvshdr
    uggvvheqnecuggftrfgrthhtvghrnhepfffghfehheekgfdttdeihfdugeetkeduiefhvd
    dujeduiefgtdehieejtedvjedvnecukfhppeduudeirddvhedurdduleefrdduleeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvse
    hljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:19cuYLrTITi6jQh3RnUbksQ56ECz1Wwi7NMnIItL-kdO9gGX_uAIDQ>
    <xmx:19cuYMoCRynxNxG9LpJXt4dD70ReldH7_WFVsF1sTi9dbYVQg1F9Tg>
    <xmx:19cuYNO534u7M_pLgvVdRKkBeC6HHuLvnjkpcX_n6RgubivVKdtGHg>
    <xmx:2NcuYIrGlUQwiCXVESZD6B9xVszm8S5NotrqsSeyvxGGeiFFtomcow>
Received: from localhost.localdomain (unknown [116.251.193.196])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0B466240057;
        Thu, 18 Feb 2021 16:10:43 -0500 (EST)
From:   Luke D Jones <luke@ljones.dev>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, Luke D Jones <luke@ljones.dev>
Subject: [PATCH] HID: asus: Add support for 2021 ASUS N-Key keyboard
Date:   Fri, 19 Feb 2021 10:10:02 +1300
Message-Id: <20210218211001.20623-1-luke@ljones.dev>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some new 2021 version of ASUS gamer laptops are using an updated
N-Key keyboard with the PID of 0x19b6. This version is using the
same init sequence and brightness control as the 0x1866 keyboard.

Signed-off-by: Luke D Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 3 +++
 drivers/hid/hid-ids.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 1dfe184ebf5a..2ab22b925941 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1221,6 +1221,9 @@ static const struct hid_device_id asus_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
+	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 		USB_DEVICE_ID_ASUSTEK_T100TA_KEYBOARD),
 	  QUIRK_T100_KEYBOARD | QUIRK_NO_CONSUMER_USAGES },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5ba0aa1d2335..b64d3eb5367c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -191,6 +191,7 @@
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD2 0x1837
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866
+#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2	0x19b6
 #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD	0x1869

 #define USB_VENDOR_ID_ATEN		0x0557
--
2.30.0

