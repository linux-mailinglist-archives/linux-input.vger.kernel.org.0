Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD3413B6E4
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 02:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgAOBag (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 20:30:36 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54502 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728848AbgAOBag (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 20:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579051835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cq04Ga1b8xTrH17T3rkjESGzzrFCqY7RRinYPFVL2u0=;
        b=Q7eWKs0w9E1gn14AnUZJCdjk1u2cWMfRu1SefhIc4yLM8s7FcZXMEdlN4/L6KKzqHsZQXj
        IBj7oPVJV1Kepe539MehgjLIpixYGfY/ZnFB50Dhn9+5IRICkY4fY6Gx4ZOYjD3gPSzLTy
        KxIEXtJFbtt+Svgt0F9vA0qez0Vf4Hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-MILkH8OSOieJ7asONUSy-w-1; Tue, 14 Jan 2020 20:30:31 -0500
X-MC-Unique: MILkH8OSOieJ7asONUSy-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A71C1800D78;
        Wed, 15 Jan 2020 01:30:30 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-34.ams2.redhat.com [10.36.116.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B657A675AE;
        Wed, 15 Jan 2020 01:30:26 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] Input: synaptics - remove the LEN0049 dmi id from topbuttonpad list
Date:   Wed, 15 Jan 2020 02:30:23 +0100
Message-Id: <20200115013023.9710-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Yoga 11e is using LEN0049, but it doesn't have a trackstick.

Thus, there is no need to create a software top buttons row.

However, it seems that the device works under SMBus, so keep it as part
of the smbus_pnp_ids.


Link: https://gitlab.freedesktop.org/libinput/libinput/issues/414
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

Hi Dmitry,

Sending the patch to the list untested (sanity only), and I'll ask
for the reporter to provide a little bit more testing.

I will keep you updated when you can merge the patch.

Cheers,
Benjamin
---
 drivers/input/mouse/synaptics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synapt=
ics.c
index 1ae6f8bba9ae..7aa84f743c48 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -146,7 +146,6 @@ static const char * const topbuttonpad_pnp_ids[] =3D =
{
 	"LEN0042", /* Yoga */
 	"LEN0045",
 	"LEN0047",
-	"LEN0049",
 	"LEN2000", /* S540 */
 	"LEN2001", /* Edge E431 */
 	"LEN2002", /* Edge E531 */
@@ -166,6 +165,7 @@ static const char * const smbus_pnp_ids[] =3D {
 	/* all of the topbuttonpad_pnp_ids are valid, we just add some extras *=
/
 	"LEN0048", /* X1 Carbon 3 */
 	"LEN0046", /* X250 */
+	"LEN0049", /* Yoga 11e */
 	"LEN004a", /* W541 */
 	"LEN005b", /* P50 */
 	"LEN005e", /* T560 */
--=20
2.24.1

