Return-Path: <linux-input+bounces-4315-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AC690497A
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 05:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77EAF283F70
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 03:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2238E29408;
	Wed, 12 Jun 2024 03:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="t9ES+U2C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FDA18E3F
	for <linux-input@vger.kernel.org>; Wed, 12 Jun 2024 03:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162489; cv=none; b=F7VSs2IdC2LX/wpBj+/YV8ASTAV7FLbbe/UTv0K02ralWP3gtdqU/Q2ip+LP1kp8B4um7bPP7LKwBHOGHepDVSHKvva93PKm7P3XLFKPu06c0KePnWf8651IZqdxhq1m+nYui22zSW/Ls7smVPGClh3bgP/atuJ9h/y/wCXMZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162489; c=relaxed/simple;
	bh=AL1kabKZ9aiMqgGz1LRsyrTMRHsm/iVj6Z4f0MCoRMM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQLZf/YHxr/IaJqngVL2B/7PvG8SFzO+s3G4LHtWJGBtioWLppmr5LtRKIVzGzFFRB3DDF6uKbluCcrBDSJqv+JJrmaAoBFJtuuQLNOPbieECQGRQ69KyVaeeiQ5YTHlwKWMb+J4luucZVs5VFTaV87oua7ZswDQle5PZzBrnCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=t9ES+U2C; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718162477; x=1718421677;
	bh=AL1kabKZ9aiMqgGz1LRsyrTMRHsm/iVj6Z4f0MCoRMM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=t9ES+U2CFM2N7R68Kk+DbbPfL20hFS7hPGgN1I0qit3FUOOgxtbrgRFRspefpNRZl
	 bk7xhcp+OHFsnx/XSi5N9VwT6jX8ug0uOZa6Ec0+IPkfoUljmk0akE8bFvMdVIOF52
	 Q5n8F4JUux/jj4jncJYLzFRaE4AJ5B8ckEoBo5E8lVxq/VJhf3z/fNRDuMCsjSvx7B
	 6Yr3dXPbabVCfAvBqC3rnnTCAtx12eBEidWzDifythG/hHGcIMSaJMY6xNMKviS4yq
	 lrOgiP1I3JcuxX5UVz+C8ubq2Nr+jY3WYSRdvhjp4Iy5hj0YVEitSA5Nsowu02gJUV
	 SKODAQztrwUJg==
Date: Wed, 12 Jun 2024 03:21:14 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/3] input/touchscreen: imagis: Add supports for Imagis IST3038
Message-ID: <20240612032036.33103-3-raymondhackley@protonmail.com>
In-Reply-To: <20240612032036.33103-1-raymondhackley@protonmail.com>
References: <20240612032036.33103-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: bf48fd04ac644e695a965ccf5ee76145560c19f7
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
 drivers/input/touchscreen/imagis.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen=
/imagis.c
index 886bcfc8497a..b2f4bc60721d 100644
--- a/drivers/input/touchscreen/imagis.c
+++ b/drivers/input/touchscreen/imagis.c
@@ -12,9 +12,16 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
=20
+#define IST30XX_REG_STATUS=09=090x20
+#define IST30XX_REG_CHIPID=09=09(0x40000000 | IST3038C_DIRECT_ACCESS)
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
@@ -25,7 +32,6 @@
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
@@ -397,9 +403,17 @@ static const struct imagis_properties imagis_3032c_dat=
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
@@ -415,6 +429,7 @@ static const struct imagis_properties imagis_3038c_data=
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



