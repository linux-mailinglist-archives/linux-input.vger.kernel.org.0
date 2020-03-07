Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1CE17CE12
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 13:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgCGMPZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 07:15:25 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38992 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726269AbgCGMPY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 07:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583583323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RyU3poUl9nZ5y2UwhwOXIx6LwbbKNvQHVlMqaG+24tw=;
        b=i2SxSzNdbwuZJqeLsxUic2YaFR3BmBdpcRfFALTwPU24MCHUDHaQ410caCVzUA7RFiXqPS
        viMGF83Lkaz+aND5WyK/Vz3VFSe0VQ0JB9YQFPP5MX0UkJmx/BJ1FeKYkntfOLL1L3pQPx
        MtFCTj2BA20cOGX/Bld3WGAEV0bS+mc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-y5VFxs-ZMMK76VOZZqNLJg-1; Sat, 07 Mar 2020 07:15:20 -0500
X-MC-Unique: y5VFxs-ZMMK76VOZZqNLJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8909184C800;
        Sat,  7 Mar 2020 12:15:19 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C60241BC6D;
        Sat,  7 Mar 2020 12:15:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 09/11] Input: goodix - Add minimum firmware size check
Date:   Sat,  7 Mar 2020 13:15:03 +0100
Message-Id: <20200307121505.3707-9-hdegoede@redhat.com>
In-Reply-To: <20200307121505.3707-1-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Our goodix_check_cfg_* helpers do things like:

	int i, raw_cfg_len =3D cfg->size - 2;
	...
	if (check_sum !=3D cfg->data[raw_cfg_len]) {

When cfg->size < 2, this will end up indexing the cfg->data array with
a negative value, which will not end well.

To fix this this commit adds a new GOODIX_CONFIG_MIN_LENGTH define and
adds a minimum size check for firmware-config files using this new define=
.

For consistency this commit also adds a new GOODIX_CONFIG_GT9X_LENGTH for
the length used for recent gt9xx and gt1xxx chips, instead of using
GOODIX_CONFIG_MAX_LENGTH for this, so that if other length defines get
added in the future it will be clear that the MIN and MAX defines should
contain the min and max values of all the other defines.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patch series
---
 drivers/input/touchscreen/goodix.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index eb57c39dc55b..5227223e666b 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -39,9 +39,11 @@
 #define GOODIX_MAX_CONTACT_SIZE		9
 #define GOODIX_MAX_CONTACTS		10
=20
-#define GOODIX_CONFIG_MAX_LENGTH	240
+#define GOODIX_CONFIG_MIN_LENGTH	186
 #define GOODIX_CONFIG_911_LENGTH	186
 #define GOODIX_CONFIG_967_LENGTH	228
+#define GOODIX_CONFIG_GT9X_LENGTH	240
+#define GOODIX_CONFIG_MAX_LENGTH	240
=20
 /* Register defines */
 #define GOODIX_REG_COMMAND		0x8040
@@ -109,7 +111,7 @@ static void goodix_calc_cfg_checksum_16(struct goodix=
_ts_data *ts);
=20
 static const struct goodix_chip_data gt1x_chip_data =3D {
 	.config_addr		=3D GOODIX_GT1X_REG_CONFIG_DATA,
-	.config_len		=3D GOODIX_CONFIG_MAX_LENGTH,
+	.config_len		=3D GOODIX_CONFIG_GT9X_LENGTH,
 	.check_config		=3D goodix_check_cfg_16,
 	.calc_config_checksum	=3D goodix_calc_cfg_checksum_16,
 };
@@ -130,7 +132,7 @@ static const struct goodix_chip_data gt967_chip_data =
=3D {
=20
 static const struct goodix_chip_data gt9x_chip_data =3D {
 	.config_addr		=3D GOODIX_GT9X_REG_CONFIG_DATA,
-	.config_len		=3D GOODIX_CONFIG_MAX_LENGTH,
+	.config_len		=3D GOODIX_CONFIG_GT9X_LENGTH,
 	.check_config		=3D goodix_check_cfg_8,
 	.calc_config_checksum	=3D goodix_calc_cfg_checksum_8,
 };
@@ -509,7 +511,8 @@ static void goodix_calc_cfg_checksum_16(struct goodix=
_ts_data *ts)
 static int goodix_check_cfg(struct goodix_ts_data *ts,
 			    const struct firmware *cfg)
 {
-	if (cfg->size > GOODIX_CONFIG_MAX_LENGTH) {
+	if (cfg->size < GOODIX_CONFIG_MIN_LENGTH ||
+	    cfg->size > GOODIX_CONFIG_MAX_LENGTH) {
 		dev_err(&ts->client->dev,
 			"The length of the config fw is not correct");
 		return -EINVAL;
--=20
2.25.1

