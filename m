Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE3FFF1485
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 12:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfKFLDZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 06:03:25 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:35703 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725890AbfKFLDY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 Nov 2019 06:03:24 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 03D344D7;
        Wed,  6 Nov 2019 06:03:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 06 Nov 2019 06:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mxxn.io; h=from
        :to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm3; bh=Ii2oxrWwPIXyOz9KTyWZWso10b
        yGznburLcw9Zjh5ao=; b=BgZvCYSEOWLQrLl7SRYAy5u+NZbovI1AEIFybvfyzt
        MQwfOWtqj1YDSsB1yOOdFxb/9M2Hen4rosBd2qEI1HzAnBqEL0sWG6APSv84W7gA
        Vf74wohU89kSvuOOFjIAofRDZrRpheoUnj8n8UiHbS4ZJK6q+KdgJkpc+OgOcVc7
        DPfKL5G5YAk/wLATdYsL9cc0/g//EyUJc6U+7mcprQufGLyMiBYScQxdzPIDiVu+
        M1/Zjrk1JWj9iaVW/8rObsmrUuxKDsw4n2EN4x2tEETgohv+gIUtzqFNQRpZFIix
        n40KUBcM7Nww4+yPFHuev/MEj6IFTwm+1IWlIGFNyzOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ii2oxr
        WwPIXyOz9KTyWZWso10byGznburLcw9Zjh5ao=; b=o87Av97mKTjX57VjcioQ3N
        la1PH9XaL3wB/G1Q/SaAmH9aNV6ximiqj1dgqJHrq/W8p0v01n7l+HE/16kVw4sp
        Br4/eJ8PcTng0/FZgKz+wAH+KWvDf36W1TG+AUiLTLXCJ97T30yZAWLEbLdl56ly
        DFX/Vq1K95YPHGkQQqZBkv83CRNlkcIBYu7kepkWNF+c9rSBbUsRy6c3KWvkVl5I
        iDVURqXaH+Zj4PeVda85VylY/1WKnu24dP858Ex6FXThbbMMUmDVdjX1JEh0RrG5
        8DPD3L2M4wqynxtEMjNG+Yaw3niGIYtzMfB/Vv2E+p/eGc6Rr3oDi0ADvn1Dp7hw
        ==
X-ME-Sender: <xms:eqjCXSlPQceVNtPabUw40ukxAK3L7W1DC0hbhISZ1bcVZM0zNUWZlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddujedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepuehlrgkkuc
    fjrhgrshhtnhhikhcuoegslhgriiesmhiggihnrdhioheqnecukfhppeduuddurddutdej
    rddvtdelrddvvdehnecurfgrrhgrmhepmhgrihhlfhhrohhmpegslhgriiesmhiggihnrd
    hiohenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:eqjCXVhaXBg-6fXjBSMW-_nm_kXGEvOoMsAcekaLsf0qyg8gkxZCtg>
    <xmx:eqjCXbXg5Y0kTfvtAS9mf6Yvl8aT5kYIkqryH062pklkpoCRIKc8Jg>
    <xmx:eqjCXXiSyd0fnmkoVm8KkBN2jnyvfjzFkh-yraj964I4mGlIqLNyvQ>
    <xmx:eqjCXUJSqQcRIgPGKUN_hlMB4jBhuWZzlj1Gkadch9kITwQkT8Uw-Q>
Received: from localhost.localdomain (225.ec0279u.cyberhome.ne.jp [111.107.209.225])
        by mail.messagingengine.com (Postfix) with ESMTPA id C271680062;
        Wed,  6 Nov 2019 06:03:20 -0500 (EST)
From:   =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>
Cc:     =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: Improve Windows Precision Touchpad detection.
Date:   Wed,  6 Nov 2019 20:02:46 +0900
Message-Id: <20191106110246.70937-1-blaz@mxxn.io>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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
---
 drivers/hid/hid-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 63fdbf09b044..2af597cd5d65 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -742,6 +742,10 @@ static void hid_scan_feature_usage(struct hid_parser *parser, u32 usage)
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
2.23.0

