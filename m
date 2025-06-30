Return-Path: <linux-input+bounces-13183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA141AED434
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 08:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDC321894376
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 06:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5441DF974;
	Mon, 30 Jun 2025 06:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoBvW6Me"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D534E1DF75D;
	Mon, 30 Jun 2025 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263424; cv=none; b=jjK0mGN+i6PzkN5S3cLuDPfDqXJOyJ2dj4KVQ/Q9bjPM7ggY7CWtR48cnjTqyRAVk/+Mq7IiMjLaJ0YbvyhoBmUdS/cxjJKNSq86carzCmErFMMBg8+Bwx05nEDkSOV6mTF/wQ8ISHal8zVO2WNFDca6FXe7rUseJxI5oapRRRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263424; c=relaxed/simple;
	bh=f/zHXizomnK/UoSQHyO9l1UbojaOXQHKnSqbjwtbLDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r99rAgyMgJST69M2vRjQOSiq/aE0DdpIH8ZsRZdaspRttLmPBrydLGLuyaCoRdHDjSOoNrLcRKxL3OReCDueqcTMvX/7fLSLGjepR/1ijvonHhWDPkDUAIVY6rJVWMqw9OBcvzLK5dA3P6bHKApJPfKGbw9vQ/FN0DuykB5Q828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoBvW6Me; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74b27c1481bso330694b3a.2;
        Sun, 29 Jun 2025 23:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751263421; x=1751868221; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bse0HiUeq6JYWCg46lscalLF5Ni0rMUFc9iwtNAYDtk=;
        b=KoBvW6MeMIzQHn81cPvVAcwKYx7IpDTzZGAF0UPxCwiuNCFRm6e8ie3tJxF+QDPExK
         tRh8OZrx3tJIN9dKJdQKomzhXJ6MIEzGfpkqpmEIDy3G43S14BBtnR+ElXPMEVe+Eb78
         3s1QVCbUidTooQlJx0LY8+4v1O61ufkmvzD1y8WQUWT7nseG1wPPqTttmN3xL89LOsM9
         EKVWsicnGniXvsHYXG/y8fTV7mV4hvtfK1F/AEibBX3ljmpCATwARjovZ+T8ub7cbN/S
         GljPaYp+r4F+G53pPGvZ/SzW9F7FAhpaq5hataRGGipMnnBPiGo5/GNUrqQkPL8qkJp6
         /XPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751263421; x=1751868221;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bse0HiUeq6JYWCg46lscalLF5Ni0rMUFc9iwtNAYDtk=;
        b=Q1/p+KJV0k6yMtZMKex0qKAd9xk6DSSLw9JEDzsxk9rzX2FNjDi5Bt0I4MBRoAZXAu
         f32g9zyheLB2y5Tdyf5Xa3YmLbIzSLW+fcfh2gzHf/PlrmCRMLDtJiNN5I68/RfbqXj6
         ZsU7a0qHz49d9V22dqBdJm5ki4U4FVQ3NxTfc87jZC2zS4itPSsscvpOOTLukbMPLGgD
         LZzMiL4/5dqJH5nDGwECE8z8VBUp3G1ySEFC7vHmJ5Qefs970efNclJQ4a7ykd7b6INH
         xwueDVQGaJgA+QDAJCVkMA+IqXZbs6PGvcGmfyzmA92f9lh3iNPmypubeD9+dGIpRCFW
         BzoA==
X-Forwarded-Encrypted: i=1; AJvYcCV1lICVngymd9HV3/0WJjw5mvIrI7d2dFFiYee625lZ01gLiz5N0CeLR2wm/ylwG//hDM4hgdpcAnKWOfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Bwiiua7bDXg/esgKWp76fEYGHAZ3uDKWI530OGt6oWohvGQ3
	mnqKsvVTMuNeSvcVUI/48mXyfmVp9NUMj4PK+e46PFVminYkE25w6QWGSFGl+g==
X-Gm-Gg: ASbGncsEckvkeQALcjazoIoLqdBNQpjer4UnjGFULNa/rK8MycpJV6U5XBWsRw74AXK
	XQVFJFhk4aUsdcstgLLJdYK7aOWy/twdWDtA8/xA+dA80oZ+DTigBeGfmawEObHT3PYkU91Bfmz
	yCRy7pdTOcu4AX2owI8XYFhHk7PsmuEDnPCEJwndBH8urOpHmOle/yeFi2Oo/qU9mP09HjZlwtZ
	UKcp4Lu1Gwdh2f7U2xnH4c1Wj1fGzTIEU2/2Ycd6rGaRDrrf0Zs5WCCygOga9eY+ke+8RBiLBoP
	Q4lch2/ffHrIj/GgKn/Fix86ZbzGYXJ2AD0OMOq7y88ZlKHzMhHt7fpxA4uw1g==
X-Google-Smtp-Source: AGHT+IFm5yoCw+BqcmmIx/EQrfxZmrjUID6nD8bqIItfY6Zwvqn3vWo5T3yKwPuH6tiYN2AHz0yuxg==
X-Received: by 2002:a05:6a00:14cb:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-74af6f4cf11mr14845678b3a.15.1751263420849;
        Sun, 29 Jun 2025 23:03:40 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b3a2sm7976071b3a.104.2025.06.29.23.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:03:40 -0700 (PDT)
Date: Sun, 29 Jun 2025 23:03:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: tca8418_keypad - switch to using module_i2c_driver()
Message-ID: <dhb2wzrhspbjh2gbt3iny7odsrpq2bbqldq276zuxwc4bnhgbl@qkbxj6yrihqv>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

With kernel supporting deferred probing there is no longer need to play
games with different initcall levels trying to influence probe order.

Switch the driver to use standard module_i2c_driver() to register the
driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/tca8418_keypad.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
index 76fc19ffe21d..68c0afafee7b 100644
--- a/drivers/input/keyboard/tca8418_keypad.c
+++ b/drivers/input/keyboard/tca8418_keypad.c
@@ -373,18 +373,7 @@ static struct i2c_driver tca8418_keypad_driver = {
 	.probe		= tca8418_keypad_probe,
 	.id_table	= tca8418_id,
 };
-
-static int __init tca8418_keypad_init(void)
-{
-	return i2c_add_driver(&tca8418_keypad_driver);
-}
-subsys_initcall(tca8418_keypad_init);
-
-static void __exit tca8418_keypad_exit(void)
-{
-	i2c_del_driver(&tca8418_keypad_driver);
-}
-module_exit(tca8418_keypad_exit);
+module_i2c_driver(tca8418_keypad_driver);
 
 MODULE_AUTHOR("Kyle Manna <kyle.manna@fuel7.com>");
 MODULE_DESCRIPTION("Keypad driver for TCA8418");
-- 
2.50.0.727.gbf7dc18ff4-goog


-- 
Dmitry

