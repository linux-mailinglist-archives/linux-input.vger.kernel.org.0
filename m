Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD7B240D600
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 11:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbhIPJXY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 05:23:24 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:40132 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbhIPJXY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 05:23:24 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 5DDB51FF4F;
        Thu, 16 Sep 2021 09:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1631784123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Kpv21NjILq9U7HHUl0C6OiYtbIBDXDdQLVZsWSCxONw=;
        b=I1ajtly4xaG5Jx00XMK2GTwCyJxMsfHzi9X8OzSwGnflhBvpTcOXPwQ0DtisIjOEjFGFV8
        D+OFFUHSC+VYLKEwzhhq+cb3ZAMuY52KiweTVKBPi17SknFJPiujOBfFpoUlaJvE6GxxtD
        uydbW6jpMOMMTWv0KNcc5OJpnywswsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1631784123;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Kpv21NjILq9U7HHUl0C6OiYtbIBDXDdQLVZsWSCxONw=;
        b=WLrMB9U7utEJK4JPD+XYJFdM/Tro6+XZywO2QfhbNeSreQQYmuEqAfWcCrdRmYsoAmw/OD
        UvzLm2laC7iKORAw==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 58423A3C6D;
        Thu, 16 Sep 2021 09:22:03 +0000 (UTC)
Date:   Thu, 16 Sep 2021 11:22:03 +0200
Message-ID: <s5hh7ekc1tw.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org
Subject: Re: Delaying i8042 probe?
In-Reply-To: <YT0zv6Rv1vURYTi3@google.com>
References: <s5ho890n1rh.wl-tiwai@suse.de>
        <CAOMZO5C-wFv0LmbHfZQUMMchJAwvxMxTs=eT6oby8O8k4QyoFQ@mail.gmail.com>
        <s5hee9wmy6e.wl-tiwai@suse.de>
        <CAOMZO5CACdcxGWn++f0+zhQaKevH7b5c-Xkv3QLBpwxc2GxizQ@mail.gmail.com>
        <s5hee9vlg8i.wl-tiwai@suse.de>
        <CAOMZO5C+gki7HT-n5D6qj06NbMxo2su2d6X+8AvM9PSmLUZ0jg@mail.gmail.com>
        <CAOMZO5DepuVScmDU7yZGVOVUs1JzHOd4bmu1z3erE2GNpcjZ+w@mail.gmail.com>
        <YT0zv6Rv1vURYTi3@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 12 Sep 2021 00:54:55 +0200,
Dmitry Torokhov wrote:
> 
> Hi Fabio,
> 
> On Sat, Sep 11, 2021 at 03:50:25PM -0300, Fabio Estevam wrote:
> > On Sat, Sep 11, 2021 at 3:43 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > On Sat, Sep 11, 2021 at 4:32 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > > OK, I'll update and let the reporter testing it.
> > >
> > > Sorry, platform_device_alloc() and platform_device_add() were missing
> > > in the earlier patch.
> > >
> > > New patch atached.
> > >
> > > Dmitry, does this look correct?
> > 
> > Please consider this one instead.
> 
> This is unfortunately is a band-aid. I wonder what other driver pokes
> the embedded controller on these devices for it to start responding to
> 8042 queries...
> 
> Does the laptop have the latest BIOS? I wonder what ACPI tables look
> like.

ACPI dump is included in hwinfo output,
  https://bugzilla.suse.com/show_bug.cgi?id=1190256#c1

If other format is required, let me know.  I thought this could be a
typical pinctrl thing, alas it doesn't look so.  The pinctrl-amd is
also built-in, and it's initialized before the input stuff...

And about BIOS: I don't think we can expect every user updates BIOS.
This report is not alone; as I checked through net, there have been a
few other reports for other distros like Arch.  On Arch, they "fixed"
the problem by reverting the config from built-in to modules (the bug
surfaced after their kconfig changes).

That said, even if it's a band-aid, we need some fix.  Can the
deferred probe be applied in some restricted manner, e.g. only for the
known buggy devices (and/or module option) and cap the max repeats?


thanks,

Takashi
