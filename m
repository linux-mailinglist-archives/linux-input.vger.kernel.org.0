Return-Path: <linux-input+bounces-15650-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C52CBFB3B0
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 11:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A206481286
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 09:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED46315D42;
	Wed, 22 Oct 2025 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYJ/Xt/q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BD6314B8E
	for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761126812; cv=none; b=Ed7jHj1FbMe+91TCjbtdTDHBrrOF5BatySRO5M/EghG0gKgpqX7st/+ptvxf7tEcqBUQKzgISdlK9cVr6wSGnd7t+zJzRRfrCGWs5mCv1nFZCWof8l37zspAibNa7V/v3//7hOLbxI3CO55SVlhfGSeW8Pm9Mjdy+Ss4jInIXGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761126812; c=relaxed/simple;
	bh=Ug22BomORIzH/9xKEEMI5MyMbImDmbNjLbaolyj4Igs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noE1IuSpModexqYxN6kkagxuosI/hBhrt4YlX55d7qN4VJJyVB0lngnxqPPUARuq/6GaiCz1Gu0VT/ziZEPzIQmt8ewBQkJglP1IiFyqEM6Wyk+fbhfMlsE77RA7+aTaLVz/dR+D1Bl1AGtzobv9+IsVO7qXfamhUV2b+sEJgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYJ/Xt/q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33EEC19422
	for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 09:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761126811;
	bh=Ug22BomORIzH/9xKEEMI5MyMbImDmbNjLbaolyj4Igs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gYJ/Xt/q2H25/BUscncq6m8uxFtQFtj52eFrduRv0CESKl27UjPFHMASbiNijSaah
	 WlCkEjTdRdv28xLn08CJoDX+1YqBwFiID3sBI4OSIhDSwXBYsNT+jT4gzgRmdlypqs
	 VsgjR2ItqllQABAfX+q8cqEq7/BB95r4kySeYYFmnxCact6widm/WTA5SrBY6DDeR9
	 dOQlK2dyuJfygtMO2xIPGAP42Bcw2bVI4/KeiMMHV4tmcvpyk1hKiXglS4W2OqiUl2
	 7TI5cKJ89lJ3zFNa0A2LztIWMatB1nlcJXteQTFO/NuJHEGwzVUAyW3m9XOXlIMfPO
	 2TczpSk6vcG6g==
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4439ecf6004so502130b6e.1
        for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 02:53:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQO2vwrTB0P7Vlto2OyprdoW2kaXIwxtubntiP4FZuyr1fR03CAOTw8uwiZepCQRuzL4Ph9MLcmpHvIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQeEyo8R8MjTjpBkwwRnT7qsBqm1CamQYbrVLOI8uqXQ2aNImV
	TD5/CjifOb8rG4lZwH29z4SRuVGYLFPusGXOLp5llgOf1fjjUapU+LCoVC6KIhxRtaE/d/FEjcV
	Hyvh71NzbKgogrALtAz66Um+AD3GFvaY=
X-Google-Smtp-Source: AGHT+IEQ13u1oSclBwpnZHBLwP4bw36HFdC9CZVWneOPiMF3MvEaF60PFP/hNa4krwDC1iDzVMkKGxdgnalzlzzvXKw=
X-Received: by 2002:a05:6808:30c1:b0:43f:28bb:2fa0 with SMTP id
 5614622812f47-44963796090mr1210072b6e.1.1761126810960; Wed, 22 Oct 2025
 02:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018142114.897445-1-usama.anjum@collabora.com>
 <20251018142114.897445-2-usama.anjum@collabora.com> <68a8c1ba-275c-4908-a4c8-2e8b83367703@kernel.org>
In-Reply-To: <68a8c1ba-275c-4908-a4c8-2e8b83367703@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 22 Oct 2025 11:53:20 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hCxpWXdnoQeW79kaDFmHcfE0A4k7JuA9T+RR1OyCw29w@mail.gmail.com>
X-Gm-Features: AS18NWDTb2kKmdjZ51ZPCTGrDBznwHyfGY-LvLmRJU4KZVT2l-jHqvsLN9kMPDw
Message-ID: <CAJZ5v0hCxpWXdnoQeW79kaDFmHcfE0A4k7JuA9T+RR1OyCw29w@mail.gmail.com>
Subject: Re: [RFC 1/4] PM: hibernate: export hibernation_in_progress()
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-input@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 11:07=E2=80=AFPM Mario Limonciello (AMD) (kernel.or=
g)
<superm1@kernel.org> wrote:
>
>
>
> On 10/18/2025 9:21 AM, Muhammad Usama Anjum wrote:
> > Export hibernation_in_progress() to be used by other modules. Add its
> > signature when hibernation config isn't enabled as well.
>
> I wonder if you actually want to have pm_sleep_transition_in_progress()
> exported instead.  "Logically" I would expect cancelling a hibernate and
> cancelling a suspend should work similarly.

Well, it does AFAICS, except that only the "freeze" and "poweroff"
transitions can be aborted during hibernation.  This is analogous to
aborting a suspend transition.

The missing part is a mechanism to cancel hibernation between image
creation and the "poweroff" transition.

