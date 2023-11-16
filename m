Return-Path: <linux-input+bounces-82-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4537EE61E
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 18:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9E23B20AE9
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 17:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06A148CE5;
	Thu, 16 Nov 2023 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EMfToD67"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66601AD
	for <linux-input@vger.kernel.org>; Thu, 16 Nov 2023 09:45:44 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32f9268bf8cso822185f8f.0
        for <linux-input@vger.kernel.org>; Thu, 16 Nov 2023 09:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700156743; x=1700761543; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=31lYSY2gScfJmzy6bBEtYXDpksRo7piXakrkacNysY0=;
        b=EMfToD67FrdEb0AvzYukUrvxkA+b8TaYGG6CCqXEGsf3ocONPCh6Ki0NfH5ucIeXhz
         ExEpDMcdg2ysufqVtOyCbaB1b5jOdizmLsLU4oOSQjgZG6yW4n4JmTF6idIQr3zkjZBX
         bJIz01HQmYoMB6mYFvLkBPejwwvpEDr7wnKaJku9UZbn3t53XSKl+kVCyWu40IVMMHoz
         wA16K+AAPxpzxOXXv0thWjMAh55PN4GQzbR7NUh/SdaNIMo2URhe9yjAAAZT6GkxF7cq
         yUQ3OKNm3ZtH5q1qNMcfK8uBxoM1VkvvDqf254vK1KKDveUPaCqfHl/zfw4M5a0N+XkL
         NFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700156743; x=1700761543;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31lYSY2gScfJmzy6bBEtYXDpksRo7piXakrkacNysY0=;
        b=L1CjGpBXE2mpFKhXOO+3P8ohGPDn/IXu7YaLKC7wbbo4ZCEvrpjyKvaa1N4sZS2N54
         USiUzlP0/Ux8lWJA0CKvdcGrSNYYAdkWO7Q2X2KzX4YyH/vX02ke9/xAo1q1cYmipgj1
         ZdAog5XwAaNZt8tfQ2sUsMJtgiYiwbR+ovMZB9VKeXd+9npurvjFay/vEYF7d6L9meDU
         ecRlnf3U75af3I930Rp2RaZPj4BT5hmByJNRDfiJOTata3NpWxMGJNhz7PPE5c3fOU3B
         kd8jj4dntI0R+9ufk9bBOA86veZRv3KfjzUlPIoTgXJRogF1qFoJjETed8NnLJxEvztf
         HHSQ==
X-Gm-Message-State: AOJu0YznM8eBQdbNISUhRo0dGZlCmyUJ/nsXnlQg7khx6VaHHn83enSa
	5w/HpPTfJmM0mnKGF9GO1uLKio7s+7GVQZrLK8jqEQ==
X-Google-Smtp-Source: AGHT+IGNVHhghBUl5iM/P/Z0aAWMjuKqtbfYIzxA2kdl7Qr/+Mlq2Ay1qmoyp8LzTWuwVbY2DWkIIJnthzW3Vy82DD4=
X-Received: by 2002:a05:6000:178f:b0:32d:84c7:2f56 with SMTP id
 e15-20020a056000178f00b0032d84c72f56mr13158051wrg.21.1700156742901; Thu, 16
 Nov 2023 09:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Brenton Simpson <appsforartists@google.com>
Date: Thu, 16 Nov 2023 09:45:31 -0800
Message-ID: <CAAL3-=88exVfuL1Y-kvPNbsU+d-UTfDLFViWVObFLtbC4xueeA@mail.gmail.com>
Subject: [PATCH] Input: xpad - add Lenovo Legion Go controllers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Erica Taylor <rickytaylor26@gmail.com>, Vicki Pfau <vi@endrift.com>, nate@yocom.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ismael Ferreras Morezuelas <swyterzone@gmail.com>, Cameron Gutman <aicommander@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

When the controllers are both attached (or detached), they appear as
0x17ef, 0x6182.  When only one is attached, they appear as
0x17ef, 0x6184.

84 (mixed attachment) is already recognized as a gamepad by Linux.  This
patch adds 82 (both attached/detached).

These controllers have many more buttons than is typical.  With this
patch, here's what's functional when it presents as 82:

Recognized:

- X, Y, A, B
- both analog sticks, including L3/R3
- D-pad
- menu and capture buttons
- rumble

Not yet recognized:

- start, select
- 4 rear paddle buttons (Y1, Y2, Y3, M3)
- gyroscope

(There are also non-functional buttons when reporting as 84 that are
out-of-scope for this patch.)

Signed-off-by: Brenton Simpson <appsforartists@google.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index f5c21565bb3cec..ecfcea8740a009 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -127,6 +127,7 @@ static const struct xpad_device {
  u8 mapping;
  u8 xtype;
 } xpad_device[] = {
+ { 0x17ef, 0x6182, "Lenovo Legion Go Controller (unified)", 0, XTYPE_XBOX360 },
  { 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
  { 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
  { 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
@@ -459,6 +460,7 @@ static const signed short xpad_btn_paddles[] = {

 static const struct usb_device_id xpad_table[] = {
  { USB_INTERFACE_INFO('X', 'B', 0) }, /* Xbox USB-IF not-approved class */
+ XPAD_XBOX360_VENDOR(0x17ef), /* Lenovo */
  XPAD_XBOX360_VENDOR(0x0079), /* GPD Win 2 controller */
  XPAD_XBOX360_VENDOR(0x03eb), /* Wooting Keyboards (Legacy) */
  XPAD_XBOXONE_VENDOR(0x03f0), /* HP HyperX Xbox One controllers */

