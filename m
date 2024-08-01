Return-Path: <linux-input+bounces-5273-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E07B944F59
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 17:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F7F21C20A96
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 15:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AA013BAD5;
	Thu,  1 Aug 2024 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gy/y0oRm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3418130499;
	Thu,  1 Aug 2024 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722526384; cv=none; b=EUXeA+rc1S7ycB8Fqz0VonFBx+01DIXO4elwd4o+BU3A2Vs4kaWAadbnE29VfimzOdfRsSsP9Nk0HZve0BFzl7+IEoe2O6YSsSBcijC8Mot22QhOv+A+rs/WBvheKtHAjsUYdWrx5pNlcTkGJ3ocdJsWRAG1aZlqLSB/d4ki6+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722526384; c=relaxed/simple;
	bh=0Z6RD/hzwHo/EXOwmYK2y/Up3ttngTyHWPxtqdjo7yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceeEn1UyA5pcGZbhYQTTlzMl9tmjNa7llpf1HJZjmqrzXJhdovj7yQyoy/O7kJ6qe6Jykn0gQsJHKbsugP97fREZPMzczyyf7veoAKmDYsMDbUCkBjM+PeFtNkIHFXRz9ZYv21JZ5xL1qq6v41peQ9debyl2gF5f6xt0o6JB1os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gy/y0oRm; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-59f9f59b827so10489918a12.1;
        Thu, 01 Aug 2024 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722526381; x=1723131181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gShZrflL5YKZiRrygexTM8/U35juX4xRe+SzGpBt7gQ=;
        b=gy/y0oRm5MbhNzFGrJtmFe3BKi0CGKVgOI3xL1YWCulQ0j0WJrwLyhTkTr6Al/I3RL
         QxePTT31+lheBzwGIIRH+4zvX6msZjAUQ+TuW/eetRe03YrYRD6eTuAe5kelY1mgLSIn
         HvgrFfgRTznuo/Ib7KmawRQowRhF4WqIhV9/J94R4rxphhGL5a0/92V+U91hOaVaZToO
         yRzmQZRhAWOy0903HRJ+S/hzC39KZj0J7ZlD09rCJfF8oxyG4GiWIriq0beOY2AFVYKn
         6PDNqq0vfEzdIaYSBlv6+R+C9Bt1Y6qwGqnQmA1RkM4YarcyRRy9YkHKiTGuTQD2nAIJ
         bVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722526381; x=1723131181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gShZrflL5YKZiRrygexTM8/U35juX4xRe+SzGpBt7gQ=;
        b=ZyCVIeMWJdYnD8+neTvntMZv3ctGWg31eXQK2MkVnFZuR3o7NvMGUnx5lf55ec0zrJ
         YeS2DFUUeOpL7L4EWVRbnhoR1o3VmtO/hNaMF1RDIK2gXr2Kvwn+EVVhPjm3Gm17xd4A
         rViUkr7FbRyxyPJmpWdlw86xPxG5/lsShqdviYgZJSUd+jRogsE/PPRsk945YXcq4MZ1
         1c42dmZoN7VZkJ+su7SDqFTGiFqOJVY2dN0SxlHJ8Br+wxhYVenJP3gyC5TkDyctCVY8
         U9MY0uqE9RyqohokM81kTdoItTir9wsdLOPIU0e3qcQAWRez2fownZSv1va2sED01ubW
         AOHw==
X-Forwarded-Encrypted: i=1; AJvYcCU2IdOA+bcZ8o1cNmj+yi/nQ/Uq3wYzO+IIELgaJJz+R6DwqKEDL+CyN9xReNQj6qm0X3nJPRcUlHOntK78MU3VDWRdeOvY
X-Gm-Message-State: AOJu0YxH2Ph4HpX5rPR3Li37y4cWWqzDLzYqa0tODE+zyiQyJn7zkxoA
	MvXwASOzHbpM2iMII9HOxIwZhcIvapNZUyHwvPQsSpHGv80nB4H+YpMo7iE5TozfrVOvRm9l1N3
	uvgnw5iOcebfOlb2d3RXNjQdU8OY=
X-Google-Smtp-Source: AGHT+IHK+AcQE+TtdH8X36s71Cc4xKyPvQ1g5sWqRxsGwtPk2bgXii8QklECpPxRNMDLDJCN21/coAOXslT4qwU9/2c=
X-Received: by 2002:a50:eaca:0:b0:5a1:e7e6:ce37 with SMTP id
 4fb4d7f45d1cf-5b7f540b790mr513712a12.26.1722526380163; Thu, 01 Aug 2024
 08:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730155159.3156-1-jason.gerecke@wacom.com> <nycvar.YFH.7.76.2408011305530.12664@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2408011305530.12664@cbobk.fhfr.pm>
From: Jason Gerecke <killertofu@gmail.com>
Date: Thu, 1 Aug 2024 08:32:48 -0700
Message-ID: <CANRwn3T4xpJVuab7cfHT8V0vH7r1Himrhq5KMLGV_xgmCH1Kkg@mail.gmail.com>
Subject: Re: [PATCH 1/5] HID: wacom: Defer calculation of resolution until
 resolution_code is known
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Ping Cheng <pinglinux@gmail.com>, 
	Joshua Dickens <Joshua@joshua-dickens.com>, Erin Skomra <skomra@gmail.com>, 
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 4:07=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrote=
:
>
> Hi Jason,
>
> this doesn't really look like a patch series, but rather a collection of
> independent, assorted fixes and improvements, right?
>
> From my POV, patches 1, 2 and 3 seem like 6.11-rc material to me, while 4
> and 5 seem to be 6.12 merge window material. Do you agree?
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

Hi Jiri,

I was honestly expecting everything (except maybe the first patch) to
be queued for 6.12. If you're comfortable merging any portion of them
for 6.11 I'm okay with that.

Patch 1 fixes an issue with declared resolution of the pen rotation
axis. It's not a critical fix (most of userspace doesn't care about
that axis' resolution) but still good to address.

Patch 2 is a clean-up I noticed while fixing 1. It's not a bugfix, so
there's no reason to prioritize.

Patches 3 - 5 improve our generic touchring code. They add support for
relative, high-res relative, and multiple rings. These are new
features, so I again was expecting these to hit the next merge window.

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

