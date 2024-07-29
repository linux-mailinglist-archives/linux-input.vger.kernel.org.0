Return-Path: <linux-input+bounces-5200-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BC493FEEC
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 22:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEDD8B22C71
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 20:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2428B18A926;
	Mon, 29 Jul 2024 20:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T9YjAZAm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB97189F32
	for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722284099; cv=none; b=PDDni4kfHfnbldTDEKaZILyrkHtDTkwQaNf/nPiM+rqhOglEycoIf/oispRUA2OnNzLSqqZm8FBYsri79B/1e7tkeySPW2z+gmU9gKXR4bAJah2BspyN2fAWHGXmOY15ZX7yImv4arB7Q9AvHgluuwHh2phrF4XdDvIOLVR3Lrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722284099; c=relaxed/simple;
	bh=0w+SG7bpvfjssE553OC0pRHj7u0uI6p4sGOhsbuut4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjeAC59KPWhAMSVvc0faWGR/uR9ROkzZFdoVgJKbT4ZRputQSpU/FFHLzLS4fTNEi83W/DDokL4rrVaUAQvPYDQE9D/92826Wzld+/P7k+US8TFmJXbaUHd1SBX8ULAOT+BMb9yJolySOKt816qUiVsjpV657a8CYzyOoXdlo70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=T9YjAZAm; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efba36802so6560050e87.2
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 13:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722284095; x=1722888895; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nxY8vWnahex+C+og3No0C3+VbWIrxAPs4cHmwNH5OIQ=;
        b=T9YjAZAmHVa6S9hWys09z3iPaiRU0onRWGFYfAig4jy8Fl4Il2XflK02WCffvikz4e
         t5KYFabDWPDDj0O1I5QprPsq1AAaNGDra7i3Tdkt4LYAFoOKRn4Fxlbd7fUdekjWI2IX
         W4HeaJa1DnpzmF7gXSEpieX1bT+IGbbZcQlW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722284095; x=1722888895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxY8vWnahex+C+og3No0C3+VbWIrxAPs4cHmwNH5OIQ=;
        b=SC+pnNwLkyC87gSydMeLEGVxNbZD6GuFWQRV2PCxCIe6tnKkSS5u7oGx7iJtbeNqFH
         r2/WkLBLiOMEiaqchNLWlvQ3jJlRTYFprsWUb242b1urpwSZSEs8T9aVbswysozl3XdO
         s7CrK8En82k3uVg9ws3faAm4Ic5ME0U4esvv1GngVciHKDZEzmbmZHG30bsOMeGF38+e
         O2ukggWlZCNPbgr9ITMuLg5TFpbsVLhSq5TKW+qASrmjLljUpAhoO+dYePtMcgzkvf1c
         Nzjy7lAsiKcE6bIZTpMLkzHHrAw+ckoQXN3vGAZxPPAXEG4jO93l60fabblx6W7ulJ/C
         0Z/g==
X-Forwarded-Encrypted: i=1; AJvYcCX1V/AMz7OYXs9tFVaztXanXQYmfXYfS0WPC3rpmHlLoFFKa0aQmGIb0DGK2ibVnLeU0B6pZlvH/c28eDstWQWpMuUxpRfAg/mMloo=
X-Gm-Message-State: AOJu0YwRfHLqsoYGJ2vkLb8pXMcP4ZlMUFLcqPHCBKBOXK7Cu0nNsVJH
	lVM9hxd93uzmNR26qbSE4lOaJMjq+aHnVjwcV5v7QzI/4JLRyceSYQqXfDdUJds4AWLVgvx+CqS
	s3duILg==
X-Google-Smtp-Source: AGHT+IGWIQCGRx+dHijQjzUZoCjJdocq+swDACSTu86EoqyiYTV73JQZCkE+7Cxfkb1VMfcSbrKaAA==
X-Received: by 2002:a05:6512:2c91:b0:52e:9f43:c13f with SMTP id 2adb3069b0e04-5309b269a11mr6720432e87.7.1722284094983;
        Mon, 29 Jul 2024 13:14:54 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd0d2csm1622440e87.69.2024.07.29.13.14.53
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 13:14:54 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso50584141fa.2
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 13:14:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjXaJMet6QKLeQcXynAwuX7TuP1iRLGemQhT5BWxDejYn3xT7UPJVMxA21KaLTYAagpa7luBXXrFZT501o5+xFZNzQ82/bRjhG1KY=
X-Received: by 2002:a2e:a787:0:b0:2ec:63f:fe91 with SMTP id
 38308e7fff4ca-2f12ee2419dmr74706391fa.38.1722284093297; Mon, 29 Jul 2024
 13:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh> <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
 <ZqfYfIp3n7Qfo1-Q@google.com> <CAHk-=wiT8RzFUVXe=r3S9dfCpV+FhARgtb5SxLDSOKCJKCLOZA@mail.gmail.com>
 <Zqfg8FW-SFFedebo@google.com> <CAHk-=wg4peLPGB+Lyvdtwxe6nVeprvTbZiO8_=E8-R_M+VyWow@mail.gmail.com>
 <ZqfpgmmLgKti0Xrf@google.com> <CAHk-=wgo9iEZ20wB4rOpt6h36Dymudqf6HXww1N094bVoqyMmg@mail.gmail.com>
 <Zqf00C_eOBwcEiWG@google.com>
In-Reply-To: <Zqf00C_eOBwcEiWG@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jul 2024 13:14:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whH+xp7ZxqgwOEm=_H=fVpWQvWpPqK6gzcPt8xdEXzwrg@mail.gmail.com>
Message-ID: <CAHk-=whH+xp7ZxqgwOEm=_H=fVpWQvWpPqK6gzcPt8xdEXzwrg@mail.gmail.com>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Henrik Rydberg <rydberg@bitmath.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jul 2024 at 13:00, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Hmm, maybe the checks should go into drivers/input/misc/uinput.c which
> is the only place that allows userspace to create input device instances
> and drive them rather than into input core logic because all other
> devices are backed by real hardware.

Ack, that sounds like a good idea, particularly if there is some
single location that could validate the input.

uinput_validate_absinfo(), perhaps?

We do end up trying to protect against some forms of bad hardware too
when possible, but realistically _that_ kind of protection should be
more along the lines of "don't cause security issues".

            Linus

