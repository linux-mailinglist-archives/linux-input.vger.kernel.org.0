Return-Path: <linux-input+bounces-7841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 099B29BA437
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 06:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55C97281CAA
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 05:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B6270833;
	Sun,  3 Nov 2024 05:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NT3JSrWr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D682572;
	Sun,  3 Nov 2024 05:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730613505; cv=none; b=K/kpNsrrm3ZzsUSxxFaVp3yMv/sG4fOBzw8I1/TuMGj1AB4+XcqLIQqzwiowHGyLxByGSY77Rnkr3cEOoRxzvS7iiz9KPxf6DTTURq5JJktyFJ4QdsPCm8svNTHTv0CDc5FkfGXaEaWRE7V8riD5b5MTKX8iMivPg30ymYrvP68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730613505; c=relaxed/simple;
	bh=C9GjAaOP6UztdlVEcTxHc6zkxCN2sPtijfriqpONP0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2gg0Bc/FisNP6+9HIR6qu6+BRl2vevJNqtMRc8Xvje26GFn3HS3R8beSXYDNJeMCMg2ISSdyR7679WPh29thuXizW33Shd99/v5p3ox0Y0zHLh94hLqU3ApFLGhr4v+Lrj6d+iFPDPC1eU//1RTYdMeJ5Q5RAWL65gadgOP7IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NT3JSrWr; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so2418644a12.1;
        Sat, 02 Nov 2024 22:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730613504; x=1731218304; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZiZQiNeawMYZeiuugM3AEghyf/eHluaA2VKO8c6yb8=;
        b=NT3JSrWrlRB1op3eV3bHZLn2a9Qz6Xx5KfzYF3sbGfTTBo82IPzVv3jyIVkfCkm4Vh
         VYnbANtR6D0rizJlVBicnIA+g2hH8uRMDZEf6uDhF2ivRovf2DC1oH/FR/NMdfLX0E/u
         j1Uk8rh/d3samgz8UjIWpCkIQwE8L1CoLvQCGo2CqWFzqybA74FTSnEGvs8c27hjYBNe
         QmmfbMIqBye+MZnuyjrByw1YjU7z5yKRlt1XX+3xe3Dex/fYeGvC9TjXtV9W2B09zZ6U
         OWCgJwY05nJd/dF15kZTjl9pFtsr16Mf5Q/Xrflhuwa5aJCGLMRZHH6JOUJlBIvwZq9W
         AFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730613504; x=1731218304;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZiZQiNeawMYZeiuugM3AEghyf/eHluaA2VKO8c6yb8=;
        b=wcf/ZGe3348s/eHt6tCSBH8n+FJJpJtpcM9J0zSx2kpoyrQep8UWkxlUJwwoc3Zrty
         zVe7GqpD+d5iSEDkestWBZ/K+y517OILci3OtMLaLjB6x1xxCLXrxyssj4/GUKJbkQ1D
         r9EXCD/e/kJnaPzamdlCaWsuVKRtwu50yENmCCrio5HjgWPxG5VUnhlTjjZytWuYk4li
         yrbyodOr1zoB+aMCB86QaMQpBT4y62DPOE24FoExRTSQK0W1XuaGKwSY1o9OlGOhx5dH
         tQ8dk02syJGOe6ZD7NVpLT1bpMqb2gJ2c9ZqLUzXSG1G7NsZ3fJiswFLKazOZjnTS8JB
         LFsw==
X-Forwarded-Encrypted: i=1; AJvYcCX5cgfE9Xi4sTHdm+56cpE3LkYsVzgqe4rdgPciKwZ29XiGDiIXowYxeZkMacAdG6yQBi6k4GSN8OM/pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztzItNKpTsVg7cLluzJAQ3PNZkPP3N6jM6wtujMBZtTNeJ7M68
	0gl3OqFFEoViLN9gCMteFBTWbnBhKZYm8kBj7IHArDB/1XPTKCBXFoHU3g==
X-Google-Smtp-Source: AGHT+IGnzTUK7gqg6Bz6abJCuqsoQwrR+2Y3TbxUmuRP3GSO0Rzw1YALvO+xY+gOv3Oy3R0xE3m6UA==
X-Received: by 2002:a17:90b:4ec3:b0:2e2:de72:2b76 with SMTP id 98e67ed59e1d1-2e93c14fdb4mr16581943a91.16.1730613503727;
        Sat, 02 Nov 2024 22:58:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a7f1:ec91:2b04:b29a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da983f9sm5244025a91.5.2024.11.02.22.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 22:58:23 -0700 (PDT)
Date: Sat, 2 Nov 2024 22:58:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.12-rc5
Message-ID: <ZycQ_DEua83lHubu@google.com>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc5

to receive updates for the input subsystem. You will get:

- a fix for regression in input core introduced in 6.11 preventing
  re-registering input handlers

- a fix for adp5588-keys driver tyring to disable interrupt 0 at suspend
  when devices is used without interrupt

- a fix for edt-ft5x06 to stop leaking regmap structure when probing
  fails and to make sure it is not released too early on removal.

Changelog:
---------

Dmitry Torokhov (3):
      Input: edt-ft5x06 - fix regmap leak when probe fails
      Input: adp5588-keys - do not try to disable interrupt 0
      Input: fix regression when re-registering input handlers

Diffstat:
--------

 drivers/input/input.c                  | 134 ++++++++++++++++++---------------
 drivers/input/keyboard/adp5588-keys.c  |   6 +-
 drivers/input/touchscreen/edt-ft5x06.c |  19 ++++-
 include/linux/input.h                  |  10 ++-
 4 files changed, 104 insertions(+), 65 deletions(-)

Thanks.


-- 
Dmitry

