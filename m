Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828082E9F3B
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 22:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbhADVA5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 16:00:57 -0500
Received: from mail.archlinux.org ([95.216.189.61]:38332 "EHLO
        mail.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbhADVA5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 16:00:57 -0500
X-Greylist: delayed 760 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Jan 2021 16:00:56 EST
Received: from localhost.localdomain (unknown [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 09AE234628A;
        Mon,  4 Jan 2021 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1609793255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=DanZ7KA9e30QdP5VSJQu+TTKfCyvLVrxVqn9XY/B3GA=;
        b=J3icIYhx8lI2B3w3cBpaJBNaVx83ih4OsxDwol4cms6RKVio7+UB3mdKzHSHRkMxv58+10
        0x87V2kLUEBukPBvuvlPiR48WJtO34hk339XFtzgwXiqfnbxci2Ng7yyH7P+reJKnvqvac
        iVxwZPWxn79NVeu2rHJpyYkgrmFZtn6XfD6wfuwzIJNebyNfV0qT3eaEjCfsivjJafIJMG
        2U7RwODr2yTEyz+fLCU4dOYjxW462iR4XaHwBLIY/6+XAc3BCo/lFJq7mbchtFpT3v24sa
        EeBFdEoiwrOgjzEwcBsF7dPYwUkD3KplHbZMnQQUdcqfckSgNMooBeoba4XLve2qAbT98a
        cC0c5+FQuDCg95Ew0sCFtXdYye1eSdlVUqMqc3EXcn9dRrRaBHmeTl6nQRwEtPhsoP4M9N
        BPUPt7nk+AaQzhc/dX01PYkZ8XElwrfpbertEHKpedqknR7tiK5T60vH2FLyFlYc/ky+YC
        UCjb4YGCUT3NbVSXyU4S+ZqBtJyLzcUN/c4z1cuwIo9iTviUdWe4n2lkMrZDdlcxEWQGCj
        vRQld5grdUiz4SkOFsOlJn24RzD8sFlxHxCyBnIpZybqBbTYecuHC1C6BxntcINaM84qXB
        vIkmU49wGbi8Ge3axxnLG606TL3tZwge4Xe6tbVHxqhgUBVNvX+3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1609793255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=DanZ7KA9e30QdP5VSJQu+TTKfCyvLVrxVqn9XY/B3GA=;
        b=DwCcOK874rhHyvYSPkp8jqqLmvTsG+oKcCbFvc/pqdskOWIkmPYAan53SOwPpSwzRrDN1L
        B3HXlo7bwTE9B2Ag==
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
Subject: [PATCH] HID: logitech-dj: add the G602 receiver
Date:   Mon,  4 Jan 2021 20:47:17 +0000
Message-Id: <20210104204717.2229315-1-lains@archlinux.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Tested. The device gets correctly exported to userspace and I can see
mouse and keyboard events.

Signed-off-by: Filipe Laíns <lains@archlinux.org>
---
 drivers/hid/hid-logitech-dj.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 1ffcfc9a1e03..45e7e0bdd382 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1869,6 +1869,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		0xc531),
 	 .driver_data = recvr_type_gaming_hidpp},
+	{ /* Logitech G602 receiver (0xc537) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		0xc537),
+	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech lightspeed receiver (0xc539) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1),
-- 
2.30.0

