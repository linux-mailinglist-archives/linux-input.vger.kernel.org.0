Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CC4363464
	for <lists+linux-input@lfdr.de>; Sun, 18 Apr 2021 11:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhDRJOf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Apr 2021 05:14:35 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53907 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229652AbhDRJOf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Apr 2021 05:14:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 8B89E5C06D2;
        Sun, 18 Apr 2021 05:14:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 18 Apr 2021 05:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LDR8EQNgU9lOtIWU1
        Gh8M+DaoEq0tBN8xClPXnhvHGI=; b=J1Nfw7Hscpdz32CutuH4RrovnK4Nc8oT8
        33yVkucAHcmfTeNE1I399yHv9CmyMZD+MPcWnI2bFBPBPktb3e5+KjPGOzzh6EkC
        2/4s2qHL9xpIrews+NABMyjwq/JE4Bt9G+eWtdP969XEQEvrNmu2P2YOobqPHIS/
        jGZpXBipCEOMGpcYrFai2E6PV2c/26qjuP5XUYJ00shBrjKRCuAGVTjFmJ/eT1BM
        OCFVPWuPzzdFJOIUoTTs7quSb0Vce27OcqVQvAZxYMVWRrcEl2Qp+z8fWBbahucW
        fT47CCaW8flAZ6i0xDY0uWJaOHAf/62OJouKO2ktoNSaLL4lNB7Mw==
X-ME-Sender: <xms:Xvh7YNgwDUyoDfPpxLH7Ls1jdevLLRPxyBtukz1utGYip_XcZvpo6A>
    <xme:Xvh7YCD4ldq6_b80wX2-fgOdlMaJerlXAJG7wLIfBoHMVU0pSAm6pa4l5H7h0YzAZ
    zkG4VWwaue3CLe6NHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelkedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepnfhukhgvucffucflohhnvghsuceolhhukhgvsehljhhonhgvshdr
    uggvvheqnecuggftrfgrthhtvghrnhepfffghfehheekgfdttdeihfdugeetkeduiefhvd
    dujeduiefgtdehieejtedvjedvnecukfhppeduudeirddvhedurdduleefrdduleeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvse
    hljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:Xvh7YNG9p0M1leL-VY19W5KnTSMeFpPHDikulpGHXzs0e8u4YQ91hw>
    <xmx:Xvh7YCQEhQIPUugwW3kmCk-nVhvI-rlsRoC3BSXD5-L_KbiyfYwcWA>
    <xmx:Xvh7YKzfztm_yIUosYA2K7vSuVA4PtGKA-CUuVuX4a8SSmwzLO5I2g>
    <xmx:X_h7YPrvQgEBqpY26eKNUWt_XkYFC4CK9B6YI8rK8WnXa-tDtf53Mw>
Received: from fedora.. (unknown [116.251.193.196])
        by mail.messagingengine.com (Postfix) with ESMTPA id 41B4F108005F;
        Sun, 18 Apr 2021 05:14:03 -0400 (EDT)
From:   Luke D Jones <luke@ljones.dev>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, Luke D Jones <luke@ljones.dev>
Subject: [PATCH] HID: asus: filter G713/G733 key event to prevent shutdown
Date:   Sun, 18 Apr 2021 21:12:29 +1200
Message-Id: <20210418091229.26001-1-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The G713 and G733 both emit an unexpected keycode on some key
presses such as Fn+Pause. The device in this case is emitting
two events on key down, and 3 on key up, the third key up event
is report ID 0x02 and is unfiltered, causing incorrect event.

This patch filters out the single problematic event.

Signed-off-by: Luke D Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 1ed1c05c3d54..60606c11bdaf 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -355,6 +355,16 @@ static int asus_raw_event(struct hid_device *hdev,
 				return -1;
 			}
 		}
+		if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+			/*
+			 * G713 and G733 send these codes on some keypresses, depending on
+			 * the key pressed it can trigger a shutdown event if not caught.
+			*/
+			if(data[0] == 0x02 && data[1] == 0x30) {
+				return -1;
+			}
+		}
+
 	}
 
 	return 0;
-- 
2.31.1

