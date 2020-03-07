Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF7F017CE0A
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 13:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgCGMPS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 07:15:18 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50911 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726073AbgCGMPR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 07:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583583316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bsy0eOMbiepVqaOl6PH06jflS2kc5r+7UY4tDhqUCFA=;
        b=S0l4XkKegr2Vg0vYnCSdeh51OLKokY5N83+mOLWMYWVrghfi2oh22wNrJT5d7o4YGEDYp+
        SOzgahBNfMCDfpHPN34qqBrcO4xNSalb5mmJHIdmY2+vh3zQv6tiqvtfD2GU5KtJDX47cb
        9wUTCPVnLTZnO7+46LepruX8ZNf9q4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-aYxVVXRMOsadrCJJc5aIgQ-1; Sat, 07 Mar 2020 07:15:12 -0500
X-MC-Unique: aYxVVXRMOsadrCJJc5aIgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9016E1005513;
        Sat,  7 Mar 2020 12:15:11 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5E1181BC6D;
        Sat,  7 Mar 2020 12:15:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v3 03/11] Input: goodix - Make resetting the controller at probe independent from the GPIO setup
Date:   Sat,  7 Mar 2020 13:14:57 +0100
Message-Id: <20200307121505.3707-3-hdegoede@redhat.com>
In-Reply-To: <20200307121505.3707-1-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
controller to lose its configuration, so on X86 ACPI platforms this is no=
t
a good idea.

This commit adds a new reset_controller_at_probe boolean to control the
reset at probe behavior.

This commits sets the new bool to true when we set irq_pin_access_method
to IRQ_PIN_ACCESS_GPIO, so there are no functional changes.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 95cac14369a8..43c61f7c6f1e 100644
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
 		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_GPIO;
 	}
@@ -932,7 +934,7 @@ static int goodix_ts_probe(struct i2c_client *client,
 	if (error)
 		return error;
=20
-	if (ts->irq_pin_access_method =3D=3D IRQ_PIN_ACCESS_GPIO) {
+	if (ts->reset_controller_at_probe) {
 		/* reset the controller */
 		error =3D goodix_reset(ts);
 		if (error) {
--=20
2.25.1

