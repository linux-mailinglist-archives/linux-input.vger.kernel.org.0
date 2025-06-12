Return-Path: <linux-input+bounces-12858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 565D6AD7B3D
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 21:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B0297A87E0
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 19:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28892D663D;
	Thu, 12 Jun 2025 19:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UEUzuLgu"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB82D5417;
	Thu, 12 Jun 2025 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757337; cv=none; b=Zhj+S/p1RSMT2uFuhfkatqZ4yYk2WJwUv23AYC0U+YM3FuXFhBE+WmrLfqEhdM551yOYRRmTWBuAlLegrI7hdDfzFDYJHhIzVzeco4SZVL/MreZPGX0iADQIT0hARWY9tgiVopjMaxKozZQ9T1F5RdQNA98Jv3NQKuZbN9TxO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757337; c=relaxed/simple;
	bh=5Ehg8aQGjsmQjFGFetFWzPdWaPT+YpJgL6j24A8jE6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQl8o+0iYoS3gevM2HPxNbGs2h+RB2qu+2o/ZwxVp1/1jIsE2H0Bbuy6/U1rXRuKHzK1mo9bxsHxJbpCKbqMMj+/GcS/7Sb4io1xOzM/HB9klDvASLiQdtQwhfgKZHivzmbYsQ5PnrmDLRQ+XTEgAxFDWF1FVmoSm+qJQvq9De8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UEUzuLgu; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 22A4720A17;
	Thu, 12 Jun 2025 21:42:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edM3XNj7nGm1; Thu, 12 Jun 2025 21:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749757334; bh=5Ehg8aQGjsmQjFGFetFWzPdWaPT+YpJgL6j24A8jE6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UEUzuLgu4Dchtus7KQuGiCqW0ifWE2FV6BsPy6we/R3AYCH6VDLdh6hgLrL/dUwJ3
	 /Gmvn5PJ11JA1Dewu/58xJ/AajK2gvVbU7CTHM10zsLWxm672VI2sBDHJh3Z/frdZg
	 gaRBqWwB41vQ+5BYytzQ4c7vWwkZjHnywP1QOG0j0f1HKK/GF+WaJlwjfM5f+HxqTe
	 k/Hnlcxb1j5NywZc3+CZgSenReVF1w/vYKouSN3A99Eh5PNc/EJN0sfVKRG4XlLGg+
	 nXthXHh/x9IHjwuDbYM/DEkMmCmamJd0SEAd2hliLqTOncevX9zgHN/DtqHIVV7bl6
	 RKsdjTXwd/+TA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 13 Jun 2025 01:11:37 +0530
Subject: [PATCH RFC v2 5/5] Input: melfas-mip4 - add support for event
 formats 4 and 9
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-mip4-touchkey-v2-5-9bbbe14c016d@disroot.org>
References: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
In-Reply-To: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749757299; l=1820;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=5Ehg8aQGjsmQjFGFetFWzPdWaPT+YpJgL6j24A8jE6I=;
 b=yu443ThPP2LFhax3dbFRPTjpQ03zQG2ZGFPbLM8nL8IHNWVWe5Bh/Avtg8HotqxsHY1aIG3hC
 UpWAdL5Kz9eAKeVZ1Fvy90cA3SqG9f1DtC7NYVr5TnBrY3dTrjUhPVG
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Valid event formats in this driver is limited to 0, 1, and 3. These are
event formats for MIP4 touchscreen devices. Add support for event
formats 4 and 9, which belong to touchkey devices.

While at it, simplify the logic in function mip4_query_device where
valid event formats are checked. Use a human-readable switch-case block
instead of an if statement with obscure conditions.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/input/touchscreen/melfas_mip4.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 57b657694a420220be135c2f78d3ddad3ef6f520..95a78c86873355d0a8e0207b1eb4a8408f55cee4 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -360,9 +360,19 @@ static int mip4_query_device(struct mip4_ts *ts)
 		dev_dbg(&ts->client->dev, "event_format: %d, event_size: %d\n",
 			ts->event_format, ts->event_size);
 
-		if (ts->event_format == 2 || ts->event_format > 3)
+		switch (ts->event_format) {
+		/* Touchscreens */
+		case 0:
+		case 1:
+		case 3:
+		/* Touchkeys */
+		case 4:
+		case 9:
+			break;
+		default:
 			dev_warn(&ts->client->dev,
 				 "Unknown event format %d\n", ts->event_format);
+		}
 	}
 
 	return 0;
@@ -440,6 +450,8 @@ static void mip4_report_keys(struct mip4_ts *ts, u8 *packet)
 	switch (ts->event_format) {
 	case 0:
 	case 1:
+	case 4:
+	case 9:
 		key = packet[0] & 0x0F;
 		down = packet[0] & 0x80;
 		break;
@@ -552,6 +564,8 @@ static int mip4_handle_packet(struct mip4_ts *ts, u8 *packet)
 	switch (ts->event_format) {
 	case 0:
 	case 1:
+	case 4:
+	case 9:
 		type = (packet[0] & 0x40) >> 6;
 		break;
 

-- 
2.49.0


