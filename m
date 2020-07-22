Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153E922A01B
	for <lists+linux-input@lfdr.de>; Wed, 22 Jul 2020 21:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732022AbgGVTXM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jul 2020 15:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgGVTXL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jul 2020 15:23:11 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D61C0619DC
        for <linux-input@vger.kernel.org>; Wed, 22 Jul 2020 12:23:11 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id x205so1777369vsc.11
        for <linux-input@vger.kernel.org>; Wed, 22 Jul 2020 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68sOMskNUyISr4mOfQ0IHsxZDcffb/mqHEUKBilvfQ0=;
        b=FPi5JKXeOzAfy0v6o2K8uFkuH8ZuyeYKGv/YPoMau7cgmYza+IWzhCFDptqGzImndP
         YJTaL9fhY34z+VNOGWx6lbc33Q+5pPAwlGC4CwMvpa6iuv/2oQYE9MMBAJk0liARKMv4
         jmUXg7T45MANM4hFN0acWJQQ4AZUlWUPDBt6crE+UI+ahgY5fVp1iXXAVkkZrWS1F3LA
         pG9OhE8ErOqidbPOAOzdDG/ybo4vPm67n/viriHlqV9WcQdtk4r/i7VtTm3KF8AuEsg0
         5mDLjV1TWUv864stb1K4blOpshGvXE9bFbteF3KrAN52pWzUaoObvkB2oLgteJI+c7GR
         l7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68sOMskNUyISr4mOfQ0IHsxZDcffb/mqHEUKBilvfQ0=;
        b=jC+M421B2e26aLQ9/nhic7Z5+Z51yEUp3buriX0HP4OpC9qeXFsCHblCCAH97EqCHM
         KrB9lOV+dCJyEIXlba1U+3OEgs9w5lBmae5qZ3HmuOUOA6fh31aIsPsJKMzL0oOgaw3M
         evOfcAqaxswX7TpMpzRZlunpf0yIfJNVIN8aWo7rmWa65qLMo4816z57XnWdy5hlj2e/
         ImpNG04dRdiE3xzt77Nvu9ZKT7hxxbEDzyPbTppe1oybcqWqJRwsIDeH0MBYnilBIMd5
         vSzSDhkpPvK9Lj5JlcGS+uSZwIlVTlX6/Z6EHspvqyEZtpUy0CUB8VZvO+lWcjiXRj0M
         5viA==
X-Gm-Message-State: AOAM531fM2nXG9ceRLiCOOG/jGRHA/sknWFqnKCd/U5hHf2wqUIwPJ38
        pvQEFuUafHPOvLYKSN50fiDCbZWnqsxPMeu55zDPIpF2GIg=
X-Google-Smtp-Source: ABdhPJwJfEkiqXesIYMIkpLsn4WY4HoYehuOJS3CL/D2KXedemqh6Qr5A5PoKlkNJWKd8IXmAaqAYyCvQHJPxCSt4TI=
X-Received: by 2002:a67:e9d1:: with SMTP id q17mr1324303vso.212.1595445791032;
 Wed, 22 Jul 2020 12:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200317032928.546172-1-djogorchock@gmail.com>
 <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
 <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
 <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
 <CAEc3jaDsSmCB0-AQDrh4_Cw3WjAavfXSy6G_A+bEtBF0U5ydkQ@mail.gmail.com>
 <703dfd7eeeb0839a34f8668c3a0d79c1ffd3ed59.camel@hadess.net>
 <CAEVj2tnXNF0BCSdH46DmNRtxPRO7oHkjdmvJuCmiRz4t4pFWuA@mail.gmail.com> <292d45aa-cd32-3348-ce32-965281a52b20@valvesoftware.com>
In-Reply-To: <292d45aa-cd32-3348-ce32-965281a52b20@valvesoftware.com>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Wed, 22 Jul 2020 14:22:59 -0500
Message-ID: <CAEVj2t=Az1G6X9Kj050aXVetW+PX==LgoEM9C3ES886NsYygcw@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] HID: nintendo
To:     "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        Carl Mueller <carmueller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pierre-Loup,

On Wed, Jul 22, 2020 at 1:54 PM Pierre-Loup A. Griffais
<pgriffais@valvesoftware.com> wrote:
>
> Hi Daniel,
>
> Sorry for hijacking this branch of the thread (it's the last one that
> survived my inbox) - it seems like merging this driver as-is would break
> Steam, according to user reports.
>
> Is there any mechanism built into this hid_nintendo patch series to duck
> out of the way if userland directly opens the underlying hidraw device?
> That's what hid_steam does to coexist peacefully with userspace drivers
> (Steam being one of them, but not the only one).>
> Thanks,

I have run into the same issue of Steam/kernel fighting over the device.
I opened an issue describing it here:
https://github.com/ValveSoftware/steam-for-linux/issues/6651.

I'd been telling people to use firejail as a temporary workaround to prevent
steam from seeing the hidraw device. Note that hid-nintendo sets the most
significant bit of the evdev's version number to allow userspace applications
to discern it from the default hid device. There's no current mechanism in
the driver to yield to userspace using hidraw, but I can look at what
hid-steam is currently doing to accomplish that.

I guess the downside to that method is that any other process listening to
the controller's evdev events would cease to receive them (maybe a voice
chat program using one of the buttons as a push-to-talk hotkey or something
similar).

Does steam use hidraw for the sony dualshock controllers as well? If so, is
hid-sony doing anything special for that usecase?

As an additional note to anyone following this thread: I have a newer patchset
I need to submit which has a couple fixes for issues people have found while
testing (sets a missing power supply flag and improves bluetooth connection
stability). I will probably hold off on submitting that until we
figure out the right
solution to the hidraw issue.

Thanks,
Daniel

>   - Pierre-Loup
>
