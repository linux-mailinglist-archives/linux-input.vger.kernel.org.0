Return-Path: <linux-input+bounces-7554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F21E9A4B16
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 05:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2447D282A9C
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 03:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627ED1BDAB1;
	Sat, 19 Oct 2024 03:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKfieT+8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F9F137E;
	Sat, 19 Oct 2024 03:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729307927; cv=none; b=bJ3u3I/05nxymYPMYWgZ1yUQCQgBnz3rwegFMXhj3dYULMo1wyVYWj8PPvrgOVL3nqh/MZCObgxqAnj9TbTQLfTJbUXxfoClsw7hEi7IghZOClbIwuBsAWGThk/y9zc7vuOOMZTPfyPrBrS/X4Ue0KR5Cu/EQ9D5VxtLV7+e1LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729307927; c=relaxed/simple;
	bh=sKrHKvVIoz7RFAmCWU4/Hk8Em85HC6/qoRsdRLO0gPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NAExxxBzEokJoWP8kcD55VNyM8KN9KDnBj/unYUHqELdW40/8eOoiAVH4u1HTl6jtsp9qvPAx9VsH68vFSVHchvohRCsSY/78j9oBCxmuqKdR9ynxqcGU0xRmIzwHrhCVW/ISxu2aclHt3W3X8YZmjEcs0+rAuSOOk/IDC3Y5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKfieT+8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20caea61132so22251995ad.2;
        Fri, 18 Oct 2024 20:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729307925; x=1729912725; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WYDkCt2AW2qQ5Kwjfu9Gsv74LzmvFCu0QmXrrrOlp6I=;
        b=eKfieT+8C1q38XCxnJswk2/oeOnsRXr/KeK58MUQfBUmC56da43rMJZfEda+PoqsU+
         6uezZ86GlLuRNYe8ezeOjDO5XZQldi/AQnSyigi3Zmd68JsbYbh+Un7fnYIdm6gUS+77
         LV+naAWer8N12rVmPr5zev7C+hXzkPQjqS6n9gwWQ34xpjNebsAdpxhlHVOy1LLEYS7I
         sPQoTFu4dlgQpVFB7WYprCTPaoIuyeUXNp0XOdySAxvt2AbGxlNuIEEmYPX6kLzBfdyT
         D7sF3vOLP1I56RTbx4tPGWA9dn6kQFbJ4FZleZeSUsJD+CjgbKYn4q4dKnK/j2JXerkQ
         xJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729307925; x=1729912725;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WYDkCt2AW2qQ5Kwjfu9Gsv74LzmvFCu0QmXrrrOlp6I=;
        b=jVehnUETQOPZZ9YMgWrgkD5OvWm8sPElwyV5CCiAE+Bfdi76SQ97ShU3UeM1UgyQ2S
         kjiQBS3xmdE0FDEmPVNgCXSmQ9PpMjf4Y9V9grnEAhs6Pfu7h6JYgOh0QOCsCBx1hQ/3
         13F7QW0r703w0MLEfyvGA9pM7gECuX2V+EE+0K52VmoNmMoxCMYCfGBGLSGWVADLU4Wn
         iik1iL5gk86358vBMh0Mu9uON+vxtqA0d5mfabjbib/Ompn74gILYT7hUIWKYCysjoeo
         sUlC+k7pFbCehV3IZS9q2o3xTNlUKdqp9GJ0P9tkbnEQgrqsg4W2CjCVFgeoCbZyCQd0
         HpTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb4Et/LabJWokIUtTwR1jllyfd7CDuni/WBlnlnWvUCBQFlSy6V3vTSRdoNzgbkY0Y0GdtP/8ipKri7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW8OaAKtwk/9rCIRibdYXoKdkyeOD9XmutMhj5SEQbtfEwT/qp
	DspNaAOoONI7+5iNkd/r5zHZD+m9S8N6/DIOhx1dbV857Chno6OcmeybSQ==
X-Google-Smtp-Source: AGHT+IFEnngUIUJCwbmRwVtFwo8FGlrLvNIhwF1/17QORGy7bmQmBBMi8U6wkV5Dbh2cKAQVh7Vbdg==
X-Received: by 2002:a17:902:f545:b0:20c:f87f:b7d0 with SMTP id d9443c01a7336-20e5a73e71cmr47906995ad.14.1729307924332;
        Fri, 18 Oct 2024 20:18:44 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:351c:e27f:10e5:484c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8f2034sm19677915ad.193.2024.10.18.20.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 20:18:44 -0700 (PDT)
Date: Fri, 18 Oct 2024 20:18:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.12-rc3
Message-ID: <ZxMlEQ8nV_0l6MqH@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc3

to receive updates for the input subsystem. You will get:

- a fix for Zinitix driver to not fail probing if property enabling
  touch keys functionality is not defined. Support for touch keys was
  added in 6.12 merge window so this issue does not affect users of
  released kernels

- a couple new vendor/device IDs in xpad driver to enable support
  for more hardware.

Changelog:
---------

John Edwards (1):
      Input: xpad - add support for MSI Claw A1M

Nikita Travkin (1):
      Input: zinitix - don't fail if linux,keycodes prop is absent

Stefan Kerkmann (1):
      Input: xpad - add support for 8BitDo Ultimate 2C Wireless Controller

Diffstat:
--------

 drivers/input/joystick/xpad.c       |  3 +++
 drivers/input/touchscreen/zinitix.c | 34 ++++++++++++++++++++++------------
 2 files changed, 25 insertions(+), 12 deletions(-)

Thanks.


-- 
Dmitry

