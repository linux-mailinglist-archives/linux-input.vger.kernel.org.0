Return-Path: <linux-input+bounces-12468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42949ABCE10
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 06:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D81B1B61839
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 04:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0082C253F27;
	Tue, 20 May 2025 04:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZiCd0ny"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7266E1DDA24;
	Tue, 20 May 2025 04:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713915; cv=none; b=LSF8E0XXfQwKXGYhXCjAOp430WdW+wnHUNCDIG1iXs62gJ7lIu25x4o/UMQdk4T+J7SliSLyEu4VRh7z3r81oxC9EYciXR+pvO8yrQ8ohFJWSx+Qnn27j2/MJbC0OSyS/InLRfG78bmyd5h0IWhR1rCnKxijTZXQJZa21Nc2sZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713915; c=relaxed/simple;
	bh=VCYrIFqtuQMqPCFWazDg7HROXhghWZtBKbfig2zo2V4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQf9jD4xvAK40F4fFLRjw+1CS8iMMNUXOzMSb4PBRbc2NtmoIOSgtAHN4H8Sw7a2K5M+PCZqeNxIB5V+XnpDIUleGs7+aW7zpb89MnY6bDeKwsSyKoFet0I+TiNepEwZJ5CFitzsQOMzCsPSTIqPIVW44yFh8l+wUB32uoxshIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZiCd0ny; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4768f90bf36so52804141cf.0;
        Mon, 19 May 2025 21:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747713913; x=1748318713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCYrIFqtuQMqPCFWazDg7HROXhghWZtBKbfig2zo2V4=;
        b=lZiCd0ny8xSOZ6bKAUCkSbMGpjaWQqjCpMf/9V9L08/skpwenWp50vp3dgG5ztp8wz
         CMewdJi6ajd/9n0ckYSy8SHP1j+UsbBMg6iuAXeNr7YB1LEfpgYZ434FbZ5T0tMNF74j
         zzVqCUB/1AsL42wYDjdY8rxjuJRZPdsImhAeDVA1gyHpi0NHoLI73zB2MbxIz12IQLvg
         VSpXOFWztkjRjhlVFspxX3r8ZDAamo4mMKGIBHRVr2iWwBgskYS5K+15/2JCuWrnfJIf
         DJwSgWM84wA/sKe6VGkA9QA1zw5HzbpzU6lnJYAgHS/fF2aIBcvM9YCNzeEv9FWkTYnP
         6E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747713913; x=1748318713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCYrIFqtuQMqPCFWazDg7HROXhghWZtBKbfig2zo2V4=;
        b=Ty4BgVbPmA9NfsiG2dhXTPIdeBS2GAPwAXmkAX0FLt0Rhj4K2ojBq3S9D8HZVcukeW
         BaCLRZX4w6gQKeugfvy493HFrwf522405p5+0wGGi5c479xDDXBSVy2fQHvxLFfbSvsE
         7D1b4jpBbWAZFtIFtos2bGnLvjTDCb6KDben8ssnnN+J2r8ybTaL+tSldcvWkrN2Bnn4
         6siB1Cv5mwb1vJKUEFzCxLjtk89u6aybm41gZVbaRoXEhDfF4gDIwr6GQUJnSRKY1qRB
         0uEZtpIWbBHHhyVAy08noxIlN/5LqxI+tysJXBGjgdahbKz1jfy5qTCMR1566WTKrB84
         hEhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxKu0daIDlyOo7bBninUIvD+dv+o8SPJFkazEE9VRU+gVX7/gFFUn5PUFAb4twZY9R4/JTPyFAomGI+LE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+UYEpz1UVtDnI7TP7rxJFNeedwdtuZHAquToHLt81p+mUXNT4
	ya2/EQKGZ49JS3M7mnZMQmjCz78WhLI8bqzX25GymA+nF/XPAaVGw0n9xAXmeoYvSTxgKI6bU/n
	wXKBj9M3ELOurvVc6zJLbqukYgxLXcVo=
X-Gm-Gg: ASbGncv/MNarITdc/dCgL0b/bUAP90kMqtvPEn7kvJkbyAljDdbJeUfqQW6BzLGSDpd
	FgboEnSxqtf6dU2FqbDPDhtNQ5+fBwbQo03SbJTFx6W2jsVW+98qLIOG1C25P8XA/FibEXhQCgf
	dP/INPbWQNQLWvG/QQ8KSgw75Jghi0slM=
X-Google-Smtp-Source: AGHT+IFxMWW7NBLAO8fFeRnFHwoVe4F0oVAf0BwPGx+DgdbPUQH09Dr4mdSys4A0E74vWph0tl2iYtwM41ZpAD/fDFE=
X-Received: by 2002:a05:622a:4207:b0:476:790c:739a with SMTP id
 d75a77b69052e-494b07a5c15mr197065971cf.20.1747713913267; Mon, 19 May 2025
 21:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517105045.70998-1-apparle@gmail.com> <naxnt42hmvorqkif3pu4x36tpo44ugo2oiblrbtlrauucm5di2@tr2yobgoywmm>
 <CAB7A79ysZ2-kxKPyiM1+5keSrsbVwNZti4FzXGUbjx4OONzrDw@mail.gmail.com> <ogmv67n3rdia67ttj6whj4wnr2humhl2fjpo56phghqf67bpjx@bbdmdsmbp4kk>
In-Reply-To: <ogmv67n3rdia67ttj6whj4wnr2humhl2fjpo56phghqf67bpjx@bbdmdsmbp4kk>
From: Apoorv Parle <apparle@gmail.com>
Date: Mon, 19 May 2025 21:04:36 -0700
X-Gm-Features: AX0GCFsLsyc_c6UlTYikQJqPctBJ8WdfrC9mE5ITtFNddhe3_GjpLn_0QDB_NU0
Message-ID: <CAB7A79x5zviCqjO_LY34v53YpDgpc3Lck5n725bn_sYTkL8EEg@mail.gmail.com>
Subject: Re: [PATCH 0/1] Input: xpad - add disable_xboxone module parameter
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, yes, that's possible. But it's too hard to generally use -
requires manual command line intervention each time the xbox dongle is
plugged-in and/or computer reboots.There's no easy way to robustly
automate this especially for layperson linux gamers.
A stripped-down and hand-compiled version of xpad is at least fully
automated, but only until the linux kernel is updated by the distro.

On Mon, May 19, 2025 at 2:36=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I understand. However you can unbind and bind individual devices to
> individual drivers via sysfs by writing into
> /sys/bus/usb/drivers/{xpad|xone}/{un}bind.
>
> Thanks.
>
> --
> Dmitry

