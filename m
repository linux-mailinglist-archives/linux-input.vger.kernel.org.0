Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B550D18219A
	for <lists+linux-input@lfdr.de>; Wed, 11 Mar 2020 20:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731030AbgCKTKY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Mar 2020 15:10:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20885 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730827AbgCKTKX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Mar 2020 15:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583953823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1hGKjHeTButN4pahe21ujciqKoFA1ETc94HuyisLC6E=;
        b=FySYEYF5w7/f79zcYfyd16vI2xfnRWqfjfqei/cPOtkzHTkP3BGfQXilkZpkp/X2NdeiLu
        9vTHrJezrGaZ6XkT2hgRwwgM/VtCzwoV3k3A3zDGAhD+8uIKCYf27yPPEvCx4oSebnTFJE
        4aUerBEESu5LLQAr4Nm4lQryw0i87BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-HnBCj7krNd2RnmMM_Nprkw-1; Wed, 11 Mar 2020 15:10:19 -0400
X-MC-Unique: HnBCj7krNd2RnmMM_Nprkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59412107ACCA;
        Wed, 11 Mar 2020 19:10:18 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2541560E3E;
        Wed, 11 Mar 2020 19:10:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Mastykin <dmastykin@astralinux.ru>,
        linux-input@vger.kernel.org
Subject: [PATCH] Input: goodix - Try to reset the controller if the i2c-test fails
Date:   Wed, 11 Mar 2020 20:10:13 +0100
Message-Id: <20200311191013.10826-2-hdegoede@redhat.com>
In-Reply-To: <20200311191013.10826-1-hdegoede@redhat.com>
References: <20200311191013.10826-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On some ACPI/x86 devices (where we use one of the ACPI IRQ pin access
methods) the firmware is buggy, it does not properly reset the controller
at boot, and we cannot communicate with it.

Normally on ACPI/x86 devices we do not want to reset the controller at
probe time since in some cases this causes the controller to loose its
configuration and this is loaded into it by the system's firmware.
So on these systems we leave the reset_controller_at_probe flag unset,
even though we have a access to both the IRQ and reset pins and thus
could reset it.

In the case of the buggy firmware we have to reset the controller to
actually be able to talk to it.

This commit adds a special case for this, if the goodix_i2c_test() fails,
and we have not reset the controller yet; and we do have a way to reset
the controller then retry the i2c-test after resetting the controller.

This fixes the driver failing at probe on ACPI/x86 systems with this
firmware bug.

Reported-and-tested-by: Dmitry Mastykin <dmastykin@astralinux.ru>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 2f135ac9484e..816d6ade89a9 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1165,6 +1165,7 @@ static int goodix_ts_probe(struct i2c_client *clien=
t,
 	if (error)
 		return error;
=20
+reset:
 	if (ts->reset_controller_at_probe) {
 		/* reset the controller */
 		error =3D goodix_reset(ts);
@@ -1176,6 +1177,12 @@ static int goodix_ts_probe(struct i2c_client *clie=
nt,
=20
 	error =3D goodix_i2c_test(client);
 	if (error) {
+		if (!ts->reset_controller_at_probe &&
+		    ts->irq_pin_access_method !=3D IRQ_PIN_ACCESS_NONE) {
+			/* Retry after a controller reset */
+			ts->reset_controller_at_probe =3D true;
+			goto reset;
+		}
 		dev_err(&client->dev, "I2C communication failure: %d\n", error);
 		return error;
 	}
--=20
2.25.1

