Return-Path: <linux-input+bounces-5314-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBFB946FCD
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 18:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C1F61C204F8
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 16:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B6B50288;
	Sun,  4 Aug 2024 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="iGWs0PmW"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3857279C2;
	Sun,  4 Aug 2024 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722788990; cv=none; b=AqYLxXVkcFOG1yK74I6cW67EMnVHIjK1L5WgWObeY+4Jv93pMC06xa+UDwSXpfX6QUojg8N72V3PfnfsDZqTX7WLICdscaz1wx900luQDzQQsEzUw8VEn8n3xx+64mrmNA8cp8bbJp8g4C1HpSqmmKbVEKpwRgTuddsAcqwESxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722788990; c=relaxed/simple;
	bh=f0NlaCtt5Gf1nH692kjaX/e8x0tkeOxFgFp66UrzRNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DH7VhSetGcxqOSD2KGEYkNa6erg9qH+jO+CUe0TaolP7ndGRVVv2wLi37UVLj/nAodzpEozDPQ413yKGL2mbYu8LXX4aVapkjRRU6h3OOGUX9tkivXGpOAM5nIRPPo3O3E5OUy9FdGf55nS3NxjKzAAgMk+9hWXgdQwsQjnr7fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=iGWs0PmW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722788985;
	bh=f0NlaCtt5Gf1nH692kjaX/e8x0tkeOxFgFp66UrzRNo=;
	h=From:Date:Subject:To:Cc:From;
	b=iGWs0PmWzGK/LWGKTE9cRWNmMSWMkqyHKZpShZSluVOgMkaHeVVsgJ/F7CFAnt6z1
	 7zhKa3Bml17F3cQ5UL7qh7ULJl62IvObvBWo2rklBurCP9bHmaKUvniZbjX2GnQoAJ
	 PRFD29erDDZLzVN1rV6e78eIDNUlG/Np0y/kBvr8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 04 Aug 2024 18:29:37 +0200
Subject: [PATCH] HID: winwing: constify read-only structs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240804-hid-const-winwing-v1-1-5a6c714753b1@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAHCsr2YC/x2MywqAIBAAf0X23IKaQfUr0cHHVnux0Kgg/Pckm
 MscZl7IlJgyjOKFRBdn3mMV1Qjwm40rIYfqoKU2spcGNw7o95hPvDlWVvRWtc7JwXbBQ+2ORAs
 //3OaS/kApIKu/2MAAAA=
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ivan Gorinov <ivan.gorinov@jobyaviation.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722788984; l=1549;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=f0NlaCtt5Gf1nH692kjaX/e8x0tkeOxFgFp66UrzRNo=;
 b=iqoKJ3TQyASgio7HiFbsQoC+E4YyPtL4UZqXOVYCTRJukuVVk2zVB+EN06SwQEuMazTb2ERIU
 2/vObygLQX7AuSXqkSHkp1eEMMRqJpka/jsXC0/AQ7h2TAA+iGYLfcP
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

These structs are never modified, so mark them as const.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
While I stumbled upon this during the rdesc constification work,
this patch is unrelated to it and can be applied independently.
---
 drivers/hid/hid-winwing.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-winwing.c b/drivers/hid/hid-winwing.c
index 10a5d87ccb96..7d1c0226ab60 100644
--- a/drivers/hid/hid-winwing.c
+++ b/drivers/hid/hid-winwing.c
@@ -27,7 +27,7 @@ struct winwing_led_info {
 	const char *led_name;
 };
 
-static struct winwing_led_info led_info[3] = {
+static const struct winwing_led_info led_info[3] = {
 	{ 0, 255, "backlight" },
 	{ 1, 1, "a-a" },
 	{ 2, 1, "a-g" },
@@ -94,7 +94,7 @@ static int winwing_init_led(struct hid_device *hdev,
 		return -ENOMEM;
 
 	for (i = 0; i < 3; i += 1) {
-		struct winwing_led_info *info = &led_info[i];
+		const struct winwing_led_info *info = &led_info[i];
 
 		led = &data->leds[i];
 		led->hdev = hdev;
@@ -150,7 +150,7 @@ static int winwing_input_configured(struct hid_device *hdev,
 	return ret;
 }
 
-static __u8 original_rdesc_buttons[] = {
+static const __u8 original_rdesc_buttons[] = {
 	0x05, 0x09, 0x19, 0x01, 0x29, 0x6F,
 	0x15, 0x00, 0x25, 0x01, 0x35, 0x00,
 	0x45, 0x01, 0x75, 0x01, 0x95, 0x6F,

---
base-commit: a5dbd76a89423eca9f8de338350f2666aacfb432
change-id: 20240804-hid-const-winwing-ca13bb09a5dc

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


