Return-Path: <linux-input+bounces-11465-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209DA77EFC
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 17:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4293B16C159
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 15:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406941F1517;
	Tue,  1 Apr 2025 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIZXn39t"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC961A5B9A
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521576; cv=none; b=UrfivQOnE3hF9WixKRA2hw3HQdQBo34JOKVLWrt3+VKsU6DA2ccxCMn0ycZtEDXKu0bfpuIa9v96Mr7MeURFCj5EAhxCpa3r6aRGsByKgtIN+Zs4f8WYca4pcIMFXWUV36SR8kB7kiCP3Zc0MHSlaAcXmHWPnWL+iXMA+1HByKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521576; c=relaxed/simple;
	bh=8IF1U4QVwTv83bVvbNrcOUQemuZpPuiVOptETQoPQhE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LEk/NIUGvjKeKoMG6zUn3mKdFrlvly4C0jWGgTDQz78Cr5FpNw0XEp9vOj8/Qo22ySWIANF8RJWrbPkKYugNatSAfaylSgGkVOjFHpP52BYWsTXVusE4UzPj24RmWqIWExJQPTVFqqXuiuoxWGalRB3jF6rTT0WgZEdmQhK4qKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIZXn39t; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2960205f8f.0
        for <linux-input@vger.kernel.org>; Tue, 01 Apr 2025 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743521572; x=1744126372; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8IF1U4QVwTv83bVvbNrcOUQemuZpPuiVOptETQoPQhE=;
        b=aIZXn39ta2EaVzBmohN1m7nrJfaPiJFJUhSYvFYePjbOyMcQARxL3rErmo++IXb2QI
         Bae2OFGLZ/ssshJiAzjXgz8j96spHxpmSlPznP1bIguslg3vFMNDAjXV0xr6g8kbmDQB
         U929xHAZeOWuqTuUIYPmSPNFr8Fx0MKrhRuN86Am/3dGxyAQfB1wsWcSo2+MMdeG1ci3
         e/AIKgo3o22Q5bT8SHVUEyzwqPmxoLIKHPIJtZluK70+jgIcz4mlaDskL/YqWQO7sfyl
         sYkTX/jCXd3exhnpqcgBkGmGXHHmZrYKiqD12rQwK2NmiaJWzKpLns/SXjlzd2Vkb13d
         NyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743521572; x=1744126372;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8IF1U4QVwTv83bVvbNrcOUQemuZpPuiVOptETQoPQhE=;
        b=qi9i1Ry2KGVMjz5NlfEUImzzI0w7V498fMZqC++bmdISg1ZAi9hPTBD/8A2Rf7RUC5
         90+jqYqG+vqaKyhhPe1YjApD0Rk9GOom2+EpZSTBDfVoFzujrVN73kwcvrd3m7lxWdFX
         2h9Ps8SxRzpJ6/VPYpIbJbjRKib2fiTht8LARySliucyc3tjQOn8hgBo86nw1ImcSZXe
         68xhkn4NWk4rEqs1gCzj9bV8yiMyZRJa4qxL2GuaTO4OXj616BrHvmj4St1/qCFHi4Cl
         x5TqJlHoiyDLdwI+UThURJkInMS2CpXJgU/TznJepes2qu6wJ/jX3TJZ+IpwIcwGalx4
         hLXQ==
X-Gm-Message-State: AOJu0YwyvtAsmYKB69fIZieF1Zjy8E3F7YpCkLngATmOIgYDjiXm33EI
	IhGEPuixyoe74gy4sjmDkbi1BpbV3mLKrBF6ry7IHQ3CToNHoNP4pdK8HBpy+4b43/qmN4q8F8w
	vtgOdwjtPw5xTVofw9ZVVga7MyAMzWWCkrdI=
X-Gm-Gg: ASbGnctAPJ/OZOQxWt/uoJbK2CcQ7wGkChR7xWrDR9hHl4CL+qZCQDHhk0vsGo/JMdg
	MY6rMfqmFIFjg148NlmQupXwkL+DlzghhMFuy55SOMaGDxxRM/yIegI+fT9RHrlwjmZJUJGAKOg
	aZ6wnRubSMB6wUs7iRqa2Gi4+n4WA=
X-Google-Smtp-Source: AGHT+IHdg8lZQyMvW5XH4AFRwr3ii5YqYBhrMbrW2XTcO5T5ilQuJ0763XjJwo+yG7/OXDZtdfSyjQCeP5Ol1I5A1YU=
X-Received: by 2002:a05:6000:2b05:b0:391:3094:d696 with SMTP id
 ffacd0b85a97d-39c1211d54dmr8600975f8f.54.1743521571926; Tue, 01 Apr 2025
 08:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: jt <enopatch@gmail.com>
Date: Tue, 1 Apr 2025 16:32:40 +0100
X-Gm-Features: AQ5f1Jo1yr9L19EsSan1NuiHRESWcu6AanmX8-pcse4WSqTefHMlHwJiRx0rF9E
Message-ID: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
Subject: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi.

The trackpoint / touchpad combo on an HP EliteBook 850 G1 is detected
under Windows 7 as:

Synaptics TouchStyk V2.0 on PS/2 Port 1
Synaptics LuxPad V1.5 on SMB Port

Linux 6.13.9 (zabbly stable kernel on debian bookworm) detects these devices as:

PS/2 Generic Mouse
SynPS/2 Synaptics TouchPad

I was unable to get libinput quirks working so I filed
https://gitlab.freedesktop.org/libinput/libinput/-/issues/1106 - Peter
Hutterer kindly explained that the problem is that linux does not set
the INPUT_PROP_POINTINGSTICK property on my trackpoint. He explained
the udev hwdb workaround and he also suggested that I send a mail to
this list.

For what it's worth, I think that this mis-detection occurs on many HP
laptop models.

$ cat /proc/version
Linux version 6.13.9-zabbly+ (root@gh-zabbly-linux-39666878469) (gcc
(Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40)
#debian12 SMP PREEMPT_DYNAMIC Mon Mar 31 02:08:07 UTC 2025

