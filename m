Return-Path: <linux-input+bounces-4335-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DBE906232
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 04:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5986B22632
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 02:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB3912CD98;
	Thu, 13 Jun 2024 02:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="r+lqTVY7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE00612C7E3
	for <linux-input@vger.kernel.org>; Thu, 13 Jun 2024 02:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718247438; cv=none; b=a3zR36h3OYt00P4t9Byh6I0fjXUYFORClQ6iqud1Fb6Ax2zk8Vwee7ymS+Gv+DJnRfhd6KisIRa/WuH/YQR+OWwC4uaMPeVvccStwvqwte79CUpKU1j4MMgoumhskWxVa74YEWasnKB9A6UuAudnfUJnx2z0syDT30XXA1gJXQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718247438; c=relaxed/simple;
	bh=f0f6wp31zL2RwkHRjXOVz/EH4HhEHMCWvKWESd4pTcA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lCVw9oYmajsgdOCYkcV8wHQNIY/s5yUld7ukhJXK23Rpqq6219t07Lo6osZZNjbwNOMOqf3mzZmAVPadvAPOzPrj0Nc/xT7Dddj+/9qiQ6cisycrMAjNy7zI2R+j7nVVK62FZ471Iwo2XImBhw3DIWiyOU2D7Fj1gAuW/82fYqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=r+lqTVY7; arc=none smtp.client-ip=185.70.40.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718247435; x=1718506635;
	bh=f0f6wp31zL2RwkHRjXOVz/EH4HhEHMCWvKWESd4pTcA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=r+lqTVY7WHJsHcd3KfQF7BiczX9O3mP903LHB6xgqzmvbsiDZ2CcNtWGmAIRpmze0
	 78ZbJaCCO0BUC1HglrvpRBBFmJMHYObdGg7pmxCq9/ihWFBdKWzef/RuJ/UXApPBC6
	 qf+oZ2LLg/bDCFgtmoOq5YT+qESseW8BOFp3VTfF9F0MutckXsoFBBUp4xWWvqnKgF
	 7O9czbvgthXt4JmtaRpwKJX4HW27i8452qiONCA/8f+ctuWd+B5sOMSZKLKal3xMQV
	 MSWCV90AtLThim8oW+msHS8L5kn6PKDTMaq4K6gHUsRnAO4MC409A6vda5jco23EAz
	 LPp5zDniodh0A==
Date: Thu, 13 Jun 2024 02:57:11 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 3/3] input/touchscreen: imagis: Add supports for Imagis IST3038
Message-ID: <20240613025631.5425-4-raymondhackley@protonmail.com>
In-Reply-To: <20240613025631.5425-1-raymondhackley@protonmail.com>
References: <20240613025631.5425-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: dbec9617af97a207be017b2482ca9ba7250f143f
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Imagis IST3038 is another variant of Imagis IST3038 IC, which has
a different register interface from IST3038C (possibly firmware defined).

Unlike IST3038C/IST3032C, IST3038 has different registers for commands,
which means IST3038 doesn't use protocol B.
Similar to IST3032C and maybe the other variants, IST3038 has touch keys
support, which provides KEY_APPSELECT and KEY_BACK.

Add support for IST3038 with touch keys.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 drivers/input/touchscreen/imagis.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen=
/imagis.c
index 886bcfc8497a..aeabf8d057de 100644
--- a/drivers/input/touchscreen/imagis.c
+++ b/drivers/input/touchscreen/imagis.c
@@ -12,9 +12,17 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
=20
+#define IST30XX_REG_STATUS=09=090x20
+#define IST30XX_REG_CHIPID=09=09(0x40000000 | IST3038C_DIRECT_ACCESS)
+
+#define IST30XX_WHOAMI=09=09=090x30003000
+#define IST30XXA_WHOAMI=09=09=090x300a300a
+#define IST30XXB_WHOAMI=09=09=090x300b300b
+#define IST3038_WHOAMI=09=09=090x30383038
+
 #define IST3032C_WHOAMI=09=09=090x32c
+#define IST3038C_WHOAMI=09=09=090x38c
=20
-#define IST3038B_REG_STATUS=09=090x20
 #define IST3038B_REG_CHIPID=09=090x30
 #define IST3038B_WHOAMI=09=09=090x30380b
=20
@@ -25,7 +33,6 @@
 #define IST3038C_REG_TOUCH_STATUS=09(IST3038C_REG_HIB_BASE | IST3038C_HIB_=
ACCESS)
 #define IST3038C_REG_TOUCH_COORD=09(IST3038C_REG_HIB_BASE | IST3038C_HIB_A=
CCESS | 0x8)
 #define IST3038C_REG_INTR_MESSAGE=09(IST3038C_REG_HIB_BASE | IST3038C_HIB_=
ACCESS | 0x4)
-#define IST3038C_WHOAMI=09=09=090x38c
 #define IST3038C_CHIP_ON_DELAY_MS=0960
 #define IST3038C_I2C_RETRY_COUNT=093
 #define IST3038C_MAX_FINGER_NUM=09=0910
@@ -397,9 +404,17 @@ static const struct imagis_properties imagis_3032c_dat=
a =3D {
 =09.protocol_b =3D true,
 };
=20
+static const struct imagis_properties imagis_3038_data =3D {
+=09.interrupt_msg_cmd =3D IST30XX_REG_STATUS,
+=09.touch_coord_cmd =3D IST30XX_REG_STATUS,
+=09.whoami_cmd =3D IST30XX_REG_CHIPID,
+=09.whoami_val =3D IST3038_WHOAMI,
+=09.touch_keys_supported =3D true,
+};
+
 static const struct imagis_properties imagis_3038b_data =3D {
-=09.interrupt_msg_cmd =3D IST3038B_REG_STATUS,
-=09.touch_coord_cmd =3D IST3038B_REG_STATUS,
+=09.interrupt_msg_cmd =3D IST30XX_REG_STATUS,
+=09.touch_coord_cmd =3D IST30XX_REG_STATUS,
 =09.whoami_cmd =3D IST3038B_REG_CHIPID,
 =09.whoami_val =3D IST3038B_WHOAMI,
 };
@@ -415,6 +430,7 @@ static const struct imagis_properties imagis_3038c_data=
 =3D {
 #ifdef CONFIG_OF
 static const struct of_device_id imagis_of_match[] =3D {
 =09{ .compatible =3D "imagis,ist3032c", .data =3D &imagis_3032c_data },
+=09{ .compatible =3D "imagis,ist3038", .data =3D &imagis_3038_data },
 =09{ .compatible =3D "imagis,ist3038b", .data =3D &imagis_3038b_data },
 =09{ .compatible =3D "imagis,ist3038c", .data =3D &imagis_3038c_data },
 =09{ },
--=20
2.39.2



