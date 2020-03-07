Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1F9217CE10
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 13:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgCGMPV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 07:15:21 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39461 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726269AbgCGMPU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 07:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583583320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kf++EnFvZfVOwQMSq2NUrycmIDxE9TIKcWZrVTM6tXA=;
        b=Ce+RB21M33E7g9bu+Z84M+csaAkhf8NUYeBdkLOJm/LhGRDWoSZ7dW+gtMRdaiL4RDKRPy
        MRnPCsz3zEMxewiTgmG+GhMLxY88jUIlF3j/+XmU6/rpzuAa6ZzRagGB/YUGU0Vs4e3e53
        NwXHqEHHEjMhamgOU+86hrstMzpT+BQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212--_CQSUOaP6ew9kurWed-_A-1; Sat, 07 Mar 2020 07:15:18 -0500
X-MC-Unique: -_CQSUOaP6ew9kurWed-_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23AF4184C800;
        Sat,  7 Mar 2020 12:15:17 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0A3571BC6D;
        Sat,  7 Mar 2020 12:15:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v3 07/11] Input: goodix - Move defines to above struct goodix_ts_data declaration
Date:   Sat,  7 Mar 2020 13:15:01 +0100
Message-Id: <20200307121505.3707-7-hdegoede@redhat.com>
In-Reply-To: <20200307121505.3707-1-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Move the  defines to above the struct goodix_ts_data declaration, so
that the MAX defines can be used inside the struct goodix_ts_data
declaration. No functional changes, just moving a block of code.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 60 +++++++++++++++---------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 3ff05a35ac1e..035e133830a2 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -29,6 +29,36 @@
 #include <linux/of.h>
 #include <asm/unaligned.h>
=20
+#define GOODIX_GPIO_INT_NAME		"irq"
+#define GOODIX_GPIO_RST_NAME		"reset"
+
+#define GOODIX_MAX_HEIGHT		4096
+#define GOODIX_MAX_WIDTH		4096
+#define GOODIX_INT_TRIGGER		1
+#define GOODIX_CONTACT_SIZE		8
+#define GOODIX_MAX_CONTACT_SIZE		9
+#define GOODIX_MAX_CONTACTS		10
+
+#define GOODIX_CONFIG_MAX_LENGTH	240
+#define GOODIX_CONFIG_911_LENGTH	186
+#define GOODIX_CONFIG_967_LENGTH	228
+
+/* Register defines */
+#define GOODIX_REG_COMMAND		0x8040
+#define GOODIX_CMD_SCREEN_OFF		0x05
+
+#define GOODIX_READ_COOR_ADDR		0x814E
+#define GOODIX_GT1X_REG_CONFIG_DATA	0x8050
+#define GOODIX_GT9X_REG_CONFIG_DATA	0x8047
+#define GOODIX_REG_ID			0x8140
+
+#define GOODIX_BUFFER_STATUS_READY	BIT(7)
+#define GOODIX_BUFFER_STATUS_TIMEOUT	20
+
+#define RESOLUTION_LOC		1
+#define MAX_CONTACTS_LOC	5
+#define TRIGGER_LOC		6
+
 struct goodix_ts_data;
=20
 enum goodix_irq_pin_access_method {
@@ -68,36 +98,6 @@ struct goodix_ts_data {
 	unsigned int contact_size;
 };
=20
-#define GOODIX_GPIO_INT_NAME		"irq"
-#define GOODIX_GPIO_RST_NAME		"reset"
-
-#define GOODIX_MAX_HEIGHT		4096
-#define GOODIX_MAX_WIDTH		4096
-#define GOODIX_INT_TRIGGER		1
-#define GOODIX_CONTACT_SIZE		8
-#define GOODIX_MAX_CONTACT_SIZE		9
-#define GOODIX_MAX_CONTACTS		10
-
-#define GOODIX_CONFIG_MAX_LENGTH	240
-#define GOODIX_CONFIG_911_LENGTH	186
-#define GOODIX_CONFIG_967_LENGTH	228
-
-/* Register defines */
-#define GOODIX_REG_COMMAND		0x8040
-#define GOODIX_CMD_SCREEN_OFF		0x05
-
-#define GOODIX_READ_COOR_ADDR		0x814E
-#define GOODIX_GT1X_REG_CONFIG_DATA	0x8050
-#define GOODIX_GT9X_REG_CONFIG_DATA	0x8047
-#define GOODIX_REG_ID			0x8140
-
-#define GOODIX_BUFFER_STATUS_READY	BIT(7)
-#define GOODIX_BUFFER_STATUS_TIMEOUT	20
-
-#define RESOLUTION_LOC		1
-#define MAX_CONTACTS_LOC	5
-#define TRIGGER_LOC		6
-
 static int goodix_check_cfg_8(struct goodix_ts_data *ts,
 			const struct firmware *cfg);
 static int goodix_check_cfg_16(struct goodix_ts_data *ts,
--=20
2.25.1

