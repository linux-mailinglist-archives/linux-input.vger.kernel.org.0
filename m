Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461EE10E739
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 09:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbfLBI4r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 03:56:47 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41621 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727460AbfLBI4o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Dec 2019 03:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575277003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hwAHXSWhTGgphD1w+BXYO2tKYQfu0YcW3SJ7AmkvEvA=;
        b=GUvKLPAaliqFCoKKpFcv4efmiqJgKkN+PcXbY9db7od9T9zxyXPwxPQrUiIN8im9VCiqNN
        aQUlah4YiP7UyHwnr0VFf0PqzmwVvOjs5/SrlqhPC0UrXjNTxuvowdMLK8sL9OcPRYrRhp
        ZyFWJ4WUsldjz/OoB1cgbvw489PDa3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-_zy2DvM2PCW1Qb8dcVaM1g-1; Mon, 02 Dec 2019 03:56:40 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4898F800D4C;
        Mon,  2 Dec 2019 08:56:39 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2D4835C21A;
        Mon,  2 Dec 2019 08:56:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: goodix - Add upside-down quirk for Teclast X89 tablet
Date:   Mon,  2 Dec 2019 09:56:36 +0100
Message-Id: <20191202085636.6650-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: _zy2DvM2PCW1Qb8dcVaM1g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The touchscreen on the Teclast X89 is mounted upside down in relation to
the display orientation (the touchscreen itself is mounted upright, but the
display is mounted upside-down). Add a quirk for this so that we send
coordinates which match the display orientation.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen=
/goodix.c
index fb43aa708660..0403102e807e 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -128,6 +128,15 @@ static const unsigned long goodix_irq_flags[] =3D {
  */
 static const struct dmi_system_id rotated_screen[] =3D {
 #if defined(CONFIG_DMI) && defined(CONFIG_X86)
+=09{
+=09=09.ident =3D "Teclast X89",
+=09=09.matches =3D {
+=09=09=09/* tPAD is too generic, also match on bios date */
+=09=09=09DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
+=09=09=09DMI_MATCH(DMI_BOARD_NAME, "tPAD"),
+=09=09=09DMI_MATCH(DMI_BIOS_DATE, "12/19/2014"),
+=09=09},
+=09},
 =09{
 =09=09.ident =3D "WinBook TW100",
 =09=09.matches =3D {
--=20
2.23.0

