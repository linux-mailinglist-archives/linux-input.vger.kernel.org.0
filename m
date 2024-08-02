Return-Path: <linux-input+bounces-5291-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4E2946649
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 01:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F62CB2195E
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 23:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F3F13AD37;
	Fri,  2 Aug 2024 23:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki7t8rH9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0785A1ABEB5
	for <linux-input@vger.kernel.org>; Fri,  2 Aug 2024 23:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722643117; cv=none; b=g8EROnKz+8RKKEqmVSLai7rvs/CXp84Wpv4QEarctAQ/7a1A+F1QVfgI+06KMEYE+N+pf+NLee+3S+BYNQMzlSNG5rn9YU/G4qHGc0DvDy5IXJWxrULOc8jUEl3i1mwOEyxtxLI3O26Y272zT/XQ9cOSZO8EOzSDo9zFoaoX1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722643117; c=relaxed/simple;
	bh=LPlpfpAD4ZmEq9OEjoJobgZa2mATDhx9q/jJOtKk84U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7nM65tANnTOQSgBu/ThhCSgXQ2oCb+S6UJDwBHhtuj+VtyazBtdkEEyc50HTtbdPe1SnJaKFy+D1dxtw+/+k5ZfawOzsOmvc4b6isKU6izGdrD2HTRtpX+f+FHF+uaJcIxScemkEr2WqQ1A07KhQ1iBF9WIlHu7BScQ+f4IN0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki7t8rH9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fd6ed7688cso74025905ad.3
        for <linux-input@vger.kernel.org>; Fri, 02 Aug 2024 16:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722643115; x=1723247915; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oHrNFLblBGsAWdB2ZipWAPOSjvap7OOmOAYB7tF/XQo=;
        b=Ki7t8rH9aUH+VFaVu+wDdpw2+TrfTdqe3lQlHq2t7fqCOyY1VRB8dATNt5JeEQ7xPO
         7Zwje5OBFhBrrLnmmVqi9Uv83yUlOyfDDX8dTGAiKpDus4jIl811dueaPS59j1qD/Axt
         Aal7t7wEItXKkI0X98G61+0KdjsQKmwkf1c/70Kdc0AHvZSOiZ5b/ALeoAvTZRSaOIvV
         oP8I1yrSdU2xPXiXHs4Ob4NMtquJa0694c6/isH4BlMOusQgiwhBqxSFBOoYUa2sbrnZ
         sPNpfl4uZwYNt7o1HHetvBJxlVmRmgNI7muQBYZYP9B3+Fmeb9ARrNMB5Tu3YHFzQXGx
         CuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722643115; x=1723247915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHrNFLblBGsAWdB2ZipWAPOSjvap7OOmOAYB7tF/XQo=;
        b=k1Ij98QETaW/P+ogLnNs2ca8PE81soyNm2Y++Su5Hbhle6YQ1S10fmr0k+LaoAItmU
         pjXdwRRNfhd0goDSx2ymhS4azw2U5Hz5yYe4sIGUhQ4iVuwqBhUogS3JgvtPt5vnQWYv
         Ywhf9o/706XFceT8ZU5zm7fKnoX0+tdT2QDxXdNdOWn4thUhf5DJ7eDsjDD4uJALfNJI
         2x3bbFDAl/yzpd4RoN7D8yHQi0SvW042F976JVmplL1owmlP7dMI/AAf1OSG1CFi650q
         bEng97T8xYSAOmaaLOhxEwWPFVuPDdZwROUp4jLlAvspCVZYuzwmZe5lZ/UFjmzCrgOn
         hv0A==
X-Forwarded-Encrypted: i=1; AJvYcCUI4IEMF6IindpFiOTIL+q877RIahJcvMlwLcDnqpbSx1iOCdnPFDmE1sDIZPJjS152KekmnaQmH70tntwAp6YKh0796NUVcJklcis=
X-Gm-Message-State: AOJu0YznMaDzgG7mErXght5INS/sHoEEAXL0vtLikQfQeU5MVtS2LruI
	btWuNE6VT6pl8hdVTqlghM/2SA87gngVMfNb4AAaXJZh2950zXHL
X-Google-Smtp-Source: AGHT+IFkC2bAJ4iyvzcDMu/T/xaa7z1Dis39HJb7CK0x/xBiaI/oWD69+yjqnTtPn0XvSARWb7W0nA==
X-Received: by 2002:a17:902:ce86:b0:1fd:7520:feb2 with SMTP id d9443c01a7336-1ff572c44d9mr61595655ad.30.1722643114877;
        Fri, 02 Aug 2024 16:58:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:47be:b3e2:7c00:141c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59179995sm22814085ad.206.2024.08.02.16.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 16:58:34 -0700 (PDT)
Date: Fri, 2 Aug 2024 16:58:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: bentiss@kernel.org, linux-input@vger.kernel.org,
	Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Message-ID: <Zq1ypyDxAVQsjpjB@google.com>
References: <CACa7zykn0q9XJAUvrqnNATr4DUv3Kc7XujF3vm6sfRB5pE6YNQ>
 <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>

Hi Tomasz,

On Fri, Aug 02, 2024 at 10:09:40PM +0200, Tomasz Pakuła wrote:
> Hi. I can't seem to shake the feeling I'm being ignored here. I would love to 
> get some input from you Dmitry, as this is an issue that was raised a few
> times throught the years and many times, it was left to wither, even with
> proper patches submitted and the reasoning explained.
> 
> One might think of this as trivial, but this is kind of an ancient limitation
> and we ought to improve linux HID compatibility, especially since this is
> such an "easy" fix but still has to propagate throught the linux world.
> 
> If I'm stepping out of the line, or something is really worng with my
> intention here then please let me know, but I know at least in 2020 there
> was a similar push to change this and  after Wei Shuai explained his reasons
> he was similary ignored.
> 
> Me? I just got a new Moza wheel and it too uses button above 80 so I can't
> make proper use of it :)

Sorry, I must have missed Wei's email and I was just trying to figure
out what to do here...

I understand that we have a limitation in the input layer for the number
of keys/buttons to support, but I wonder if input layer is the best way
of going through here. For the long time I was against an "anonymous" or
programmable buttons in the EV_KEY space. The reason is that we want
userspace to not care what device emits an event and act solely upon
what that event is. I.e. if a device emits KEY_A it should not matter if
it is an external USB keyboard, or internal PS/2 one or maybe it is
Chrome OS matrix keyboard connected to an embedded controller with it's
own protocol. Same goes for KEY_SCREENLOCK and others. Yes, we do have
multiple usages called "trigger happy" but I am not really happy about
them.

Additionally extending keys space is not free, we need to allocate
bitmaps, historically we run into issues with uevents being too big,
etc, etc.

I wonder if we can consider following alternatives:

1. Can we go through HID (/dev/hidraw) instead of input layer? I do not
think we will see such devices connected over anything but HID (BT or
USB).

2. Can we consider using something other than EV_KEY? For example we
could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair to allow
transmitting key number and state of keys that do not have pre-defined
meaning. Here we are losing event deduplication and ability to query
full keyboard state, but I wonder how important that is for the devices
in question.

Thanks.

-- 
Dmitry

