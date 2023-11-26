Return-Path: <linux-input+bounces-244-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021E7F906D
	for <lists+linux-input@lfdr.de>; Sun, 26 Nov 2023 01:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B791C20A8F
	for <lists+linux-input@lfdr.de>; Sun, 26 Nov 2023 00:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07D9384;
	Sun, 26 Nov 2023 00:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="YFIGQbOZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12324133;
	Sat, 25 Nov 2023 16:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1700957767; x=1701216967;
	bh=P1pnzMB33pcjyYnWs1uOpWPQE6zW15EcToOjweNN8qU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YFIGQbOZGbogg9ojHIfruFn7qEDtyi7Sb3c8jwg8ulDZiC28C6w9MLBVeCemhVFZT
	 diOT6Cb/nnUsL+wNTiLuVTdO+51ijhS6amaQLM2EpMY+jXbFAaR7tF0wUHb+GJ2EsZ
	 QqaCTRhV+2DjtDTDmt/osTdl8FEfKzZW4q6VyoYnWkp6TkC/nKP1Y7hpfuzYtOMmf9
	 pphoOBMmWUb1yJ2Slkd9i1z4elzTqd78G5+gXzyMJLnhhhSqqaX6Un/lxiJzGo8I4p
	 myDQfXY1ANJZ1/PRcNEcCnSWk5rHZ9/E29P5JQhpDmZJ84YXDaDzM+JxsukjaQs4wO
	 T+PT2GBJasRTw==
Date: Sun, 26 Nov 2023 00:15:49 +0000
To: roderick.colenbrander@sony.com, jikos@kernel.org, benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/1] hid-playstation: Fix button maps for the DualSense Edge controller
Message-ID: <20231126001544.747151-1-akoskovich@pm.me>
Feedback-ID: 37836894:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This brings functionality of the DualSense Edge controller inline
with the stock PS5 controller.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/hid/hid-playstation.c | 60 ++++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 8ac8f7b8e317..fc42003cc0eb 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1344,10 +1344,18 @@ static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
=20
 =09input_report_abs(ds->gamepad, ABS_X,  ds_report->x);
 =09input_report_abs(ds->gamepad, ABS_Y,  ds_report->y);
-=09input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
-=09input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
-=09input_report_abs(ds->gamepad, ABS_Z,  ds_report->z);
-=09input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
+
+=09if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
+=09=09input_report_abs(ds->gamepad, ABS_RX, ds_report->z);
+=09=09input_report_abs(ds->gamepad, ABS_RY, ds_report->rz);
+=09=09input_report_abs(ds->gamepad, ABS_Z,  ds_report->rx);
+=09=09input_report_abs(ds->gamepad, ABS_RZ, ds_report->ry);
+=09} else {
+=09=09input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
+=09=09input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
+=09=09input_report_abs(ds->gamepad, ABS_Z,  ds_report->z);
+=09=09input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
+=09}
=20
 =09value =3D ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
 =09if (value >=3D ARRAY_SIZE(ps_gamepad_hat_mapping))
@@ -1355,19 +1363,49 @@ static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
 =09input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[value].=
x);
 =09input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[value].=
y);
=20
-=09input_report_key(ds->gamepad, BTN_WEST,   ds_report->buttons[0] & DS_BU=
TTONS0_SQUARE);
-=09input_report_key(ds->gamepad, BTN_SOUTH,  ds_report->buttons[0] & DS_BU=
TTONS0_CROSS);
-=09input_report_key(ds->gamepad, BTN_EAST,   ds_report->buttons[0] & DS_BU=
TTONS0_CIRCLE);
-=09input_report_key(ds->gamepad, BTN_NORTH,  ds_report->buttons[0] & DS_BU=
TTONS0_TRIANGLE);
+=09if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
+=09=09input_report_key(ds->gamepad, BTN_WEST,
+=09=09=09=09ds_report->buttons[0] & DS_BUTTONS0_TRIANGLE);
+=09=09input_report_key(ds->gamepad, BTN_SOUTH,
+=09=09=09=09ds_report->buttons[0] & DS_BUTTONS0_SQUARE);
+=09=09input_report_key(ds->gamepad, BTN_EAST,
+=09=09=09=09ds_report->buttons[0] & DS_BUTTONS0_CROSS);
+=09=09input_report_key(ds->gamepad, BTN_NORTH,
+=09=09=09=09ds_report->buttons[0] & DS_BUTTONS0_CIRCLE);
+=09} else {
+=09=09input_report_key(ds->gamepad, BTN_WEST,
+=09=09=09=09ds_report->buttons[0] & DS_BUTTONS0_SQUARE);
+=09=09input_report_key(ds->gamepad, BTN_SOUTH,
+=09=09=09=09ds_report->buttons[0] & DS_BUTTONS0_CROSS);
+=09=09input_report_key(ds->gamepad, BTN_EAST,
+=09=09=09=09ds_report->buttons[0] & DS_BUTTONS0_CIRCLE);
+=09=09input_report_key(ds->gamepad, BTN_NORTH,
+=09=09=09=09ds_report->buttons[0] & DS_BUTTONS0_TRIANGLE);
+=09}
+
 =09input_report_key(ds->gamepad, BTN_TL,     ds_report->buttons[1] & DS_BU=
TTONS1_L1);
 =09input_report_key(ds->gamepad, BTN_TR,     ds_report->buttons[1] & DS_BU=
TTONS1_R1);
 =09input_report_key(ds->gamepad, BTN_TL2,    ds_report->buttons[1] & DS_BU=
TTONS1_L2);
 =09input_report_key(ds->gamepad, BTN_TR2,    ds_report->buttons[1] & DS_BU=
TTONS1_R2);
 =09input_report_key(ds->gamepad, BTN_SELECT, ds_report->buttons[1] & DS_BU=
TTONS1_CREATE);
 =09input_report_key(ds->gamepad, BTN_START,  ds_report->buttons[1] & DS_BU=
TTONS1_OPTIONS);
-=09input_report_key(ds->gamepad, BTN_THUMBL, ds_report->buttons[1] & DS_BU=
TTONS1_L3);
-=09input_report_key(ds->gamepad, BTN_THUMBR, ds_report->buttons[1] & DS_BU=
TTONS1_R3);
-=09input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BU=
TTONS2_PS_HOME);
+
+=09if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
+=09=09input_report_key(ds->gamepad, BTN_THUMBL,
+=09=09=09=09ds_report->buttons[1] & DS_BUTTONS1_R3);
+=09=09input_report_key(ds->gamepad, BTN_THUMBR,
+=09=09=09=09ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
+=09=09input_report_key(ds->gamepad, BTN_MODE,
+=09=09=09=09ds_report->buttons[1] & DS_BUTTONS1_L3);
+=09} else {
+=09=09input_report_key(ds->gamepad, BTN_THUMBL,
+=09=09=09=09ds_report->buttons[1] & DS_BUTTONS1_L3);
+=09=09input_report_key(ds->gamepad, BTN_THUMBR,
+=09=09=09=09ds_report->buttons[1] & DS_BUTTONS1_R3);
+=09=09input_report_key(ds->gamepad, BTN_MODE,
+=09=09=09=09ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
+=09}
+
 =09input_sync(ds->gamepad);
=20
 =09/*
--=20
2.43.0



