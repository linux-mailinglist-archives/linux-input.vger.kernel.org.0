Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB323CAD6C
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241431AbhGOUBF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 16:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345635AbhGOT7x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 15:59:53 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3051AC0770C8
        for <linux-input@vger.kernel.org>; Thu, 15 Jul 2021 12:43:33 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id y38so11000604ybi.1
        for <linux-input@vger.kernel.org>; Thu, 15 Jul 2021 12:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mORWuxqNeQ7U8jR/CCtUOf5NVtBCfXa2jZj4bYl8nfk=;
        b=qNDafNjq4RXLuaxg7bl6omlNkm20cItvRjle+O1g4WWwkV36/5gGQW/NZ3Gu+4SrWg
         aZIc5H1QOvIlEDs/Nd0cBb6Z8+DVmQzzYCo7/DOOcJdsPjSb5mQk5nc4NC4ZGP9T4xQU
         xJIhJgvtYhJCNpVAL9sjQO6jx1gszNFQIUqV25i1zEOmib4C0FUA+7ozT6a+fn9LE/iq
         s2HkL/wmWSuAPkIGw6hOiRbVxPXiP39AjfPlJjtvQ6t5kzjCFZkyGrDVdOHoI3iKWJe0
         A/W8qh8xlNJKMjFZsRXlJ1dZ5PnWM/Vkl6w/SR0+D4mNRPbNC/au19Su/L6NndsUxkQq
         7G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mORWuxqNeQ7U8jR/CCtUOf5NVtBCfXa2jZj4bYl8nfk=;
        b=JYSpWrWYOKQV++ETm5LHv6kOIxYPzXrSktS+pQzgiSgiwa66Z/fAU+S+QRSblX7Le1
         JH2gc39YcUWS2p6lqoEXuWFwYjs5ccaxHFiBLBX0gvb6HKPj9cNH2G8J9+KkEhJSUAT9
         7bZSZi8g5i/Nz9gT5QqGK1e/VNMruslsCbUWyr+I2UYDtM80+B2X+FgG7HBXR1bjZQt8
         fHL+F20Digs8a2QTuHemhLvLujsQsyqcqAE358pLu7iPh3XT/dWoBWW388RWq75jy4aS
         t87Y47d2Dhki8isvNyupRvDSlJry0BXi8NszAtsjOBrQaK9o83zIScNSJGU4V837bLKx
         GKtA==
X-Gm-Message-State: AOAM5323LGMQ1IpGa608nVsVWnoyz2uQbASrpedzxHYWOUWebpJLq7NZ
        2U7w47kvYDzdMr8dduIyxrkyvlYjMnZWQLrobW4=
X-Google-Smtp-Source: ABdhPJxRYrFjkcuznDadgVAk9vvzEMa72C0BywsxInWEXAXdZjYL5etax9+/pOzUqfcEGBpjZ6rys0phomQEje1vt4Y=
X-Received: by 2002:a25:dbce:: with SMTP id g197mr7782098ybf.152.1626378212488;
 Thu, 15 Jul 2021 12:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210520224715.680919-1-djogorchock@gmail.com> <nycvar.YFH.7.76.2107152053100.8253@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2107152053100.8253@cbobk.fhfr.pm>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 15 Jul 2021 12:43:21 -0700
Message-ID: <CAEc3jaCHjYW+rr9L5WJAZu2gJ2RaA2uQ3=gJZKVK-Ny-dSOYWg@mail.gmail.com>
Subject: Re: [PATCH v13 00/15] HID: nintendo
To:     Jiri Kosina <jikos@kernel.org>
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        Carl Mueller <carmueller@gmail.com>,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Bastien Nocera <hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

From my perspective the driver looked fine. For me the only thing is
the LED naming for the player LEDs and any other LEDs. We are going
through the same thing now for hid-playstation and need the blessing
of our the LED maintainers.

Thanks,
Roderick

On Thu, Jul 15, 2021 at 11:53 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 20 May 2021, Daniel J. Ogorchock wrote:
>
> > I've neglected updating this for awhile. Not much has changed in this
> > revision. It has a couple bug fixes caught in the prior rev in addition
> > to altering how rumble is handled
>
> I have gone through this series, and haven't found anything outstanding,
> so unless anyone voices any objections immediately, I am planning to queue
> it for 5.15.
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
