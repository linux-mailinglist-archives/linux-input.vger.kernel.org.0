Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1729A426E4
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 15:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730567AbfFLNDA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 09:03:00 -0400
Received: from myself5.de ([5.230.26.43]:43438 "EHLO myself5.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730214AbfFLNDA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 09:03:00 -0400
X-Greylist: delayed 1199 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Jun 2019 09:02:59 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=myself5.de; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=kaMCzSe33t2mDZfL48JawC3dylTfnzOCvJpCgH+Tfh4=;
        b=PX/6A62NkVlH5hV5ULbHDmAaJnJh1oyv29QSxNEZkz3QZ3MWWlr24JbUTes84szYkTTfomClnBuf6ruPr9crcW5D7rrYauHYMjaqJm0gP7G2IDhC5PbRkjXhDqDu3Ch2T2+E8ZnhUvCIJDQFy6/WKbnt6dXHcYega9Qq6viHPGyUPThaIQNuCwkaqI5nRPHZq5nd2FsF3UMlE+yZfMdY+fPqbFuo/wZUMbaTky2HJuA02TYpOQD60gGiZOIccwBMmlMCLtST45wkoo4Zk+Pe0S/CMdq8iA6Kmv7u0r4MYrckT4Rt+KIr/exgXleJhDTYplsdRBGrxOYkWqURMDi4nQ==;
Received: from hsi-kbw-046-005-003-194.hsi8.kabel-badenwuerttemberg.de ([46.5.3.194] helo=localhost)
        by myself5.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <gpg@myself5.de>)
        id 1hb2aZ-0005Hv-Um; Wed, 12 Jun 2019 14:42:52 +0200
From:   Christian Oder <me@myself5.de>
Cc:     Christian Oder <me@myself5.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Update Hi10 Air filter
Date:   Wed, 12 Jun 2019 14:40:53 +0200
Message-Id: <20190612124053.119182-1-me@myself5.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Turns out the Hi10 Air is built by multiple companies so using Hampoo
as a filter is not enough to cover all variants.

This has been verified as working on the Hampoo and Morshow version.

Signed-off-by: Christian Oder <me@myself5.de>
---
 drivers/platform/x86/touchscreen_dmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index b662cb2d7cd5..61e7c4987d0d 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -597,7 +597,8 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
 		/* Chuwi Hi10 Air */
 		.driver_data = (void *)&chuwi_hi10_air_data,
 		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_SYS_VENDOR, "CHUWI INNOVATION AND TECHNOLOGY(SHENZHEN)CO.LTD"),
+			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
 			DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
 		},
 	},
-- 
2.21.0

