Return-Path: <linux-input+bounces-16017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D8EC50B16
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 07:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2DCF4E030B
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 06:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5D02D5A14;
	Wed, 12 Nov 2025 06:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joeybednar.com header.i=@joeybednar.com header.b="et8Q0JsT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-200167.simplelogin.co (mail-200167.simplelogin.co [176.119.200.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0510942
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 06:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762928690; cv=pass; b=Kc8WcWr0ezU8PAuijNpW4xJHckz2pRo4FyJCgsKG0aFeQnmoSvIJI34hvT913TrBpH7CK/FF+gb+z6nAeiLUjlqpQrWt7VWjJ5SKbjdnAXcYd0AMAjWmdvbrPUsoSIH0lN4eh13FxVzcJRJun9oDvW6uVpDzf6PRwYwFq5p5OBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762928690; c=relaxed/simple;
	bh=rdr0Z8fz64CdjFrcKU+vyvrK1Fv7d5Jw3CcXFluAGZQ=;
	h=Date:Subject:MIME-Version:Content-Type:From:Cc:Message-ID; b=aozAtpSDS3GQn65BERgPfEWXZ2W2yaBNnNkIPhOaXFwLXpCpX8sjyPwAHghNDTqD8kH5lxDr2w+jYafd63Q10/Jl6pVYfOnbBz6FnXjkWxm+juT4nHp1Jro/NfK/yM8Awo1Hmj4GyiBOrbnA/B5AV2/4SsYPnPsHO6qOtU09F1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joeybednar.com; spf=pass smtp.mailfrom=joeybednar.com; dkim=pass (1024-bit key) header.d=joeybednar.com header.i=@joeybednar.com header.b=et8Q0JsT; arc=pass smtp.client-ip=176.119.200.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joeybednar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joeybednar.com
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1762927591;
	cv=none; b=vo8Mnq5myjhcIPRH4+NQyrtM+o224eWnghYcCXpIh3dTqdoR895wHNL3s5G1xcgiPXYUH4NS11/zm1X1jtMuBw0TxnBHl6Njlsg4JFI8oVf6n/5h/+69iIgs3zW6oy3GYZmIzl9km/o+dfR4SCLNxrV6yBYZbrDGfPWm6W5OeN225S/6+Mtf9t9/3lskrQMFiAMz76nB5DfU8yHmUKcyWkQa66oZWVKY2UwBPxEmW9NsTJbItPVV6lStIfRZXM80nPrwvdvLhGB0gzycQ5R+43reQFGVkSmcPmqne4Cfo9J1pxK+I32HJGyH+oglYRfNgJgn5LIcUKUbneYvr6dg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1762927591; c=relaxed/simple;
	bh=rdr0Z8fz64CdjFrcKU+vyvrK1Fv7d5Jw3CcXFluAGZQ=;
	h=Date:Subject:From:Cc; b=2MQNnWqz3Tmja5NI2rC55hMuqpKonl5pLE4bs739wlJB88FMbAEfIoXglYLj6rU13J67dW7g+kYSYxavD6fJVYVNL2n6BWtnhLIC1GS030JThsNkNCqZq2G537GUFdvIlSNk9XBuxYb9vrYn9Yethuah//8LJ73K/xad5cLlZW0wt/Y2E3QNAeiLSYjXtKUiVeCSk9xUGt9TeGT5z3YB4F+4AmI4a7nd7NdHWbeem/BtQQ0NViQP8WcH0MLvaO6s1x2RUJcp05bZB3j6vvU0FV6rL7ppLbwFB2ltYYaNBrSgviHRte/gjtp6+NGLqjB4akTvAnvYgVZf/ooTBiTWeg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joeybednar.com;
	s=dkim; t=1762927591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rdr0Z8fz64CdjFrcKU+vyvrK1Fv7d5Jw3CcXFluAGZQ=;
	b=et8Q0JsTFrrk25zUw2/0nyB54/2pI4a04ikYGKFGS7MYL0qeciFfu3NFID2wfmqG/dWPWB
	U9Sthwam4th4okIUX/4Yz8vZIPRf5vrhTxXzAYr8ZL+BRhp/4tvg96oLtHMJuS2AIG4A48
	9obcik5bdonlNnvs2qaVNiG9a4ksQ9I=
Date: Wed, 12 Nov 2025 06:06:23 +0000
Subject: [PATCH] HID: apple: Add "SONiX KN85 Keyboard" to the list of
 non-apple keyboards
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: linux@joeybednar.com
Cc: 
 linux-kernel@vger.kernel.org,linux-input@vger.kernel.org,bentiss@kernel.org,jikos@kernel.org
Message-ID: <176292759108.7.4651202733090413990.1001877915@joeybednar.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1001877919
X-SimpleLogin-Want-Signing: yes

From: Joey Bednar <linux@joeybednar.com>

The SoNiX KN85 keyboard identifies as the "Apple, Inc. Aluminium
Keyboard" and is not recognized as a non-apple keyboard. Adding "SoNiX
KN85 Keyboard" to the list of non-apple keyboards fixes the function
keys.

Signed-off-by: Joey Bednar <linux@joeybednar.com>
---
 drivers/hid/hid-apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 61404d7a43ee..01488ffc6dcf 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -354,6 +354,7 @@ static const struct apple_key_translation swapped_fn_le=
ftctrl_keys[] =3D {
 };
=20
 static const struct apple_non_apple_keyboard non_apple_keyboards[] =3D {
+=09{ "SONiX KN85 Keyboard" },
 =09{ "SONiX USB DEVICE" },
 =09{ "Keychron" },
 =09{ "AONE" },
--=20
2.51.2




