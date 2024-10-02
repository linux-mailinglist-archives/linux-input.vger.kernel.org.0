Return-Path: <linux-input+bounces-7017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 564A098D453
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 15:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22331F22381
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 13:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B881D0433;
	Wed,  2 Oct 2024 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="zqY7cPgJ"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9471D042F;
	Wed,  2 Oct 2024 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875072; cv=none; b=kr7Zy9pDkfa3vanPbZg62ot4PwUXGeyW8pTB6ZZ+AArrAXddrfbp4VYDwEFxUHqzu8JSrUSdxa8JeiOCIvuCw/kgsapEYBAebvXrEPGRQVLXxzM8ccT/V/v2f3t2KIcqltgrzTYczDgYFChrhM08pcDkSjaJ0CZSKIJE9IhHqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875072; c=relaxed/simple;
	bh=8P6cWE6Y3SA/zxE+3Ctl2dClY9Gtv8gEj/Eg/FUpoR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T0/wUdmIALObH/IfKd9eLON78xR/ysuBs3SYwU0h27f2DJuJ90ueKt8jM+EmJWSqQH/Ba4Xo1Fj6bqKBO1EzGCVuNvAm4S4hSLL+bFdByXXzyKwLi7VUlis+pzhrIQiWzEXcQxdvgdaV9qYQRZmXfCrA8L/Z0JQRYlj6l62QaEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=zqY7cPgJ; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1727874151; bh=8P6cWE6Y3SA/zxE+3Ctl2dClY9Gtv8gEj/Eg/FUpoR4=;
	h=From:Date:Subject:To:Cc:From;
	b=zqY7cPgJb9jmR5CQdr+rUu91FIIOb0nZOoZKYK8nlZfcjVsEACwf0h4v7cHJu++PP
	 iDxQDStZkNj/mfCKymU35/45mH7PmU+lMJ0TU4TE6I3iSg0nLhXsAXgLwZ2RD9Xyeo
	 aJYW28OMLTfFfUUZHfwkI5aZ41wR3wUVzkVxCFtiZ4L1pIWHQNDHtl2Os4Lrsqzech
	 ImgETqwl8ZCcE/sJwcFTyAzkSFvoheosAglciE1ke8n2+PEskR3LiOKYkq5JDLGDNf
	 n16j0xxLncfFsimO5aokwpK4JpHQpewO0cUVhEDyA15H3gee0Rv4d+xi6iocSvZiVy
	 oV6+g9UAyKPMw==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id A19121328;
	Wed,  2 Oct 2024 18:02:30 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Wed, 02 Oct 2024 18:01:48 +0500
Subject: [PATCH] Input: zinitix - Don't fail if linux,keycodes prop is
 absent
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru>
X-B4-Tracking: v=1; b=H4sIADtE/WYC/x3MTQqAIBBA4avErBtQadVVooU/Yw2BhkZY4t2Tl
 t/ivQqZElOGeaiQ6ObMMXTIcQC767ARsusGJdQkhVD4cuCLC4aIBz02OsrohSdpnLbWKOjlmch
 z+a/L2toHUxAg/2UAAAA=
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakob Hauser <jahau@rocketmail.com>, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2631; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=8P6cWE6Y3SA/zxE+3Ctl2dClY9Gtv8gEj/Eg/FUpoR4=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBm/URjhNJb/Nku0RJgsyjBRT6aSmzh4qPldUF3p
 GI3pSYDMSqJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZv1EYwAKCRBDHOzuKBm/
 dYNfD/oDmMTMH/R3m8mf1l4fxqoZcnmt8vw3gAnQcyLuyuzMHp8nSkcLn0Nds+XX0bjVcQap/fv
 tR/dwidlIeDsoxaX1p5a91c29+U+R6Vwb0OZaOzkXEWVyrfoI2v33UY23OHlkrKpjVhXVGfGI5r
 UaE9Cb7sUeA++XZMIefBoVz/d52nGPoTJSGjQvyd3uYLUCWgT1Pk1MKTXfX+xtM4n19M0ujUXsl
 N+k92N8WFpPIVw1DAE7/CDMhijjrqz72OdAPAG6CHDL3bH4F2B1qYQHdBxGnGM9GSKr8X6tGPS2
 a468eVIWB63NorWrOewuygiAmIinBrEEsfH9j2rj9hj/QiNWi7XJVi0QHH101c3q7ZDqNW/arQp
 NVoa2lgTmrbfduOjWRMxt3UY06omFeUd3MB60pLUvvMN6DYVSxSAHW6wVZXIVbHauJZOIsUiWzL
 MeMuXwTMiaCIQw7/x88Zr3sM1pO5nxftVGE+ESBEIuywvJesK5PIg2LMM7z6i4kePBwSk5fBTvc
 cB/tGw8EViFO/pVZRPoESjKrzyWV98J4RjpQSng1hFdJSXIYkkAG2WXmKLw+GrD86SiSxFFteUR
 Fna65JTi86PU9gsNGWXLi8XuCZV+2WLzgrMKBen8ITylM9Z6PhW9Hz5R1CD5m88Z7k2VvWRFh2u
 /Lxd2QPAJ5oN8ZA==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

When initially adding the touchkey support, a mistake was made in the
property parsing code. The possible negative errno from
device_property_count_u32() was never checked, which was an oversight
left from converting to it from the of_property as part of the review
fixes.

Re-add the correct handling of the absent property, in which case zero
touchkeys should be assumed, which would disable the feature.

Reported-by: Jakob Hauser <jahau@rocketmail.com>
Tested-by: Jakob Hauser <jahau@rocketmail.com>
Fixes: 075d9b22c8fe ("Input: zinitix - add touchkey support")
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 drivers/input/touchscreen/zinitix.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 52b3950460e2..1f726653940c 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -645,19 +645,30 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		return error;
 	}
 
-	bt541->num_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
-	if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
-		dev_err(&client->dev, "too many keys defined (%d)\n", bt541->num_keycodes);
-		return -EINVAL;
+	error = device_property_count_u32(&client->dev, "linux,keycodes");
+	if (error == -EINVAL || error == -ENODATA) {
+		bt541->num_keycodes = 0;
+	} else if (error < 0) {
+		dev_err(&client->dev, "Failed to count \"linux,keycodes\" property: %d\n", error);
+		return error;
+	} else {
+		bt541->num_keycodes = error;
 	}
 
-	error = device_property_read_u32_array(&client->dev, "linux,keycodes",
-					       bt541->keycodes,
-					       bt541->num_keycodes);
-	if (error) {
-		dev_err(&client->dev,
-			"Unable to parse \"linux,keycodes\" property: %d\n", error);
-		return error;
+	if (bt541->num_keycodes > 0) {
+		if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
+			dev_err(&client->dev, "too many keys defined (%d)\n", bt541->num_keycodes);
+			return -EINVAL;
+		}
+
+		error = device_property_read_u32_array(&client->dev, "linux,keycodes",
+						       bt541->keycodes,
+						       bt541->num_keycodes);
+		if (error) {
+			dev_err(&client->dev,
+				"Unable to parse \"linux,keycodes\" property: %d\n", error);
+			return error;
+		}
 	}
 
 	error = zinitix_init_input_dev(bt541);

---
base-commit: fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
change-id: 20241002-zinitix-no-keycodes-f0fe1bdaccb2

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


