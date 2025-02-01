Return-Path: <linux-input+bounces-9666-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D95A24A43
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 17:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62F8718874E5
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 16:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551531C5D44;
	Sat,  1 Feb 2025 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="IeC5sSCs"
X-Original-To: linux-input@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FD91C3BE3
	for <linux-input@vger.kernel.org>; Sat,  1 Feb 2025 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426827; cv=none; b=QSPIKB+iexohom03hLMKRB/2mdwFLpT8zAM2bom5jlOKDlNPFkBjShGEOKq4muyN9PH8CKv7trO1BAhhqLt5mh5ST5j2HnGkKJQOTxcmfD69w1fHI9x5L+QUzx+Qke/i593I1fHy29t6nIaBMA1ke/AwXgENYm9JjXQy4SF+86Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426827; c=relaxed/simple;
	bh=cUxxIeyT4Mkg/ivrf4HZy3rlC+u22Pb1shKlAGWW2QY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=raG/TBj4Q3C6RDF0x5hmfKh/f5Zr5i44c4Wn7pWJvuHlw3gDAMGVk9ODg8R5fK4AdJ792a42Ji2BMdnkXPYqGth68YlDJSfvlKpsPKaJBkJtF7cf0OSsc7RvIP6QX/HXll0xCugJQ4JvLd+7j3nE0+XM6AEo5upKg/yYGubSs78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=IeC5sSCs; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9E8D3240101
	for <linux-input@vger.kernel.org>; Sat,  1 Feb 2025 17:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738426815; bh=cUxxIeyT4Mkg/ivrf4HZy3rlC+u22Pb1shKlAGWW2QY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:From;
	b=IeC5sSCsszbK82ryuL5ZGBG51VGYquQpWz46oykzJC5hPhhFOCN08rcJOViu5mWnr
	 etTDPhdzBhQWW3Kg+hlQtGIBtqbSY0oXdYpC4NamGNB4vOE6a1NI1VaquVGUxgMBDZ
	 tGPNhJFoBdUrMCpbIMOsXypVg0KfNPDfG5nXmqxNhsgKP4h4uYmgUr0LV63cnsIjd1
	 0YIDxK14p3zI/d4w2ErMfIz5Dz48qLg75GpQMHykgBpJ9WKehQXhk7Tw626RpZ4IFS
	 IhnDahxLqXXNdlnepfuHp8QXw15pe9J5WyygzxjS23ByI83V9VHKiNPQOWREra9c6Z
	 h6hhDfiHKke0A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YldJt4d1fz9rxM;
	Sat,  1 Feb 2025 17:20:14 +0100 (CET)
Message-ID: <717e71d6-5114-45ff-aa6b-0bb4a68b6261@posteo.net>
Date: Sat,  1 Feb 2025 16:20:15 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marian Flor <marian.flor@posteo.net>
Subject: [PATCH v2] gpio_keys.c: Send also event when EV_ABS axis button is
 released
Content-Language: en-US
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The input EV_ABS does not emit an event when the axis button is
released.  It appears to libevdev as held, even when the axis
button is physically released.  This behavior is also opposing
to the devicetree documentation for gpio-keys.  Change the code
to additionally emit a zero valued event on axis button release.

Signed-off-by: Marian Flor <marian.flor@posteo.net>
---
v2: No changes in patch itself, v2 got a commit description.

 drivers/input/keyboard/gpio_keys.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 5eef66516e37..20a0327e8f9a 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -373,12 +373,10 @@ static void gpio_keys_gpio_report_event(struct gpio_button_data *bdata)
 		return;
 	}
 
-	if (type == EV_ABS) {
-		if (state)
-			input_event(input, type, button->code, button->value);
-	} else {
+	if (type == EV_ABS)
+		input_event(input, type, button->code, state ? button->value : 0);
+	else
 		input_event(input, type, *bdata->code, state);
-	}
 }
 
 static void gpio_keys_debounce_event(struct gpio_button_data *bdata)
-- 
2.39.5


