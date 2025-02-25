Return-Path: <linux-input+bounces-10345-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC6A443A9
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 15:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9134E17F85E
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 14:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644E4268C6F;
	Tue, 25 Feb 2025 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgOS9yfp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D02221ABB2;
	Tue, 25 Feb 2025 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740495297; cv=none; b=BT/6j58icfUfGKBsOLNyYwhgzYA0opNfXsPsoKMw75dTPFb8NANuoDhNmh7E6p5kvQlPjSqC/EooYHZ5X6EbdhRgqmBLXfAg5QQhxUoiTMc3I/Vrba61SeSOxjFjxeC4Q2wS7bnl/azbrZTBSy0I37rwN668+Nj/hJqxWzo8Ffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740495297; c=relaxed/simple;
	bh=IAZmZupfWPhUfgk4lZe0NsfW4XTnGX4gwlCfIrMA8Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MqYq8+FkxNv5+q+4rLQ5AVda8aB1uSSl/iK4JIc/s7Bfb2kVtORq/9TsPT5GdgkJjzgj0p02vNNQqhO6OEbg+FQcVv9MFYTHJ6iZlxxm6l4W8uzLI/5khjpTlcnUextwR02fQnzQPamKhGNJEQpb5tcqIXoTWASYlLIzXfbrokE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgOS9yfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13575C4CEDD;
	Tue, 25 Feb 2025 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740495296;
	bh=IAZmZupfWPhUfgk4lZe0NsfW4XTnGX4gwlCfIrMA8Wg=;
	h=From:To:Cc:Subject:Date:From;
	b=WgOS9yfpjE+KWaYWPUS/RZgHbThsyBPh8Fs4M6MiHWrLG/MR8ymb/kU5R150TOhCd
	 TuG94czczt9WPUO4dAFhz8rkK7kxFYknyXNb2ua4XhxI/PYtExNFRnEAtrq/7HEjy9
	 4wTE8PCgtOIovdI83kyD9/EOXoaJwHtEcBmQZroo6xucjyCF8wn5hyt/hBeb3Zvi+6
	 lOgGUPMeJbsjRDy9n5rZPgRtcX5yltHJ4+9oJmjfS0HI7CBOSi9tA+MuHx5X/opE0m
	 KPlpkZ2d87YitWNY2gpTGAzUGiCHT8JkovswSHYG4b32E7PYYhF46SigBI1OnUTlfm
	 JnjaWaxTPsXUQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Takashi Iwai <tiwai@suse.de>,
	Jonathan Denose <jdenose@google.com>,
	Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] Input: synaptics: hide unused smbus_pnp_ids[] array
Date: Tue, 25 Feb 2025 15:54:38 +0100
Message-Id: <20250225145451.1141995-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When SMBUS is disabled, this is never referenced, causing a W=1 warning:

drivers/input/mouse/synaptics.c:164:27: error: 'smbus_pnp_ids' defined but not used [-Werror=unused-const-variable=]

Hide the array behind the same #ifdef as the code referencing it.

Fixes: e839ffab0289 ("Input: synaptics - add support for Intertouch devices")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Sent this about a year ago, the patch is still needed, so resending without changes
---
 drivers/input/mouse/synaptics.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index aba57abe6978..309c360aab55 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -161,6 +161,7 @@ static const char * const topbuttonpad_pnp_ids[] = {
 	NULL
 };
 
+#ifdef CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS
 static const char * const smbus_pnp_ids[] = {
 	/* all of the topbuttonpad_pnp_ids are valid, we just add some extras */
 	"LEN0048", /* X1 Carbon 3 */
@@ -196,6 +197,7 @@ static const char * const smbus_pnp_ids[] = {
 	"SYN3257", /* HP Envy 13-ad105ng */
 	NULL
 };
+#endif
 
 static const char * const forcepad_pnp_ids[] = {
 	"SYN300D",
-- 
2.39.5


