Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A04D1CE24B
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 20:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729564AbgEKSJt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 14:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgEKSJt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 14:09:49 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5735C061A0C
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 11:09:48 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r16so8813973edw.5
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=axdoHiX9E6z9O7lAN4eJM1bsQRKBne5yAB3H/+h8jDM=;
        b=pCBQigc11wtctQrhrddWxgcndnZShc+/z9OMf8T4VHMM+1cdAAkcOmWgtZAMcn66pu
         zS8WA+SO43F1U2GypU0i5yTjnor1TFpf0+hpkPnOFAhH3FSWxGcb6HbiQJ4U43HDqAQu
         B/jNL272IWxftvkP9u2s7BcdwiqSuwOH5OgnKWc3NLhsRVhevnJN1zXEo++88+OgkFnu
         CWstudNpJXYqvIcm5Qyo6hjbwJeVAldAG1Kv0KWQL/Ua5vJh4ALBxJjISDNAwJQH2H2v
         5wusuWH3fxNAUBTUTJPjgElHG6Rp4PEWQ62oh/LAQipdxRST2PgrxY5jlUB7FhypBaLN
         AUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=axdoHiX9E6z9O7lAN4eJM1bsQRKBne5yAB3H/+h8jDM=;
        b=YFkx6L/mjMxsjRPBwlqRpZkgTFY8ef+VTCLNZ5eA6pYNTpweTpSFGNanRzneJ+Kgcn
         nnaSlCjfMLHyuOqBo78e5Sim2WSwc2vA4mOdAo/sCGM2vNnirgkevjooDpC1uFvnexeZ
         wAnPsfScb7o9Diyzn3rIsSONrJSb2YpU7YHIHOfoVM+OhpO5vrI5MagZnardZd+UvHd9
         wIsBFwfTAYynez/7GXS9mpVQGug+sjOwa9dgHzE/VWafImPl9sV5zQKduWojT1+SY5Jk
         GWcpeWuieXSGms9HzY8S8K2Tr1S4ms46FCqi6TmKac9Kzb1S9EgNaBTiCd+phQhpSGs8
         a5cw==
X-Gm-Message-State: AGi0PuaLRqFlSS2vJ8WAZk6LTL2v21x096uYuu5KYDKkNG6n8ZGDdXgw
        amXWapmjD8kBXTeeErOIJoj3r7i6vH+WTrixMnZ7ag==
X-Google-Smtp-Source: APiQypIwWGJrvuX+5hzjHxYL8usxaDlkoTqXFooOIQIAKMfOcW2cvWbLbaiQq0aotOUuoXxCrU16dVTRcG/7RKrWNkM=
X-Received: by 2002:aa7:c6cd:: with SMTP id b13mr9376377eds.314.1589220586234;
 Mon, 11 May 2020 11:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAKF84v2gWnokoyhRe_feiWJcYOAPUcWwjaX93GkqmXqm8OzmYg@mail.gmail.com>
 <CAKF84v1yRUjvxdWUNXdKXFQw7=9rjR0+pwvXP1ORjq5JEijc4g@mail.gmail.com> <CAKF84v1R4xs3HKH8v-SnBrZ2eEVim2W9OPD+BWPQchpfVJTHXQ@mail.gmail.com>
In-Reply-To: <CAKF84v1R4xs3HKH8v-SnBrZ2eEVim2W9OPD+BWPQchpfVJTHXQ@mail.gmail.com>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Mon, 11 May 2020 11:09:35 -0700
Message-ID: <CAKF84v3+qPu2pRgqmBOKNJqbkqKjJ8ihZXaK5JnNdu9Tn77EuA@mail.gmail.com>
Subject: Re: behaviour change for keyboards introduced by "HID: generic:
 create one input report per application type"
To:     Garfield Tan <xutan@google.com>,
        linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jkosina@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Bumping this back up, it would be awesome to receive a response on this.

On Tue, Apr 21, 2020 at 2:37 PM Siarhei Vishniakou <svv@google.com> wrote:
>
> Bringing this back.
>
> Any thoughts on this Jiri and Benjamin?
>
> On Wed, Apr 8, 2020 at 9:45 AM Siarhei Vishniakou <svv@google.com> wrote:
> >
> > Hi Benjamin and Jiri,
> >
> > Could you provide your thoughts on this?
> >
> > On Wed, Apr 1, 2020 at 1:02 PM Siarhei Vishniakou <svv@google.com> wrot=
e:
> > >
> > > Hello linux-input,
> > >
> > > We have noticed a recent behavior change introduced by the commit:
> > > https://github.com/torvalds/linux/commit/f07b3c1da92db108662f99417a21=
2fc1eddc44d1
> > > HID: generic: create one input report per application type.
> > >
> > > We have been looking into the behaviour of the Microsoft Designer
> > > keyboard. Prior to these patches, the keyboard would report as a
> > > single input_device to the user space. After these patches, the
> > > keyboard is now split into 2 input devices: =E2=80=9CDesigner Keyboar=
d
> > > Consumer Control=E2=80=9D and =E2=80=9C"Designer Keyboard Keyboard". =
We noticed that
> > > this behavior also applies to the keyboard Dell KB216. In the Dell
> > > case, it is split into 3 devices, which include =E2=80=9CConsumer Con=
trol=E2=80=9D
> > > (for some of the media keys) and =E2=80=9CSystem Control=E2=80=9D (fo=
r the sleep
> > > button).
> > >
> > > In both Microsoft and Dell cases, these are pretty standard keyboards=
,
> > > although they do contain media keys and power/sleep keys.
> > >
> > > Could you please confirm that this new behaviour is indeed
> > > intentional, and that you wanted keyboards to be split in this
> > > fashion?
> > >
> > > Thanks,
> > > Siarhei
