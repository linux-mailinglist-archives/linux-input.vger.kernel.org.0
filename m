Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12860FC8E3
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 15:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfKNOaz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Nov 2019 09:30:55 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43125 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726214AbfKNOaz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Nov 2019 09:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573741854;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=p5IMdAy0QoogpMasEv3USwrlTXtAy1OWo07tBkC2X4I=;
        b=ch95ClTxJv2wxQBySfa+1aby/wHYyG4rpn6ctWXWW7LGx/08P1vA09z8b+bJTinH7W8oyu
        oBKI3KFh8XRnWqNEak42c99GDsaxLf2IG8FYV7+m9WPsa3/O/U+ySEFn2co7wbvwFQ1UyW
        WNZv8BK85edWthzLpEBJ2AvtQc4NYOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-BvidWgRzMGeKSeFVQV_FYg-1; Thu, 14 Nov 2019 09:30:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D2978026C4;
        Thu, 14 Nov 2019 14:30:52 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.128])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7EB646A020;
        Thu, 14 Nov 2019 14:30:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: Silence intermittent get_battery_capacity errors
Date:   Thu, 14 Nov 2019 15:30:46 +0100
Message-Id: <20191114143046.238711-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: BvidWgRzMGeKSeFVQV_FYg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

My Logitech M185 (PID:4038) 2.4 GHz wireless HID++ mouse is causing
intermittent errors like these in the log:

[11091.034857] logitech-hidpp-device 0003:046D:4038.0006: hidpp20_batteryle=
vel_get_battery_capacity: received protocol error 0x09
[12388.031260] logitech-hidpp-device 0003:046D:4038.0006: hidpp20_batteryle=
vel_get_battery_capacity: received protocol error 0x09
[16613.718543] logitech-hidpp-device 0003:046D:4038.0006: hidpp20_batteryle=
vel_get_battery_capacity: received protocol error 0x09
[23529.938728] logitech-hidpp-device 0003:046D:4038.0006: hidpp20_batteryle=
vel_get_battery_capacity: received protocol error 0x09

We are already silencing error-code 0x09 (HIDPP_ERROR_RESOURCE_ERROR)
errors in other places, lets do the same in
hidpp20_batterylevel_get_battery_capacity to remove these harmless,
but scary looking errors from the dmesg output.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 8e91e2f06cb4..cd9193078525 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1102,6 +1102,9 @@ static int hidpp20_batterylevel_get_battery_capacity(=
struct hidpp_device *hidpp,
 =09ret =3D hidpp_send_fap_command_sync(hidpp, feature_index,
 =09=09=09=09=09  CMD_BATTERY_LEVEL_STATUS_GET_BATTERY_LEVEL_STATUS,
 =09=09=09=09=09  NULL, 0, &response);
+=09/* Ignore these intermittent errors */
+=09if (ret =3D=3D HIDPP_ERROR_RESOURCE_ERROR)
+=09=09return -EIO;
 =09if (ret > 0) {
 =09=09hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
 =09=09=09__func__, ret);
--=20
2.23.0

