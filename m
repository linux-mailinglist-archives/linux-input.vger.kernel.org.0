Return-Path: <linux-input+bounces-5922-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE7962148
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6F41C20866
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E8C165F00;
	Wed, 28 Aug 2024 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="B86BV1YO"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F400F16088F;
	Wed, 28 Aug 2024 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830484; cv=none; b=fKloMlDnFMUrM/2yS/CGcRPayc6JywY9f2URzFZcbkV2sTRQhjImBrI/P4HmrMeQr7aKaCsKWOCRuR+j7gR59WKo5MgNQjXI+BUhOfL1v8hgo/PLthmCmanclgA3TXBK5PFvABqHf93Qo4FjnmvzpGSjkW4bawqBB5zHItRlGzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830484; c=relaxed/simple;
	bh=QTzjvaF4B884XJqYTvfBBTA8lTLsNNhLKRcn7LKe3N4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DwZGRJbUgHBxKwjFjXpkL4Im0Q8XNhaLvP+Dkkipteb0lYVkIWE5jekPR1C5tGyX8ewUgViUoIVp10RJ6/9FkxGjpowBhGu3svPe2ogHvu2rnBNUcJPEmFLoWnUHFR1YBkJmK3vt1ZwxyoENMZHiO6KRT+Y1knbUsWwFwloDpd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=B86BV1YO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830481;
	bh=QTzjvaF4B884XJqYTvfBBTA8lTLsNNhLKRcn7LKe3N4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B86BV1YOFuMlovpKVpfUPPEcHrzRKJvVrjT/xlSwgcGDDmLx317Kho3M07S1ykY4r
	 u7L4jxKXu+wrYEwxM5rV7D8wGHm8+ICw42N0qAMpWGNSjCgEWxdeVrdXJ9wVaHtVdf
	 9p7VYN7EiPqmYsEVm9iabjZsxQiVgkzl2s1capa4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:27 +0200
Subject: [PATCH 08/14] HID: viewsonic: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-8-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=1214;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=QTzjvaF4B884XJqYTvfBBTA8lTLsNNhLKRcn7LKe3N4=;
 b=TgFea5nsZbmjMFDzWAZS80SU+G1eOptrbLzEMT8KnsxNf6yu6VO6YToiGk9MNan63obxsfSQs
 tYYhkBhxEC6BLT/JUnIx3WgUlrOOM5ZV7CnaQrjBZtZ8ehm279lo4rb
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-viewsonic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-viewsonic.c b/drivers/hid/hid-viewsonic.c
index 86f41e3fcb95..532bed88bdf8 100644
--- a/drivers/hid/hid-viewsonic.c
+++ b/drivers/hid/hid-viewsonic.c
@@ -22,7 +22,7 @@
 #define PD1011_RDESC_ORIG_SIZE	408
 
 /* Fixed report descriptor of PD1011 signature pad */
-static __u8 pd1011_rdesc_fixed[] = {
+static const __u8 pd1011_rdesc_fixed[] = {
 	0x05, 0x0D,             /*  Usage Page (Digitizer),             */
 	0x09, 0x01,             /*  Usage (Digitizer),                  */
 	0xA1, 0x01,             /*  Collection (Application),           */
@@ -77,8 +77,8 @@ static const __u8 *viewsonic_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	case USB_DEVICE_ID_VIEWSONIC_PD1011:
 	case USB_DEVICE_ID_SIGNOTEC_VIEWSONIC_PD1011:
 		if (*rsize == PD1011_RDESC_ORIG_SIZE) {
-			rdesc = pd1011_rdesc_fixed;
 			*rsize = sizeof(pd1011_rdesc_fixed);
+			return pd1011_rdesc_fixed;
 		}
 		break;
 	}

-- 
2.46.0


