Return-Path: <linux-input+bounces-148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26F7F217F
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 00:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E73D81C211C9
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 23:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8ED3B2A7;
	Mon, 20 Nov 2023 23:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bluemarch.art header.i=@bluemarch.art header.b="qZkMdeeM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C099C1;
	Mon, 20 Nov 2023 15:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bluemarch.art;
	s=protonmail; t=1700523551; x=1700782751;
	bh=dd+dNmKFN8lfQj43JesPqQvmmvSrg8D6LBMjVjoSI0M=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qZkMdeeMys5x6Rm7NOwggG2wHha/2gDpdttSf2RQj0w+mULbS+KXbmt1E8PNEmczD
	 YQekkf/BiAda0ONeI92h0wdKiNd23WxrfOBhv40jT2WdIF26KIz50cA85nzT7H8YX2
	 6adA6QR7UgpnzU90LzODgihhA4GQ6FKu6SjvcX30WJJ1up7DlV8i3ncAn61CcYyMyI
	 Tg0a8nbBkl20r8nOKVaoMFaJZVZTuaSnmnLV3deBItHu1MqLPpiuFnSL/EpFOompiD
	 TnmL6qj45mH0Q8mNeN/I9OPoLt0kfoxk/Fh95975CWDxmuTI1SpLNQ6vlieZqbntKg
	 RMPstEnFj8jGQ==
Date: Mon, 20 Nov 2023 23:39:07 +0000
To: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
From: Szilard Fabian <szfabian@bluemarch.art>
Cc: Szilard Fabian <szfabian@bluemarch.art>
Subject: [PATCH RESEND] Input: i8042 - add Fujitsu Lifebook U728 to i8042 quirk table
Message-ID: <20231120233520.264264-2-szfabian@bluemarch.art>
Feedback-ID: 87830438:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Another Fujitsu-related patch.

In the initial boot stage the integrated keyboard of Fujitsu Lifebook U728
refuses to work and it's not possible to type for example a dm-crypt
passphrase without the help of an external keyboard.

i8042.nomux kernel parameter resolves this issue but using that a PS/2
mouse is detected. This input device is unused even when the i2c-hid-acpi
kernel module is blacklisted making the integrated ELAN touchpad
(04F3:3092) not working at all.

So this notebook uses a hid-over-i2c touchpad which is managed by the
i2c_designware input driver. Since you can't find a PS/2 mouse port on this
computer and you can't connect a PS/2 mouse to it even with an official
port replicator I think it's safe to not use the PS/2 mouse port at all.

Signed-off-by: Szilard Fabian <szfabian@bluemarch.art>
---
I think the same configuration could be applied to Lifebook U748 and U758
too but I can't test this theory on these machines.
---
 drivers/input/serio/i8042-acpipnpio.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8=
042-acpipnpio.h
index 028e45bd050b..983f31014330 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -618,6 +618,14 @@ static const struct dmi_system_id i8042_dmi_quirk_tabl=
e[] __initconst =3D {
 =09=09},
 =09=09.driver_data =3D (void *)(SERIO_QUIRK_NOMUX)
 =09},
+=09{
+=09=09/* Fujitsu Lifebook U728 */
+=09=09.matches =3D {
+=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK U728"),
+=09=09},
+=09=09.driver_data =3D (void *)(SERIO_QUIRK_NOAUX)
+=09},
 =09{
 =09=09/* Gigabyte M912 */
 =09=09.matches =3D {
--=20
2.42.1



