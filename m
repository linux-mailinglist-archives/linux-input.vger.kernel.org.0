Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F8F17B122
	for <lists+linux-input@lfdr.de>; Thu,  5 Mar 2020 23:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgCEWB5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 17:01:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37053 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726263AbgCEWB5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Mar 2020 17:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583445716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SAwxEmlbYmwTrAkP9RTwzxAaRCJN87MPTXYLhM4I+nc=;
        b=V/qXjolYN8drOFJUoZZZb+V//YTsvXQzBuCBGMUjC541SNvVkLTnadrk+jNo5aKHJsMZBp
        B06FL3hp3auabk5w9Yadb5LwWMiy5oQ2EGY+Lv6aaWOovI8+SYaqJWueZK11CHXMCu1pJ7
        LDEE5MhQLBLIi5mAMxrnasCVq26u02A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-cTYXkzd_OO-qtOhoxzaxZg-1; Thu, 05 Mar 2020 17:01:52 -0500
X-MC-Unique: cTYXkzd_OO-qtOhoxzaxZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 424BE8024F6;
        Thu,  5 Mar 2020 22:01:51 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2493C272D1;
        Thu,  5 Mar 2020 22:01:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v2 11/11] Input: goodix - Restore config on resume if necessary
Date:   Thu,  5 Mar 2020 23:01:32 +0100
Message-Id: <20200305220132.228722-11-hdegoede@redhat.com>
In-Reply-To: <20200305220132.228722-1-hdegoede@redhat.com>
References: <20200305220132.228722-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices, e.g the Trekstor Primetab S11B, lose there config over
a suspend/resume cycle (likely the controller loses power during suspend)=
.

This commit reads back the config version on resume and if matches the
expected config version it resets the controller and resends the config
we read back and saved at probe time.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Replace dev_warn on version mismatch on resume with dev_info
---
 drivers/input/touchscreen/goodix.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 79dc4a0ad1a0..b37ea068c918 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1246,6 +1246,7 @@ static int __maybe_unused goodix_resume(struct devi=
ce *dev)
 {
 	struct i2c_client *client =3D to_i2c_client(dev);
 	struct goodix_ts_data *ts =3D i2c_get_clientdata(client);
+	u8 config_ver;
 	int error;
=20
 	if (ts->irq_pin_access_method =3D=3D IRQ_PIN_ACCESS_NONE) {
@@ -1267,6 +1268,27 @@ static int __maybe_unused goodix_resume(struct dev=
ice *dev)
 	if (error)
 		return error;
=20
+	error =3D goodix_i2c_read(ts->client, ts->chip->config_addr,
+				&config_ver, 1);
+	if (error)
+		dev_warn(dev, "Error reading config version: %d, resetting controller\=
n",
+			 error);
+	else if (config_ver !=3D ts->config[0])
+		dev_info(dev, "Config version mismatch %d !=3D %d, resetting controlle=
r\n",
+			 config_ver, ts->config[0]);
+
+	if (error !=3D 0 || config_ver !=3D ts->config[0]) {
+		error =3D goodix_reset(ts);
+		if (error) {
+			dev_err(dev, "Controller reset failed.\n");
+			return error;
+		}
+
+		error =3D goodix_send_cfg(ts, ts->config, ts->chip->config_len);
+		if (error)
+			return error;
+	}
+
 	error =3D goodix_request_irq(ts);
 	if (error)
 		return error;
--=20
2.25.1

