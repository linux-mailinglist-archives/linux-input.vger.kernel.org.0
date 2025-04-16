Return-Path: <linux-input+bounces-11806-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA648A90468
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 15:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 404FC17D98E
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 13:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8904409;
	Wed, 16 Apr 2025 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="sdmQk+p7"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3664A98;
	Wed, 16 Apr 2025 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810345; cv=none; b=kxENzqmkGOn2Tt6h6XNmg6sOlx9ElW+RchcDqQGXiLc1ZgRqbkADDUQlpR+PKFTdm4f32OhK5Zo1Pf/e1EsR625VyTOnGWrrLwZHYqOUkklaKIaEArzJXswsDiS4tLoFtqE8xBDItsxCL4oieDec7roJao4gw9D8BBFUy3wsw3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810345; c=relaxed/simple;
	bh=GYl+cOi7Hm/A4FYPFJHfCgValqrvdD0WgXA3Ec/yJBQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=V9vKl/ucXq8hMi2Xj2LgTUklr08OAwc93a0NQ2QMlTTmXyDOQySrT4EdhV/l1RTYN/ouXXM61D6oEe9jX2+u/KSShWA8ihOCMysfkQZZe5V4fSLcmkQbGPmK791+xmjRYdfqTY2R3TSUcUYgsPKl3NJz+LlZZdAZaM7HYxxhlLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=sdmQk+p7; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744810329; x=1745415129; i=markus.elfring@web.de;
	bh=Dn8xuaSrDHADMxryfuksnXO0OdZ0u3w/+mZ++AFocgs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sdmQk+p7oiGATfCy29PPKK/xGkxlpnetRo/teAjeQX2wN2CZfpkWc9qvnAGxL6WY
	 C8TT6HjMlu1JikuqstfdPL2CE19gEzIsRqkIMcFRCAp9yxSbVdk7kBBdxnfQ2Q7aP
	 +Jlo2q5S4/jnFWYnLBC7M8JAbuVWKBRkTTtLLP8a7Qrf8fvCAFNNYDql/RbsADPyH
	 238RCtrUtttoqBwd2Q5xDZ0eW/8SXe5e93B4QMfoZatljZ1fstloAoFSTB63Xi6gU
	 brCcNw9m0kBpqpAJHH2mQMezFpEGD7l2P6RjD9Wiym7SSc0/fq/lKbwUtmIcJYFyd
	 5tn8VZt7/NxwXrtXCg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkEhR-1tKPSK2JA1-00cbAF; Wed, 16
 Apr 2025 15:32:09 +0200
Message-ID: <99e0a0e0-1b21-4e94-a9ff-2dc5715d676d@web.de>
Date: Wed, 16 Apr 2025 15:32:07 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-input@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
 Benjamin Tissoires <bentiss@kernel.org>, =?UTF-8?Q?Filipe_La=C3=ADns?=
 <lains@riseup.net>, Jiri Kosina <jikos@kernel.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang
 <chenyuan0y@gmail.com>, Julia Lawall <julia.lawall@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] HID: logitech-hidpp: Replace devm_kasprintf() call by
 devm_kstrdup() in hidpp_connect_event()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p0Gcn/xDyd5bYhM6L0T5fXSG4T6gFZJvHcW4YdN9JMQystv7jEN
 eRgR4/qeZIslSdBclxpTgNsjmZuqzxG9Cgb4PNgc01QsDUILCD1oapkzA/eo3vNjz6L1yxq
 M/9TFDuf+vvWsB8xrZrMKGDhSbUQY+DhG/dtCkNJIo3XXTa86/FGx6bGV2ymurnQ9+iEkXr
 fj+vVKAYFs6erB9y3LbEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EwgZgdyj4bA=;NOXxqttxTUYMG0HAcx+4MD8/Uxf
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Apr 2025 15:25:05 +0200

Use a devm_kstrdup() call instead of a devm_kasprintf() call
in this function implementation because only a single string
should be copied.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/hid/hid-logitech-hidpp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-h=
idpp.c
index 10a3bc5f931b..c1a9ecde57c6 100644
=2D-- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4216,8 +4216,7 @@ static void hidpp_connect_event(struct work_struct *=
work)
 	if (hidpp->name =3D=3D hdev->name && hidpp->protocol_major >=3D 2) {
 		name =3D hidpp_get_device_name(hidpp);
 		if (name) {
-			devm_name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL,
-						   "%s", name);
+			devm_name =3D devm_kstrdup(&hdev->dev, name, GFP_KERNEL);
 			kfree(name);
 			if (!devm_name)
 				return;
=2D-=20
2.49.0


