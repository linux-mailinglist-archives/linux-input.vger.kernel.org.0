Return-Path: <linux-input+bounces-5918-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3D96213D
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86B10B25672
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198BA15B968;
	Wed, 28 Aug 2024 07:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KlJg7BVQ"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D2D15B13C;
	Wed, 28 Aug 2024 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830480; cv=none; b=qC+Q/oecPIXwSTU45PLIdjYhDlfz372f083PaFZXYGqXcyDLWx+Z83YW46XCEYw+fLEmmV1yafkFskyQ38nguzcuX+avE1bIVyjtGvxQmvfD4khqVJ81xrbDH6n4fxZyRev0Qc93Zc4kTn9+n6yhOn1QqfSrzgPy63VWt5L1Dh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830480; c=relaxed/simple;
	bh=d/Hy3jTDpRGHAOU4IIxyREy5kpLEitmtqMFs7QmKIJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erQYD9alOInQ/w37wc9EMKRGnCmSxW7WOo4aBu4lKa2E4uUXYTeT5zMtAwHcqRPxOAnhxirpcoAvPT21TRQj+M3t6zWv/F+U7Svj4l+kAF8nrQnsurOouGW1rKvdC/VX1tajqC2WwHKl9jaz5R7/C2A/spN5B1zwLVSOk9xE6Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KlJg7BVQ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830476;
	bh=d/Hy3jTDpRGHAOU4IIxyREy5kpLEitmtqMFs7QmKIJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KlJg7BVQghLT+w+R8yyj6f9P/CHrRki5cqOloD+sXZq8RFpdCWjGpyqMBhmt3l8G4
	 pg/+++n15dNGDtIvmn7qZSwlRgOhGxzgJJYn0Df/j0m00YnBDiGRGcxKMWKltY9gR3
	 MuV+7G3LCddviRb6BlrJwfVtJVG6bAFS6ZrHKVm4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:28 +0200
Subject: [PATCH 09/14] HID: steelseries: constify fixed up report
 descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-9-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=1303;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=d/Hy3jTDpRGHAOU4IIxyREy5kpLEitmtqMFs7QmKIJM=;
 b=U2dXddlGmgOGNJohfVOgYOYTN9TkcY8xwfL2/bOf4Bky49k74MAA2Ck9CXkLq4LYjrOo/Y/4k
 sBR4MayqNzvBp0hes/C6FTOoz7b8OIZLoMXQ7U/3uBxgpY/EulefPUn
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-steelseries.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 895da49e8ead..7e83fee1ffa0 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -51,7 +51,7 @@ struct steelseries_srws1_data {
  * appear in the 'Generic Desktop' usage.
  */
 
-static __u8 steelseries_srws1_rdesc_fixed[] = {
+static const __u8 steelseries_srws1_rdesc_fixed[] = {
 0x05, 0x01,         /*  Usage Page (Desktop)                */
 0x09, 0x08,         /*  Usage (MultiAxis), Changed          */
 0xA1, 0x01,         /*  Collection (Application),           */
@@ -580,8 +580,8 @@ static const __u8 *steelseries_srws1_report_fixup(struct hid_device *hdev,
 	if (*rsize >= 115 && rdesc[11] == 0x02 && rdesc[13] == 0xc8
 			&& rdesc[29] == 0xbb && rdesc[40] == 0xc5) {
 		hid_info(hdev, "Fixing up Steelseries SRW-S1 report descriptor\n");
-		rdesc = steelseries_srws1_rdesc_fixed;
 		*rsize = sizeof(steelseries_srws1_rdesc_fixed);
+		return steelseries_srws1_rdesc_fixed;
 	}
 	return rdesc;
 }

-- 
2.46.0


