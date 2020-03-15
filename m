Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48A7A185EC0
	for <lists+linux-input@lfdr.de>; Sun, 15 Mar 2020 18:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728966AbgCORfB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Mar 2020 13:35:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60257 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728947AbgCORfB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Mar 2020 13:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584293700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8J2wARP0Hjfkbaur3RYx3jtrBPk2eNpCjjR+5RjBtyc=;
        b=dORD6GXfGzLS4FfhgVQwEgocxAdEed6K3J1MTDA6obtKiOWxH46g+G454d/cF0DSqcnJZ2
        UHFyt9KgOT6cO30cg48KrHPfocHwvDSXhUiU1NFPP0ku/kSrrLiAMAMpbim+ld+1k/m6c4
        WNKrE1yK1WELPfL0sCklSLLZx2u8H7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-KRwSvLXePiy4BH9yyf2xyg-1; Sun, 15 Mar 2020 13:34:56 -0400
X-MC-Unique: KRwSvLXePiy4BH9yyf2xyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 504FA189D6C0;
        Sun, 15 Mar 2020 17:34:55 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-18.ams2.redhat.com [10.36.116.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9D8B492D0C;
        Sun, 15 Mar 2020 17:34:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: lg-g15: Do not fail the probe when we fail to disable F# emulation
Date:   Sun, 15 Mar 2020 18:34:49 +0100
Message-Id: <20200315173449.24857-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

By default the G1-G12 keys on the Logitech gaming keyboards send
F1 - F12 when in "generic HID" mode.

The first thing the hid-lg-g15 driver does is disable this behavior.

We have received a bugreport that this does not work when the keyboard
is connected through an Aten KVM switch. Using a gaming keyboard with
a KVM is a bit weird setup, but still we can try to fail a bit more
gracefully here.

On the G510 keyboards the same USB-interface which is used for the gaming
keys is also used for the media-keys. Before this commit we would call
hid_hw_stop() on failure to disable the F# emulation and then exit the
probe method with an error code.

This not only causes us to not handle the gaming-keys, but this also
breaks the media keys which is a regression compared to the situation
when these keyboards where handled by the generic hidinput driver.

This commit changes the error handling to clear the hiddev drvdata
(to disable our .raw_event handler) and then returning from the probe
method with success.

The net result of this is that, when connected through a KVM, things
work as well as they did before the hid-lg-g15 driver was introduced.

Fixes: ad4203f5a243 ("HID: lg-g15: Add support for the G510 keyboards' ga=
ming keys")
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1806321
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lg-g15.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index 8a9268a5c66a..ad4b5412a9f4 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -803,8 +803,10 @@ static int lg_g15_probe(struct hid_device *hdev, con=
st struct hid_device_id *id)
 	}
=20
 	if (ret < 0) {
-		hid_err(hdev, "Error disabling keyboard emulation for the G-keys\n");
-		goto error_hw_stop;
+		hid_err(hdev, "Error %d disabling keyboard emulation for the G-keys, f=
alling back to generic hid-input driver\n",
+			ret);
+		hid_set_drvdata(hdev, NULL);
+		return 0;
 	}
=20
 	/* Get initial brightness levels */
--=20
2.25.1

