Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF6712DF3B
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2020 15:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbgAAOyk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jan 2020 09:54:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45991 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725783AbgAAOyk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jan 2020 09:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577890478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jvhp+xnz9EwRvP63K0+dQ4Xvfe7NLR2F8UF0Jv3WGIg=;
        b=gchBX8Q30Mh2zr2ZacWhgmbwd7uXiiUsgXxqXlZFgCtGpek0MzmvU/klgwrHw/3JlMcmxA
        rGAwCeHJc2kfeyyologKJD04j87lo03ijP89Bi11hgNgbvkUATXvJWx0WVDAMEkCiOBQ8e
        Y05dzSJU+UsAtiD/mqw9MAVZKS8WqzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-wk-rlNhMOwGFmWPoFZ_9kQ-1; Wed, 01 Jan 2020 09:54:34 -0500
X-MC-Unique: wk-rlNhMOwGFmWPoFZ_9kQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7A8D10054E3;
        Wed,  1 Jan 2020 14:54:32 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C149482063;
        Wed,  1 Jan 2020 14:54:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH 02/10] Input: goodix - Make loading the config from disk independent from the GPIO setup
Date:   Wed,  1 Jan 2020 15:54:21 +0100
Message-Id: <20200101145429.16185-2-hdegoede@redhat.com>
In-Reply-To: <20200101145429.16185-1-hdegoede@redhat.com>
References: <20200101145429.16185-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

At least on X86 ACPI platforms it is not necessary to load the touchscree=
n
controller config from disk, if it needs to be loaded this has already be=
en
done by the BIOS / UEFI firmware.

Even on other (e.g. devicetree) platforms the config-loading as currently
done has the issue that the loaded cfg file is based on the controller
model, but the actual cfg is device specific, so the cfg files are not
part of linux-firmware and this can only work with a device specific OS
image which includes the cfg file.

And we do not need access to the GPIOs at all to load the config, if we
do not have access we can still load the config.

So all in all tying the decision to try to load the config from disk to
being able to access the GPIOs is not desirable. This commit adds a new
load_cfg_from_disk boolean to control the firmware loading instead.

This commits sets the new bool to true when we set irq_pin_access_method
to irq_pin_access_gpio, so there are no functional changes.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 08806a00a9b9..eccf07adfae1 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -56,6 +56,7 @@ struct goodix_ts_data {
 	u16 id;
 	u16 version;
 	const char *cfg_name;
+	bool load_cfg_from_disk;
 	struct completion firmware_loading_complete;
 	unsigned long irq_flags;
 	enum goodix_irq_pin_access_method irq_pin_access_method;
@@ -654,8 +655,10 @@ static int goodix_get_gpio_config(struct goodix_ts_d=
ata *ts)
=20
 	ts->gpiod_rst =3D gpiod;
=20
-	if (ts->gpiod_int && ts->gpiod_rst)
+	if (ts->gpiod_int && ts->gpiod_rst) {
+		ts->load_cfg_from_disk =3D true;
 		ts->irq_pin_access_method =3D irq_pin_access_gpio;
+	}
=20
 	return 0;
 }
@@ -952,7 +955,7 @@ static int goodix_ts_probe(struct i2c_client *client,
=20
 	ts->chip =3D goodix_get_chip_data(ts->id);
=20
-	if (ts->irq_pin_access_method =3D=3D irq_pin_access_gpio) {
+	if (ts->load_cfg_from_disk) {
 		/* update device config */
 		ts->cfg_name =3D devm_kasprintf(&client->dev, GFP_KERNEL,
 					      "goodix_%d_cfg.bin", ts->id);
@@ -983,7 +986,7 @@ static int goodix_ts_remove(struct i2c_client *client=
)
 {
 	struct goodix_ts_data *ts =3D i2c_get_clientdata(client);
=20
-	if (ts->irq_pin_access_method =3D=3D irq_pin_access_gpio)
+	if (ts->load_cfg_from_disk)
 		wait_for_completion(&ts->firmware_loading_complete);
=20
 	return 0;
@@ -1001,7 +1004,8 @@ static int __maybe_unused goodix_suspend(struct dev=
ice *dev)
 		return 0;
 	}
=20
-	wait_for_completion(&ts->firmware_loading_complete);
+	if (ts->load_cfg_from_disk)
+		wait_for_completion(&ts->firmware_loading_complete);
=20
 	/* Free IRQ as IRQ pin is used as output in the suspend sequence */
 	goodix_free_irq(ts);
--=20
2.24.1

