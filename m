Return-Path: <linux-input+bounces-8535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF409F074C
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 10:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE94F284B75
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 09:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B4A1AE01E;
	Fri, 13 Dec 2024 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0TyhOYCO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8871AC8AE
	for <linux-input@vger.kernel.org>; Fri, 13 Dec 2024 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734081023; cv=none; b=ZoHAczrVsQzdElnULPfK0d64erbgTD+f9k+uAr4yj0usR/SvNsv1B6hVwnMj71xU6Yeu+TNmeSoA5UezbGjbgh+yvArWyTZbgvCr5TNt3Dj75FdI3z5gKvYia7sjETfqoo/NTUWCbxIYtOeVXQTrg0VtL9YKoIfq8ZAucYIhFNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734081023; c=relaxed/simple;
	bh=4GoxPHziDL8jynynpc6II9XKQmKHxtY3WLim+EY8Rn8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FwcUvgO+kIWvyY+vhUCg3Us0m7XZNPtT+Qix2Fg8rD6qg+fp72xn8w+xWFHxDLzxBbUriA11LJYk+wutS+1u8eJB2o3vEcezWbBfqRyKiW5+XFBhklksTWZB44EwbkJsRoQtUs7LS7eY3Qxp7yoRuBffAAEqq/AOgYpYBtOxGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0TyhOYCO; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2161d185f04so11778215ad.3
        for <linux-input@vger.kernel.org>; Fri, 13 Dec 2024 01:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734081020; x=1734685820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZMjcDhc1h3P2X9Fu0YyDkAQOlnsU6jYEmSS6gnAML4=;
        b=0TyhOYCOvIo5/MoX5rWM13KVpbScFj33pmm+/NclfFcYB1R+JX6bgF31Gh776qQvSO
         w1LuHug2EETtMZvhUW7B0PIO5JRjErvYeheDxIJKXuwo52javjty8BFIVR5FTP47Z0su
         dSfNz1/EMc3/HcEeAt4oIlvY1Uz8ghXLc2+5hdwkr6Fo7aMywbUQOVs51moVfZ8qhHFm
         oQovRIwPCjrBFm2D4WIJv/V0di/Kcq+oklWF/1z7YDuob7UAiF3pjIsLMrAUwhR11kfH
         C5llTkrnAkgmtvRRjlY9crPP1g8fsfGJYnz2YfCApBEYsnr6nQDPJPnZyA67Uac84rRG
         1myQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734081020; x=1734685820;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UZMjcDhc1h3P2X9Fu0YyDkAQOlnsU6jYEmSS6gnAML4=;
        b=dFchKSQwEFMxp9pGWUoAfruhN5BsnsA7/Qjv1TODZxmlZ0rxt55WzX1N4uj7waS0ge
         +hamdMvdIkswZ+8mj5OYCca9ET7JWkeh8Pq9PEfi6u9DsGBD7jO2gFh80linl/HwEsuv
         r06761BjbntVYRL02ee7Ac/dJVynzAcItoEVMEPQEWAq/ZhTuBo/G8wF86nbeUr5ur2S
         jz4HJZgkEQUcrbPnAM/KuUoGKSWwCwaXEtFg6jiqi1EJedpzkiAsDUwAYc5/qIF8cO2X
         LuQDfWF2SqF1fwLwRQPAdCzFAfaj+7R3sTRghd4i83MoFdDu3782aOGVIw0XuWXKj5mJ
         zVWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkhjUKnC2pJlrCT3z80qwVxtC9agzxV4TSo2Fdb74yW9d76HN5xix0OCucuiSadJyN7tWMmdsvd77R+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHR74rfZhKv4aYZmerYnruO4I36JMmLm/G30U7rVIERc8oQLf
	9XpsuD6AVJvd0k3Jcf1eFzlBYIUQPB7D3Juxb54NORvGd51FDy2mkP6pAipwb684WAFLcs+HEcq
	jUkHG+FM68rRPYA==
X-Google-Smtp-Source: AGHT+IEWGF+x01YrzH8Zqz6DDD7saIEVhbAUPTAJ8Q7hrcR+RUbndbMM9vtqiuEmG36O/LrpFgJSqohpUP+Lnmw=
X-Received: from plti1.prod.google.com ([2002:a17:902:6ac1:b0:212:5134:8485])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d510:b0:215:7446:2151 with SMTP id d9443c01a7336-2189298205amr23588125ad.4.1734081020572;
 Fri, 13 Dec 2024 01:10:20 -0800 (PST)
Date: Fri, 13 Dec 2024 09:10:08 +0000
In-Reply-To: <03c79eca-f79b-4008-9037-ea96e18f093f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <03c79eca-f79b-4008-9037-ea96e18f093f@quicinc.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213091016.2058740-1-guanyulin@google.com>
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
From: Guan-Yu Lin <guanyulin@google.com>
To: quic_wcheng@quicinc.com
Cc: Thinh.Nguyen@synopsys.com, broonie@kernel.org, cezary.rojewski@intel.com, 
	conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, 
	dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org, krzk+dt@kernel.org, 
	lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com, perex@perex.cz, pierre-louis.bossart@linux.dev, 
	robh@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com, 
	tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On 12/10/2024 8:40 AM, Takashi Iwai wrote:
>> On Tue, 10 Dec 2024 01:59:10 +0100,
>> Wesley Cheng wrote:
>>> On 12/5/2024 4:53 PM, Wesley Cheng wrote:
>>> Hi Takashi,
>>>
>>> Could you possibly help share some direction on what you think of the c=
urrent design, and if you think its detrimental that we make modifications =
mentioned by Cezary?  I have the next revision ready for review, but I want=
ed to get a better sense on the likeliness of this landing upstream w/o the=
 major modifications.
>>
>> Honestly speaking, I have no big preference about that design
>> question.  The most important thing is rather what's visible change to
>> users.  An advantage of the current design (sort of add-on to the
>> existing USB-audio driver) is that it's merely a few card controls
>> that are added and visible, and the rest is just as of now.  The
>> remaining design issue (two cards or single card) is rather
>> kernel-internal, and has nothing to do with users.  So I'm fine with
>> the current design.
>>
>> OTOH, if we follow the pattern of HD-audio, at least there will be
>> more preliminary changes in USB-audio driver side like we've done for
>> HD-audio.  That is, make most of USB-audio code to be usable as (a
>> kind of) library code.  It's more work, but certainly doable.  And if
>> that can be achieved and there other similar use cases of this stuff
>> not only from Qualcomm, it might make sense to go in that way, too.
>> That said, it's rather a question about what's extended in future.
>> If Intel will need / want to move on that direction, too, that's a
>> good reason to reconsider the basic design.
>>
>
> So to clarify, what Cezary and I are proposing are actually two different=
 concepts to achieve some sort of offloading for audio data.  In my use cas=
e, we're trying to leverage as much of the USB SND implementation as possib=
le, and only offloading the handling of audio transfers.  Everything else i=
s still handled by USB SND, hence the reason for it being an add-on since m=
ost of it stays the same.  Unfortunately, I don't have any details about th=
e full HW offload design, as public material on it is fairly minimal.  So i=
t would be difficult for me to rework my series to something I don't have a=
 line of sight into.  Personally (and as you can probably tell :)), I would=
 prefer if we could do the refactoring in stages (if actually required), si=
nce I've been pushing this method for awhile now, and I'm not sure if I can=
 take up that effort to do that on my next submission.  At least from the Q=
C perspective if we did move to the HDaudio-type implementation, I think I'=
d need to also
> change up the ASoC design we have currently implemented as well, so it wo=
uldn't be a trivial change.
>
>
> Thanks
>
> Wesley Cheng
>

Given that the series has already undergone extensive review, I prefer Wesl=
ey's
design. We've begun leveraging the design in our local environment with
positive results. Furthermore, we've proposed an additional feature to enab=
le
USB audio offload during system suspend [1]. In brief, by combining these t=
wo
points, we can identify use cases where other vendors could also benefit fr=
om
Wesley's design.

[1] https://patchwork.kernel.org/project/linux-usb/cover/20241106083501.408=
074-1-guanyulin@google.com/=20

Regards,
Guan-Yu

