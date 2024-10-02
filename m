Return-Path: <linux-input+bounces-6996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DA98CF66
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 11:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 082611F22E22
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 09:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB821974F4;
	Wed,  2 Oct 2024 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkusTJ2c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D67195FEF;
	Wed,  2 Oct 2024 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859696; cv=none; b=aHHwqpGYMYc7vEDFvSFBH6Q+yjSIpU4fmZjRPOm5Z0jiVbDyES2yvqe3kcFBLZrMmj0kpuzL/KpbC4heMgam45yW1yT1hhj8w4qbW8n8jiCDBKWbIDw4TLviWw4CpkXOBIVlKpjXMyvejjeu7Gpa4fYxbfBXiqVqDxxcFHjmjvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859696; c=relaxed/simple;
	bh=X18HVSgvMnmjdQuPetWwp/DWJtcJMZb+wnJxJSl4sws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CHBmrms04lTpqWrBA5FHTc3t2B6OfNUyAuOPETiCLnrOAxBbjPo8LaXk5XF3NotkwbzxQ4aHLR5vr30sBDNRZ0zrKwgxrqGQ/Cd8vrKccaFV+PdwdpbBrcfEeV5ksKMImPMlVQXX9tHBNZk2xf/P4YSNl45G3qC4rqRcPNDgVdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkusTJ2c; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20aff65aa37so51288045ad.1;
        Wed, 02 Oct 2024 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727859694; x=1728464494; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJnaeRTtnCOnXwkwaIDxDLw+kNh3wmshf5pg+t20Z84=;
        b=BkusTJ2cTL9f21UQiC4oSq0MMF3GggVKLDjFe+dtxWsB2YC37WhCTY5OjpsKSp8T52
         Xj2xIqCK6jqE3F5Taa7VqAF0FiXWqotty7S/jjB43ikcSX1+usJQ4MU15u1pJjm6fpaP
         COzJHylKWQ9KRdSIho+puv4LrdoLlA2VWugdn71yQYCrbUZF6yxu+mCTWRvbjgvyq1b2
         KYPHYXLz29h0ebQeTkZZtNyxZuKwXkig3bjD/GJ/27M3+fUfDJSucJsd/6Ymz1qIT5gm
         khZV6tpy4aqHlxFqSANEa5xhJPVPBp5qmyS/aFkGWWQX9S1k4ZGtbVjf1qda8Zlzz9nG
         gCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727859694; x=1728464494;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJnaeRTtnCOnXwkwaIDxDLw+kNh3wmshf5pg+t20Z84=;
        b=h8tRFCmXK9HSvmMBI/yxMYKJ4NlmpUuHHnqT1CHO5P6G2kIpHQfELZ6wiNREGBt+Q8
         ENgbjkqtI67XF15iUhF5B7KlR4lEV5GdOdb9QPf7HrImjBarAVsgh+U5QMCKtSxr4G+8
         vwXzIyTC1tR2SfxxNmk8ukV0Lq2SoUc2daL9Op/an5LNNb7fNVR/wJB+GQda+ofClis3
         NIXSVzBp3pw1sZH+U+nkej4VGf3ZQY7aBNGqYBXAJJ9uim1kn+AcUCdpBBQIjTy/Ni7f
         D7+DVz8+1RTfFttIER3pG05RELwZ7iUyY1mrgxIUSHjy+svX7Wzar5Os8qZthEOPOGdB
         h4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1g44PyEZU7EjeD6HKNaaFDPXjDeg/+OXE/68ZAnC6vkZQrs81fCEevrDuti7+El44WFgmWsL5Qq61Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Nbqawc8K+3q0rNeN+Ftw6/nXoXnB0aWcAwFjuCGuC5BxwZX4
	U0AMrvAFnizGN2JBgoP38vyBg931yCqU495is8xUmgcL1OVSV8jY
X-Google-Smtp-Source: AGHT+IE5MZg+r4Glo96eqPG5MnC4HqvwFZi39KIGVQJBuf25GHvR6zqSmylxDwpkDfRCiXLEssMomQ==
X-Received: by 2002:a17:902:e80f:b0:20b:a10c:9be3 with SMTP id d9443c01a7336-20bc5a1f226mr30131395ad.21.1727859694312;
        Wed, 02 Oct 2024 02:01:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:59b3:a140:3cbe:62fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e36fe7sm80247385ad.211.2024.10.02.02.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 02:01:33 -0700 (PDT)
Date: Wed, 2 Oct 2024 02:01:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.12-rc1
Message-ID: <Zv0L62ULdkkweejQ@google.com>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc1

to receive updates for the input subsystem. You will get:

- a couple fixups for adp5589-keys driver

- recently added driver for PixArt PS/2 touchpads is dropped temporarily
  because its detection routine is too greedy and mis-identifies devices
  from other vendors as PixArt devices.

Changelog:
---------

Dmitry Torokhov (1):
      Revert "Input: Add driver for PixArt PS/2 touchpad"

Nuno Sa (2):
      Input: adp5589-keys - fix NULL pointer dereference
      Input: adp5589-keys - fix adp5589_gpio_get_value()

Diffstat:
--------

 drivers/input/keyboard/adp5589-keys.c |  22 ++-
 drivers/input/mouse/Kconfig           |  12 --
 drivers/input/mouse/Makefile          |   1 -
 drivers/input/mouse/pixart_ps2.c      | 300 ----------------------------------
 drivers/input/mouse/pixart_ps2.h      |  36 ----
 drivers/input/mouse/psmouse-base.c    |  17 --
 drivers/input/mouse/psmouse.h         |   3 +-
 7 files changed, 14 insertions(+), 377 deletions(-)
 delete mode 100644 drivers/input/mouse/pixart_ps2.c
 delete mode 100644 drivers/input/mouse/pixart_ps2.h

Thanks.


-- 
Dmitry

