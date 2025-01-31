Return-Path: <linux-input+bounces-9631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB06A23F12
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 15:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 650E67A4166
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2025 14:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F621DE4CB;
	Fri, 31 Jan 2025 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="QgLH+F12"
X-Original-To: linux-input@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF581CCB21
	for <linux-input@vger.kernel.org>; Fri, 31 Jan 2025 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738333326; cv=none; b=TlWu5C9Vxck6HrY8i07GRq0XoummwcYWZh3zRieD6SIyw+3kcJ5fUq8/kUahpqTedzDXvxL2BVrbP3SA63saX2o6uZhuifAkFzA9PChL7fTBhOk86jnftrtW1rjZKnTXVOGeywxUu0fPrxIpW7RyN+io1F60ktdzvXxddpzkbRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738333326; c=relaxed/simple;
	bh=J1lmk+XVMgp82xEXvHYN5BFuCS3NK5+mQqzkrXuFSSs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=UgeS2ljWPsQlV4UJWyRLRTsBk4J0qz9boLjdRfSjlmXkoZ/qwkqIASvuXNfummOgaiJqBQPu9c/AnKlSqacpJ+J0hkb9Bzr5hiX6mozZWk2cNFXVkeWL0N6r67frIkxlsZtZxGtb2s1oCNCth0yke7jJ3Ny9FVOiHFf0DePlK6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=QgLH+F12; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2DDC9240103
	for <linux-input@vger.kernel.org>; Fri, 31 Jan 2025 15:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738333323; bh=J1lmk+XVMgp82xEXvHYN5BFuCS3NK5+mQqzkrXuFSSs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:From;
	b=QgLH+F12yafrqIWYxIbi6/4LpjmJxGWr1/kDLi2+jIyfRIRQeH83d1ulB89y5IB3o
	 nGo14zgixSxNguU4B0S4DKb8J9d0P16BzhQSDMF3t9+p5s4bGhdk8pHy5PRQaqONv/
	 bptAoc5lywgMipfbuqMS2rjNOG1ZlInpXF8ogDakt1dXmlFSJGU+ZmL03CYBmSv7fP
	 jcdn/9+gFYGpsyc7448CcxkUfP+w+3+M+xzvP3gmMlCSbwk9cwNRocdeJ8v53yzjNw
	 hRv1d+3OTn54++PGB9vtShVZJK5hK4+dkpCqsuX5bnOLXy6qLzBbwl+k6pq6hi8Aga
	 hULsla06TQhZw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ykyky4Bkwz9rxL;
	Fri, 31 Jan 2025 15:22:02 +0100 (CET)
Message-ID: <10ae4572-bfc4-4ead-8563-99a26285d29e@posteo.net>
Date: Fri, 31 Jan 2025 14:22:02 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marian Flor <marian.flor@posteo.net>
Subject: [PATCH 1/1] gpio_keys.c: Send also event when EV_ABS axis button is
 released.
Content-Language: en-US
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

---
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


