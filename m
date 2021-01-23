Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E1C301778
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 19:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbhAWSEl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 13:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbhAWSEf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 13:04:35 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BDBC06174A;
        Sat, 23 Jan 2021 10:03:54 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 8C46A38F93A;
        Sat, 23 Jan 2021 18:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1611425031;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pUy5GRn6iAd0774+zrvt/xxLsLy5Gfph7I887BlZzNk=;
        b=UZgc6Oy5ZTKAZ8K/7Ctl9s4xaalUQ0/9rnhUoQKQ9dN/pOd+gSILq86FxTlF373Yq95WTE
        M8B4qA++psNGCpoNBzAOJ2RYYY4ToMrqyW3qb0BRS5XWMDmJIKNOYPDFWU6B4Vh0M6MQRp
        OAWaInpTQ5oKvRt0QqToPpScvHrBDvOFl/LNpn5rcB9AAX5PvdZd8IsxaooHjC29kIt7vc
        YhznEn0vC55BTOFJCUGakum85SweF6/ld8T3hMEJuJaJSF5lh6JaSOuCp7lPV2qyUT1a+X
        Gwn3WrA08+xUc/fTZ6JJFAlsXXQw3QvksNQ87DI7n2KajOS31N22okwNAyCjiWpCvlirQP
        DWByboxNTxXanzIEMWlQzI+31lERsSZsBedO5U7aHHMh2WmDduuttOC1t3KkDnyLiH27XP
        FR/HZGgur73cThhoVBHPgP8Rd75scZ5Z3NocF8K/Vu1ooj3N7r/JG7vGwlm8KljTxwONIP
        1uHr9I17w3Gi369Y6ECbyuvwql5yC39l2i6lXtt63xGp87WI3a+1MnY//LqdcjYtIqqvWM
        Hq71RHSYmERhfGL4L0o3TlDlhL4pHoA0dNZAx1FbRo5qAG/3NVOsuRn3M55aTNpqMTFIH6
        MR7k75vXgFTcHeeRdF3yXtV2cwOhEG49zwRsWN0qfT/IapMQtiQIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1611425031;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pUy5GRn6iAd0774+zrvt/xxLsLy5Gfph7I887BlZzNk=;
        b=noC/7x4rdVIF6TIIpPH6gRDnKKvdwV8Dh1v1QhdRRC+my3IExMwH+AujrLW22mX6LXKjM0
        hIi/YnKi2uRn2SAw==
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>
Subject: [PATCH 2/2] HID: logitech-hidpp: add support for the G Pro X Superlight over USB
Date:   Sat, 23 Jan 2021 18:03:34 +0000
Message-Id: <20210123180334.3062995-2-lains@archlinux.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210123180334.3062995-1-lains@archlinux.org>
References: <20210123180334.3062995-1-lains@archlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Filipe Laíns <lains@riseup.net>

Tested and is working :)

Signed-off-by: Filipe Laíns <lains@riseup.net>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 291c6b4d26b7..54a289510a7d 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4268,6 +4268,8 @@ static const struct hid_device_id hidpp_devices[] = {
 		.driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
 	{ /* Logitech G Pro Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
+	{ /* Logitech G Pro X Superlight Gaming Mouse over USB */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC094) },
 
 	{ /* MX5000 keyboard over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb305),
-- 
2.30.0

