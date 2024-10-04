Return-Path: <linux-input+bounces-7089-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 240399908E5
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 18:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B60FF1F22510
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 16:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448E61C727F;
	Fri,  4 Oct 2024 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="U2ByiIus"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7571C3047;
	Fri,  4 Oct 2024 16:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728058678; cv=none; b=t8n1v9Df1+T44k5CPPe+w/UY4LLdlkhNM9mP2nIeeNxwYIGbS86edwamYALL8YAa0wpn920BN3m4LLeKegcjjAqzZpCDtzPEOU+JH9SU2BNUvGU/QWnpg4l21/9Ov34nxKdmRIvoC/bQQpXbaOQbviyr/6QK95lZGgVwOj9y5f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728058678; c=relaxed/simple;
	bh=H0MnowX7nwTqasbChirFtQh7Hmkp0r7mgb/om6B8so0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CLjDJ41a/WwpDYwvxuk0oUByELiJhRTBRdiVjuExNtPXUVw1nR5g9l9evBgo1lWxA/cjt8fJ++EZEw40duyTjqBRnsWKR6RCgsIHfdL8JlaWZlLWKxTEen8MxIRkrQ/4F0Ts3wTE+vd87nE5oUGRwE7n8ZwTk5MiofUNxuu3Q6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=U2ByiIus; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1728058663; bh=H0MnowX7nwTqasbChirFtQh7Hmkp0r7mgb/om6B8so0=;
	h=From:Date:Subject:To:Cc:From;
	b=U2ByiIuseHsVCeqmSivPZ/iRoHDlC8SjxPQvTmxBuTjPEBM6AIR8jlLPhzOkIjkUG
	 wR+QbHtWbqY6406F6/vbgyPglV7oAW3+uG0dx54IlxIeu/Bp7RExgx0QlLpSHlMwSu
	 6+eJeh/6EmmfSCn4av8Kd9r/wYCrcXDGOuP/fCjfJZGtn+bzDialpytMegSeD4/0o5
	 wZtn7gBk9vUchFxMhoMJI0xphvDZXaSwmWgNd6dPAOgI2JEEP8q8+3jlxXCMmHncn8
	 JWrOzN7iDyBuwDeagfjBCvrUjNpBdqz32VxCrNV0JFNdq5cimBUnpnmqmRKmVt0vIT
	 CY9PY4i06w4SA==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 78E202617;
	Fri,  4 Oct 2024 21:17:41 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Fri, 04 Oct 2024 21:17:30 +0500
Subject: [PATCH v2] Input: zinitix - Don't fail if linux,keycodes prop is
 absent
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-zinitix-no-keycodes-v2-1-876dc9fea4b6@trvn.ru>
X-B4-Tracking: v=1; b=H4sIABkVAGcC/32NQQrCMBBFr1Jm7UgmBLGuvId00aYTOwiJJGloL
 b27sQdw+R789zdIHIUT3JoNIhdJEnwFfWrATr1/MspYGbTShpTS+BEvWRb0AV+82jByQqcc0zD
 21g4a6vId2clyVB9d5UlSDnE9Tgr97P9eISTkq1G6vSgyLd1zLP4cZ+j2ff8CNkJSrrQAAAA=
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakob Hauser <jahau@rocketmail.com>, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=H0MnowX7nwTqasbChirFtQh7Hmkp0r7mgb/om6B8so0=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBnABUgY6l+kVbcWDny/A7E2Z7SNrVmdl6hGDFX7
 FIhEi2aeF2JAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZwAVIAAKCRBDHOzuKBm/
 dW0cEACSb5XIfxWFCULLbMl7PX1bkH1mR5KhJDmQviQyDOzLq6qYoAwpxY/9P8EfTjRSVgo4FHb
 /DPO3YQ2PhUHbDiu67WRryEjfRfnjtmVaQegh9rXpEfWRSSw5D1pnU9VYX44YbfojcfjfUvw227
 lXu6z+wCEJq3aIsiIo6+MCiSYMgnEQM4o3p2cV0gSNTmI6d3kJ8M0CAJ3ui5RbAoJjCh6ZRLUfF
 zqzEmxpRn320XPptaz4Cv7R3OuRz2NHFg6MFFJiMCq8eZh4/TnTZDNf09MWCNBsQIenrrFlC3gq
 55JwdU3obQg7z86PujUuCMNF4mgF6Ho4FEzmJRoYt6UcB+YVpoCfvd9XHJ27/kMLR0YkhCxTDoD
 WAjF9BiVAmeHct9dDiWzse3/PfLL3n0EA9BY/CVNBooaGHEX2NTw1VhZK55lLd45kveUKYLGwDy
 gAAfHYIZ7dEtOhJy2QYRVIm9rHHU6nW7ouGChnS6da833Hh+7xXKxLSJ37kvg7gjTBx1CHfjRJu
 /eVfD0qY/UomElDaZXMfweU5VtCTeDO4g6rE36et3E0pOwqYnnfmABluLEjB+ilVlYp1w1ITSn+
 u8MI53SnLcK0jY1b8RRZOYFljxIpHepvQ9IYfbpDlMTv0ef3EPyT1dK+/B9IH8ybvFXinPJqm9T
 /Qt1Rp+Kncq6h0A==
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Changes in v2:
- Refactored the change to simplify the code (Dmitry)
- Link to v1: https://lore.kernel.org/r/20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru
---
 drivers/input/touchscreen/zinitix.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 52b3950460e2..716d6fa60f86 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -645,19 +645,29 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		return error;
 	}
 
-	bt541->num_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
-	if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
-		dev_err(&client->dev, "too many keys defined (%d)\n", bt541->num_keycodes);
-		return -EINVAL;
-	}
+	if (device_property_present(&client->dev, "linux,keycodes")) {
+		bt541->num_keycodes = device_property_count_u32(&client->dev,
+								"linux,keycodes");
+		if (bt541->num_keycodes < 0) {
+			dev_err(&client->dev, "Failed to count keys (%d)\n",
+				bt541->num_keycodes);
+			return bt541->num_keycodes;
+		} else if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
+			dev_err(&client->dev, "Too many keys defined (%d)\n",
+				bt541->num_keycodes);
+			return -EINVAL;
+		}
 
-	error = device_property_read_u32_array(&client->dev, "linux,keycodes",
-					       bt541->keycodes,
-					       bt541->num_keycodes);
-	if (error) {
-		dev_err(&client->dev,
-			"Unable to parse \"linux,keycodes\" property: %d\n", error);
-		return error;
+		error = device_property_read_u32_array(&client->dev,
+						       "linux,keycodes",
+						       bt541->keycodes,
+						       bt541->num_keycodes);
+		if (error) {
+			dev_err(&client->dev,
+				"Unable to parse \"linux,keycodes\" property: %d\n",
+				error);
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


