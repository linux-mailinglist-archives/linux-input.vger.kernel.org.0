Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8BE12DF42
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2020 15:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbgAAOyu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jan 2020 09:54:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24866 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727075AbgAAOyt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jan 2020 09:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577890488;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OUjbpD1ItOrOa7T/NVzcaJPR9tn9Fj40n0xcoR1De+8=;
        b=F/u1I9CB5XWTlgjzObgVi3FPHeatnc50+3YNd+4Dbkl84VllZ25309r6zycJQ1uxu0D07X
        YhTLPbzhtd7fzykj2/wt/FhOIZNqoDfwgGWMEjeqMgoc3njZa37Us7DAVqLqOMyzoQiy6c
        L0bcRHjxcdu2BDJxyPxJ3z/g7x/huNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-NQsvZqQzM_SAp-ePRC-_IA-1; Wed, 01 Jan 2020 09:54:44 -0500
X-MC-Unique: NQsvZqQzM_SAp-ePRC-_IA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D104F800D41;
        Wed,  1 Jan 2020 14:54:43 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BB6D082063;
        Wed,  1 Jan 2020 14:54:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH 10/10] Input: goodix - Restore config on resume if necessary
Date:   Wed,  1 Jan 2020 15:54:29 +0100
Message-Id: <20200101145429.16185-10-hdegoede@redhat.com>
In-Reply-To: <20200101145429.16185-1-hdegoede@redhat.com>
References: <20200101145429.16185-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices, e.g the Trekstor Primetab S11B, loose there config over
a suspend/resume cycle (likely the controller looses power during suspend=
).

This commit reads back the config version on resume and if matches the
expected config version it resets the controller and resends the config
we read back and saved at probe time.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 0f39c499e3a9..389d3e044f97 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1232,6 +1232,7 @@ static int __maybe_unused goodix_resume(struct devi=
ce *dev)
 {
 	struct i2c_client *client =3D to_i2c_client(dev);
 	struct goodix_ts_data *ts =3D i2c_get_clientdata(client);
+	u8 config_ver;
 	int error;
=20
 	if (ts->irq_pin_access_method =3D=3D irq_pin_access_none) {
@@ -1253,6 +1254,27 @@ static int __maybe_unused goodix_resume(struct dev=
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
+		dev_warn(dev, "Config version mismatch %d !=3D %d, resetting controlle=
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
2.24.1

