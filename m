Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0980517CE13
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 13:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgCGMP0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 07:15:26 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26759 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726269AbgCGMPZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 07:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583583324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b/o+ADmp79J6fOsPh3EqWFkKa4brKaoTW4iJBCG8nGc=;
        b=e0LxUVp/Vlt8xInBCPCKEnhcW/L+u7Y3yCUL0GwgBxWhd8BIVKVPu0O7g1J/YA4fdgBlEw
        1t2P+7Go+qYg/+VBlmb/i9vl6wYJ6OFerqRekPf+yh8FqAOShaWh2qYyDJ9C0Vn1hV1WaI
        gUZAmgkaZlw4i3snfD+y1WBldyNC6Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-iEuT03LdPj6cRHuepxyVlA-1; Sat, 07 Mar 2020 07:15:22 -0500
X-MC-Unique: iEuT03LdPj6cRHuepxyVlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2529F107ACC4;
        Sat,  7 Mar 2020 12:15:21 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0CA557389B;
        Sat,  7 Mar 2020 12:15:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v3 10/11] Input: goodix - Make goodix_send_cfg() take a raw buffer as argument
Date:   Sat,  7 Mar 2020 13:15:04 +0100
Message-Id: <20200307121505.3707-10-hdegoede@redhat.com>
In-Reply-To: <20200307121505.3707-1-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 48 ++++++++++++++----------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 5227223e666b..3c53f7fd1dfa 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -73,7 +73,7 @@ enum goodix_irq_pin_access_method {
 struct goodix_chip_data {
 	u16 config_addr;
 	int config_len;
-	int (*check_config)(struct goodix_ts_data *, const struct firmware *);
+	int (*check_config)(struct goodix_ts_data *ts, const u8 *cfg, int len);
 	void (*calc_config_checksum)(struct goodix_ts_data *ts);
 };
=20
@@ -103,9 +103,9 @@ struct goodix_ts_data {
 };
=20
 static int goodix_check_cfg_8(struct goodix_ts_data *ts,
-			const struct firmware *cfg);
+			      const u8 *cfg, int len);
 static int goodix_check_cfg_16(struct goodix_ts_data *ts,
-			const struct firmware *cfg);
+			       const u8 *cfg, int len);
 static void goodix_calc_cfg_checksum_8(struct goodix_ts_data *ts);
 static void goodix_calc_cfg_checksum_16(struct goodix_ts_data *ts);
=20
@@ -428,22 +428,21 @@ static int goodix_request_irq(struct goodix_ts_data=
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
@@ -465,22 +464,22 @@ static void goodix_calc_cfg_checksum_8(struct goodi=
x_ts_data *ts)
 	ts->config[raw_cfg_len + 1] =3D 1; /* Set "config_fresh" bit */
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
@@ -508,17 +507,16 @@ static void goodix_calc_cfg_checksum_16(struct good=
ix_ts_data *ts)
  * @ts: goodix_ts_data pointer
  * @cfg: firmware config data
  */
-static int goodix_check_cfg(struct goodix_ts_data *ts,
-			    const struct firmware *cfg)
+static int goodix_check_cfg(struct goodix_ts_data *ts, const u8 *cfg, in=
t len)
 {
-	if (cfg->size < GOODIX_CONFIG_MIN_LENGTH ||
-	    cfg->size > GOODIX_CONFIG_MAX_LENGTH) {
+	if (len < GOODIX_CONFIG_MIN_LENGTH ||
+	    len > GOODIX_CONFIG_MAX_LENGTH) {
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
@@ -527,17 +525,15 @@ static int goodix_check_cfg(struct goodix_ts_data *=
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
@@ -1072,7 +1068,7 @@ static void goodix_config_cb(const struct firmware =
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
2.25.1

