Return-Path: <linux-input+bounces-2999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCA28A4420
	for <lists+linux-input@lfdr.de>; Sun, 14 Apr 2024 18:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 637AF2813C8
	for <lists+linux-input@lfdr.de>; Sun, 14 Apr 2024 16:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFB11386BF;
	Sun, 14 Apr 2024 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ0BP1lc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C90136985;
	Sun, 14 Apr 2024 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713112661; cv=none; b=JAo+SknrWn6pLuw1Ss6ObcEYdsR7VDfzVri9XkTiyJ2g2gCzxbH4FJPMZ1YP1cuRmSawifUMgfASaXSqT1PW0YE8oxU8e/I15rdu4pj7hG8YVNnKcqea+pYqFswXypdR1KK69WtODpkvkTpMQfH3JUyAhQ5jcqJXoLJ6S1EdCpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713112661; c=relaxed/simple;
	bh=n1GBrsVS4GARqilvgj9hly7fmHpvCWOvd9Tir89CMy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjlvShMJjyDXy0A1i73i/+stcRpQdh1g3LrqR2BQgMNuYyZcw2Ykt0JreETlAyc6WGWZhvxqdplpjahf+1TYHQdnRGpRhkYp5wTjdi+VLWXwG644upWkSCECBUk54M26hKWJqDbQmi1nl37xTQ3b7K5zD35Fl9VsOWHLGmaBGcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ0BP1lc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5F8C072AA;
	Sun, 14 Apr 2024 16:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713112661;
	bh=n1GBrsVS4GARqilvgj9hly7fmHpvCWOvd9Tir89CMy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GQ0BP1lc8pp2vfBJ6P2MEZAjjps7Ow8d8omihEfdd4Aj40v7JPDFqeQUYva9hywu9
	 vmNHGwoItyxie09pjtLpn/1vpXrarhhTE6X/aDSuW8SoCHaBZkEiOcVpMXyTDcPZ2B
	 GWKGeLdlQYkf66Mk4AD9tKrgAsrOiUkd2mGVFVoa1gjKlZOBEjF1qc+K0kTEtTICIN
	 Rhnj+RBLHMxuqesY/ok0yc7HugAPQEPvWpSAAuSH5DGMbA2p7MZbXBCQ7SrNhvP5TI
	 DPQ/KLcg3D41WmP0d4MvH7CzHPl7yO37OnQhQn0KDfkHvvKWHM2h7xnvdBNvH/Bdjy
	 YgdEUUU8N1tJQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:13 +0200
Subject: [PATCH 15/18] HID: picoLCD: Constify lcd_ops
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-15-9b37fcbf546a@kernel.org>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=krzk@kernel.org;
 h=from:subject:message-id; bh=n1GBrsVS4GARqilvgj9hly7fmHpvCWOvd9Tir89CMy8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX/O1cfvjid1pCiM8wbVynw2uERX4Lt9w05U
 eJgqpeaHu2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF/wAKCRDBN2bmhouD
 11thD/9N34bL4HZbHiidJ6z2vPuMOUkiHu0vGFu0cvuO4M4fwaNPt6K7MTBoIHA1B7+e7CbSofE
 2GugAP1F+KpuLfKziqfDUDW3kbtBDnCDmZ9X4doHBoAVx2F5eDMcP48FqLGkqwc9KjMZSQOK4ON
 hDz++U7QoMi1RZD18C0A7XGBcwnBAMj/AmsVRFy67mYWcqPquRYhz8RX/GiERjvczSLPiQoZgUv
 +eJMbJs+BV8gQi4YctWI2kzzTpcS8w9XJ7V8XfirDlDPRNA5ecRWx4JVYEAnkHJNtBpmjMj09f6
 ccgbpAleOa7PVffmw0dDUhpF2e2+T3KxSc2sA0MjfTq2JJFPkoz7YEbEgeBd2xvHJq0bX2HqTnB
 7YYFgeQZoxumLMZST88PHXyt04MXsOBbmf2X4lAmQMLlut8C7SxhH1rg1wNuem2fbgzpaeXRsrE
 RVEv0R8yW9B7S4AMgkefEL3hMAG/HlEQGvI9PHqUCyTLqEW51vj+zKODe9xPLqF5/mzgZ6B7bQf
 gNNOPvkiJ74Wqh0XK/+hLxPlXolF0MUzVdjvlomIqgoCXmBeYUTtJpJEFmpdGv21lldvyQcgIuF
 iQXAv4cj9HWN1L45yxdwpo7m+QanNGiif9QS+nSpvj8Fu5Cfd8d4YmcngMLy9sZSQGKrWJ/85AE
 i8rRMTrjMM024xA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'struct lcd_ops' is not modified by core backlight code, so it can be
made const for increased code safety.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Depends on the first patch in the series.
---
 drivers/hid/hid-picolcd_lcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-picolcd_lcd.c b/drivers/hid/hid-picolcd_lcd.c
index 0c4b76de8ae5..061a33ba7b1d 100644
--- a/drivers/hid/hid-picolcd_lcd.c
+++ b/drivers/hid/hid-picolcd_lcd.c
@@ -46,7 +46,7 @@ static int picolcd_check_lcd_fb(struct lcd_device *ldev, struct fb_info *fb)
 	return fb && fb == picolcd_fbinfo((struct picolcd_data *)lcd_get_data(ldev));
 }
 
-static struct lcd_ops picolcd_lcdops = {
+static const struct lcd_ops picolcd_lcdops = {
 	.get_contrast   = picolcd_get_contrast,
 	.set_contrast   = picolcd_set_contrast,
 	.check_fb       = picolcd_check_lcd_fb,

-- 
2.34.1


