Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA311996AE
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 14:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbgCaMjy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 08:39:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39941 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730715AbgCaMjx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 08:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585658393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=rKokRUrWi7vxXZibXZEuuLYWY82HM9AMGwi/dz0HtXw=;
        b=awX2xJbB0d8hZVF4kHCTPG1UJM3RVui0YAEqBkXRJck2qImlEpntbRRHVmTxbaFg9LpxYm
        sO6KX54NSwH35tr325V9Lr2CSDW0q5AuLGSknpG5hT+Z+X+6q8wfK/kBA39Vg1vSNr8AIp
        QQi0zsGsekHMbrU3EgauX+TodvAHJdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-EiSGQoPNMhWCea-xhdvQCA-1; Tue, 31 Mar 2020 08:39:51 -0400
X-MC-Unique: EiSGQoPNMhWCea-xhdvQCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F82801A33;
        Tue, 31 Mar 2020 12:39:50 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A9E8060BE0;
        Tue, 31 Mar 2020 12:39:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: i8042 - add Acer Aspire 5738z to nomux list
Date:   Tue, 31 Mar 2020 14:39:47 +0200
Message-Id: <20200331123947.318908-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Acer Aspire 5738z has a button to disable (and re-enable) the
touchpad next to the touchpad.

When this button is pressed a LED underneath indicates that the touchpad
is disabled (and an event is send to userspace and GNOME shows its
touchpad enabled / disable OSD thingie).

So far so good, but after re-enabling the touchpad it no longer works.

The laptop does not have an external ps2 port, so mux mode is not needed
and disabling mux mode fixes the touchpad no longer working after togglin=
g
it off and back on again, so lets add this laptop model to the nomux list=
.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/serio/i8042-x86ia64io.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/=
i8042-x86ia64io.h
index dc974c288e88..08e919dbeb5d 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -530,6 +530,17 @@ static const struct dmi_system_id __initconst i8042_=
dmi_nomux_table[] =3D {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo LaVie Z"),
 		},
 	},
+	{
+		/*
+		 * Acer Aspire 5738z
+		 * Touchpad stops working in mux mode when dis- + re-enabled
+		 * with the touchpad enable/disable toggle hotkey
+		 */
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5738"),
+		},
+	},
 	{ }
 };
=20
--=20
2.26.0

