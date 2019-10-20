Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE5DDE0C7
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2019 23:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbfJTVr3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 17:47:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45422 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726374AbfJTVr2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 17:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571608047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=QvHg9G5IUBK1ZxXZrofOmkygG7aGnz8dBx2C+LM1U6U=;
        b=echaUuOrsp/Vod4CrCT4OkcFZWuBc8NE6I6dsUU53SAB0+U+iZm47H1UOHIH4Gd2UNFeAA
        1/Ig6T/7P56GqnisnyunAh7XlKCOcwHhW9oJeJlVj47eyCQoP+8EmxsIbTc5sG5kQXpx08
        gwYIDUvx30BTkXsCzWk8qjA6jMZUV4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-4TOFgtxhNICmg_WkBZAOVQ-1; Sun, 20 Oct 2019 17:47:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FE381800DC7;
        Sun, 20 Oct 2019 21:47:23 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-98.ams2.redhat.com [10.36.116.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E75C2608A5;
        Sun, 20 Oct 2019 21:47:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] HID: i2c-hid: Send power-on command after reset
Date:   Sun, 20 Oct 2019 23:47:18 +0200
Message-Id: <20191020214718.150906-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 4TOFgtxhNICmg_WkBZAOVQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Before commit 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power
management"), any i2c-hid touchscreens would typically be runtime-suspended
between the driver loading and Xorg or a Wayland compositor opening it,
causing it to be resumed again. This means that before this change,
we would call i2c_hid_set_power(OFF), i2c_hid_set_power(ON) before the
graphical session would start listening to the touchscreen.

It turns out that at least some SIS touchscreens, such as the one found
on the Asus T100HA, need a power-on command after reset, otherwise they
will not send any events.

Fixes: 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-h=
id-core.c
index d9c55e30f986..04c088131e04 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -447,8 +447,12 @@ static int i2c_hid_hwreset(struct i2c_client *client)
 =09if (ret) {
 =09=09dev_err(&client->dev, "failed to reset device.\n");
 =09=09i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
+=09=09goto out_unlock;
 =09}
=20
+=09/* At least some SIS devices need this after reset */
+=09ret =3D i2c_hid_set_power(client, I2C_HID_PWR_ON);
+
 out_unlock:
 =09mutex_unlock(&ihid->reset_lock);
 =09return ret;
--=20
2.23.0

