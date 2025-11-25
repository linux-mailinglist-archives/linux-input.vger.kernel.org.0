Return-Path: <linux-input+bounces-16332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C776C84F53
	for <lists+linux-input@lfdr.de>; Tue, 25 Nov 2025 13:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4047F4E3E86
	for <lists+linux-input@lfdr.de>; Tue, 25 Nov 2025 12:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AB73195FF;
	Tue, 25 Nov 2025 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZAVnN1R"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C62D8DC3
	for <linux-input@vger.kernel.org>; Tue, 25 Nov 2025 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764073570; cv=none; b=NiH78rmUrESsMkr1OmX7MaiqA8hTwG9Lz8J0ZZRRV6RG33MU7oZ3z0VkpTQDcqWqcVjqhKxHF7R0aXa/tKpI5ZId13BmF9z6xv+oCQeqvnmAwcCDCsLH+I2BV+qgU9XfGDJNskg5BfSuei0THvC0i20PENxcuQwqZXDjb80kVaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764073570; c=relaxed/simple;
	bh=Zvrwnbbw/3orNTGSrOMAUA5Y/Het52/a2ovrMrjm5ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2gmMb9gjcVFPIhNkm88rPSh6AT1LwcseadAMd1rUWG6zOyezof76qWGSSrY3Os2lsS3jeU5FjjfGrS7O1SaYgnUlaDOFgUytXbQ7wTzu7DYdRZRcMfoBP/cKwr+Xe81ml33lbDAJjC+SCbyw1yoJwJnX1iDOGLe2bC5wEGzd84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZAVnN1R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03FEC4AF09
	for <linux-input@vger.kernel.org>; Tue, 25 Nov 2025 12:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764073570;
	bh=Zvrwnbbw/3orNTGSrOMAUA5Y/Het52/a2ovrMrjm5ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bZAVnN1RFmDyLMddEnpbnEE+PDfA3GV3ADbO4gBOxnHLI/ItPDPEUnYEZlmaF35Qy
	 rE+8aDngu3M3LYGtkhwAKfy+TC+3Yn/nft1DwlCncu+rr/9xffYVTIJllgsKHDl7/i
	 yBKTwaOMIGq5w43JrsyTPxAK7PYPXTH5rd6cUMhP3hi1dfnsuqG8EeW9ZMHaVx4UK3
	 Awz8e2heI6UiDMSL5LBZqqKM0ayShoxMRDQPtz/aK1vzx1EJaY4gd7IfFNi+f9G63M
	 qLkyv4bOxNV+g/Aw9haEmapzKIRB5x7I/mOkn0lpPnU/7bQbLvgNH1y0YGQUAmufM9
	 Hia1acJ5iuFsg==
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-450f7f91845so868100b6e.1
        for <linux-input@vger.kernel.org>; Tue, 25 Nov 2025 04:26:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWw5O93P78Sgcqm5SYGYndM27HBJdCwuGRksvcGsqgmwru1ttdq7Bxp4LlMHxEFvaAbBx29oPL0Aaa5tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWH/Mso+cIlWAxQ/6PtXVF3wEaD3zt8iK8j2SPLBv/mgg2RJXB
	BExYYxSZgUw84BqAUR14bwtw9rIY/ygUKayglLGoZ/SGiySlK3Q8B76k7blIXNaZTUf5a+3nZX6
	g3MKNNLePYQJKtSi/ncBI6NgMSuWajrE=
X-Google-Smtp-Source: AGHT+IGYguZlNaP1Qrg6qHtt+XGD/CWfI1p4aoYHhE0zHc88503s37W5EZKx023bHPOtiCTf9Je+0Zcu3TCCmNUIDNU=
X-Received: by 2002:a05:6808:1a1d:b0:450:4cbc:b20c with SMTP id
 5614622812f47-45115aa5eadmr4879327b6e.37.1764073569139; Tue, 25 Nov 2025
 04:26:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107184438.1328717-1-usama.anjum@collabora.com>
 <20251107184438.1328717-4-usama.anjum@collabora.com> <CAJZ5v0gtGjE-rSwM4Kom4cDEhp3eSOkLCmbLwrt_9u9a7VP6zQ@mail.gmail.com>
 <6f1f3210-47c6-4c00-8fb9-35f48bae2581@collabora.com>
In-Reply-To: <6f1f3210-47c6-4c00-8fb9-35f48bae2581@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 25 Nov 2025 13:25:56 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iDUPB9s2fPJxqVqPGj5wbw54tR4thmDD2V-r4+Q2prwg@mail.gmail.com>
X-Gm-Features: AWmQ_bmYzcRJtuYDmncfjUQOlIEg9cepukxFQx45jUU5lmAWTSjkDX0FX6bWCqk
Message-ID: <CAJZ5v0iDUPB9s2fPJxqVqPGj5wbw54tR4thmDD2V-r4+Q2prwg@mail.gmail.com>
Subject: Re: [PATCH 3/4] Input: Ignore the KEY_POWER events if hibernation is
 in progress
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-input@vger.kernel.org, kernel@collabora.com, superm1@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 11:23=E2=80=AFAM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> On 11/24/25 11:50 PM, Rafael J. Wysocki wrote:
> > On Fri, Nov 7, 2025 at 7:45=E2=80=AFPM Muhammad Usama Anjum
> > <usama.anjum@collabora.com> wrote:
> >>
> >> Input (Serio) drivers call input_handle_event(). Although the serio
> >> drivers have duplicate events, they have separate code path and call
> >> input_handle_event(). Ignore the KEY_POWER such that this event isn't
> >> sent to the userspace if hibernation is in progress.
> >
> > Your change affects suspend too.
> >
> > Also, what's the goal you want to achieve?
> Two goals:
> * Don't send event to userspace
> * Set pm_wakeup for hibernation cancellation for non-acpi devices (This a=
pi
>   call should be tested on non-acpi devices such as arm board to see if i=
t
>   helps. I don't have an arm board in hand)
>
> >
> >> Abort the hibernation by calling pm_wakeup_dev_event(). In case of ser=
io,
> >> doesn't have wakeup source registered, this call doesn't do anything.
> >> But there may be other input drivers which will require this.
> >>
> >> Without this, the event is sent to the userspace and it suspends the
> >> device after hibernation cancellation.
> >
> > I think that's because user space handles it this way, isn't it?
>
> Yes, it depends on how userspace handles such events. There are different=
 settings
> configured for systemd-logind when power event is received. The purpose i=
s to consume
> this event to cancel the hibernation without letting userspace know about=
 it.
>
> Thinking more about it, I wasn't sure if all of such events are compulsor=
y to be
> delivered to userspace. But then I found an example: In acpi_button_notif=
y(), all
> such events are not sent to userspace if button is suspended. So it seems=
 okay to
> not send this as well and just consume in the kernel.

You want the given key (and it doesn't matter whether or not this is
KEY_POWER or something else) to play two roles.  One of them is to
send a specific key code to user space and let it handle the keypress
as it wants.  This is how it works most of the time.  The second one
is to wake up the system from sleep (and I'm not sure why you want to
limit this to hibernation) in which case the key code will not be sent
to user space.

For this to work, you need to switch between the two modes quite
precisely and checking things like pm_sleep_transition_in_progress()
(which is only used for debug and its raciness is not relevant there)
is not sufficient for this purpose.  That's what the "suspended" flag
in the ACPI button driver is for.

