Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E695A656F6E
	for <lists+linux-input@lfdr.de>; Tue, 27 Dec 2022 21:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbiL0Uod (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Dec 2022 15:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbiL0Unn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Dec 2022 15:43:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA84E101F7;
        Tue, 27 Dec 2022 12:36:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8CAF16123E;
        Tue, 27 Dec 2022 20:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B259C433F2;
        Tue, 27 Dec 2022 20:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672173352;
        bh=2GcRly9AVDUC27HN7Zqofi6oG8Jv56e1hzoEUsWjzC0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dih13vFLjnw+hESFWkvnAZQ4bqyYxLGcgEmleMFvTyE3WYa8lroW6t1jXxNdbrrCi
         OYjVKqTSGRGLJqzE3BUalXdozjOWrxyLeQOR0Kmm/EuPY46+aQQAbs2qMeRZoQSkCw
         f+uCtu5DRHmJ+RqtOPTnLpl2UkCGYiGF0iQt7dtq+BaT/8rJXAjzA8IDbiHWhqAbxg
         aK8UTWymmfbn5kAldoKSxIolSEeSDbcIhXONv0eaeYNlSyUwoUo5gogu6R/dcPSsQW
         BxevlmyhcswY9Nox2fFi230ctp2nnCkjxCpbWBL3PFKJWG9wGiueCaePAdSGkdf4JJ
         FpmN/VU8/tVyg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Akito <the@akito.ooo>, Jiri Kosina <jkosina@suse.cz>,
        Sasha Levin <sashal@kernel.org>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 6/7] HID: multitouch: fix Asus ExpertBook P2 P2451FA trackpoint
Date:   Tue, 27 Dec 2022 15:35:31 -0500
Message-Id: <20221227203534.1214640-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203534.1214640-1-sashal@kernel.org>
References: <20221227203534.1214640-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: José Expósito <jose.exposito89@gmail.com>

[ Upstream commit 4eab1c2fe06c98a4dff258dd64800b6986c101e9 ]

The HID descriptor of this device contains two mouse collections, one
for mouse emulation and the other for the trackpoint.

Both collections get merged and, because the first one defines X and Y,
the movemenent events reported by the trackpoint collection are
ignored.

Set the MT_CLS_WIN_8_FORCE_MULTI_INPUT class for this device to be able
to receive its reports.

This fix is similar to/based on commit 40d5bb87377a ("HID: multitouch:
enable multi-input as a quirk for some devices").

Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/825
Reported-by: Akito <the@akito.ooo>
Tested-by: Akito <the@akito.ooo>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-multitouch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 463a8deae37e..9db327654580 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1953,6 +1953,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_ELAN, 0x313a) },
 
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_ELAN, 0x3148) },
+
 	/* Elitegroup panel */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,
-- 
2.35.1

