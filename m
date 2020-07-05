Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0039D2149BE
	for <lists+linux-input@lfdr.de>; Sun,  5 Jul 2020 04:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgGEC4k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Jul 2020 22:56:40 -0400
Received: from mail-40137.protonmail.ch ([185.70.40.137]:50288 "EHLO
        mail-40137.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgGEC4k (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Jul 2020 22:56:40 -0400
X-Greylist: delayed 494 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 Jul 2020 22:56:38 EDT
Date:   Sun, 05 Jul 2020 02:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1593917302;
        bh=pmMW5RuvGxW1tpO1VhOI282KLL4Jyl1FTQA9xHHkje0=;
        h=Date:To:From:Reply-To:Subject:From;
        b=DRV+xQmisuiAsx1+Yha2dlCbDHytWWCnUPz0BqGWq+248/rATeQ+YR+wM2wyy+cVb
         coT2B9en+mgxOKUFdNKenoVW4CKQ9Q3czSpS/uCksg5QtgTMck0Tl4IY8Wn5LesWeC
         vY4tfGQgEokDWfOLTibNNYo8ByXWON5Ex4KcpnRs=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
From:   Mazin Rezk <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH] HID: logitech: Use HIDPP_RECEIVER_INDEX instead of 0xff
Message-ID: <FW0Ps9vggIuA-9asmWgfQkNKSlcwuAhNfFXxK3QGSu4uJRAEykUGdoL5sbJsAlehWv__Eq4LKejp0QpxQRj5LYn5tOrVRDbjrcn3JVDGLAQ=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
        shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some parts of hid-logitech-dj explicitly referred to 0xff for the
receiver index. This patch changes those references to the
HIDPP_RECEIVER_INDEX definition.

Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/hid/hid-logitech-dj.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 48dff5d6b605..a78c13cc9f47 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1153,7 +1153,7 @@ static int logi_dj_recv_query_paired_devices(struct d=
j_receiver_dev *djrcv_dev)
 =09if (!dj_report)
 =09=09return -ENOMEM;
 =09dj_report->report_id =3D REPORT_ID_DJ_SHORT;
-=09dj_report->device_index =3D 0xFF;
+=09dj_report->device_index =3D HIDPP_RECEIVER_INDEX;
 =09dj_report->report_type =3D REPORT_TYPE_CMD_GET_PAIRED_DEVICES;
 =09retval =3D logi_dj_recv_send_report(djrcv_dev, dj_report);
 =09kfree(dj_report);
@@ -1175,7 +1175,7 @@ static int logi_dj_recv_switch_to_dj_mode(struct dj_r=
eceiver_dev *djrcv_dev,

 =09if (djrcv_dev->type =3D=3D recvr_type_dj) {
 =09=09dj_report->report_id =3D REPORT_ID_DJ_SHORT;
-=09=09dj_report->device_index =3D 0xFF;
+=09=09dj_report->device_index =3D HIDPP_RECEIVER_INDEX;
 =09=09dj_report->report_type =3D REPORT_TYPE_CMD_SWITCH;
 =09=09dj_report->report_params[CMD_SWITCH_PARAM_DEVBITFIELD] =3D 0x3F;
 =09=09dj_report->report_params[CMD_SWITCH_PARAM_TIMEOUT_SECONDS] =3D
@@ -1204,7 +1204,7 @@ static int logi_dj_recv_switch_to_dj_mode(struct dj_r=
eceiver_dev *djrcv_dev,
 =09memset(buf, 0, HIDPP_REPORT_SHORT_LENGTH);

 =09buf[0] =3D REPORT_ID_HIDPP_SHORT;
-=09buf[1] =3D 0xFF;
+=09buf[1] =3D HIDPP_RECEIVER_INDEX;
 =09buf[2] =3D 0x80;
 =09buf[3] =3D 0x00;
 =09buf[4] =3D 0x00;
--
2.27.0
