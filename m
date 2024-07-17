Return-Path: <linux-input+bounces-5067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340EE9334B6
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 02:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52F501C221E8
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 00:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2E980B;
	Wed, 17 Jul 2024 00:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRyL2v4O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570DB628;
	Wed, 17 Jul 2024 00:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721175980; cv=none; b=LSkxOAFFSlNLJoAcr4lF6C3cmwLpXIPZ2SGbGYj1ubm2zE0F7cMOHPPK/48X2U6hB20I9UOU9jLfh07U70QD6scFpo1H18CAzxsCjlL5sqeo7/Zng51upnUxmktc3ZDPH0iQdzx+8zojjY7mryqhkWXV9clQSrC4OJ3lvKS4CjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721175980; c=relaxed/simple;
	bh=+lJcuhUAesI+fL0W1Lu97bp1FSqBUUXjb7gc7D1sNuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUEk1PbtNiB/abPvR8X/wa1DyVlWw7phweQtwCXgg0LNjvJ/qo6CKQ47vhm+1td9lB4Im0wpxfGhG+kVGKbsCyN31HUOaCAGcpxf8cfrUijrKOJR3AistCxrQHbaI8UDt69DtGKrhl0ESBbYwYfi9zLD8sD55yYLgHgXe+b2s4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRyL2v4O; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eea7e2b0e6so84122771fa.3;
        Tue, 16 Jul 2024 17:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721175976; x=1721780776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1xxlrYKlsAYREKMmiCm0HsJPbyvJOc9ZOy05BR0hfg=;
        b=bRyL2v4Oy5HTh+ozLx+DXz2Pj+GYKszffdHejg6x34ctRbjK82exdd44nrITI1Ry9t
         xIWINl62yGMlT6Hr9jgRbulDJUponcPWubIch9huaObmQfm/Lpnye65LUjoiCq8FUjyO
         ip2uknveeSie4b1YvkL96S1RoAzyzYYysH6RAwg253InXfw5NqUsaSFqvUXEszM4FFnz
         onb7FZQ8YZWSm8tH34U6f4Rz8xEu+EGioX4zz95Z6iVp3DaJGUvT57CuuvHF5ASQq9Zp
         WIWNyAcJMFwr3vuITkDbXXrTtWiou2/LoIWjWUgRAk25IopwCVJzCy0/PNF0BmsMVjvC
         ogXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721175976; x=1721780776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1xxlrYKlsAYREKMmiCm0HsJPbyvJOc9ZOy05BR0hfg=;
        b=Xbveq3WEVilQAtSXYnnJ//WCBRERBJjrNcWPJ20/OrckTYdWI816Ih7SWTheXBkEhV
         dNRYnSjQ6MAKsZTzVBgVf8ktnd7VeV5uM5A+Gdqg7UxoEqlx+zQVqQnHSdOiym9g7xEM
         JYTkxP5wY51x/I1S05GmCYouXVtDLq21eNVS8NAkdO86qiSYhj5ehMFMfhA22dz8LytY
         mq+2MCJwyjfg+m1YM4vCRd+DQ1oEaKMv3cFEqNgYEW7//lgA2XiwrHY9LC7sV7smbe+b
         6KDiXdTWzQzv82yzVu7RtlC5aLF6zqvQP8ekSO693qQWLN639uPzhIKHuN7iVr0WEmWu
         j3gg==
X-Forwarded-Encrypted: i=1; AJvYcCWKftI2Y8+opfRCniXnng/ni17tcaCJEGo3vHPztI+jO7oSt3v3YsC5CGsaVOa9kvBnbcsfRhh7iO7dinDtqyiWkym0qKuL2x9/G7h5E98/Kt0hIK0/mD3YYWGOAFqr21Kk/HFzigu46Ws=
X-Gm-Message-State: AOJu0YzAvEY5GzVZR+thIsehPIFEZPi8asDh5b9RJcZzySwwNBmhRzGD
	Dl8DWHNqv4PX4NqZj8JUlQqcH5oqDqdKNYiguAZBDeR3Q/P5D0en+WoLaysl6k+X4pSttgz3RNj
	mpORGqqE7/KIVUORJMr2i98C0+XY=
X-Google-Smtp-Source: AGHT+IElT/EzxkksPegW6XakIZVQSFwW+STqcxNmU+5etr1eW87xKQ221AgJMtPX86rRIAL3RIYDPJ4UfqBMPDOpVPE=
X-Received: by 2002:a2e:7305:0:b0:2ee:8573:eb51 with SMTP id
 38308e7fff4ca-2eefd14c831mr618711fa.34.1721175976127; Tue, 16 Jul 2024
 17:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616163055.75174-1-max@enpas.org> <CAEc3jaCkH5JwNTpHRZYsekbwX+G6T5tMTLD0+O6E7Q2hqcAFHw@mail.gmail.com>
 <dedb2c39-fc28-4cba-802f-5d56f23db722@enpas.org> <CAEc3jaC-Tmd2XtK9H2sipBJAhCf16dMWx46r8Hs4p9At3LC_Jg@mail.gmail.com>
 <afda41dc-7b36-4ddd-abfc-c9430d8c9503@enpas.org>
In-Reply-To: <afda41dc-7b36-4ddd-abfc-c9430d8c9503@enpas.org>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Tue, 16 Jul 2024 17:26:04 -0700
Message-ID: <CAEc3jaB7ijeXCUKOhpORx4Omf8edSmc1HKe9bk22V1mz=cLa+g@mail.gmail.com>
Subject: Re: [PATCH v1] hid-playstation: DS4: Update rumble and lightbar together
To: Max Staudt <max@enpas.org>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Max,

On Wed, Jul 10, 2024 at 8:35=E2=80=AFAM Max Staudt <max@enpas.org> wrote:
>
> Hi Roderick,
>
>
> On 7/9/24 01:07, Roderick Colenbrander wrote:
> > The console behavior (I checked the code) does use the flags as well
> > like I do. The architecture there between usermode/kernel is a bit
> > different, so in some cases flags do get set when not needed.
>
> Thank you so, so much for double checking this. It's always great to
> have someone who can speak authoritatively on such matters and eliminate
> the guesswork.
>
>
> > Various devices tried to capture bit patterns and see what kind of
> > worked even though not really right. (Officially licensed
> > controllers are a different story they use different hid reports.) We
> > didn't know other devices did this wrong.
>
> Licensed controllers... That will be my next patch set, apologies in
> advance :)

Oh I see. Hm, we have been doing a lot of work in this space for both
PS4 and PS5 controllers. We just didn't submit it yet and need to
clean up the code a bit as we have some internal demand for this as
well. We need to get our hands on some more of these controllers,
validate before we were about to share the work. There are some
details to these controllers (on the console it is kind of a separate
driver even).

>
> They need quite a few quirks, too... And as it turns out, my previous
> patches have laid a lot of ground work for them :)
>
>
> > Correct the validation tests are all uhid based, which is the best
> > which can be done.
>
> Please correct me if I'm getting the wrong idea here, but what I read
> between the lines and from your email address is that this is something
> in Sony's interest.
>
> So an idea comes to mind: Maybe somewhere inside Sony, there exists
> something like a DS4 simulator at the HID level, which could serve as a
> foundation for improving the tests? That would get the tests much closer
> to the gold standard, which is using a real controller.
>
> If not, then maybe there is protocol documentation that could help test
> writers in creating more precise tests?

Unfortunately none of the documentation for our controllers is public.
Just read between the lines in the code, which we cover with some
clues here and there :)

>
> > There is the hid-tools one, but the one which we help out with, but
> > the key one is the Android ones. We have so many problems with these.
> > Mostly because of vendors not enabling e.g. FF support or LED support
> > other things.
>
> Hm, but downstream users misconfiguring kernels is not our fault, is it?
> In that case, the tests actually do their work correctly if they show
> that something is amiss.
>
>
> > The main new Android kernel (public knowledge) is now 6.6 and many
> > new devices due later this year/early next year will use it.  The
> > eco system is a lot wider now and the drivers are used a lot on
> > non-mobile devices (cars, televisions, chromecast,..). Occassionally
> > driver patches are also backported from upstream to older Android
> > kernels (patches have to be merged upstream first).
>
> I see. But still, that is just typical downstream risk of building on
> behaviour that the kernel does not provide guarantees for. I know
> first-hand that backporting is a lot of work and easy to get wrong, but
> this is the first time that I hear that as a reason to stop improving
> the mainline kernel. Hence my confusion here.
>
>
> > Not that I wouldn't want these kind of patches, but I have to weigh
> > both sides.
>
> Thanks for your understanding, and hence my offer to help if I somehow
> can...
>
>
> > The pain on addressing things downstream and in Android conformance
> > tests is quite painful.
>
> Hm, I can somewhat imagine this. I've heard that Android conformance is
> quite strict.
>
> Given Sony's supposed interest (see above), I guess it would be a
> worthwhile investment to make the tests more robust? We could just hold
> off on this patch for a while until downstream has better tests... What
> would be a timeline for this to trickle downstream?
>
>
> > We would also have both code paths used in the wild forever, because
> > existing 6.6 devices wouldn't change behavior.
>
> Well, that's kind of the point of LTS releases, if I'm not mistaken...
>
>
> > (The official Android tests are kind of kernel version agnostic as
> > they work across multiple kernel and Android versions.
>
> Hm, sounds to me like the Android test framework is broken if it cannot
> be kernel-specific in such cases. What's required in order to improve thi=
s?

It is a bit of a long process we work on with Google. Some initial
fixing of some of the bugs will be for this year to make sure the 6.6
tests pass properly. But any work to maybe handle multiple behaviors,
that's quite tricky and would take quite a bit of time to be honest.
Considering how widely Android and all these devices are used, I'm
hesitant to make changes to not cause regressions. Even just a simple
one can take forever to trickle down.

>
>
> Max
>
>

Roderick

