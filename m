Return-Path: <linux-input+bounces-1315-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 198CD831F26
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 19:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE7C8B25724
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 18:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BA02DF73;
	Thu, 18 Jan 2024 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zAEaP9Sr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93382D7B2
	for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705602962; cv=none; b=QxnwkWU4jeXeh8rdHM5pWNN4KuYwUPu5mOzH/d1Xwsl4kEJbbqSqdaTUYaFwIuEDWlTtjUOxkiwzHover1oXNHUG0hcwGKfrWbwE2ev9096Z9E0JvX7+cY1LktsSpK9N7bty2JwnvTQOucn2OP1vi/FEabTTGuQSQzLMLhodMsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705602962; c=relaxed/simple;
	bh=20UxIykfYukj0g9j/eDNEQ/NSTxqxpi9uNhdtfcPpQk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kEmchLZM8MqDjdW5kvYlye7Yb/GJx7X6JPxQMultyCoZLgqwnhz/TTKuOlsXMaTQAF0PXrSaMnDxOm5p2OQqVLjxGD93a56nobIvSqUNgCBgAV8R4t+64ka5IsVxVF8uhJO2SEaYxwfspZVq6aVtfr4Z64YRTWNV2YsTlkytyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=appsforartists-gmr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zAEaP9Sr; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=appsforartists-gmr.bounces.google.com
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1d486bce39bso62672885ad.1
        for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 10:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705602959; x=1706207759; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aVvypQ50Ee91qtKLnKzhKC/cnaDZgrechO8IJ87aiGM=;
        b=zAEaP9SrChv6sutIgvGznI9El+qygcbOHTT89aidpsBnwBU4wqPhqj5VHI7/CnDHmo
         O0UAz3bUa+F/wzGvAtOVVSSpUPdGdD2OQAGjynVr6KRYwZgqnpebEtW+Ub0z9A/2QAeO
         7hUa7if3vb8mn2BFr2Ah+wdK+VPQ0O0BgdG/ZxnWhJ9jGwpXatnCx/+9494DIRTDiosT
         rL1HgMMZJaX9Ru/SKPxHVZdubC8acHpispIy/wNH++Qgiryzqx0RgmuM3kYgYl8A9O6/
         kn7XG+MyXMvEGdfQfCptlu00TkXeuSjiccaQ0UHxPmIoCopLDuiiNXYdKWNkAzuMVt2o
         ckOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705602959; x=1706207759;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVvypQ50Ee91qtKLnKzhKC/cnaDZgrechO8IJ87aiGM=;
        b=K+hM7aiVzrd1/pHEGzgPqVTvXbemdxFElmMxt59rzFLj1nonvNUcwfpEy23iEvo+Eo
         sAwPaNlpnqT36SBG6TH+RHiXLA24hpm/B68W4fF1yuJdxSimmjIjDGsMFLi7fID40hxj
         oTNFErUntG4nPC87Pm85z/ik0WUERlcmTFPXof7noCSe80bSBg8Rj7y4TC7jdfah7rHr
         xBDq3RGHHR6nLqzHXlHjG3MOMI5j5evgVY7Tc8NCh0B4UaN9i63nwGqZB6m/JhFiiEx3
         9J8t/u0e3YjPpwgt2dX2P4vlkJi3qCg+r3GDr4L+Y4hn1vRFrcgaJe/PPBf+RTM+Kb37
         k98A==
X-Gm-Message-State: AOJu0YzqvqMRHzO3Y/6JNs2k+R0TgPOpnl/1+lmMF2QcTGRJWUY79MfN
	GoA9xNfjlLFklIABIhDvlYtwXRS8716l1z2Iu8vxLqdIYVC5zDwdcgF/LeKX8XPZikJ2spOvQmb
	Ztm0PwFVrYED8wXQXDFfGSUourA==
X-Google-Smtp-Source: AGHT+IGnj7EF+GJQvg/2/Iue2rmvRAkno2OsXEXAETb8bgELqDgsXtZL23jbNlord2i3UIOaISr4SJQxpcg2A2d2VJI=
X-Received: by 2002:a17:902:f683:b0:1d4:c27a:db7d with SMTP id
 l3-20020a170902f68300b001d4c27adb7dmr15102plg.0.1705602959193; Thu, 18 Jan
 2024 10:35:59 -0800 (PST)
Date: Thu, 18 Jan 2024 18:35:46 +0000
In-Reply-To: <CAAL3-=88exVfuL1Y-kvPNbsU+d-UTfDLFViWVObFLtbC4xueeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAAL3-=88exVfuL1Y-kvPNbsU+d-UTfDLFViWVObFLtbC4xueeA@mail.gmail.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240118183546.418064-1-appsforartists@google.com>
Subject: [PATCH] Input: xpad - add Lenovo Legion Go controllers
From: Brenton Simpson <appsforartists@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Cameron Gutman <aicommander@gmail.com>, Erica Taylor <rickytaylor26@gmail.com>, 
	Ismael Ferreras Morezuelas <swyterzone@gmail.com>, Jonathan Frederick <doublej472@gmail.com>, 
	Matthias Benkmann <matthias.benkmann@gmail.com>, Matthias Berndt <matthias_berndt@gmx.de>, nate@yocom.org, 
	Sam Lantinga <slouken@libsdl.org>, Vicki Pfau <vi@endrift.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, trivial@kernel.org, 
	Brenton Simpson <appsforartists@google.com>
Content-Type: text/plain; charset="UTF-8"

The Lenovo Legion Go is a handheld gaming system, similar to a Steam Deck.
It has a gamepad (including rear paddles), 3 gyroscopes, a trackpad,
volume buttons, a power button, and 2 LED ring lights.

The Legion Go firmware presents these controls as a USB hub with various
devices attached.  In its default state, the gamepad is presented as an
Xbox controller connected to this hub.  (By holding a combination of
buttons, it can be changed to use the older DirectInput API.)

This patch teaches the existing Xbox controller module `xpad` to bind to
the controller in the Legion Go, which enables support for the:

- directional pad,
- analog sticks (including clicks),
- X, Y, A, B,
- start and select (or menu and capture),
- shoulder buttons, and
- rumble.

The trackpad, touchscreen, volume controls, and power button are already
supported via existing kernel modules.  Two of the face buttons, the
gyroscopes, rear paddles, and LEDs are not.

After this patch lands, the Legion Go will be mostly functional in Linux,
out-of-the-box.  The various components of the USB hub can be synthesized
into a single logical controller (including the additional buttons) in
userspace with [Handheld Daemon](https://github.com/hhd-dev/hhd), which
makes the Go fully functional.

Signed-off-by: Brenton Simpson <appsforartists@google.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index f5c21565bb3c..ecfcea8740a0 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -127,6 +127,7 @@ static const struct xpad_device {
 	u8 mapping;
 	u8 xtype;
 } xpad_device[] = {
+	{ 0x17ef, 0x6182, "Lenovo Legion Controller for Windows", 0, XTYPE_XBOX360 },
 	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
 	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
 	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
@@ -459,6 +460,7 @@ static const signed short xpad_btn_paddles[] = {
 
 static const struct usb_device_id xpad_table[] = {
 	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
+	XPAD_XBOX360_VENDOR(0x17ef),		/* Lenovo */
 	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
 	XPAD_XBOX360_VENDOR(0x03eb),		/* Wooting Keyboards (Legacy) */
 	XPAD_XBOXONE_VENDOR(0x03f0),		/* HP HyperX Xbox One controllers */
-- 
2.43.0.275.g3460e3d667-goog


