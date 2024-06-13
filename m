Return-Path: <linux-input+bounces-4333-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4290622F
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 04:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD361F2247D
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 02:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6F112C49A;
	Thu, 13 Jun 2024 02:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gnjJoPkO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D747C12C47A;
	Thu, 13 Jun 2024 02:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718247426; cv=none; b=BR6/iUThvTvkmJzODehbOApak5Cg3UyTBg740coBlPmSHZAlFbIXwmElL3pX+krYUhvEz88dpSxh6ZXJaJEVGsww5Y66lGmYUxxjh/L2znWn/s1vuOpW/CfYpHRzPJB7XQlomNaWcEW4h/+jEvFKhgRD/m3runtvbo48s0mlVxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718247426; c=relaxed/simple;
	bh=4caMDJk1fymacmDutxXRaq4p+OusCKGUepMMnXhyzuE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJsC3xNuh+LOxDfO14jl47+YRdoZit/I+GN+8T6nWdBtQNAyGYrNU/Rjcm2h8wuIzLJvlOYVrg1VoD0psZ9iYlITRqb46nZ2r7czcuwfN5tUNyV5ITTYNvEtoHHuWnJ6jKprtDzDvb3TJwQe8C0g4+a5CGeofyttz7lpjtKXlOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gnjJoPkO; arc=none smtp.client-ip=185.70.40.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718247417; x=1718506617;
	bh=v9+fU/3I0sW3EO1/uEtuQOuAAW/aw8IWkdBocAl5mAU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gnjJoPkOQ9grf+eAMoLWDYAYxEI3dNd7sUEO5WPg6WC3XPKbGceb5L3P5wWYPB9WJ
	 67uzBFXGd5jwsd+RCGiSk8bc8s8ERF6xsNA+J0u59PXufjSsbr1/UPDGA9ubomp4Zx
	 essIN93KcXXJq/OUDyTxOTrgy8YLTy5eaJOAb+5rJFNsLAWDFHx+WBkN4ApYUneMQj
	 a0OiqDhsWT9qx8cXEtdVq0ppU5EQGAqjveJLajZ10SMg8J4g6+OhPd4K8qxwgyA51O
	 wDRzryZlBR08bwSsAX9E4dve0n1w4NEiVmP2JunbotZxnryop8+ZcnAKOiPxn1XKOV
	 f0MPoGvqz/6EQ==
Date: Thu, 13 Jun 2024 02:56:54 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 1/3] input/touchscreen: imagis: Clarify the usage of protocol_b
Message-ID: <20240613025631.5425-2-raymondhackley@protonmail.com>
In-Reply-To: <20240613025631.5425-1-raymondhackley@protonmail.com>
References: <20240613025631.5425-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: b8475f1b66fb1743f99407396eeefd71710f8969
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



