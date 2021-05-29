Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CE1394AF7
	for <lists+linux-input@lfdr.de>; Sat, 29 May 2021 09:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhE2HlZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 May 2021 03:41:25 -0400
Received: from gproxy6-pub.mail.unifiedlayer.com ([67.222.39.168]:37333 "EHLO
        gproxy6-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229597AbhE2HlZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 May 2021 03:41:25 -0400
X-Greylist: delayed 1331 seconds by postgrey-1.27 at vger.kernel.org; Sat, 29 May 2021 03:41:25 EDT
Received: from cmgw13.mail.unifiedlayer.com (unknown [10.0.90.128])
        by gproxy6.mail.unifiedlayer.com (Postfix) with ESMTP id 47C41802A111
        for <linux-input@vger.kernel.org>; Sat, 29 May 2021 07:17:37 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id mtDylEewxyyhqmtE0lzezM; Sat, 29 May 2021 07:17:37 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=GcvSISbL c=1 sm=1 tr=0 ts=60b1ea91
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=LfuyaZh/8e9VOkaVZk0aRw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=5FLXtPjwQuUA:10:nop_rcvd_month_year
 a=oz0wMknONp8A:10:endurance_base64_authed_username_1 a=vU9dKmh3AAAA:8
 a=ghuwRo_2Bo-mHjyg8MkA:9 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=CXVyLQdQAMht2B5jP0T4rfKfHtH8BCLXihuCEBPUS9o=; b=i/6zNYDFwAKzI2I8eloCVTXx2M
        0vUzgcUY0ulHSWFyDrktGdfXAoR0IUvn30DPMHXs+b1XBHpACcnuvI9sLVqWZUYs+xRfCagMtM3Yu
        /kgMCGvpW6xuSNWebQSnUZjN3YhjPSzMg6Vu4/ZTEcE4yRa74UGO4ayoBkbxLpomeQWbajTWnxUIu
        H7Rujh3+PC1DOsLJkz4psciF8DI2sPLM5G2k9PkK0v0VI8Nxq+AORZsHqUcPzEWlDqkrPqa4ce/3A
        yh0AgPeGJw1zuD+myqzPkSy8Tp/Dl5+vwMMpJOn+g24cccQfr9u0ddzmwrHvnInCtmOHsBbXdsgCv
        Y4N7y+Mw==;
Received: from [117.202.186.207] (port=34954 helo=localhost.localdomain)
        by md-in-79.webhostbox.net with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <navin@linumiz.com>)
        id 1lmtDy-000zTM-65; Sat, 29 May 2021 07:17:34 +0000
From:   Navin Sankar Velliangiri <navin@linumiz.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com, navin@linumiz.com
Subject: [PATCH] hid: hid-chicony: fix switch case indentation
Date:   Sat, 29 May 2021 12:48:08 +0530
Message-Id: <20210529071808.5268-1-navin@linumiz.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 117.202.186.207
X-Source-L: No
X-Exim-ID: 1lmtDy-000zTM-65
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [117.202.186.207]:34954
X-Source-Auth: linumcmc
X-Email-Count: 5
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

fixed switch case indentation.
Block comments should not use a trailing */ on a separate line.
Reported by checkpatch.

Signed-off-by: Navin Sankar Velliangiri <navin@linumiz.com>
---
 drivers/hid/hid-chicony.c | 74 +++++++++++++++++++++++++++++----------
 1 file changed, 55 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
index ca556d39da2a..7dd4cfd256d9 100644
--- a/drivers/hid/hid-chicony.c
+++ b/drivers/hid/hid-chicony.c
@@ -65,26 +65,61 @@ static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 
 	set_bit(EV_REP, hi->input->evbit);
 	switch (usage->hid & HID_USAGE) {
-	case 0xff01: ch_map_key_clear(BTN_1);	break;
-	case 0xff02: ch_map_key_clear(BTN_2);	break;
-	case 0xff03: ch_map_key_clear(BTN_3);	break;
-	case 0xff04: ch_map_key_clear(BTN_4);	break;
-	case 0xff05: ch_map_key_clear(BTN_5);	break;
-	case 0xff06: ch_map_key_clear(BTN_6);	break;
-	case 0xff07: ch_map_key_clear(BTN_7);	break;
-	case 0xff08: ch_map_key_clear(BTN_8);	break;
-	case 0xff09: ch_map_key_clear(BTN_9);	break;
-	case 0xff0a: ch_map_key_clear(BTN_A);	break;
-	case 0xff0b: ch_map_key_clear(BTN_B);	break;
-	case 0x00f1: ch_map_key_clear(KEY_WLAN);	break;
-	case 0x00f2: ch_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
-	case 0x00f3: ch_map_key_clear(KEY_BRIGHTNESSUP);	break;
-	case 0x00f4: ch_map_key_clear(KEY_DISPLAY_OFF);	break;
-	case 0x00f7: ch_map_key_clear(KEY_CAMERA);	break;
-	case 0x00f8: ch_map_key_clear(KEY_PROG1);	break;
+	case 0xff01:
+		ch_map_key_clear(BTN_1);
+		break;
+	case 0xff02:
+		ch_map_key_clear(BTN_2);
+		break;
+	case 0xff03:
+		ch_map_key_clear(BTN_3);
+		break;
+	case 0xff04:
+		ch_map_key_clear(BTN_4);
+		break;
+	case 0xff05:
+		ch_map_key_clear(BTN_5);
+		break;
+	case 0xff06:
+		ch_map_key_clear(BTN_6);
+		break;
+	case 0xff07:
+		ch_map_key_clear(BTN_7);
+		break;
+	case 0xff08:
+		ch_map_key_clear(BTN_8);
+		break;
+	case 0xff09:
+		ch_map_key_clear(BTN_9);
+		break;
+	case 0xff0a:
+		ch_map_key_clear(BTN_A);
+		break;
+	case 0xff0b:
+		ch_map_key_clear(BTN_B);
+		break;
+	case 0x00f1:
+		ch_map_key_clear(KEY_WLAN);
+		break;
+	case 0x00f2:
+		ch_map_key_clear(KEY_BRIGHTNESSDOWN);
+		break;
+	case 0x00f3:
+		ch_map_key_clear(KEY_BRIGHTNESSUP);
+		break;
+	case 0x00f4:
+		ch_map_key_clear(KEY_DISPLAY_OFF);
+		break;
+	case 0x00f7:
+		ch_map_key_clear(KEY_CAMERA);
+		break;
+	case 0x00f8:
+		ch_map_key_clear(KEY_PROG1);
+		break;
 	default:
 		return 0;
 	}
+
 	return 1;
 }
 
@@ -92,10 +127,11 @@ static __u8 *ch_switch12_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
-	
+
 	if (intf->cur_altsetting->desc.bInterfaceNumber == 1) {
 		/* Change usage maximum and logical maximum from 0x7fff to
-		 * 0x2fff, so they don't exceed HID_MAX_USAGES */
+		 * 0x2fff, so they don't exceed HID_MAX_USAGES
+		 */
 		switch (hdev->product) {
 		case USB_DEVICE_ID_CHICONY_ACER_SWITCH12:
 			if (*rsize >= 128 && rdesc[64] == 0xff && rdesc[65] == 0x7f
-- 
2.31.1

