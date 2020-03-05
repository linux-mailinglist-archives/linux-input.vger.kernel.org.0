Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74A3317B119
	for <lists+linux-input@lfdr.de>; Thu,  5 Mar 2020 23:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgCEWBp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 17:01:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53258 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726177AbgCEWBo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Mar 2020 17:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583445703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9X0tPeTd8ep1xLj5JedlM+V1EOkT07TEa7tD2Nbptao=;
        b=M7qZvEeOnSRfZMov/9mgwIuS5zwEEkX1+Qrm2w6Z7pNTFE2llFO4eq6uhif6Xggd23BpHd
        Vvs9QJRjPopOMPas7n/4vwPVQc9cJn9KzI429/bM8FGlK2YjnizPOQDnZjb6aV0ZAF1/tU
        wR/Ek4SPj6E/1aUAA1dRQCYIkZ86+Fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-tWpXzQRDPmaIJ1cWlfyaxQ-1; Thu, 05 Mar 2020 17:01:39 -0500
X-MC-Unique: tWpXzQRDPmaIJ1cWlfyaxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 672838017CC;
        Thu,  5 Mar 2020 22:01:38 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 49B9839E;
        Thu,  5 Mar 2020 22:01:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v2 03/11] Input: goodix - Make resetting the controller at probe independent from the GPIO setup
Date:   Thu,  5 Mar 2020 23:01:24 +0100
Message-Id: <20200305220132.228722-3-hdegoede@redhat.com>
In-Reply-To: <20200305220132.228722-1-hdegoede@redhat.com>
References: <20200305220132.228722-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index 28bb4385a54d..b29946dd6697 100644
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

