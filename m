Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0391683FF
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2020 17:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgBUQsM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Feb 2020 11:48:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48027 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726550AbgBUQsL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Feb 2020 11:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582303690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UupPnaby7SpPxDfQY2kkW/qiysb0yTeJ3mIqTBuQPng=;
        b=axBe9fvesUgnlbzoSlrz3+uzHzZVAu4Mir0+a1bgK4XtOSRASomiR88Hc36csn7I3+urYs
        D+wLY0Tpba663Plsoc1dD77wkqLCHaejwRNw7TwPDN8q49oWJ7rd7+OTNLLXRBz/Z7i64k
        wsyp+FeoyJIlfBLwkAo//aAC+B4NBak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-q65HmfTEPL-64XScUOb-1Q-1; Fri, 21 Feb 2020 11:48:06 -0500
X-MC-Unique: q65HmfTEPL-64XScUOb-1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F17ABA36C5;
        Fri, 21 Feb 2020 16:48:04 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-191.ams2.redhat.com [10.36.116.191])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E7C9560CD3;
        Fri, 21 Feb 2020 16:48:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH resend 09/10] Input: goodix - Make goodix_send_cfg() take a raw buffer as argument
Date:   Fri, 21 Feb 2020 17:47:34 +0100
Message-Id: <20200221164735.508324-9-hdegoede@redhat.com>
In-Reply-To: <20200221164735.508324-1-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make goodix_send_cfg() take a raw buffer as argument instead of a
struct firmware *cfg, so that it can also be used to restore the config
on resume if necessary.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 46 ++++++++++++++----------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 21be33384d14..0f39c499e3a9 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -71,7 +71,7 @@ enum goodix_irq_pin_access_method {
 struct goodix_chip_data {
 	u16 config_addr;
 	int config_len;
-	int (*check_config)(struct goodix_ts_data *, const struct firmware *);
+	int (*check_config)(struct goodix_ts_data *ts, const u8 *cfg, int len);
 	void (*fix_config)(struct goodix_ts_data *ts);
 };
=20
@@ -101,9 +101,9 @@ struct goodix_ts_data {
 };
=20
 static int goodix_check_cfg_8(struct goodix_ts_data *ts,
-			const struct firmware *cfg);
+			      const u8 *cfg, int len);
 static int goodix_check_cfg_16(struct goodix_ts_data *ts,
-			const struct firmware *cfg);
+			       const u8 *cfg, int len);
 static void goodix_fix_cfg_8(struct goodix_ts_data *ts);
 static void goodix_fix_cfg_16(struct goodix_ts_data *ts);
=20
@@ -426,22 +426,21 @@ static int goodix_request_irq(struct goodix_ts_data=
 *ts)
 					 ts->irq_flags, ts->client->name, ts);
 }
=20
-static int goodix_check_cfg_8(struct goodix_ts_data *ts,
-			const struct firmware *cfg)
+static int goodix_check_cfg_8(struct goodix_ts_data *ts, const u8 *cfg, =
int len)
 {
-	int i, raw_cfg_len =3D cfg->size - 2;
+	int i, raw_cfg_len =3D len - 2;
 	u8 check_sum =3D 0;
=20
 	for (i =3D 0; i < raw_cfg_len; i++)
-		check_sum +=3D cfg->data[i];
+		check_sum +=3D cfg[i];
 	check_sum =3D (~check_sum) + 1;
-	if (check_sum !=3D cfg->data[raw_cfg_len]) {
+	if (check_sum !=3D cfg[raw_cfg_len]) {
 		dev_err(&ts->client->dev,
 			"The checksum of the config fw is not correct");
 		return -EINVAL;
 	}
=20
-	if (cfg->data[raw_cfg_len + 1] !=3D 1) {
+	if (cfg[raw_cfg_len + 1] !=3D 1) {
 		dev_err(&ts->client->dev,
 			"Config fw must have Config_Fresh register set");
 		return -EINVAL;
@@ -463,22 +462,22 @@ static void goodix_fix_cfg_8(struct goodix_ts_data =
*ts)
 	ts->config[raw_cfg_len + 1] =3D 1;
 }
=20
-static int goodix_check_cfg_16(struct goodix_ts_data *ts,
-			const struct firmware *cfg)
+static int goodix_check_cfg_16(struct goodix_ts_data *ts, const u8 *cfg,
+			       int len)
 {
-	int i, raw_cfg_len =3D cfg->size - 3;
+	int i, raw_cfg_len =3D len - 3;
 	u16 check_sum =3D 0;
=20
 	for (i =3D 0; i < raw_cfg_len; i +=3D 2)
-		check_sum +=3D get_unaligned_be16(&cfg->data[i]);
+		check_sum +=3D get_unaligned_be16(&cfg[i]);
 	check_sum =3D (~check_sum) + 1;
-	if (check_sum !=3D get_unaligned_be16(&cfg->data[raw_cfg_len])) {
+	if (check_sum !=3D get_unaligned_be16(&cfg[raw_cfg_len])) {
 		dev_err(&ts->client->dev,
 			"The checksum of the config fw is not correct");
 		return -EINVAL;
 	}
=20
-	if (cfg->data[raw_cfg_len + 2] !=3D 1) {
+	if (cfg[raw_cfg_len + 2] !=3D 1) {
 		dev_err(&ts->client->dev,
 			"Config fw must have Config_Fresh register set");
 		return -EINVAL;
@@ -506,16 +505,15 @@ static void goodix_fix_cfg_16(struct goodix_ts_data=
 *ts)
  * @ts: goodix_ts_data pointer
  * @cfg: firmware config data
  */
-static int goodix_check_cfg(struct goodix_ts_data *ts,
-			    const struct firmware *cfg)
+static int goodix_check_cfg(struct goodix_ts_data *ts, const u8 *cfg, in=
t len)
 {
-	if (cfg->size > GOODIX_CONFIG_MAX_LENGTH) {
+	if (len > GOODIX_CONFIG_MAX_LENGTH) {
 		dev_err(&ts->client->dev,
 			"The length of the config fw is not correct");
 		return -EINVAL;
 	}
=20
-	return ts->chip->check_config(ts, cfg);
+	return ts->chip->check_config(ts, cfg, len);
 }
=20
 /**
@@ -524,17 +522,15 @@ static int goodix_check_cfg(struct goodix_ts_data *=
ts,
  * @ts: goodix_ts_data pointer
  * @cfg: config firmware to write to device
  */
-static int goodix_send_cfg(struct goodix_ts_data *ts,
-			   const struct firmware *cfg)
+static int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg, int=
 len)
 {
 	int error;
=20
-	error =3D goodix_check_cfg(ts, cfg);
+	error =3D goodix_check_cfg(ts, cfg, len);
 	if (error)
 		return error;
=20
-	error =3D goodix_i2c_write(ts->client, ts->chip->config_addr, cfg->data=
,
-				 cfg->size);
+	error =3D goodix_i2c_write(ts->client, ts->chip->config_addr, cfg, len)=
;
 	if (error) {
 		dev_err(&ts->client->dev, "Failed to write config data: %d",
 			error);
@@ -1058,7 +1054,7 @@ static void goodix_config_cb(const struct firmware =
*cfg, void *ctx)
=20
 	if (cfg) {
 		/* send device configuration to the firmware */
-		error =3D goodix_send_cfg(ts, cfg);
+		error =3D goodix_send_cfg(ts, cfg->data, cfg->size);
 		if (error)
 			goto err_release_cfg;
 	}
--=20
2.25.0

