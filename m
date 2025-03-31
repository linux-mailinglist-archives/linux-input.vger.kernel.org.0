Return-Path: <linux-input+bounces-11407-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB3A769F0
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73CCF3AE502
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 15:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A4523373C;
	Mon, 31 Mar 2025 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMixczB9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD57233733;
	Mon, 31 Mar 2025 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432919; cv=none; b=JhTryThsd14IFDyJELlMvP2Zorp0U1IE3d01+jafB+kpoAyisUApHX0eC3Iqy5IKFmJ2+exkS0HUGJxTqbpOzOmPvYlhFo0Zg6GrPubADAMHzBGCSrnjjQ5Hm0PoS/8a6FZltNXeEpzzzyHv1fppI1QYCCA67FgXT/p0JMZsN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432919; c=relaxed/simple;
	bh=0ylQr3AKNQSc4xCToTSW36HPdoK63vTJRJvNgCW1xtY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9KxpJPGGtt1HQRmqZHQlxkKGwf2vZ2Ytgz8j3Uis05etSh+QdD4WFA0pp2UzE/lJg33IW5QaaUOrvIS4J6D1c4StZ8xDijYI17AjxwRCNUr26t0Kri56PxvtzEpAc7YiZzYTM5sUBbU32w49kPSVewyYW0k3oVXKNc74HUFszc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMixczB9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D4FC4CEE9;
	Mon, 31 Mar 2025 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432918;
	bh=0ylQr3AKNQSc4xCToTSW36HPdoK63vTJRJvNgCW1xtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fMixczB9Bi/ycn93hUyQ/cKTTrMYugVtlXxbbhLsBdPEvYPNIxHPR9DTMa/KIrpLT
	 PgAHEP1dHa2WcCy5YkwTsDT+RksXQrFoc2RsFSRY4+V1k93zpYCIpOfzre17jETMhX
	 8DfICUcXTop3eL73Xb7b9IYw8sRfd8uaD+4QyrRX2d4l2XhediSOZEIMUwmuL5x1D9
	 /ZsHD7VeMmQCeKIEd/ZoZaDriWay8Ukk/TTuDljRHm+tAbkBDJU4qFX4bk0spe2Jo/
	 BfnV+eb3U4g06KADCSQ14Phr3LNWqd5kScxeCS66VSr1dFpuvBenK3L/ih4HhbH4o0
	 VzSUTCOOevy5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>,
	Paul Dino Jones <paul@spacefreak18.xyz>,
	=?UTF-8?q?Crist=C3=B3ferson=20Bueno?= <cbueno81@gmail.com>,
	Pablo Cisneros <patchkez@protonmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 04/23] HID: pidff: Do not send effect envelope if it's empty
Date: Mon, 31 Mar 2025 10:54:50 -0400
Message-Id: <20250331145510.1705478-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145510.1705478-1-sashal@kernel.org>
References: <20250331145510.1705478-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
Content-Transfer-Encoding: 8bit

From: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

[ Upstream commit 8876fc1884f5b39550c8387ff3176396c988541d ]

Envelope struct is always initialized, but the envelope itself is
optional as described in USB PID Device class definition 1.0.

5.1.1.1 Type Specific Block Offsets
...
4) Effects that do not use Condition Blocks use 1 Parameter Block and
an *optional* Envelope Block.

Sending out "empty" envelope breaks force feedback on some devices with
games that use SINE effect + offset to emulate constant force effect, as
well as generally breaking Constant/Periodic effects. One of the affected
brands is Moza Racing.

This change prevents the envelope from being sent if it contains all
0 values while keeping the old behavior of only sending it, if it differs
from the old one.

Changes in v6:
- Simplify the checks to make them clearer
- Fix possible null pointer dereference while calling
  pidff_needs_set_envelope

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/usbhid/hid-pidff.c | 42 +++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 5fe4422bb5bad..a01c1b2ab2f4c 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -262,10 +262,22 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 static int pidff_needs_set_envelope(struct ff_envelope *envelope,
 				    struct ff_envelope *old)
 {
-	return envelope->attack_level != old->attack_level ||
-	       envelope->fade_level != old->fade_level ||
+	bool needs_new_envelope;
+	needs_new_envelope = envelope->attack_level  != 0 ||
+			     envelope->fade_level    != 0 ||
+			     envelope->attack_length != 0 ||
+			     envelope->fade_length   != 0;
+
+	if (!needs_new_envelope)
+		return false;
+
+	if (!old)
+		return needs_new_envelope;
+
+	return envelope->attack_level  != old->attack_level  ||
+	       envelope->fade_level    != old->fade_level    ||
 	       envelope->attack_length != old->attack_length ||
-	       envelope->fade_length != old->fade_length;
+	       envelope->fade_length   != old->fade_length;
 }
 
 /*
@@ -580,11 +592,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_constant(effect, old))
 			pidff_set_constant_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.constant.envelope,
-					&old->u.constant.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.constant.envelope);
+		if (pidff_needs_set_envelope(&effect->u.constant.envelope,
+					old ? &old->u.constant.envelope : NULL))
+			pidff_set_envelope_report(pidff, &effect->u.constant.envelope);
 		break;
 
 	case FF_PERIODIC:
@@ -619,11 +629,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_periodic(effect, old))
 			pidff_set_periodic_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.periodic.envelope,
-					&old->u.periodic.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.periodic.envelope);
+		if (pidff_needs_set_envelope(&effect->u.periodic.envelope,
+					old ? &old->u.periodic.envelope : NULL))
+			pidff_set_envelope_report(pidff, &effect->u.periodic.envelope);
 		break;
 
 	case FF_RAMP:
@@ -637,11 +645,9 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 			pidff_set_effect_report(pidff, effect);
 		if (!old || pidff_needs_set_ramp(effect, old))
 			pidff_set_ramp_force_report(pidff, effect);
-		if (!old ||
-		    pidff_needs_set_envelope(&effect->u.ramp.envelope,
-					&old->u.ramp.envelope))
-			pidff_set_envelope_report(pidff,
-					&effect->u.ramp.envelope);
+		if (pidff_needs_set_envelope(&effect->u.ramp.envelope,
+					old ? &old->u.ramp.envelope : NULL))
+			pidff_set_envelope_report(pidff, &effect->u.ramp.envelope);
 		break;
 
 	case FF_SPRING:
-- 
2.39.5


