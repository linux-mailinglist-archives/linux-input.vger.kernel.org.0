Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241E11B948A
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 00:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgDZWbb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 18:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgDZWbb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 18:31:31 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202CDC061A0F
        for <linux-input@vger.kernel.org>; Sun, 26 Apr 2020 15:31:31 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id q7so4180063qkf.3
        for <linux-input@vger.kernel.org>; Sun, 26 Apr 2020 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rt68c2EqLz1g59uY27LQ1sf1pHv/YngA9vLG8cjHRS4=;
        b=FErjPNxXWvyBq7GxkngpEMpj8JWCoOkULL+GbtFWS7/PZ/MbPBqNvl+RZnVPU+tdjz
         MXtKhlEp+uLOWnyUL2D+J7QnrwhR/fD3IH6BmpjCmqgeaOyvEskLLKG2ZtKvXKAM1iyP
         6lhClCBDLovC0n3tf2WS7o8grOdAzDGofeJWQNac2mPtSVVkZt9mAUWLmJCJ7LsbI4OA
         fmtre6ot+FpBgiLozSwdHkyAqXvntFH5Xo7w8GbfpqnBA5Ngd/d2vfF93ZuapOUjjN9y
         4vfH4meZKxl0FMGaXP07S9jknqe0CqHBPjhi5wQvRhWb4AGENRxTMi6/RbhZ36XXDa0c
         VlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rt68c2EqLz1g59uY27LQ1sf1pHv/YngA9vLG8cjHRS4=;
        b=PVVjwO9iDzzCLSy8ulDf75UQaLw5BxMt8U+04Fi0cfYAjj+uTf6V5CdamOg37Bsqzl
         5TgSVLpx6HolJ2A3oe3dv479r+M6BahLegOcGuLOL0JCG6PEfyODlJrL7VMZ6X56hlaZ
         WRdazvJf1O5d5btCoMy+Xg+5uxZcY8xuqE0npnibAmO14E/AvJhqwsvogPehc+fxPmPx
         8cA1wuORLGHJGTo1vrV/1cZbkgiNGuKN5gNVUfI+ud0RDlgztR0zpNpeMXPTeGDM8qEK
         pfaOcjgtcO5L01Q70evp5O+Bz1fppvxQQ4Ki2e2ZhxUjIJgXxZlYf0iwx3dpK3Ctisyr
         f+9Q==
X-Gm-Message-State: AGi0PuZQoZie4Yj9x3OuvYfWsdi9WCtmm7HT8b08zEFYqwXn6eZ0AmUl
        NgHGL75Q8XVDCeqTcSYf1/9i6eapw7OoEpl6Aik=
X-Google-Smtp-Source: APiQypIi6I+qUdWYIT7j7dVVFskyTYQFsGPH2D0IHpnM2QpWIh0bXJvlhMU9IrRQyiTkV6qeBSu1Ef74v9iIOqARYBE=
X-Received: by 2002:a05:620a:844:: with SMTP id u4mr19617074qku.20.1587940290212;
 Sun, 26 Apr 2020 15:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200317032928.546172-1-djogorchock@gmail.com>
 <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
 <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com> <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
In-Reply-To: <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Sun, 26 Apr 2020 15:31:18 -0700
Message-ID: <CAEc3jaDsSmCB0-AQDrh4_Cw3WjAavfXSy6G_A+bEtBF0U5ydkQ@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] HID: nintendo
To:     Bastien Nocera <hadess@hadess.net>
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
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

On Sun, Apr 26, 2020 at 2:14 PM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Sun, 2020-04-26 at 13:42 -0700, Roderick Colenbrander wrote:
> >
> <snip>
> > I really wonder how a device like this should be handled. It looks
> > like the device can also handle a bunch of other classic Nintendo
> > controllers.
> >
> > Is there anyway of detection this adapter? It feels nasty to have to
> > hack in quirks for this device...
>
> The end game isn't very different from how we handle XBox 360, or
> PS3/PS4 "clone" devices.
>
> Those devices (the adapters) work on the actual Nintendo Switch
> hardware, so should probably work with the driver that handles the same
> type of hardware on Linux.
>

(resend in plain text)

I agree it probably makes sense to handle in this driver. I'm worried
about the application level implications. We have been doing a lot of
work e.g. on Android to try to make gamepads consistent. It is weird
to have a "Switch controller" with different features as applications
make assumptions and don't expect there to be multiple versions of a
particular controller. Any button mapping files would potentially be
wrong for those too, certain features are not there (e.g. no sensors
or no lights or rumble) or if they are the behaviour is different
(e.g. HD rumble vs a classic rumble motor).

Ideally we would do some kind of "fixup" to change the device name and
or replace the device ids to at least separate them.

Roderick
