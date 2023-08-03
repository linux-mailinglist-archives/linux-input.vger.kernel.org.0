Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 449F576E943
	for <lists+linux-input@lfdr.de>; Thu,  3 Aug 2023 15:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236024AbjHCNE3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Aug 2023 09:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235931AbjHCNDz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Aug 2023 09:03:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838AE3C2D;
        Thu,  3 Aug 2023 06:03:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B50E61D9E;
        Thu,  3 Aug 2023 13:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93562C433C9;
        Thu,  3 Aug 2023 13:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691067828;
        bh=w9+cJfdNbfDx56HHO38pwtfmNpApp/NQmAGal2jU1YA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m7Gk6p/Z/iP87UMm/SIT6NoEt5ndpxyZ+NJkC1l+jfETEN4fICELt/KNua7MsCp4U
         MZALGb/ZctyNfvr/0kOG0r2htFSXT959q5qRh0Eq4oUVNSHiOVRsXLyqK7Z6ScPyKq
         Ob8DydmD4ikVb4SjZniG3N83xs+WXdsYdbxu19TQM2TIXd86xqkJdNI5xGdgQqzcrq
         iYyZiDqE5G3lyqrMmOWYboTnGBor9f4JeEK0I4AKCIHb42BndXGM+0Pdl9oHQ5bg3x
         w8r9W6WfWJoAPZ6ZKiTXIRe/l3Cb9n7IDSJQqNRrOLeTKi7MVCM7rkPLuYbRUn/sYI
         psz1pRphEDhkg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Sasha Levin <sashal@kernel.org>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 2/2] HID: logitech-hidpp: Add wired USB id for Logitech G502 Lightspeed
Date:   Thu,  3 Aug 2023 09:03:43 -0400
Message-Id: <20230803130343.641695-2-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803130343.641695-1-sashal@kernel.org>
References: <20230803130343.641695-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.123
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

[ Upstream commit a343a7682acc56182d4b54777c358f5ec6d274e7 ]

Previously, support for the G502 had been attempted in commit
'27fc32fd9417 ("HID: logitech-hidpp: add USB PID for a few more supported
mice")'

This caused some issues and was reverted by
'addf3382c47c ("Revert "HID: logitech-hidpp: add USB PID for a few more
supported mice"")'.

Since then, a new version of this mouse has been released (Lightpseed
Wireless), and works correctly.

This device has support for battery reporting with the driver

Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Link: https://lore.kernel.org/r/20230630113818.13005-1-stuart.a.hayhurst@gmail.com
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index c61da859cd3c6..d6c92c5b2bb42 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4367,6 +4367,8 @@ static const struct hid_device_id hidpp_devices[] = {
 
 	{ /* Logitech G403 Wireless Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC082) },
+	{ /* Logitech G502 Lightspeed Wireless Gaming Mouse over USB */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC08D) },
 	{ /* Logitech G703 Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC087) },
 	{ /* Logitech G703 Hero Gaming Mouse over USB */
-- 
2.40.1

