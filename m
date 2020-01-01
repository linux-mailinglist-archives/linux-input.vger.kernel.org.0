Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24FC112DF3A
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2020 15:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgAAOyh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jan 2020 09:54:37 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21486 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725783AbgAAOyh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Jan 2020 09:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577890476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PrFDttW00HT8+r1wKB5F+O9CjgnzQwIJTKLoi1FfpM0=;
        b=gta49X1V1j199k8mJy8leQrNahjjrRvhOY2uygQg6XB6hTHUFqdGpR3JJKTQugg+u0vjVk
        m5VVINkxrqhnTHoFkHwxDDWXTJuv1sUWuKluxSQLmhsZ63LjHdX/d4hVkIqqkd5R/swgjs
        EN4DsEiIRrj2MgM37JBW+aT2ib/9G+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-hqsuyk8TN2a0e4PLLSgL7w-1; Wed, 01 Jan 2020 09:54:35 -0500
X-MC-Unique: hqsuyk8TN2a0e4PLLSgL7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FEF1477;
        Wed,  1 Jan 2020 14:54:34 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2AC2083C09;
        Wed,  1 Jan 2020 14:54:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH 03/10] Input: goodix - Make resetting the controller at probe independent from the GPIO setup
Date:   Wed,  1 Jan 2020 15:54:22 +0100
Message-Id: <20200101145429.16185-3-hdegoede@redhat.com>
In-Reply-To: <20200101145429.16185-1-hdegoede@redhat.com>
References: <20200101145429.16185-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Before this commit we would always reset the controller at probe when we
have access to the GPIOs which are necessary to do a reset.

Doing the reset requires access to the GPIOs, but just because we have
access to the GPIOs does not mean that we should always reset the
controller at probe. On X86 ACPI platforms the BIOS / UEFI firmware will
already have reset the controller and it will have loaded the device
specific config into the controller. Doing the reset sometimes causes the
controller to loose its configuration, so on X86 ACPI platforms this is n=
ot
a good idea.

This commit adds a new reset_controller_at_probe boolean to control the
reset at probe behavior.

This commits sets the new bool to true when we set irq_pin_access_method
to irq_pin_access_gpio, so there are no functional changes.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index eccf07adfae1..dd5a8f9e8ada 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -56,6 +56,7 @@ struct goodix_ts_data {
 	u16 id;
 	u16 version;
 	const char *cfg_name;
+	bool reset_controller_at_probe;
 	bool load_cfg_from_disk;
 	struct completion firmware_loading_complete;
 	unsigned long irq_flags;
@@ -656,6 +657,7 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
ta *ts)
 	ts->gpiod_rst =3D gpiod;
=20
 	if (ts->gpiod_int && ts->gpiod_rst) {
+		ts->reset_controller_at_probe =3D true;
 		ts->load_cfg_from_disk =3D true;
 		ts->irq_pin_access_method =3D irq_pin_access_gpio;
 	}
@@ -932,7 +934,7 @@ static int goodix_ts_probe(struct i2c_client *client,
 	if (error)
 		return error;
=20
-	if (ts->irq_pin_access_method =3D=3D irq_pin_access_gpio) {
+	if (ts->reset_controller_at_probe) {
 		/* reset the controller */
 		error =3D goodix_reset(ts);
 		if (error) {
--=20
2.24.1

