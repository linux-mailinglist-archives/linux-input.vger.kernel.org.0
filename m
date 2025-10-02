Return-Path: <linux-input+bounces-15212-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C0BB5028
	for <lists+linux-input@lfdr.de>; Thu, 02 Oct 2025 21:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D7A13BB7D4
	for <lists+linux-input@lfdr.de>; Thu,  2 Oct 2025 19:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322F2267AF1;
	Thu,  2 Oct 2025 19:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="C7mxTJry"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AB9A93D
	for <linux-input@vger.kernel.org>; Thu,  2 Oct 2025 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759433470; cv=none; b=K0yDaaehHr0c47qSoOpf8f/Yh8nK6XimK4LOsGzo2V6yEXki0YtKFZV9HYNsXYkGUm6SrsV3hVH/+QKSiWZr8g3LpVr0KIr7g+LC3ZuWwlNqsytRVKBUVYOY0o5dj4KBtTdYVO68oSRIokX5G3FMXFA1UaJtdBqB5cewcQ9Q+CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759433470; c=relaxed/simple;
	bh=591lrtQQxWESA8MyP7UauFFOOg7tL8peh400Qf+3nWg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NSfTcLzzeWeIu9P3roXOI+HghsDFrFLkMdioUcCW2dI9qxkNsOWaln5Qg+U2Nyn+3tqQea+oTeQOyUtJelk4CMkxJz5B6vXBM0mAYyCNC2AndgnjFfFaYXuTmPRSls8dI9qO31JF6yslVwDvrvd5Jg8jtqXS4zArSLrPSqA3bqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=C7mxTJry; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1759433465; x=1759692665;
	bh=FxuuanLVOOcyI0swMrAM1++ap6VLQXhS6ewUOsargc8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=C7mxTJry4m6w4yNaNGxN+OpdXbfbMKS1OZ/F2PPQfOAoCpT3ZQ8NlSibNWPJf7jVF
	 JBWBiCjGt1JbONC/f5W1CJlUeCoqpYxmfrqMMSXoEPtYoywXbPuNjsXC8Dn/5CFipz
	 qUQhIkVI7GceTnKNQJ59LsI6q4nx8YQTEnh8oe9pjJzNt+bv8MEeStfbWHvMog07KK
	 miOqwc7woXGdUHxuMfLgOUrfe0MVwUnUyG54gD5vuaJCyjf/3Zw7oBfPybPmV797b7
	 uQ5qylqd022IKC55DoEHQ3hSrKtNYqjwfK6m3esMyp9z00kheDUeT6lyAQK8TtFaMX
	 z8gbs/qtle3PA==
Date: Thu, 02 Oct 2025 19:30:58 +0000
To: jikos@kernel.org
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: stuart.a.hayhurst@gmail.com, linux-input@vger.kernel.org, bentiss@kernel.org, hadess@hadess.net, lains@riseup.net, mavchatz@protonmail.com
Subject: [PATCH] HID: logitech-hidpp: Do not assume FAP in hidpp_send_message_sync()
Message-ID: <20251002193025.2066319-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: a5d210cd9c88b383569bdd3eea678c6dc78320e9
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Currently, hidpp_send_message_sync() retries sending the message when the
device returns a busy error code, specifically HIDPP20_ERROR_BUSY, which
has a different meaning under RAP. This ends up being a problem because
this function is used for both FAP and RAP messages.

This issue is not noticeable on older receivers with unreachable devices
since they return HIDPP_ERROR_RESOURCE_ERROR (0x09), which is not equal to
HIDPP20_ERROR_BUSY (0x08).

However, newer receivers return HIDPP_ERROR_UNKNOWN_DEVICE (0x08) which
happens to equal to HIDPP20_ERROR_BUSY, causing unnecessary retries when
the device is not actually busy.

This is resolved by checking if the error response is FAP or RAP and
picking the respective ERROR_BUSY code.

Fixes: 60165ab774cb ("HID: logitech-hidpp: rework one more time the retries=
 attempts")
Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index aaef405a717e..524afc797917 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -350,10 +350,15 @@ static int hidpp_send_message_sync(struct hidpp_devic=
e *hidpp,
=20
 =09do {
 =09=09ret =3D __do_hidpp_send_message_sync(hidpp, message, response);
-=09=09if (ret !=3D HIDPP20_ERROR_BUSY)
+=09=09if (response->report_id =3D=3D REPORT_ID_HIDPP_SHORT &&
+=09=09    ret !=3D HIDPP_ERROR_BUSY)
+=09=09=09break;
+=09=09if ((response->report_id =3D=3D REPORT_ID_HIDPP_LONG ||
+=09=09     response->report_id =3D=3D REPORT_ID_HIDPP_VERY_LONG) &&
+=09=09    ret !=3D HIDPP20_ERROR_BUSY)
 =09=09=09break;
=20
-=09=09dbg_hid("%s:got busy hidpp 2.0 error %02X, retrying\n", __func__, re=
t);
+=09=09dbg_hid("%s:got busy hidpp error %02X, retrying\n", __func__, ret);
 =09} while (--max_retries);
=20
 =09mutex_unlock(&hidpp->send_mutex);
--=20
2.43.0



