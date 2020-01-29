Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7022D14C65B
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2020 07:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgA2GIa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jan 2020 01:08:30 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33588 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgA2GIa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jan 2020 01:08:30 -0500
Received: by mail-qt1-f195.google.com with SMTP id d5so12424748qto.0;
        Tue, 28 Jan 2020 22:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XSsdezcj4dG+mQwXOhVLjFrU3arbmVdqxIXjBy6aTQk=;
        b=unu9sTAC770niJyIOKL2Eilh2pMycRYRTt29Z8AeiVOpg0EMXWODFBJcSKLLYFOF/0
         YJ/U79FE5M3LFEGI3mY9+cGUdtDqE1Vh7wjGScAOxX3xfa3e/WzhYlirvoOtQPUb7aAk
         B2yNT82RSsVMZromy1NexPvwh9f8FktI8/E91U+L8SvObcKA74NK7Pxuw5xpxOKST4Ac
         OaYptmFD9JKQFC8aGMy0X6+Ey3nyrmAWg613vZE85rr/9idXtkSYQCQM3KG0TW+4Vnri
         NM1Xc6lqlQhhFP2iA1a/ez7/IziOEysUwdfwRVdbkjuGynqtuMqNKXwu6KhYDFdZlosZ
         ZnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XSsdezcj4dG+mQwXOhVLjFrU3arbmVdqxIXjBy6aTQk=;
        b=LaaIoVI3p+wJhKsYc34LS+71TswQ6PUL61rslsJ8j/QYQcdae2vaJZhrNY8bznR5pQ
         P33gJcwwvJlqQm3xPC5GZXi/V21QKZCxDkOTc6rFYJ6/K0UIdV7yw3lqIhH/tH3KU1Hs
         myG7VAMfdGj2U/MW8bK8io2fKhQ5eRk492UBOjDLsNMrZLHaFY5hhT93DUit1QVo4zTn
         Px2/g6JuhZ1pmM7yoLfvD1+8/U/OjwlG0VdwxRuiVlXgD69hnnVOBLWf4/7AT8ghXDO6
         ZzzZKElNTXFXvxT2t3TJRUXe/edcz3rQTnY5DlwlsW2iKX9gHvzBkEO/j4WPqa4e6OqL
         f6Lw==
X-Gm-Message-State: APjAAAUIW6gjpk5oO9qI9o0/Pue/Gkdc0TDJWds6hv3G37eBxZp2RunS
        J2HIJwELORY+2/HEG9qithQ/aFl/6mUW+8KhHOs=
X-Google-Smtp-Source: APXvYqxvSSiUSFJBwX3yjsjDIoIuBmp6Zq/TSfyo5m+te6q/fjs3XaiYsEgMqBYfabWxsKuUjEZStjhJLT4WuIFxdhU=
X-Received: by 2002:ac8:70d5:: with SMTP id g21mr12306205qtp.46.1580278109295;
 Tue, 28 Jan 2020 22:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20200126194513.6359-1-martyn@welchs.me.uk> <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
 <nycvar.YFH.7.76.2001281109030.31058@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2001281109030.31058@cbobk.fhfr.pm>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Tue, 28 Jan 2020 22:08:18 -0800
Message-ID: <CAEc3jaDpHzxOVNLoAtVLRV_5b2kkSgGBepe1y4P6Rdjgd_rkOw@mail.gmail.com>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Martyn Welch <martyn@welchs.me.uk>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Conn O'Griofa" <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 28, 2020 at 2:11 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Mon, 27 Jan 2020, Roderick Colenbrander wrote:
>
> > Thanks for sharing your patch. Though I must say with my Sony hat on, I
> > don't really like supporting clone devices (they hijack our device ids..
> > etcetera) and we support hid-sony in an official capacity now across
> > various devices.
>
> Drifting away from this particular patch a little bit -- given this
> official support from Sony, would you be fine with putting this into
> writing, and adding yourself to MAINTAINERS file?

Of course that's no problem. Over time I need to figure out how will
maintain aspects of the driver though. I belong to the game console
division, some other devices currently supported by the driver (e.g.
TV remotes, Vaio laptops) are other divisions, so that's a challenge
as we don't know anything about those devices and don't have
datasheets or anything. Maybe we will slice the driver in some way or
something.

Thanks,
Roderick


> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
