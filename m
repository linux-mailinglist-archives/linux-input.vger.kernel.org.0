Return-Path: <linux-input+bounces-6122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F7796AFD3
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B98DB23E84
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3130181720;
	Wed,  4 Sep 2024 04:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3C3co6v"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6143152;
	Wed,  4 Sep 2024 04:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424277; cv=none; b=kHc9yKisnztOJOlpx7+YQWmqWvgLBVmFHC3CUuqb01BFDKekn5TnJsiooATlXkvkg0w09XFf9aLUYdHaMrgiEB2uEBEQChP5iJPQZwLnZCGLyu1H1EbR5X7IRsuwLPBT3E3T4R08PY9ZcnPRidM1ai7RMoneCwKrp64wfu+Be80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424277; c=relaxed/simple;
	bh=wEgSwE4JomOzrqQzVP6mUd3/U3sdbpZiT/uDtQD7yKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V2ReL5m9Z7+NfOCoPIoIJ3XQLouWM8641oh+Ibu6tmLx8o15mLAVzFP9ahTaoZcX6R/qfpQBXfnYStD+rI26ZIM88kq7BnrB7ZO7bi82ipGQgO44KkQnSpjK291vUUOSgb4GkUX/UGN5R+3uRi3dzpEEq0qRjffXFKtGcZwSsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3C3co6v; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7d4ed6158bcso1321192a12.1;
        Tue, 03 Sep 2024 21:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424274; x=1726029074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC2VeYSPSoVy3q3YHFnRw4GnwqgM66ZmBKtWVOZ2wQM=;
        b=c3C3co6v0vSMY+06zIK4bUajU88C4PDaFqx/RaWWSH5G6h6vZKJTGXcHKIqb9UVvyu
         4hRU6V7jmo6MMQ3rSham1OnsFhrakdoFe5IPMTFoO9AXDjlf2+k7FxlhqhOxICsIAFf5
         TvIA1nPjuCvq6qVzgLAEd/hmuZVMW3y5PSyfZnsRmFqeBJjVzL5HS0zMrxT1SZ366X6o
         PNm/b/ZBMTK6uK2c9lwIchRsS8Yh8G3QRm5Lsb0AutGY0SA8NG8bGRRaIwUMikN1a5Nz
         ZmCm/FqRY5uxzCRFM6Q6FmfaebpU8XC5lq3EcqhHbFRs0uDPWSJtkasNu+BLUwjSKvHF
         VKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424274; x=1726029074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZC2VeYSPSoVy3q3YHFnRw4GnwqgM66ZmBKtWVOZ2wQM=;
        b=rOWlfk8tTJAM+Y5kZkeNg4/y+iHcUozNkuc3GZJr9dro7wQs3ijTUpP6zT8vyV5+3U
         R7FmQGfIgjx6noOiFaIkJyY4+udxVTw8rN9KO4ojyLz+eLZ9e3BzNUMPS+iiGSHyX2ny
         vIYro+qnSrsN+toRiYomvKCE2QTt5kRMHcjkMpVfcAiOPz5wUAKmBB0ZxnqwMpHP+lIY
         HjTHtE4e3/Wfcib749ecv5lMbt9w55yohSCCMY5kCw3ioFSgo9iaHuz2UvcM4p/BpQpm
         C5CMWqzJmtr456/oowUs0yhePaJRMcju1ThS+BFreUucbj27nnakbAmwd3cMM53Q+yzf
         7d+g==
X-Forwarded-Encrypted: i=1; AJvYcCVUrxab4R6ZbBv0qQw4+VCG4g9pqEJDCYJmqIz5Os2CC82YLcOUMI0hGLOPsZ7+RpGMjpmBuD0MCpGP6vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxqLGKYmiJcc1oFZsky+gPUkKsYIneJ0WWbwDfFwNb/Cj9uNvz
	3T5gWSdyRIrPvKekmI+QSrwHHiaAKu8e/okD+Z0/FViq1IUWEiF81jm28w==
X-Google-Smtp-Source: AGHT+IGTOIBw7HgMRxBMWldPqddrIfjXO0/hS4KJdsaRosTqs80U6MOaMs5JtEcJGuUSIuLGwzXylA==
X-Received: by 2002:a17:903:1d2:b0:206:aa2e:6d1f with SMTP id d9443c01a7336-206aa2e7235mr39491265ad.46.1725424274316;
        Tue, 03 Sep 2024 21:31:14 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea392e3sm5503555ad.135.2024.09.03.21.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:31:14 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Convert joystick drivers to use new cleanup facilities
Date: Tue,  3 Sep 2024 21:30:57 -0700
Message-ID: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series converts drivers found in drivers/input/keyboard to use new
__free() and guard() cleanup facilities that simplify the code and
ensure that all resources are released appropriately.

Thanks!

Dmitry Torokhov (6):
  Input: db9 - use guard notation when acquiring mutex
  Input: gamecon - use guard notation when acquiring mutex
  Input: iforce - use guard notation when acquiring mutex and spinlock
  Input: n64joy - use guard notation when acquiring mutex
  Input: turbografx - use guard notation when acquiring mutex
  Input: xpad - use guard notation when acquiring mutex and spinlock

 drivers/input/joystick/db9.c                  | 30 +++---
 drivers/input/joystick/gamecon.c              | 22 ++---
 drivers/input/joystick/iforce/iforce-ff.c     | 48 +++++----
 .../input/joystick/iforce/iforce-packets.c    | 57 +++++------
 drivers/input/joystick/iforce/iforce-serio.c  | 36 +++----
 drivers/input/joystick/iforce/iforce-usb.c    | 13 ++-
 drivers/input/joystick/n64joy.c               | 35 +++----
 drivers/input/joystick/turbografx.c           | 22 ++---
 drivers/input/joystick/xpad.c                 | 99 +++++++------------
 9 files changed, 152 insertions(+), 210 deletions(-)

-- 
Dmitry

