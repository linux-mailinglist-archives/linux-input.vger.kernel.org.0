Return-Path: <linux-input+bounces-9264-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 363D9A130CE
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 02:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80ECC1886B89
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 01:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD9828E0F;
	Thu, 16 Jan 2025 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="k9j+zOlW"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE592868B
	for <linux-input@vger.kernel.org>; Thu, 16 Jan 2025 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736991157; cv=none; b=Gi6o1LE/S7VcijFJThBngHHO83Wilc/Lzf4R0dBpMVbscM6tR7NfphBrPQ3S6zX2u6hmShnKg9gKLMitJSVSI/hOcfXSXXY9qoy0PrOFj1vQwJs9q96Fdz6QVxl8RY+vm6YEr9Umrvh0U0UW0INZcQ+1mqlgLphgT4gwYusYOpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736991157; c=relaxed/simple;
	bh=fjXWcLYczeAPgJD8bfYBY+9TSwKvxHISgwc9ax97IXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PvKOu78fpXn3bD/gGwJfHvbZNE8WRm6F7E4jMLfVVIY/AxFY16b7u7gbM+NdHL+eXkBbrsCZHvRtmUqtcp/+Se4oupglcbbOETxICVMnW9I5oKwCzpUAyKzjJiib3zhmiqIJmMvLc8Tc3WPWFhM1F9YhuFOCtxLSDKw6Nhjt7S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=k9j+zOlW; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1736990733; bh=fjXWcLYczeAPgJD8bfYBY+9TSwKvxHISgwc9ax97IXg=;
	h=From:To:Cc:Subject:Date:From;
	b=k9j+zOlWiZ1ZXycr04+RHGT0O3uF23RNc0gqF6wZJo4qXtPoq8/Sv4akQw3SCwu4r
	 ORV9b+LKg5pejwcT+H/nFYcX4D1qaoRewMFE/Qm6O9x7OGHi+ruYbzXoKjbustHWaS
	 kAsMcnfvjr1bfM8coJNj7wlMPXbqiBYiAH7gIcQEdBKUI8/v0oxmCUqtXn2x2SWGnR
	 04/FE9lZsVjyZtnXklsQyBqK/wIkFZp1rL7plGT7a4U0jtdHhJvyfDynVHkJL+k+Re
	 Cuw1/kIqXxxjYzoqaN8dPcNUQT5fHKNGoXZhTHw5oiCiS3xfrFoegl46kkFYBOvn/F
	 ShMt/+N47raFg==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id AFABF13208A;
	Wed, 15 Jan 2025 17:25:32 -0800 (PST)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
	Vicki Pfau <vi@endrift.com>
Subject: [PATCH] xpad: Add QH Electronics VID/PID
Date: Wed, 15 Jan 2025 17:25:18 -0800
Message-ID: <20250116012518.3476735-1-vi@endrift.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>

Add support for QH Electronics Xbox 360-compatible controller

Signed-off-by: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ff9bc87f2f70..56ae0847cbfd 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -305,6 +305,7 @@ static const struct xpad_device {
 	{ 0x1689, 0xfe00, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x17ef, 0x6182, "Lenovo Legion Controller for Windows", 0, XTYPE_XBOX360 },
 	{ 0x1949, 0x041a, "Amazon Game Controller", 0, XTYPE_XBOX360 },
+	{ 0x1a86, 0xe310, "QH Electronics Controller", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0002, "Harmonix Rock Band Guitar", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0003, "Harmonix Rock Band Drumkit", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0130, "Ion Drum Rocker", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
@@ -514,6 +515,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
 	XPAD_XBOX360_VENDOR(0x17ef),		/* Lenovo */
 	XPAD_XBOX360_VENDOR(0x1949),		/* Amazon controllers */
+	XPAD_XBOX360_VENDOR(0x1a86),		/* QH Electronics */
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harmonix Rock Band guitar and drums */
 	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA controllers */
 	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA controllers */
-- 
2.47.1


