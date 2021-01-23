Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A49A301773
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 19:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbhAWSDT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 13:03:19 -0500
Received: from mail.archlinux.org ([95.216.189.61]:34302 "EHLO
        mail.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbhAWSDS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 13:03:18 -0500
Received: from localhost.localdomain (unknown [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 217B438F936;
        Sat, 23 Jan 2021 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1611424955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ed041JHOrV9zlDdKkjpA13hlj/ZFHa+9xai9QP0XgGI=;
        b=07f6FL1eoPOqMIOni9IpgzBcpTe7AC8GbJtZCSLDTaSuJOsEFA1vuCfDQrADt86HJoPvHF
        Hxuo6qVRc/jR3pt9Jbu0lse0Ywd0y2jwmBJ/L3eZEfOSes36PsrbpmhCuF431XPuxA0ZEq
        QdD1Z8cE6AyHX6E852J+vSZIp6NbQG9gH5KnT7hVaqSorrV0qrGnCdvA3r9ZqYgq7V1/ms
        e5Tj0fcbemuLC5xCQPio9yQE7tv3v0KbnGlX3T91Su3eAEy3HTsh8rih2Y8RmAKn7Llt4R
        A+JI0EaB2q8YMXHOL4bzID4wox023pG7z+XKIrpgb5ABmm6pnPwLCa4JcyPN2geFBJBFX1
        Gw9QNgjd86YgqU77UWxXjbHikFEV7IulbHOBlJEhQwck/P8wCCJPr4t04rNUrs33LwG/BV
        YgF9J2YWv8hl5AC0jVczxTG4Q9bvVlZgzHC9ne0LfyihFUJm3tX4Xst4sJ6AD4B1PbnCyy
        i6JBUyb2D5puh51W/nwe8M4mjTD34tF/MBRX3nCjUt6ly+Uo6uM05zgU5Qa0lC9goPfVTJ
        zJmrX+rrmpeDLu4Ou2U+oSM8MMO/msSz/Lqj2UVMiOj5elsxYVMLix4ngI2mx/rldfrdsT
        WahzsHqailv/bByalbnId63ErRmApSeXhzoPoPkjrSyNjPWiUYIJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1611424955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ed041JHOrV9zlDdKkjpA13hlj/ZFHa+9xai9QP0XgGI=;
        b=UYbKvaX9dbcmGs3L3h7QmReHZlgCbee2H8P+VAnlR+DnKLOVVW0HFNUl1tsET9J5Fzo3Ek
        ex1oUTyQXwdWyyCA==
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>
Subject: [PATCH] HID: logitech-dj: add support for the new lightspeed connection iteration
Date:   Sat, 23 Jan 2021 18:02:20 +0000
Message-Id: <20210123180220.3056430-1-lains@archlinux.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Filipe Laíns <lains@riseup.net>

This new connection type is the new iteration of the Lightspeed
connection and will probably be used in some of the newer gaming
devices. It is currently use in the G Pro X Superlight.

This patch should be backported to older versions, as currently the
driver will panic when seing the unsupported connection. This isn't
an issue when using the receiver that came with the device, as Logitech
has been using different PIDs when they change the connection type, but
is an issue when using a generic receiver (well, generic Lightspeed
receiver), which is the case of the one in the Powerplay mat. Currently,
the only generic Ligthspeed receiver we support, and the only one that
exists AFAIK, is ther Powerplay.

As it stands, the driver will panic when seeing a G Pro X Superlight
connected to the Powerplay receiver and won't send any input events to
userspace! The kernel will warn about this so the issue should be easy
to identify, but it is still very worrying how hard it will fail :(

[915977.398471] logitech-djreceiver 0003:046D:C53A.0107: unusable device of type UNKNOWN (0x0f) connected on slot 1

Signed-off-by: Filipe Laíns <lains@riseup.net>
---
 drivers/hid/hid-logitech-dj.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 45e7e0bdd382..1401ee2067ca 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -994,7 +994,12 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
 		workitem.reports_supported |= STD_KEYBOARD;
 		break;
 	case 0x0d:
-		device_type = "eQUAD Lightspeed 1_1";
+		device_type = "eQUAD Lightspeed 1.1";
+		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
+		workitem.reports_supported |= STD_KEYBOARD;
+		break;
+	case 0x0f:
+		device_type = "eQUAD Lightspeed 1.2";
 		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
 		workitem.reports_supported |= STD_KEYBOARD;
 		break;
-- 
2.30.0

