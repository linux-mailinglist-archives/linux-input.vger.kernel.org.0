Return-Path: <linux-input+bounces-5919-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B642962142
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF492851FD
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E3515CD55;
	Wed, 28 Aug 2024 07:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="WGQNJA8k"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7B15ADA4;
	Wed, 28 Aug 2024 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830481; cv=none; b=ZUsJ0bkIu2DNb7kbTUOrX7Ylw/VvqOdDDvx5ID9/gxe0SEsP3dSoglcSPZJbMMAWDMpXylQaOeEPOXxNd1KSTAbEDCQNNrU+2hrgYYhWkykmgFjbsoVgqHiXMVZK4Z746JqUHUGT+w7mAlaBM3Tu1UKGOZ6Z7WPShona0OnAPPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830481; c=relaxed/simple;
	bh=yvyLOv/li/2UvXjYSNvZv8fKVDGIDMLkIWtKlqnopdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXAiawJkg/8yMmDaNas6csRuHkpYMzH1h4XfUhy23wm9UoTSxoP4u4tqdydld0nTAT6u9Nx5oHXWAXCYafro7nZ8Koxv3JgfDkKVS+hAI6hQDYz2QQCgT+u6mFNHzMmPySICO0aZFSg42JpEj3Bk15xFqwFtgInGwNFKzQUw5ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=WGQNJA8k; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830478;
	bh=yvyLOv/li/2UvXjYSNvZv8fKVDGIDMLkIWtKlqnopdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WGQNJA8ksjJ5rdCLtxB0lL/qSdCyzfy8sTCnhBjyE9rFQDwk6VOm9RNlKojaD8DtE
	 17QcGtv7CkaIvv70ofPP+gNDGeghr0oglzKbS1yWqHOtmsvDh2FSGzW9Muiwvpnw/Y
	 vxeQdNxqqmaqbLjGwu1E52HktJYGhb8PfQWo5dhI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:24 +0200
Subject: [PATCH 05/14] HID: maltron: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-5-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=1184;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=yvyLOv/li/2UvXjYSNvZv8fKVDGIDMLkIWtKlqnopdc=;
 b=BGJFULnQNh9m4EsW9texxB97onFiLUcMdfyYwXADfo6b/oABlSPOb2Q0erIyPDJrWPxo2Cj1M
 qCoJByfE7GSA6U0frGBLrUCJlojznRA2SxoXsicZ9AU0OrdPD1N56ct
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-maltron.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-maltron.c b/drivers/hid/hid-maltron.c
index 374c64dd82c2..f0aad1ba2e6d 100644
--- a/drivers/hid/hid-maltron.c
+++ b/drivers/hid/hid-maltron.c
@@ -22,7 +22,7 @@
 #include "hid-ids.h"
 
 /* The original buggy USB descriptor */
-static u8 maltron_rdesc_o[] = {
+static const u8 maltron_rdesc_o[] = {
 	0x05, 0x01,        /* Usage Page (Generic Desktop Ctrls) */
 	0x09, 0x80,        /* Usage (Sys Control)                */
 	0xA1, 0x01,        /* Collection (Application)           */
@@ -79,7 +79,7 @@ static u8 maltron_rdesc_o[] = {
 };
 
 /* The patched descriptor, allowing media key events to be accepted as valid */
-static u8 maltron_rdesc[] = {
+static const u8 maltron_rdesc[] = {
 	0x05, 0x01,        /* Usage Page (Generic Desktop Ctrls) */
 	0x09, 0x80,        /* Usage (Sys Control)                */
 	0xA1, 0x01,        /* Collection (Application)           */

-- 
2.46.0


