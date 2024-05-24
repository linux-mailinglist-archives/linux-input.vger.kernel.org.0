Return-Path: <linux-input+bounces-3825-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 575A78CE8ED
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 18:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1491B20CCD
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 16:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A112812CD81;
	Fri, 24 May 2024 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IHWvqFSU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EC12837E
	for <linux-input@vger.kernel.org>; Fri, 24 May 2024 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716569437; cv=none; b=KaIJdGY7l9CsnPMe4UJfCVPg2cZ0aDolbwPvt3e9w7TnY6vBojCH4tJ6b099o7bpmuzKbNIhOGAd7+zc9RyjLU5/5YrqvNVssMoP3zgeR9aq/PVQ50k5VcmcjFl6gL/IqAGQYjeiIQXaIa92c5JoX57yHCgHFm481Yp3ki15Nss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716569437; c=relaxed/simple;
	bh=HcJ3lytpbQnXo443M5BAMEUyaYSBLtuCf2kCkQUnnPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAdSqYnQngKyeCOw2qIsy0fgzbRyaKVH0m7C8JkiPnlQlWef9JHpfd6SLkxSIFbXFTop8G4HwMadYT8SpYA/OOKvgaZuN/3y138p1EkHThLa8yuDXe5ZaDSLTl/BUaljzdvBTj7QsPzd6Q9GD6Hbc3ixs3gbXbwevS+KNQ48gAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IHWvqFSU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-529644ec0ebso1608516e87.3
        for <linux-input@vger.kernel.org>; Fri, 24 May 2024 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1716569434; x=1717174234; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/wd0aVWeaab4pkRhA/5Mkwde91KCNjgTYomFjikwQ9E=;
        b=IHWvqFSUUdak0YQMUAlHb4mzO76TO1wwpddI2HAy89X9ah0f1uLMJCMk6CgqDdoEoH
         2xJXWb6uyoSYvsIZoDDTAVbtzBKo2LLFRUR/qVtBXcSfEyns5kqoCql8+Ieoflxwr5BI
         jH5qSIgo09fwRUsOr4mIaF2V+iX5WlhGM2tWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716569434; x=1717174234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wd0aVWeaab4pkRhA/5Mkwde91KCNjgTYomFjikwQ9E=;
        b=VpKMLfN0earw7aFCQ65pjAiqUpoZ1YwkyKCF4FTNj/PtJGdDlpKt2NB2wLmZSX3Sse
         p44f9Jc1YDAy4a0OAjurHaiLZMrFmtYbECoFu5uyphey6n9jTfwOCB77LsZLu/8KzcOl
         f4scBfZ2RHpkIfnX1tq9c8Zc+VjLXsa+njORnLCNp882NdkAj20sGyieaBw557lj9LVb
         WSK6UpHjbODCHvhtaK5U8Pf6cBLPRUxoJ9b309gm9odSIb/63VanK2LCzNKjrxiTvLS3
         KfyWNjxd0CrbyNmhmzJr3B0u7jJbQ8ERPyF2hCrLOceMB8yD/kobByt2VAyeYRfUJeu8
         SBZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU3Dzyd4H2L5WS3WQTf/g3e7MphJk1qPjBq+fuPP4WtyTedGD5aEXoL0675bUcmtuCXDxxtiJmGlfcpb5Ebd1KYN8MjhoJhqreqcs=
X-Gm-Message-State: AOJu0Yx9ItDhrCqUciMGVVD6AxbmJ+x5/pd/zToSroagGtI1EOPpsEBE
	mhQN5O4hcmJp3kTVMDEFdafWEd6c3/x/5omNLTsaKhMVRr8nw+RgPixgjWEIAVK3y3/OqDANF+f
	GxJ36Zw==
X-Google-Smtp-Source: AGHT+IFdJBY2Sd0fu7L/MJLh1Xu4Mu0NhmZjEm/SmVwabCK6ikzJB/ENEmgTlWi+typKwTzhX0moKQ==
X-Received: by 2002:a05:6512:3d15:b0:51d:2af8:2e7b with SMTP id 2adb3069b0e04-529679318demr2923684e87.57.1716569433662;
        Fri, 24 May 2024 09:50:33 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c33111sm207877e87.202.2024.05.24.09.50.32
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 09:50:33 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so105737221fa.3
        for <linux-input@vger.kernel.org>; Fri, 24 May 2024 09:50:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf3v3NeJ+gcG5uGxjFBlYHszbj+yZuBUfjdnlisXGfT1R3iYdduCZgpivpGSZaA8jIBXVOVAzsUy27/ZM+37hTPvrBVrxa+9kohaQ=
X-Received: by 2002:a2e:7407:0:b0:2e9:485d:45a4 with SMTP id
 38308e7fff4ca-2e95b096de2mr23558551fa.16.1716569432516; Fri, 24 May 2024
 09:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zk_rXBV8E8Hwu04W@google.com> <ZlCv3HNhfcaEYjHf@google.com>
In-Reply-To: <ZlCv3HNhfcaEYjHf@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 24 May 2024 09:50:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXJcLOGizFGmVyY3cd9+oBwsh3-PYPdVBdqCW+Djgz8Q@mail.gmail.com>
Message-ID: <CAHk-=wgXJcLOGizFGmVyY3cd9+oBwsh3-PYPdVBdqCW+Djgz8Q@mail.gmail.com>
Subject: Re: [git pull] Input updates for v6.10-rc0
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 May 2024 at 08:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Oops, forgot to push the tag, sorry about it. Should be there now.

Possibly related to that, you didn't get a pr-tracker-bot notification either.

So beep-boop, this is your manual robot notification.

              Linus

