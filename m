Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3619112DF40
	for <lists+linux-input@lfdr.de>; Wed,  1 Jan 2020 15:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgAAOyp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jan 2020 09:54:45 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27781 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727075AbgAAOyp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Jan 2020 09:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577890483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=unQWUTanchpRnVdbBSJHobAkca7o+O98ZPvn0NzbwxY=;
        b=Z66BCQ7IcbN+Vt8PvtBzKrRzPb/WXmBvSqY6pkzYfSt414qffsrp7ARTLrWOSfGJU9sghO
        VaiFm8Zfqb+2IqVsilktppXgRATwm51BxlV4HGQTmKsRxVdYNFT7tpIAtTNWoT/uda2z5E
        cauVV8sDq/Hg8Ytsns/MvKMvm8lD6bQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-IyNI4PfzMJOCmjDvs2RMZw-1; Wed, 01 Jan 2020 09:54:42 -0500
X-MC-Unique: IyNI4PfzMJOCmjDvs2RMZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D7608024D1;
        Wed,  1 Jan 2020 14:54:41 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 023F982063;
        Wed,  1 Jan 2020 14:54:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH 08/10] Input: goodix - Save a copy of the config from goodix_read_config()
Date:   Wed,  1 Jan 2020 15:54:27 +0100
Message-Id: <20200101145429.16185-8-hdegoede@redhat.com>
In-Reply-To: <20200101145429.16185-1-hdegoede@redhat.com>
References: <20200101145429.16185-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 51 ++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 66d6bb74507d..21be33384d14 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -72,6 +72,7 @@ struct goodix_chip_data {
 	u16 config_addr;
 	int config_len;
 	int (*check_config)(struct goodix_ts_data *, const struct firmware *);
+	void (*fix_config)(struct goodix_ts_data *ts);
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
+static void goodix_fix_cfg_8(struct goodix_ts_data *ts);
+static void goodix_fix_cfg_16(struct goodix_ts_data *ts);
=20
 static const struct goodix_chip_data gt1x_chip_data =3D {
 	.config_addr		=3D GOODIX_GT1X_REG_CONFIG_DATA,
 	.config_len		=3D GOODIX_CONFIG_MAX_LENGTH,
 	.check_config		=3D goodix_check_cfg_16,
+	.fix_config		=3D goodix_fix_cfg_16,
 };
=20
 static const struct goodix_chip_data gt911_chip_data =3D {
 	.config_addr		=3D GOODIX_GT9X_REG_CONFIG_DATA,
 	.config_len		=3D GOODIX_CONFIG_911_LENGTH,
 	.check_config		=3D goodix_check_cfg_8,
+	.fix_config		=3D goodix_fix_cfg_8,
 };
=20
 static const struct goodix_chip_data gt967_chip_data =3D {
 	.config_addr		=3D GOODIX_GT9X_REG_CONFIG_DATA,
 	.config_len		=3D GOODIX_CONFIG_967_LENGTH,
 	.check_config		=3D goodix_check_cfg_8,
+	.fix_config		=3D goodix_fix_cfg_8,
 };
=20
 static const struct goodix_chip_data gt9x_chip_data =3D {
 	.config_addr		=3D GOODIX_GT9X_REG_CONFIG_DATA,
 	.config_len		=3D GOODIX_CONFIG_MAX_LENGTH,
 	.check_config		=3D goodix_check_cfg_8,
+	.fix_config		=3D goodix_fix_cfg_8,
 };
=20
 static const unsigned long goodix_irq_flags[] =3D {
@@ -442,6 +450,19 @@ static int goodix_check_cfg_8(struct goodix_ts_data =
*ts,
 	return 0;
 }
=20
+static void goodix_fix_cfg_8(struct goodix_ts_data *ts)
+{
+	int i, raw_cfg_len =3D ts->chip->config_len - 2;
+	u8 check_sum =3D 0;
+
+	for (i =3D 0; i < raw_cfg_len; i++)
+		check_sum +=3D ts->config[i];
+	check_sum =3D (~check_sum) + 1;
+
+	ts->config[raw_cfg_len] =3D check_sum;
+	ts->config[raw_cfg_len + 1] =3D 1;
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
+static void goodix_fix_cfg_16(struct goodix_ts_data *ts)
+{
+	int i, raw_cfg_len =3D ts->chip->config_len - 3;
+	u16 check_sum =3D 0;
+
+	for (i =3D 0; i < raw_cfg_len; i +=3D 2)
+		check_sum +=3D get_unaligned_be16(&ts->config[i]);
+	check_sum =3D (~check_sum) + 1;
+
+	put_unaligned_be16(check_sum, &ts->config[raw_cfg_len]);
+	ts->config[raw_cfg_len + 2] =3D 1;
+}
+
 /**
  * goodix_check_cfg - Checks if config fw is valid
  *
@@ -828,12 +862,11 @@ static int goodix_get_gpio_config(struct goodix_ts_=
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
@@ -842,15 +875,21 @@ static void goodix_read_config(struct goodix_ts_dat=
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
+	/*
+	 * Ensure valid checksum and config_fresh bit being set for possible
+	 * re-upload of config after suspend/resume.
+	 */
+	ts->chip->fix_config(ts);
 }
=20
 /**
--=20
2.24.1

