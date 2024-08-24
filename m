Return-Path: <linux-input+bounces-5808-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E295DBF9
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 578E31C21690
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CDA14AD2C;
	Sat, 24 Aug 2024 05:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msTWxG5u"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF2F9F8;
	Sat, 24 Aug 2024 05:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478659; cv=none; b=uE5XuPKLG6JQKnVYF7jRn78IgFs9JBA7a9O+eJ3VZiemmLi81XfPklJLYlesGq6UMLDYzkP8LoeXxLW2ZXGqydduV3g1TV5dnGPHlFxqXYXoH242VBppSklN2celvEeWIL098lcuP4tL2oam0HiwXLok9esQn7oBu/Gpumx5joY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478659; c=relaxed/simple;
	bh=RBq0t+Oeul0RDjqrhv39ztLuMJby2GYYzrTIRLqH60o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fBMAnQo4pGHfTI7m1dAuN/pd0L0aaDmrfsLihZQTY4N6gtHEwlHeLOuDPHtWNUVZsPP0f4HyPTZ6apjBjHsi6582yJyudryy/N5Y6ujb+bM3fM6yI58gYal9PQDq0s0cBeC8wtG76YosGegN3jHI6lfQhLz6/ci5kSb27/ZS3X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msTWxG5u; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7141e20e31cso2274618b3a.3;
        Fri, 23 Aug 2024 22:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478657; x=1725083457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXcPecOjtqx+Zc8jZ/8Wsl3BuGgS41zdgecv9rZMsU4=;
        b=msTWxG5upMoI9F+FKbGMaEN5L9RKs/Pe4ibyyokT5iCT8OhpMZYkFHt3ARoOJtbVKF
         r52NIVov1aBHwD1nR8twO6MXnUXcTJI4NjDIke1FSRPYKmMXL4lBAOGzDQBnibw1vOvh
         sWhaeST9PE64+DEDjGOkk9+mNrev8qfgk2spWMkghyMeZo2Ao1MkJMm965n1be7peahS
         MgD08Cb6ebtCTrk3k25TmiXnnpEWtwpaJHHDjpMF/9A2cCs6s2cSasKMiB1ANTxM9rMa
         RD8NRirUqEZ8OUnV/1hb/0Uqv7120dUzfXObvIKKgvNPKTHx8Ri4q0IlcsSde8iTDY+T
         NzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478657; x=1725083457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXcPecOjtqx+Zc8jZ/8Wsl3BuGgS41zdgecv9rZMsU4=;
        b=AxzWcOuIC49l3n3GH/p1y0Yqe0PofKWDZao1ga0p9IO0nEsm966pnw9E4Nl8A4vcU8
         w9cUEGUed9fKyjBm1ac6jbVKh7wLaoonQcCcIq+ho9nrHPlk+DPrGjOVms20D9OWF+2t
         qYin7tZ9kdVBzEa4xAFb0DHVNSbsX519TBIIh6la01aX+gxC1+QR+YWb9DN41G0Y9I3j
         n7bgJZf9qw3/jNL75vcZL8sYyngaak0yv4gYAPKgqmttBRv4AOmJApzuwxyEt95VOuWQ
         VvbtNuWIoLac8sDET2jOg7E4Md+8tyXBo2VWkB9ivbJXX9aOAQR3dELsZ51HcHOHaQBj
         6xQg==
X-Forwarded-Encrypted: i=1; AJvYcCUgVU8V2ZQtobOdbWnK6I3YQXt8vpEJJoPgqZYKjaR5RuB48ksZsLI8CU2BBeqMmPjDwoJTwMr7qDAKIbqX@vger.kernel.org, AJvYcCWfOpafD8vAFEksHRP21H3Vdo4Lfwwq6Lmkw3MuG2Hd/wQJjf/bXwQW7oO2lISytEfxJAYy7wptx4K9Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNpY6/OsvSTQRcFDzBpoGvKnc4WURs6iCrCvs/1YXMXQ/yoof
	w3KEQATyupzgWEzs2M2muCAdgR/2WGoRPXw7cbrEGOMriEAefp78XJFfoA==
X-Google-Smtp-Source: AGHT+IG2ePa91HvAP/VUsg/eGJAfvJ3MCbUdHHmHZveRIl2wUEmkUsDXJfjHAcoF9DLLPe6tBBzxdg==
X-Received: by 2002:a05:6a21:6b0b:b0:1c4:d4b2:ffe5 with SMTP id adf61e73a8af0-1cc8a084937mr4737413637.54.1724478656850;
        Fri, 23 Aug 2024 22:50:56 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:50:56 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/18] zforse_ts: assorted cleanups
Date: Fri, 23 Aug 2024 22:50:24 -0700
Message-ID: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a set of somewhat random cleanups for the zforce_ts driver. 

Heiko, Andreas, if you still have access to the hardware it would be
great if you could give it a spin.

Thanks!

Dmitry Torokhov (17):
  Input: zforce_ts - simplify reporting of slot state
  Input: zforce_ts - remove support for platfrom data
  Input: zforce_ts - do not explicitly set EV_SYN, etc bits
  Input: zforce_ts - handle errors from input_mt_init_sots()
  Input: zforce_ts - remove unneeded locking
  Input: zforce_ts - ensure that pm_stay_awake() and pm_relax() are balanced
  Input: zforce_ts - use guard notation when acquiring mutexes
  Input: zforce_ts - switch to using get_unaligned_le16
  Input: zforce_ts - make parsing of contacts less confusing
  Input: zforce_ts - do not ignore errors when acquiring regulator
  Input: zforce_ts - use dev_err_probe() where appropriate
  Input: zforce_ts - make zforce_idtable constant
  Input: zforce_ts - stop treating VDD regulator as optional
  Input: zforce_ts - switch to using devm_regulator_get_enable()
  Input: zforce_ts - do not hardcode interrupt level
  Input: zforce_ts - remove assert/deassert wrappers
  Input: zforce_ts - switch to using asynchronous probing

Sudip Mukherjee (1):
  Input: zforce_ts - use devm_add_action_or_reset()

 drivers/input/touchscreen/zforce_ts.c   | 474 ++++++++++--------------
 include/linux/platform_data/zforce_ts.h |  15 -
 2 files changed, 192 insertions(+), 297 deletions(-)
 delete mode 100644 include/linux/platform_data/zforce_ts.h

-- 
Dmitry


