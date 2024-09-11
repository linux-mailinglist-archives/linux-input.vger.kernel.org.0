Return-Path: <linux-input+bounces-6431-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DF1975A13
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 20:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9709F1C21BCD
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 18:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982B81AE035;
	Wed, 11 Sep 2024 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhptTs53"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038B1AC89D
	for <linux-input@vger.kernel.org>; Wed, 11 Sep 2024 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726078265; cv=none; b=OuqyAUDBKFZfL6K8gS7Ud95uBrxsryoAju1f4EdEWNVvpCqd9dPfryZI6X03MXq1e0/2G8CV+f3QjuseY+Ht96FA9tAibXL5xCaPDVtTXcMJc/D7YU4M092SW4/dHCZIUr+PrWKhtWJRrIMq8qCCyUNpRS90jBVPakhB0niSyP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726078265; c=relaxed/simple;
	bh=Js8jjNQZDT8tiwUw6u5+jk8bj0r7QunVyfhwePaBQv8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SNqkYA6hMCQFaKOzjt0BT1PV4Z6lML+f+qAfvbuHLATRXLxgSMhZgvwwocWWG85EHuVKZnzoA0Whzkn3zTSXa3JARoQwtEV9G9F3+c8rz54IaLZqqzFndZHJT9UY51pDaLS3GN6mbsUGBdDTOfvVRL+Z0K0YudYuDOwNDwz2NpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhptTs53; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-374b6e433a8so16875f8f.2
        for <linux-input@vger.kernel.org>; Wed, 11 Sep 2024 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726078262; x=1726683062; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Js8jjNQZDT8tiwUw6u5+jk8bj0r7QunVyfhwePaBQv8=;
        b=RhptTs53wRzOHkBxPVOYOV+Be/YQaw26wE8IKuxujUDHcJs4APCI0bcyuTHBeQJrnA
         PB88dtOFRdZ/qt7EYExuSYlOxLhPVyXu4/74ocHZy2oQE9ts+F0RJeG8/JXWFVnFsV5a
         iI6m+TWtO0jaMiKabA8pSfVooxMu3GHibwPHiKIF4E6OmZMVrJuCwqotc3mzrQ+imtdn
         CACQNPgysZMzl8bAeZwLJS9ibf8LlP34191ja2GTakDhZBCRVi6N6/EY5bljfxPTrjG4
         +9PJP103x9CEudp79OSjfuA7l7xqDt3hwUSh2WfXh0gjAqupkCGliAcXGU0v9Wf95PP1
         3q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726078262; x=1726683062;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Js8jjNQZDT8tiwUw6u5+jk8bj0r7QunVyfhwePaBQv8=;
        b=TBRLo90tT00iOeos8sAUsVAoZbw38YzaS0NcbFHf6H7mZktIGswgeWBGf3uKC3abye
         nRtftEcVbAv5ajlKCGNTFX94ppwEZB3QtUQn7JRCmzK5feHcL9xgxRxptKq14MaWdbW8
         1bsU7nF/uNyJwOXZ6fB4b3OTfTNBBYR6DtG5pMcaVu2bPbkDxdR2VsumglcpJwpbjAGu
         ZFsGEbrzBkys4j0IPVGS8sw9AgQ2kfYYalKpNFepYzYsRuPq7oW1f/DGs3TCjAGLQbJJ
         FT/ootUgAgpA66BC4QLb/qwjfR0a2dLTdXXWyTFlKjY3iF6dgoRNUhlt/i13amdw4k0s
         kpHA==
X-Forwarded-Encrypted: i=1; AJvYcCXBvuNR92ZEdUe+8RCatbmchdAsofLUMW7zdO9QO7ijE1daTagthL6hKOLC+VjPMXHEdQ5T/K50FchRSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyC9u4TcJ3gKnjs15ZS7++HEKR029xd9KebrqL3LRWK919WuOf
	nw+B5K/i8F3jAb6j8LbBE87AU6wJCEbfDzizve1ADIn9Sgwv5ORk0f0y4auHGLrNEGVGnvTMulz
	hSJjKwcHaTsDcsAf+ye8xLfy7gKam3OKU2m4=
X-Google-Smtp-Source: AGHT+IHw6sEyo/Gc6P2LWkwj1ctQchqBnRYAXUqLOohZrpmiq6Htl3jyaJbc6zxIB8XrTWBm/1Zn0Cv7JOK9N3E/VuM=
X-Received: by 2002:a05:6000:1fa2:b0:374:cef0:fd46 with SMTP id
 ffacd0b85a97d-378c2cf37bcmr37976f8f.5.1726078261282; Wed, 11 Sep 2024
 11:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andrey 9929 <andreykaere@gmail.com>
Date: Wed, 11 Sep 2024 21:10:50 +0300
Message-ID: <CAJOHOeyVHRuxCw719tLDhUEmjD0hNob+ZdS_24WCZ=OOyV4PRg@mail.gmail.com>
Subject: Thinkpad T14sG2a touchpad not detecting pressure
To: rydberg@bitmath.org, linux-input@vger.kernel.org, chatty@enac.fr, 
	benjamin.tissoires@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello! I've encountered a bug (at least I believe it is), that my
touchpad on Thinkpad T14s gen 2 AMD is not reporting pressure nor size
of the touch under linux. In the most recent kernel, 6.10.9 it at
least has ABS_MT_TOOL_TYPE. I thought it has something to do with
libinput, but the developer told me
(https://gitlab.freedesktop.org/libinput/libinput/-/issues/1035) that
it's a kernel issue and redirected me here. If there is anything I can
do to help investigate this issue, please let me know. Thanks in
advance!

