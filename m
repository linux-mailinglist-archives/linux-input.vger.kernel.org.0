Return-Path: <linux-input+bounces-7267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F78999460
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D49728482E
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9A81E260B;
	Thu, 10 Oct 2024 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzqHEcie"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A61CDFD4;
	Thu, 10 Oct 2024 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595561; cv=none; b=jIc/aNE5ruo6duu0lR/kcLsLUGd7dp2b5nFuIaTdjfq3M2F9GU4dhvc+x1UzbZJZVn4FfzbK29VO3T8Yd1/nMTomL65PQiFm6JLrk0FsNHs56wFfIlI4TD32/w7caWIDyRyfGe7mMtSOUHaRUIiZhIb/UCqvIZ9pmVVGSnm+Gxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595561; c=relaxed/simple;
	bh=H3QCDpR4l7Ykj3GCahYdrBiVlspqgJ1J9/SZlkURrtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zdb8cMjMwk2Vr7ZQ1my/Mo60qP3ikuSzl7EZuVdWIcsp3QnI7Avgh2inPeAkp/oSNMbT+hG/QYtKvNWABtb+LORRU9qgqXc1L8sGu0cMVujIedyP2NEnDIa2l3ataBYXaRxQUXIE0BIzLnXosftY2uGx4UiG4FQN9VC9Vmdckp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzqHEcie; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4311420b63fso10118055e9.2;
        Thu, 10 Oct 2024 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595558; x=1729200358; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJW7O5XKUbOuuqLLX5pzcTQ1E4Av2AR4QeFhDmOQC8k=;
        b=RzqHEcievD+eBz5fdSKmSAJ9M4YsdM7AqT+1j+VVNhY8dqayqHRLL1ztdIrq0N7lCH
         2uS0iSJ587HZbi+dP2TQ49EsiTwHK+HkE9+zzMBEtkX3tnK0PW6K6zc+m7kQMuhiRHq5
         Jdr+EoY/UPDOzqvlTw2CxYK8IpihAlyGqzmBS60j853ysr9CwFcZAwoY4okw/KkTDkor
         qVUUryWuOXqre23ypcTcPiqs22EggS5AcYoWxKeeGItqGLLmUOWW42BGuhkp0r3P/v5s
         EWgAvE6avHNqCzIs5gsKyUwB8YtAsU8ZcXznR+mUy2UFdudn8NrD6vH6h2brg/xmrFED
         y0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595558; x=1729200358;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJW7O5XKUbOuuqLLX5pzcTQ1E4Av2AR4QeFhDmOQC8k=;
        b=Humoy/sB132aFsDGK49xRFJcQGabIVD5fHSWWb7dBYOeBO5HZDKVpv1r9QSUdiVckR
         R1D2Nm7v2AKNNQMdSFZeTEVvgNJqmwTN2UCP23CLqup2zc/mycSppffbs3p5L1ozf6Ic
         cibFV4R5Hk7wWJMq9wD615eQom/vldCgbLN1YqlqpKTJAddxrXpOB0wySC1sNvuK00QV
         3KNfrq/ubqRrUFAExkP3+C4tddGMNdw3bCmH72zCJz42UWa5ja63vaPgfrsi5FN1BvNd
         wCdvWvV7PIhSV/ZjYHtwYONxp8AsEFlruEY7NUIAO8jK2wJz8O9KOtX1OVYKkKmjPPdc
         gSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvAvKkgaeW1StW3GiDbmvC3+dFuChUzCLS2loYmf6vFMLwogmzD0L2j1l0FdDR0fmTJotz2sPNb3Uu9fA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxaQ8FqFVRbDVAz+0SHdNmlRUfpEXqaNhCn3hvZk5LOaOrMZPE
	0YFQ6GF4SlvZZpXYaTU9KoxReu5x3CQuVbnmCA5jfImrzsPn0jM5
X-Google-Smtp-Source: AGHT+IGjhjvs23XBaF9qo7yUB6Onp+okLGqfHWsTl1zeKUZJoKhghxIMshywkcca8h+/0cILKz7jtQ==
X-Received: by 2002:a5d:5641:0:b0:37d:4a2d:6948 with SMTP id ffacd0b85a97d-37d552375b6mr274533f8f.33.1728595557711;
        Thu, 10 Oct 2024 14:25:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:25:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 00/10] input: automate of_node_put() calls for device_node
Date: Thu, 10 Oct 2024 23:25:50 +0200
Message-Id: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5GCGcC/x3MQQqAIBBA0avErBNUamFXiRDTsWaRhloE0t2Tl
 u8vfoWMiTDD1FVIeFOmGBpE34HdTdiQkWsGyeUgOFeMwnkVba4SD1NQR69DdKhbZGI1qPxouXQ
 K2uBM6On55/Pyvh//OD7kbAAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=3941;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=H3QCDpR4l7Ykj3GCahYdrBiVlspqgJ1J9/SZlkURrtU=;
 b=ts+Lle7wL/NftURW4LFEavUzl5GrcOSKdRmgSDAOu1aMNej5jIzm2CTRgJNXE6hx7mfQRYjjT
 +ApNZbKfUf5BWFg+9nvAGVEh/pTZoGKhLCO94Qdp2GRbQN2Bm16D02B
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series removes the explicit calls to 'of_node_put()' from the input
subsystem, either by switching from 'for_each_child_of_node()' to its
scoped variant 'for_each_child_of_node_scoped()', or by adding the
cleanup attribute to the device_node by means of the '__free()' macro.

This series simplifies the code in some cases, and it makes it in
general more robust, as it will avoid memory leaks if early returns are
added without the required call to 'of_node_put()', which is a rather
common issue.

The following drivers unconditionally release the device node after
using it:

  - misc/twl4030-vibra.c ('of_node_put()' under an if, but only if the
    node received a valid value).
  - misc/sparcspkr.c
  - serio/i8042-sparcio.h
  - touchscreen/raspberrypi-ts.c
  - touchscreen/ts4800-ts.c

The usage of the cleanup faciliy for these drivers offers no real gain
at the moment, but as soon as an error path is added to them, things can
go wrong, as it has happened multiple times with such nodes. I intended
to remove this error-prone pattern from the subsystem, so it is not
"borrowed" by new users. But if someone has strong feelings about the
automatic cleanup for those drives, I will not complain if they are left
as they are (at least until a new buggy error path is introduced ;)).

The approach for the variable declaration is the one that has been
followed in previous clean ups: as near as possible to its usage,
instead of at the top. I have no strong feelings about that either, but
I would prefer it that way for consistency and to have a common pattern
for future additions.

A single call to 'of_node_put()' has been left behind in rmi4/rmi_bus.c,
as it is used to release a node passed as a parameter, which would make
the use of the cleanup attribute too cumbersome for no real gain. It is
called unconditionally, and it will probably not be used as a common
pattern for new users of a device_node.

There has been some previous work from Dmitry to use the cleanup
facilities for 'fwnode_handle' and mutexes[1][2], which this series
aims to complement for 'device_node'.

Link: https://lore.kernel.org/linux-input/20240904044244.1042174-1-dmitry.torokhov@gmail.com/ [1]
Link: https://lore.kernel.org/linux-input/20240825051627.2848495-1-dmitry.torokhov@gmail.com/ [2]

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (10):
      Input: cap11xx - switch to for_each_child_of_node_scoped
      Input: mtk-pmic-keys - switch to for_each_child_of_node_scoped
      Input: sun4i-lradc-keys - switch to for_each_child_of_node_scoped
      Input: twl6040-vibra - use cleanup facility for device_node
      Input: twl4030-vibra - use cleanup facility for device_node
      Input: sparcspkr - use cleanup facility for device_node
      Input: 88pm860x - use cleanup facility for device_node
      Input: i8042 - use cleanup facility for device_node
      Input: raspberrypi-ts - use cleanup facility for device_node
      Input: ts4800-ts - use cleanup facility for device_node

 drivers/input/keyboard/cap11xx.c           | 12 ++++--------
 drivers/input/keyboard/mtk-pmic-keys.c     | 17 +++++------------
 drivers/input/keyboard/sun4i-lradc-keys.c  |  7 ++-----
 drivers/input/misc/sparcspkr.c             |  4 +---
 drivers/input/misc/twl4030-vibra.c         | 11 +++--------
 drivers/input/misc/twl6040-vibra.c         |  8 ++------
 drivers/input/serio/i8042-sparcio.h        |  6 +-----
 drivers/input/touchscreen/88pm860x-ts.c    | 20 +++++++-------------
 drivers/input/touchscreen/raspberrypi-ts.c |  4 +---
 drivers/input/touchscreen/ts4800-ts.c      |  5 ++---
 10 files changed, 28 insertions(+), 66 deletions(-)
---
base-commit: 515ef92b4939fa51f9f1ee278618e2d419b0b8b0
change-id: 20241009-input_automate_of_node_put-1bae9f5c02d9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


