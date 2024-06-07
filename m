Return-Path: <linux-input+bounces-4238-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0416900E27
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 00:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7AEF1C21415
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 22:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879591553BC;
	Fri,  7 Jun 2024 22:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="lNEDrV/f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UkXYsMaQ"
X-Original-To: linux-input@vger.kernel.org
Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DD8155312;
	Fri,  7 Jun 2024 22:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717799868; cv=none; b=uaQIFVLheS9dV9bvYsI07XiIwiAzo67GWnGAv/DGwsW3OfWHyrTiaHnnq5D+Lg/F0USErF/hNXIkY5MEkzrotP9x0JteOiz9nWwzZ+OyqhT0PK2AjNVTJaqHaWzHAl3PbvWEWhj8/o2RtJDxlkN6Afr/dTrugxR7qeEgXJbt5cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717799868; c=relaxed/simple;
	bh=21KYqmMsJodopUyHtIt0YM7A851WqDpfy10WbXgK1/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwvZxxWiWyJ9ZKEyVXDJmhwovWMsP6T0tQqDJPsEnq/yxUmZGDnnox88Ry0VU4pTkzkIdiwQ9Oa0PquSBTjROspYAO9ZePObL2EiQSUc2oRxZyv1oxyqUdcLecmiZ/mfD5Yg05ZZiL7bZ0GDiePXTIvwoRl5z6gund0Fe3owNNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=lNEDrV/f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UkXYsMaQ; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 656D51C00185;
	Fri,  7 Jun 2024 18:37:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 07 Jun 2024 18:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1717799864; x=1717886264; bh=arjxTVPYQ9PKxgxS01/4z
	syKupYyuINExddKmUuoAIE=; b=lNEDrV/feIrZiM+J03eAHFasKbr+I0NBVOQ1P
	lM0i6egtevxlqPZe1jiCx0TFmXdpsO5N1hddLT/31ZenlbGBcqbSDVnAQ8JqT0tq
	71X5z/piXFekJ/844CAiz/jaA9H9zcu1s2oQyI/+PZPSMbLXR3gBqy06iiz8T90p
	3ghcz7yQeQyhwH/N3i6i6bVGVWBQtI9Ml54nBSdyXyK8pXWpR2hbQLnb/HqhJpYe
	gg5R5QVdyhqLvMkBKaOPf64uy3cSCcwz9OiP3fR96U84o0wTQTwk4yvwE9Ms54ra
	pp1QEMrsD8hUjWmc1eIEDV7Ad8wCeTyoB5s8HahotjWGbmddQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717799864; x=1717886264; bh=arjxTVPYQ9PKxgxS01/4zsyKupYy
	uINExddKmUuoAIE=; b=UkXYsMaQto8C4H+vyob79pbodDghAUo3a7g8YY4XKb+3
	8z1f1T3sBGEnZzWVYVTqz8fcSS1Ao8g+OL0IrE1bhm+HDll92uML8ylW168YJkMV
	SKp4+dxAEQu06I0hRkIskSE6+kpbzi7/LGGGnzFqqeEsWcEdJxay5DEDuwTP+w/w
	tgEr3pjMt3q6CGBezm25M2pZV4MysPAsLyajturJ5wWgMIbypDJ/s28c5a3Ppdv0
	tIREoyNfGBunbM6AD63YKxwJ3f8ttL+3YpOZhisEJn6TLtsSlrspIScvTTz+2H+4
	M1KmOfwU091ApgIuXXOjTqcSZC39cAnERcU1aG5Gnw==
X-ME-Sender: <xms:t4tjZrGFRfLM4Uh0MQl54XHVoLrvLNld-VSjlJ0HaBGnpGmgg9DLgQ>
    <xme:t4tjZoUO2aLtBoFG9ybn-4dt8Gb_KBc5y6tPaoxVmgHXJJq1nikKHN808uF9QlITx
    a8J8w_oAFRCI2uBhb0>
X-ME-Received: <xmr:t4tjZtIEcwl4ZHWfcY1CSIML5X0T0nT6ac2zP64Na3iIEUWm88N5NG-OYDCP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtvddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthfduudekffefkeeiffdttd
    dvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:t4tjZpElyS4QdCBzXlP5rmqyXVIj1NYOads4MXOPHRLMLPSZZ661Uw>
    <xmx:t4tjZhUJVT8JTpesJxfcsOgWz-KpnJnGeIBOv3Sc4oADuTRDSjJYjw>
    <xmx:t4tjZkNYoHNNqQpTAO2lwQEkufYMaGr87YNYKyWseYkhpJr2fr49Fg>
    <xmx:t4tjZg1Y8zRKB8dEkXF_WzKnLp74Q0_8D1rPdNPIyEl-_jGeO70qFA>
    <xmx:uItjZpTMJvZ0x4ZtRkutsBmS_iY-0eLGVa48sf-gJLrs7IMH9RLhnun0>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 18:37:39 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	vi@endrift.com,
	maxwell.nguyen@hp.com,
	appsforartists@google.com,
	carl.ng@hp.com,
	christophe.jaillet@wanadoo.fr,
	matt.git@fastmail.fm,
	linux-kernel@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH] Input: xpad - add support for ASUS ROG RAIKIRI PRO
Date: Sat,  8 Jun 2024 10:37:22 +1200
Message-ID: <20240607223722.1170776-1-luke@ljones.dev>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the VID/PID for ASUS ROG RAIKIRI PRO to
xpad_device and the VID to xpad_table.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/hid/hid-ids.h         | 1 +
 drivers/input/joystick/xpad.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 61d2a21affa2..31c522fa4e87 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -209,6 +209,7 @@
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2	0x19b6
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3	0x1a30
 #define USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR		0x18c6
+#define USB_DEVICE_ID_ASUSTEK_ROG_RAIKIRI_PAD		0x1abb
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY		0x1abe
 #define USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD	0x196b
 #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD	0x1869
diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 6fadaddb2b90..3a5af0909233 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -209,6 +209,7 @@ static const struct xpad_device {
 	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
 	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
 	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
+	{ 0x0b05, 0x1abb, "ASUS ROG RAIKIRI PRO", 0, XTYPE_XBOXONE },
 	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
-- 
2.45.2


