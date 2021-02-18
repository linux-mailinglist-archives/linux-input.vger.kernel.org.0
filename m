Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8731831F1C6
	for <lists+linux-input@lfdr.de>; Thu, 18 Feb 2021 22:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBRVkL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 16:40:11 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:51435 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229652AbhBRVkJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 16:40:09 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 3DB9D5C0067;
        Thu, 18 Feb 2021 16:39:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 18 Feb 2021 16:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=H0yjNZCCvNE+YgpJN
        TvaN9hpZllwnD2nL2ItZk1wUyE=; b=XklhjCe7RCq0KzOGFCX4MIpEQ3MfRHS53
        +G5HYxK2PNf95j4h575SK9G2Z2I4zWTtOaY4XJ/mAYTC8CwLIgRtN4ofQqGUTMDL
        /vQDnyhQUkd9JXjECInnHvrksrEfr8Bw+Y/AkOORLGrdKITKVj8giEbUGpMi6djY
        8eI8XqVB05KzwZswuQ/36ssIlFaPixGWk4mKGC08z3R84npRcthpSzVH21QErF7U
        xlm+zxjMhJSr7GGKJigkXbb+YI89r9Na6KT+nz/KTIYDT72TY8NQx2gF3cIiLkLy
        eEPdS7I+cVPijvOd4Cpusll/w2WPMuiRN5DefWvboGh0Nj7WHIw0A==
X-ME-Sender: <xms:d94uYK_xT8pIIOCNUsDw6fEBjRZdQA9IklnRTQI6XwYJtrJi1n795A>
    <xme:d94uYBvir-mmyscMIDyO4kyuZlGMc1u-beUR6LWqptuMMb7iqBqwjsqMinq5go4qU
    bUUEkG2jfOfp7vRYik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeggddugeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepnfhukhgvucffucflohhnvghsuceolhhukhgvsehljhhonhgvshdr
    uggvvheqnecuggftrfgrthhtvghrnhepfffghfehheekgfdttdeihfdugeetkeduiefhvd
    dujeduiefgtdehieejtedvjedvnecukfhppeduudeirddvhedurdduleefrdduleeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvse
    hljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:d94uYFCV1c2FOZ0PeJ_I6WhDntGwoUBIX5Db05Q2hlmhuC44DzEolQ>
    <xmx:d94uYBWB9mbFjdb_JyyUkEPivjOXN5OXJQjmaiD_cQZwEEI4F1aYhg>
    <xmx:d94uYLAJizGkqcMimcGSXjCGJ0_k6WVoWZULhI8qGHLha08_RhB-1A>
    <xmx:eN4uYByvAW8rzwh0cjFhLfmygt-r73-Awdrc9ymRoJx5b7uqo7u-SQ>
Received: from localhost.localdomain (unknown [116.251.193.196])
        by mail.messagingengine.com (Postfix) with ESMTPA id ED7FE24005D;
        Thu, 18 Feb 2021 16:38:59 -0500 (EST)
From:   Luke D Jones <luke@ljones.dev>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, Luke D Jones <luke@ljones.dev>
Subject: [PATCH] HID: asus: Filter keyboard EC for old ROG keyboard
Date:   Fri, 19 Feb 2021 10:38:46 +1300
Message-Id: <20210218213846.22504-1-luke@ljones.dev>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Older ROG keyboards emit a similar stream of bytes to the new
N-Key keyboards and require filtering to prevent a lot of
unmapped key warnings showing. As all the ROG keyboards use
QUIRK_USE_KBD_BACKLIGHT this is now used to branch to filtering
in asus_raw_event.

Signed-off-by: Luke D Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 2ab22b925941..1ed1c05c3d54 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -335,7 +335,7 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (drvdata->quirks & QUIRK_MEDION_E1239T)
 		return asus_e1239t_event(drvdata, data, size);
 
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+	if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) {
 		/*
 		 * Skip these report ID, the device emits a continuous stream associated
 		 * with the AURA mode it is in which looks like an 'echo'.
-- 
2.30.1

