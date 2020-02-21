Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E252A168400
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2020 17:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgBUQsN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Feb 2020 11:48:13 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34171 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgBUQsN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Feb 2020 11:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582303691;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7qRzsNRYPkGNDdDOrXTwsC7lDP0SRQVIc0cM4HNBxyA=;
        b=S5eeUDudPFl9ODGdxZQC+0hHHcgylmQYsuv8e9TNOSreltdQiWesUr/fNF+skkx/wpgu08
        jOQJROOPGLLLBA3tiqkwHGjyus6FutOx530lasxKTnHWUfWWr74/g37uVUflWr5O8dG9Qm
        3Qjq9k1y+JCGqxee0XG17PlKfnhwoTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-P9N-ugiOPT-jJ10BX_yyhA-1; Fri, 21 Feb 2020 11:48:09 -0500
X-MC-Unique: P9N-ugiOPT-jJ10BX_yyhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D113318B9FBF;
        Fri, 21 Feb 2020 16:48:08 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-191.ams2.redhat.com [10.36.116.191])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 576F4610DE;
        Fri, 21 Feb 2020 16:48:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH resend 10/10] Input: goodix - Restore config on resume if necessary
Date:   Fri, 21 Feb 2020 17:47:35 +0100
Message-Id: <20200221164735.508324-10-hdegoede@redhat.com>
In-Reply-To: <20200221164735.508324-1-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
2.25.0

