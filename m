Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 068E811B2E8
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 16:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732013AbfLKPjh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 10:39:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:49302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388218AbfLKPim (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 10:38:42 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD15C222C4;
        Wed, 11 Dec 2019 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576078721;
        bh=rZyyGTSGqEdF7VKgJNRfvCHj4Kpp26BWMDhsN9Rd6gA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0Wn8bA+V6jVMOcETh6ZIu7PCMA/aaNTkCBnAZSx9+90JcGl5sdP9dGNfPBrIs/a3s
         iyy8h6XgiTg4d18ODL9RbUVhcepBOxR6Zdciq8A999vHb8R/psOfoYijZQQJkhPChj
         Hl9cS+5kkUP9pjgcD3EAAsPO2vEXfIcoXmup8TQ8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 26/37] HID: Improve Windows Precision Touchpad detection.
Date:   Wed, 11 Dec 2019 10:38:02 -0500
Message-Id: <20191211153813.24126-26-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211153813.24126-1-sashal@kernel.org>
References: <20191211153813.24126-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Blaž Hrastnik <blaz@mxxn.io>

[ Upstream commit 2dbc6f113acd74c66b04bf49fb027efd830b1c5a ]

Per Microsoft spec, usage 0xC5 (page 0xFF) returns a blob containing
data used to verify the touchpad as a Windows Precision Touchpad.

   0x85, REPORTID_PTPHQA,    //    REPORT_ID (PTPHQA)
    0x09, 0xC5,              //    USAGE (Vendor Usage 0xC5)
    0x15, 0x00,              //    LOGICAL_MINIMUM (0)
    0x26, 0xff, 0x00,        //    LOGICAL_MAXIMUM (0xff)
    0x75, 0x08,              //    REPORT_SIZE (8)
    0x96, 0x00, 0x01,        //    REPORT_COUNT (0x100 (256))
    0xb1, 0x02,              //    FEATURE (Data,Var,Abs)

However, some devices, namely Microsoft's Surface line of products
instead implement a "segmented device certification report" (usage 0xC6)
which returns the same report, but in smaller chunks.

    0x06, 0x00, 0xff,        //     USAGE_PAGE (Vendor Defined)
    0x85, REPORTID_PTPHQA,   //     REPORT_ID (PTPHQA)
    0x09, 0xC6,              //     USAGE (Vendor usage for segment #)
    0x25, 0x08,              //     LOGICAL_MAXIMUM (8)
    0x75, 0x08,              //     REPORT_SIZE (8)
    0x95, 0x01,              //     REPORT_COUNT (1)
    0xb1, 0x02,              //     FEATURE (Data,Var,Abs)
    0x09, 0xC7,              //     USAGE (Vendor Usage)
    0x26, 0xff, 0x00,        //     LOGICAL_MAXIMUM (0xff)
    0x95, 0x20,              //     REPORT_COUNT (32)
    0xb1, 0x02,              //     FEATURE (Data,Var,Abs)

By expanding Win8 touchpad detection to also look for the segmented
report, all Surface touchpads are now properly recognized by
hid-multitouch.

Signed-off-by: Blaž Hrastnik <blaz@mxxn.io>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index c60bb6f8eceb0..7cd9455754636 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -761,6 +761,10 @@ static void hid_scan_feature_usage(struct hid_parser *parser, u32 usage)
 	if (usage == 0xff0000c5 && parser->global.report_count == 256 &&
 	    parser->global.report_size == 8)
 		parser->scan_flags |= HID_SCAN_FLAG_MT_WIN_8;
+
+	if (usage == 0xff0000c6 && parser->global.report_count == 1 &&
+	    parser->global.report_size == 8)
+		parser->scan_flags |= HID_SCAN_FLAG_MT_WIN_8;
 }
 
 static void hid_scan_collection(struct hid_parser *parser, unsigned type)
-- 
2.20.1

