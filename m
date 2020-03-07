Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F77517CE11
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 13:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgCGMPW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 07:15:22 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20352 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726269AbgCGMPW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 07:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583583321;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7gKAt/awFe9kC49u5UQMt9T3H8ULlEgxXSXYVBn+EeE=;
        b=e0+5dA5O0r8rcYzY+/07v9GAP72aK4y9yI08xeW3RuwGnzdb5g3kyAIKXQ3I4xFy6CwQBG
        /ujjC1yJFsqrMr5KlmVJTI7Frr8uPqI4fT2ONrwSXUVBD8OyR8tA3H12srNtgELaZaMOXI
        rbn6sgtdwTBVkdfN0eOOw5ottQ/wGKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-SjFAK3-eOx-h1s7Pu1y1TQ-1; Sat, 07 Mar 2020 07:15:19 -0500
X-MC-Unique: SjFAK3-eOx-h1s7Pu1y1TQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8446D8017CC;
        Sat,  7 Mar 2020 12:15:18 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 675451BC6D;
        Sat,  7 Mar 2020 12:15:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v3 08/11] Input: goodix - Save a copy of the config from goodix_read_config()
Date:   Sat,  7 Mar 2020 13:15:02 +0100
Message-Id: <20200307121505.3707-8-hdegoede@redhat.com>
In-Reply-To: <20200307121505.3707-1-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Save a copy of the config in goodix_read_config(), this is a preparation
patch for restoring the config if it was lost after a supend/resume cycle=
.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- s/fix_config/calc_config_checksum/
- Add a comment explaining that the "ts->config[raw_cfg_len + 1] =3D 1" l=
ines
  are setting the "config_fresh" bit
---
 drivers/input/touchscreen/goodix.c | 47 ++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 035e133830a2..eb57c39dc55b 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -72,6 +72,7 @@ struct goodix_chip_data {
 	u16 config_addr;
 	int config_len;
 	int (*check_config)(struct goodix_ts_data *, const struct firmware *);
+	void (*calc_config_checksum)(struct goodix_ts_data *ts);
 };
=20
 struct goodix_ts_data {
@@ -96,35 +97,42 @@ struct goodix_ts_data {
 	unsigned long irq_flags;
 	enum goodix_irq_pin_access_method irq_pin_access_method;
 	unsigned int contact_size;
+	u8 config[GOODIX_CONFIG_MAX_LENGTH];
 };
=20
 static int goodix_check_cfg_8(struct goodix_ts_data *ts,
 			const struct firmware *cfg);
 static int goodix_check_cfg_16(struct goodix_ts_data *ts,
 			const struct firmware *cfg);
+static void goodix_calc_cfg_checksum_8(struct goodix_ts_data *ts);
+static void goodix_calc_cfg_checksum_16(struct goodix_ts_data *ts);
=20
 static const struct goodix_chip_data gt1x_chip_data =3D {
 	.config_addr		=3D GOODIX_GT1X_REG_CONFIG_DATA,
 	.config_len		=3D GOODIX_CONFIG_MAX_LENGTH,
 	.check_config		=3D goodix_check_cfg_16,
+	.calc_config_checksum	=3D goodix_calc_cfg_checksum_16,
 };
=20
 static const struct goodix_chip_data gt911_chip_data =3D {
 	.config_addr		=3D GOODIX_GT9X_REG_CONFIG_DATA,
 	.config_len		=3D GOODIX_CONFIG_911_LENGTH,
 	.check_config		=3D goodix_check_cfg_8,
+	.calc_config_checksum	=3D goodix_calc_cfg_checksum_8,
 };
=20
 static const struct goodix_chip_data gt967_chip_data =3D {
 	.config_addr		=3D GOODIX_GT9X_REG_CONFIG_DATA,
 	.config_len		=3D GOODIX_CONFIG_967_LENGTH,
 	.check_config		=3D goodix_check_cfg_8,
+	.calc_config_checksum	=3D goodix_calc_cfg_checksum_8,
 };
=20
 static const struct goodix_chip_data gt9x_chip_data =3D {
 	.config_addr		=3D GOODIX_GT9X_REG_CONFIG_DATA,
 	.config_len		=3D GOODIX_CONFIG_MAX_LENGTH,
 	.check_config		=3D goodix_check_cfg_8,
+	.calc_config_checksum	=3D goodix_calc_cfg_checksum_8,
 };
=20
 static const unsigned long goodix_irq_flags[] =3D {
@@ -442,6 +450,19 @@ static int goodix_check_cfg_8(struct goodix_ts_data =
*ts,
 	return 0;
 }
=20
+static void goodix_calc_cfg_checksum_8(struct goodix_ts_data *ts)
+{
+	int i, raw_cfg_len =3D ts->chip->config_len - 2;
+	u8 check_sum =3D 0;
+
+	for (i =3D 0; i < raw_cfg_len; i++)
+		check_sum +=3D ts->config[i];
+	check_sum =3D (~check_sum) + 1;
+
+	ts->config[raw_cfg_len] =3D check_sum;
+	ts->config[raw_cfg_len + 1] =3D 1; /* Set "config_fresh" bit */
+}
+
 static int goodix_check_cfg_16(struct goodix_ts_data *ts,
 			const struct firmware *cfg)
 {
@@ -466,6 +487,19 @@ static int goodix_check_cfg_16(struct goodix_ts_data=
 *ts,
 	return 0;
 }
=20
+static void goodix_calc_cfg_checksum_16(struct goodix_ts_data *ts)
+{
+	int i, raw_cfg_len =3D ts->chip->config_len - 3;
+	u16 check_sum =3D 0;
+
+	for (i =3D 0; i < raw_cfg_len; i +=3D 2)
+		check_sum +=3D get_unaligned_be16(&ts->config[i]);
+	check_sum =3D (~check_sum) + 1;
+
+	put_unaligned_be16(check_sum, &ts->config[raw_cfg_len]);
+	ts->config[raw_cfg_len + 2] =3D 1; /* Set "config_fresh" bit */
+}
+
 /**
  * goodix_check_cfg - Checks if config fw is valid
  *
@@ -843,12 +877,11 @@ static int goodix_get_gpio_config(struct goodix_ts_=
data *ts)
  */
 static void goodix_read_config(struct goodix_ts_data *ts)
 {
-	u8 config[GOODIX_CONFIG_MAX_LENGTH];
 	int x_max, y_max;
 	int error;
=20
 	error =3D goodix_i2c_read(ts->client, ts->chip->config_addr,
-				config, ts->chip->config_len);
+				ts->config, ts->chip->config_len);
 	if (error) {
 		dev_warn(&ts->client->dev, "Error reading config: %d\n",
 			 error);
@@ -857,15 +890,17 @@ static void goodix_read_config(struct goodix_ts_dat=
a *ts)
 		return;
 	}
=20
-	ts->int_trigger_type =3D config[TRIGGER_LOC] & 0x03;
-	ts->max_touch_num =3D config[MAX_CONTACTS_LOC] & 0x0f;
+	ts->int_trigger_type =3D ts->config[TRIGGER_LOC] & 0x03;
+	ts->max_touch_num =3D ts->config[MAX_CONTACTS_LOC] & 0x0f;
=20
-	x_max =3D get_unaligned_le16(&config[RESOLUTION_LOC]);
-	y_max =3D get_unaligned_le16(&config[RESOLUTION_LOC + 2]);
+	x_max =3D get_unaligned_le16(&ts->config[RESOLUTION_LOC]);
+	y_max =3D get_unaligned_le16(&ts->config[RESOLUTION_LOC + 2]);
 	if (x_max && y_max) {
 		input_abs_set_max(ts->input_dev, ABS_MT_POSITION_X, x_max - 1);
 		input_abs_set_max(ts->input_dev, ABS_MT_POSITION_Y, y_max - 1);
 	}
+
+	ts->chip->calc_config_checksum(ts);
 }
=20
 /**
--=20
2.25.1

