Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7933E3BAF5C
	for <lists+linux-input@lfdr.de>; Mon,  5 Jul 2021 00:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhGDW3o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Jul 2021 18:29:44 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:59615 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229549AbhGDW3o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Jul 2021 18:29:44 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 506D33200925;
        Sun,  4 Jul 2021 18:27:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 04 Jul 2021 18:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PC3LkJ0XYgyYX4Ygc
        mVWDDEY9mKV/iXktNtOtqHoJ3Q=; b=vrDfbUUyUDyWYCcSgTPTmGeljJffbIkYL
        QANhIk2XkTbjucDSsh0C+oQNvLgN/TaJqGZXP7VRUI8Al00FcB8GC43e+1JzyDYS
        w80sa04IirkYFK09E6JD6a1DP/0jdQ6UaSu9VWybTCua3yzs171WpByZwawfb/tS
        eF3WP5UqGj4yqcNZHNAOxfYYBZ4vhHFoLgS/2+fEKe+SOMOGEbCZUMeTXL8foQCe
        CbvQN2edT1lCcNV0OH72o2ScJOzAAELiLDkI5kl0dpnoqk1mzm0KWz3Wy1eVMEQo
        jQKgPFDJJoncEnUBn/oK58uWSFipIlhRL1kPege+J0uOHkJmwOkEQ==
X-ME-Sender: <xms:uzXiYKmGkem7wAB9AdRixedJmh4RCgWK5NsGSKm_9Y_DQYDi7PrXpw>
    <xme:uzXiYB1ItCsPb-18G9MzCqOuzGGJIwmHblxikkg9nWZln1-kipjbRpVMP0CLFGY4A
    rWRDtbBEOzEaZMRkFE>
X-ME-Received: <xmr:uzXiYIoaqSwEiU-PNX5GNAHxe8ZP54dMI63nSEYFZ-79t5QxUXicqDJm0UpY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejfedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhn
    vghsrdguvghvqeenucggtffrrghtthgvrhhnpeelffelhfeltdfhtdevuefgveeuueekge
    etiefgiefhgfejvdetvdeuvedthfdvkeenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:uzXiYOm081lbZioG98s8O9-l2pAGSSuYz2OhSwRlBJE_jPwkZOb8Wg>
    <xmx:uzXiYI0hXVKWLCK1a-CULFbz6GQvT-wO8CP_-nJnkD4V8ixLqJmU2w>
    <xmx:uzXiYFuTrnIYy2N9WPmIWILIwWFhpvB5v89qFmGGDKWie9Zlor4QUg>
    <xmx:uzXiYGDzA587t5WNplSY2aItD3tI3tP3uetldOXBsQO5Tq9F4_2aPw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jul 2021 18:27:05 -0400 (EDT)
From:   "Luke D. Jones" <luke@ljones.dev>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH] HID: asus: Remove check for same LED brightness on set
Date:   Mon,  5 Jul 2021 10:26:59 +1200
Message-Id: <20210704222659.882193-1-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Remove the early return on LED brightness set so that any controller
application, daemon, or desktop may set the same brightness at any stage.

This is required because many ASUS ROG keyboards will default to max
brightness on laptop resume if the LEDs were set to off before sleep.

Signed-off-by: Luke D Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 60606c11bdaf..19da81d2a910 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -486,9 +486,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
 {
 	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
 						 cdev);
-	if (led->brightness == brightness)
-		return;
-
 	led->brightness = brightness;
 	schedule_work(&led->work);
 }
--
2.31.1

