Return-Path: <linux-input+bounces-2815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86838897E21
	for <lists+linux-input@lfdr.de>; Thu,  4 Apr 2024 06:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25CC61F237AD
	for <lists+linux-input@lfdr.de>; Thu,  4 Apr 2024 04:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A791E101E6;
	Thu,  4 Apr 2024 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="NbOwCh9x"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53F73E476
	for <linux-input@vger.kernel.org>; Thu,  4 Apr 2024 04:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712203256; cv=none; b=Y0Rj8chrDxmlbSHvFWYwlRyjQD3BAdHirIPX8T53xFoKrm0mgsQqBzg2K8lShDl5Fhm/h3OhC7aRKpCYnRIrmRY8UAJ5e/sZ1hPRm0E54KlObFFS8PQxCj/mKIcOwmV9TL2+Kibj8xYv0MBIVrzJmJMj3ROEQoYp7dPfN2OY1AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712203256; c=relaxed/simple;
	bh=oCpeFPp5Jn/D6YRwZuhmZyieNnPGgk+37gsgTcTOZOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dWbkbzPLvWDpq5JaJC7biPCYp6s/U55CZ5/qgivR1rIn3b3U4FZVbNI5Vt18RVh1+7tHTx9JtqReme3VwHNJ+Z4axCr/EIxCqiHXTJQqAag01REVmYAGxl18JTT6F4pWXrL/eUe4y6XNs9Qj7MKL2i18vc+5imHn/f9xdLwbezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=NbOwCh9x; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 6F303A264;
	Wed,  3 Apr 2024 20:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1712202837; bh=oCpeFPp5Jn/D6YRwZuhmZyieNnPGgk+37gsgTcTOZOA=;
	h=From:To:Cc:Subject:Date:From;
	b=NbOwCh9xFnewFNZFisWIZ9yOuW8/pvbK/biiHvaW2FYgGu/w8YzaB4qLEJ5mL7jZ2
	 fab3cLT2M3EgQ0u7aQCnNt6N7jnH88TzpYujrWoMkwQdNBBpSSQtFzWwCaXoRkJI/z
	 pMkvLH/N4iZh8QL+t5j4o58tK3qM3ry7PY25hKYgSrrlbSY5/RJnoTClPZoOqKMn7E
	 1FkK07ULCUPjftw3/QikdH113ZdtxUiNXa+Ze0XIe4r4xOCH1O7LxGgNMIqKw4co5N
	 X5DJwAJ3ZGdt6J0gtwqNEKgypAJv953BLH6iKvjeOoXqTuyJD5GiDl0Cv3kvCKkNPB
	 Kz5vhjzmTBSNg==
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH] Input: xpad - add support for ASUS ROG RAIKIRI
Date: Wed,  3 Apr 2024 20:53:45 -0700
Message-ID: <20240404035345.159643-1-vi@endrift.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the VID/PID for ASUS ROG RAIKIRI to xpad_device and the VID to xpad_table

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index bf3a7c1824f8..a7ce6258a2fa 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -202,6 +202,7 @@ static const struct xpad_device {
 	{ 0x0738, 0xcb29, "Saitek Aviator Stick AV8R02", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
 	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
+	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
 	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
@@ -474,6 +475,7 @@ static const struct usb_device_id xpad_table[] = {
 	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
 	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
 	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz Gamepad */
+	XPAD_XBOXONE_VENDOR(0x0b05),		/* ASUS controllers */
 	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f Xbox 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f Xbox One controllers */
-- 
2.44.0


