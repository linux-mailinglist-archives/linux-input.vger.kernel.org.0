Return-Path: <linux-input+bounces-6769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335DE98788D
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 19:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6150E1C20B40
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 17:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6871415699E;
	Thu, 26 Sep 2024 17:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="pHjOHqES"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF381D5AAB;
	Thu, 26 Sep 2024 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727372672; cv=none; b=RDgYXQlZXmhVHYNRBvM2tn/Oc+sU2kFgQr8GLwOgYm1yJidwYhnpgdcHCkmAlGdG5TSk2cckP6FN0l35hOU8u4BiH4GWK4oQeYseX/EJh9nIf+78CJdicYnNL67R/nDaRYDELJgIk5O0tm2XoRFsiVetBVyTGi4TXnsPyKaM4A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727372672; c=relaxed/simple;
	bh=UvqNi//U5wpTfXilNRRlc85z5yE3eJG6ObZ848q/sB0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MMfthrakebOCvIR+/3FQqMLPWUjUDJy6eiGbsZcOkAK3ZOvIKD1+6XSe8hxOtmUiaARgrrs2Zu/fDYZfaJF+4dUASzIj00R4b3abYYVdfiJvaaSuomyk1AI/i6ZuOFQO8IA2HubSrthBNyQjn54qLVjpyDTUL2JvoZRO03E4sVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=pHjOHqES; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse.fritz.box (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 0B05B2FC004A;
	Thu, 26 Sep 2024 19:44:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727372666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H9x97eDU1PbyOXF3v/R8RWr8/PHzoFtqdxlXc7gdyN4=;
	b=pHjOHqESqmMGfH/HwRdNXvirvmdk0Cb7VAux7obRQqlQrN8ldcFalwCDXAseP/ViksCopa
	Nthj70LPG8L6X15wGqIz4laUGuViBeAdK2DvXIkSaBG1M+O/KueagrF2YnhNTs+azowVaE
	/6sax7iDYHuF7It/ipL3XcY9FW4kAzg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: 
Cc: bentiss@kernel.org,
	dri-devel@lists.freedesktop.org,
	hdegoede@redhat.com,
	jelle@vdwaa.nl,
	jikos@kernel.org,
	lee@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org,
	onitake@gmail.com,
	pavel@ucw.cz
Subject: [PATCH 0/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04
Date: Thu, 26 Sep 2024 19:44:04 +0200
Message-Id: <20240926174405.110748-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
took some time but now a first working draft of the suggested new way of
handling per-key RGB keyboard backlights is finished. See:
https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/
First time for me sending a whole new driver to the LKML, so please excuse
mistakes I might have made.

Known bugs:
- The device has a lightbar which is currently not implemented and
  therefore stuck to blue once the first backlight control command is send.

What is still missing:
- The leds fallback
- Lightbar control

Some general noob questions:

Initially I though it would be nice to have 2 modules, one jsut being the
wmi initialization and utility stuff and one just being the backlight logic
stuff, being loaded automatically via module_alias, but that would still
require me to create the virtual hid device during the wmi_ab probe, and
that already needs the ll_driver, so i guess I have to do it statically
like i did now?
Or in other words: I would have liked to have a module dependency graph
like this:
    tuxedo_nb04_lamp_array depends on tuxedo_nb04_platform (combining *_wmi_init and *_wmi_utility)
but if i currently split it into modules i would get this:
    tuxedo_nb04_wmi_ab_init dpends on tuxedo_nb04_wmi_ab_lamp_array depends on tuxedo_nb04_wmi_utility

Currently after creating the virtual hdev in the wmi init probe function I
have to keep track of it and manually destroy it during the wmi init
remove. Can this be automated devm_kzalloc-style?

Kind regards,
Werner Sembach



