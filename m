Return-Path: <linux-input+bounces-4363-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D082908FFA
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 18:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB0D1284A9C
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 16:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070421802DF;
	Fri, 14 Jun 2024 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+KrFXAo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BBB18FC65;
	Fri, 14 Jun 2024 16:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718381983; cv=none; b=MZqtaMRpmIGRIs+JqReSgux6pSt+fLaauF1KFEUp3mqo6uR8CyuGvkTYdKZ5oMFPsISrfsJwPbdw6gmE1BC2Nu6Umch5UMC6usUi8lHm8T2VtSQgnUrlPBvnCJ6f7iAoLGP8P3xYvQYjnDBbvLZysU6y77UbZ6WcgMyIckb6u24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718381983; c=relaxed/simple;
	bh=ghumy45H0/3eMYoSiCTKrirZ9Uu1uwRB9sWgQo81TAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XHCfQsj46pGJ6fmibylsIM5WZgay63WY2DvRwKs4fNxMhuKBgM783sHYQtX1hbNsPLR2kqWAdQa76qlWw/NiM/MbdckWGu+K12OmDywT49G3q1YuyxQon+qGcPvdxHj7UDe863iEr9ZFMn0TwG6J8I1C3Dc8N9Istf/spZWjjfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+KrFXAo; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ead2c6b50bso24345061fa.0;
        Fri, 14 Jun 2024 09:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718381980; x=1718986780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9UZfCLUgzUy6gU198+2MCNQwylAn9FzJrbD2qALlANc=;
        b=H+KrFXAoOjfbuE6ILWm3zKJ3vITIFGWdRH2qZG74/P5OKtyc0e1j7DHHQC83m/PSb+
         ekLrnOz8z9mbgyKkxFf/BU+pgG/xPyDXA4BL72rvG9+P+xfjdNo9Aw4e8FqWmZkMEKoW
         VMFrWZdHBbhd6sQxw6/sVEfBY++CWHSCxGMGVNPonbtAWaCYXTUio1HCGJhpXksMpoDE
         inlgIvpwA/iKIS7RX1WMHCcCfxaoeBNfwpBsuGCy1o8NtyZWYo3jRM6FPEET0BOxPDSY
         c/ZD//QGb76ZmtvWtC7lzj6vfv6JP22qkWcPwOzokSfLAg5f/ems/L8FwGy4mbCg22lm
         hoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718381980; x=1718986780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UZfCLUgzUy6gU198+2MCNQwylAn9FzJrbD2qALlANc=;
        b=krHe3ojxUH52IGq2B+Dwdcvk5siwIBcR7PlmTObP4cqfGK3xbibo8cyzUNaqxUoAhm
         mKL2j0oEKH+P0TTcYilKWquaJjeoqmkZB2Aiqp0ZWTB/JIRVvvzHeDDnBwcyLNP5vvRg
         UPuSYr2SThsLWoNz2KPj0ZD9D+6mm7IpUwymCHwbNxO+oRBm7EckZv98aRaUKAmi/D26
         /x4iQhSNNOvnziEKmKCtqKi6eFUW37xHUrUjEyAtABTtwRELperGEVQ1A3nPI2Ee9NPF
         zFXXJ3J75hLFhXrga3RdpLV/ez5z7Umxc1Xl9/JU4z1Y252W3j0snb5NwEP/bEAYEXYY
         01ww==
X-Forwarded-Encrypted: i=1; AJvYcCVafPux381xHdOYQxxh9dxV+NWvHnfniubCyunMWuo3l0jbfABgDiftm6JXuE76KDTVIhOChy5BeR/m6ei5eCuv6gFJvbqXeVxDjBsQ672GBlQpdOB+Mjyq9LnLuIR0oEt1P4PdFdU/oxM=
X-Gm-Message-State: AOJu0Yy+azz3Ru/fNM415EX9ZGzk/MJIgKf6EdOKuzpURIE69IwsCqaf
	p2wcd4B3r26jJ9Kj2zdJyYY5z0+q/MW8S+PmRIN2zYOw4nMlC9wyNt/LNg==
X-Google-Smtp-Source: AGHT+IHUOhleBa7jZHxGwPCmbKCvzNa/r8jf3yDyTz2gwlF56Re1r++eZyoiWJkpkgT2IddXSVfJBw==
X-Received: by 2002:a2e:6e17:0:b0:2ec:199:8b0e with SMTP id 38308e7fff4ca-2ec0e5b5edemr22232961fa.8.1718381980144;
        Fri, 14 Jun 2024 09:19:40 -0700 (PDT)
Received: from fedora.. ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eefa63sm104638905e9.1.2024.06.14.09.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:19:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: benjamin.tissoires@redhat.com,
	arnd@arndb.de,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 0/2] Fix UCLogic warnings
Date: Fri, 14 Jun 2024 18:16:04 +0200
Message-ID: <20240614161935.230529-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

This is a follow up on Arnd's work [1] fixing these warnings.

Sending it as v2 so it is clear that the first patch doesn't
need to be merged.

Best wishes,
Jose

[1] https://lore.kernel.org/linux-input/8d93cdd6-379b-48e7-8a10-9df190b12623@app.fastmail.com/T/
José Expósito (2):
  HID: uclogic: Avoid linking common code into multiple modules
  HID: uclogic: Add module description

 drivers/hid/Makefile                 | 6 ++----
 drivers/hid/hid-uclogic-core.c       | 1 +
 drivers/hid/hid-uclogic-rdesc-test.c | 2 ++
 drivers/hid/hid-uclogic-rdesc.c      | 2 ++
 4 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.45.2


