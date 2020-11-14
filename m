Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1C72B2C74
	for <lists+linux-input@lfdr.de>; Sat, 14 Nov 2020 10:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgKNJpm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Nov 2020 04:45:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26970 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726578AbgKNJpl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Nov 2020 04:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605347139;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=6hXYZmIPa8wyA5niJb8ZS057Kv9WHT3Q438nEI4IGKM=;
        b=hiZzGG+dJr2lmH/D63GXkocYCwi4G5PUaIcXExTzdaYcQ9s06aTcjLwKXUPnXxwy8xHmGo
        MeSXWPwYEI3vZF0xIW6LI94ftpFDPm+x0I+4dBtu23EjFlyunWyFHUo68ZAHQolGJNC0UK
        eW4n09elMF91MN9PqTB1/huNcr4Q/Q8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-L0sGAddhO9-BjXDaiix_cg-1; Sat, 14 Nov 2020 04:45:37 -0500
X-MC-Unique: L0sGAddhO9-BjXDaiix_cg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BC1E1868401;
        Sat, 14 Nov 2020 09:45:36 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-97.ams2.redhat.com [10.36.112.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A30135D9E8;
        Sat, 14 Nov 2020 09:45:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: logitech-dj: Fix an error in mse_bluetooth_descriptor
Date:   Sat, 14 Nov 2020 10:45:31 +0100
Message-Id: <20201114094531.8285-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix an error in the mouse / INPUT(2) descriptor used for quad/bt2.0 combo
receivers. Replace INPUT with INPUT (Data,Var,Abs) for the field for the
4 extra buttons which share their report-byte with the low-res hwheel.

This is likely a copy and paste error. I've verified that the new
0x81, 0x02 value matches both the mouse descriptor for the currently
supported MX5000 / MX5500 receivers, as well as the INPUT(2) mouse
descriptors for the Dinovo receivers for which support is being
worked on.

Fixes: f2113c3020ef ("HID: logitech-dj: add support for Logitech Bluetooth Mini-Receiver")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-dj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index d3471d655ab4..7706454de88f 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -330,7 +330,7 @@ static const char mse_bluetooth_descriptor[] = {
 	0x25, 0x01,		/*      LOGICAL_MAX (1)                 */
 	0x75, 0x01,		/*      REPORT_SIZE (1)                 */
 	0x95, 0x04,		/*      REPORT_COUNT (4)                */
-	0x81, 0x06,		/*      INPUT                           */
+	0x81, 0x02,		/*      INPUT (Data,Var,Abs)            */
 	0xC0,			/*    END_COLLECTION                    */
 	0xC0,			/*  END_COLLECTION                      */
 };
-- 
2.28.0

