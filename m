Return-Path: <linux-input+bounces-4314-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C2904976
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 05:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11B3E1C23779
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 03:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5DBF9F8;
	Wed, 12 Jun 2024 03:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="U1JcTFuB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F092135A
	for <linux-input@vger.kernel.org>; Wed, 12 Jun 2024 03:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162480; cv=none; b=X8GnHM1bvR2G28SyBvEAQCfc2pUGESBRAtu0c8zQ+LUdv89KK0aUArqkZgidd4a+CxNJnXlvVA+7Hk1uSa+PP15/h7F9SvZsXI9oSGHf0DkMkMcLlSQ7x5US5vrUtv8suJdpXpUH7djUDI/C6G0331TVGARjAh3TBuxP4wC5eV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162480; c=relaxed/simple;
	bh=4caMDJk1fymacmDutxXRaq4p+OusCKGUepMMnXhyzuE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3p6IZff3j6f3MdYfIB/fXCgRimQfOikpyOQ4TOWq325Mca6OtvQ56MuFp/cocuw+0RuGaLX4iqT/vgwOUdYJmElxSymF2rDa1jwojxsJaEcaBDiighuUDye+mdj21HuWB1x0kNp9HrNDMDDbO/0PxWKCQ6VhggVBl7/k2NspgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=U1JcTFuB; arc=none smtp.client-ip=185.70.40.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718162470; x=1718421670;
	bh=v9+fU/3I0sW3EO1/uEtuQOuAAW/aw8IWkdBocAl5mAU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=U1JcTFuBUNjJx1tlixm8r0piCpAroBpoKrhEfwDWDo2pa06uw24iozBmrWEqI8weg
	 j2kkSr3299DV3Gq6znNf4PUDER6P6hDby6KdqbOm29tfvsfCs1fqXrwVYHi5WiOVcG
	 +Mm5TvRQbYyl8XXjVKEh8nMi8rPt5m/9CvmFd8QE3RRquXsqODO89ESwYf4O2szwl0
	 kFGlfwFYU5Feb6Bb0/dR2lBikK7RiSSYajg2O6cnUHPagyRJCjAqrH4xDxhX+IOTed
	 +MkHp0g/uLKGe3cb3/I17fSXGlPY3QujRR8/zbitvmvlKXpTgiSuRvJxszecPm9Id6
	 AWnpJLqz2OLaw==
Date: Wed, 12 Jun 2024 03:21:04 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 1/3] input/touchscreen: imagis: Clarify the usage of protocol_b
Message-ID: <20240612032036.33103-2-raymondhackley@protonmail.com>
In-Reply-To: <20240612032036.33103-1-raymondhackley@protonmail.com>
References: <20240612032036.33103-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 651ef5fd3f41cfde3c3b7171adfecf433ee63de8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

protocol_b is a property, which tells Imagis panel to use a different
format for coordinates.

IST30XXC series is known for using protocol B, while the other series
aren't. Note this could be confusing, unlike the model name implies.

Adjust the usage of protocol_b to avoid confusion.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 drivers/input/touchscreen/imagis.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen=
/imagis.c
index 074dd6c342ec..886bcfc8497a 100644
--- a/drivers/input/touchscreen/imagis.c
+++ b/drivers/input/touchscreen/imagis.c
@@ -120,12 +120,12 @@ static irqreturn_t imagis_interrupt(int irq, void *de=
v_id)
=20
 =09for (i =3D 0; i < finger_count; i++) {
 =09=09if (ts->tdata->protocol_b)
-=09=09=09error =3D imagis_i2c_read_reg(ts,
-=09=09=09=09=09=09    ts->tdata->touch_coord_cmd, &finger_status);
-=09=09else
 =09=09=09error =3D imagis_i2c_read_reg(ts,
 =09=09=09=09=09=09    ts->tdata->touch_coord_cmd + (i * 4),
 =09=09=09=09=09=09    &finger_status);
+=09=09else
+=09=09=09error =3D imagis_i2c_read_reg(ts,
+=09=09=09=09=09=09    ts->tdata->touch_coord_cmd, &finger_status);
 =09=09if (error) {
 =09=09=09dev_err(&ts->client->dev,
 =09=09=09=09"failed to read coordinates for finger %d: %d\n",
@@ -394,6 +394,7 @@ static const struct imagis_properties imagis_3032c_data=
 =3D {
 =09.whoami_cmd =3D IST3038C_REG_CHIPID,
 =09.whoami_val =3D IST3032C_WHOAMI,
 =09.touch_keys_supported =3D true,
+=09.protocol_b =3D true,
 };
=20
 static const struct imagis_properties imagis_3038b_data =3D {
@@ -401,7 +402,6 @@ static const struct imagis_properties imagis_3038b_data=
 =3D {
 =09.touch_coord_cmd =3D IST3038B_REG_STATUS,
 =09.whoami_cmd =3D IST3038B_REG_CHIPID,
 =09.whoami_val =3D IST3038B_WHOAMI,
-=09.protocol_b =3D true,
 };
=20
 static const struct imagis_properties imagis_3038c_data =3D {
@@ -409,6 +409,7 @@ static const struct imagis_properties imagis_3038c_data=
 =3D {
 =09.touch_coord_cmd =3D IST3038C_REG_TOUCH_COORD,
 =09.whoami_cmd =3D IST3038C_REG_CHIPID,
 =09.whoami_val =3D IST3038C_WHOAMI,
+=09.protocol_b =3D true,
 };
=20
 #ifdef CONFIG_OF
--=20
2.39.2



