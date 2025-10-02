Return-Path: <linux-input+bounces-15211-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 394EDBB4FC5
	for <lists+linux-input@lfdr.de>; Thu, 02 Oct 2025 21:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4FE119E0889
	for <lists+linux-input@lfdr.de>; Thu,  2 Oct 2025 19:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC90280332;
	Thu,  2 Oct 2025 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="l++hd/Qp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F52367B5
	for <linux-input@vger.kernel.org>; Thu,  2 Oct 2025 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759433104; cv=none; b=CDdChqW51lnt0rzijk6pEIm81Y39+F2y5eqgaO2hRkUv+wxa9Oq2jV44pgtxP+YwAdg+OSCStO3PfdFYL7GsyrvZzwl4ztNA6KvyB9HA9xUtPGmeOLLSZ3DeM4N9eaFoaAAqlLBKkLHx4O06Iu3u1YqhgNYWyIR8HtGoa9c73xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759433104; c=relaxed/simple;
	bh=FwCB5IJnEG0PSVtFwYxTC8uoOtzZEg6gEkKzh3IAsfE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UxknwhfyEay2Ar2D2bApK3j4ptu4R34cgIxAHOJPEDsv2B/SSSP7MrJ1F7MchpdGAdgwvjRCwhCB6/yIhXbDCi9jLotHkcSXO5hXJ6O/XqA4AhZMJr9gmbmPY7tPD1i36Jnns/Y0SQ3w1Rq+LSKZKcsG+BtZ++S3PLdhbNQ94aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=l++hd/Qp; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1759433085; x=1759692285;
	bh=2mPWG/kAOAMYASdhirng+n31WFQ8Pt+J3XT8jlfwhpI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=l++hd/QpdbSMubdZ6RbzTu0WDomQ73W393Rrkd0/h+AWxSlsZDNc/Jy7hdSy6g3eK
	 uB8qch70kc+E2wPi/sW6abhYaxYPiTeUtkFBEmWuhY0wT49d44brWW9nueAeIsC3BK
	 n5B/Fr9lZGZc7j5CEoWQCdRq0pL0RtyWJXdos8FLEdrNOwonQZZmJqMKgQNIHrJFvA
	 K751xJKX1OVna2VGl4Bi80l/sltcALnfOCw5VKjA0Afd+mmtnWfDhTifvjBt27f1Ma
	 58XqxNkM5jXZgu2aBkkdUYPWfPK0Q3tvyg2o4SLedRobUaVyiUSMHOuu13yMwqhud3
	 mtuPiuYPV1rLA==
Date: Thu, 02 Oct 2025 19:24:37 +0000
To: jikos@kernel.org, stuart.a.hayhurst@gmail.com
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: linux-input@vger.kernel.org, bentiss@kernel.org, hadess@hadess.net, lains@riseup.net, mavchatz@protonmail.com
Subject: [PATCH] HID: logitech-hidpp: Silence protocol errors on newer lightspeed receivers
Message-ID: <20251002192324.1991349-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: e43c7fb972a887798cffced87381faef4d40b67b
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When logitech-hidpp tries to communicate with an unreachable device paired
to a 046d:c547 lightspeed receiver, the following message is printed to the
console:

hidpp_root_get_protocol_version: received protocol error 0x08

This occurs because this receiver returns 0x08 (HIDPP_ERROR_UNKNOWN_DEVICE)
when a device is unreachable, compared to 0x09 (HIDPP_ERROR_RESOURCE_ERROR)
that the older receivers return.

This patch silences this harmless error by treating
HIDPP_ERROR_UNKNOWN_DEVICE the same as HIDPP_ERROR_RESOURCE_ERROR
in hidpp_root_get_protocol_version().

There are other checks for HIDPP_ERROR_RESOURCE_ERROR found in
battery-related functions, however this receiver does not trigger them when
the device is disconnected.

Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index aaef405a717e..1d46783384ed 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -969,7 +969,8 @@ static int hidpp_root_get_protocol_version(struct hidpp=
_device *hidpp)
 =09}
=20
 =09/* the device might not be connected */
-=09if (ret =3D=3D HIDPP_ERROR_RESOURCE_ERROR)
+=09if (ret =3D=3D HIDPP_ERROR_RESOURCE_ERROR ||
+=09    ret =3D=3D HIDPP_ERROR_UNKNOWN_DEVICE)
 =09=09return -EIO;
=20
 =09if (ret > 0) {
--=20
2.43.0



