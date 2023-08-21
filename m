Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280ED7826F1
	for <lists+linux-input@lfdr.de>; Mon, 21 Aug 2023 12:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjHUKUq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 06:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234621AbjHUKUp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 06:20:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B12D3
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692613194;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6J98QdNCW3hGvq/vmAAFfh6AyiQr3+OWRF+NTVCkrzw=;
        b=OoLBAtgmyTc/1q1MQ2EjIijeGpZpyJLR+QJ7INDYvopoo4zdFj44n1IwhEkFBGPkSQGIZ5
        /z8f8oaTyaeehuUsR4lEzsmbvXGw79v5u0jWgsCuWgJqNaqHYiSXUtSOoB3shepSmvp4sp
        rwyqwOVmYUmA/D20UfsI0zdoPuTICUI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-evp1Y6iHOUu3MWMRgsOSFA-1; Mon, 21 Aug 2023 06:19:53 -0400
X-MC-Unique: evp1Y6iHOUu3MWMRgsOSFA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5256fdb3e20so1922457a12.3
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 03:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692613191; x=1693217991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6J98QdNCW3hGvq/vmAAFfh6AyiQr3+OWRF+NTVCkrzw=;
        b=Y4Sm894ueYEEtIAT8SosByuuBXlm4x2mL5KsOvh3xLcJs8EAyjFWp9+PJbtQHzFpS0
         b6AdBidwlUjVlYtwW8cdZ+KT9EzQIZB+4DlpBoFIZ+LYRgmQ9GjFyZj89XLf9Xmq9De6
         0hjEHpHw8rnwxg6j1jpynhPP5Qr11elGfiIPbJioARv+RcBEUaUPHsHQhIL1ImDODUZJ
         9eAW3187Ab78Yydv9lplhonecziixHlQhDYr/nv6/KhpHJ28cVp/LYDeo0dkmpBxh+E7
         ScC5Q3IIhNzCdZ37rYPSBJjrM7YfBFhzYKBAOZI4z+j/0J0UJYkMc2Y9s5MnZUo4xFyI
         nRNw==
X-Gm-Message-State: AOJu0Yx/k9XFZgZvox2niy6ITyvRS3BK07l0Y97IErNSMbIFo3wKCA8y
        zvZcsKlhWi1ptRLOrAIXi6vGiRd9wVk15DfCynPZFAUxCXIp8ILLgOBmECKrbHpLJoPWCVEbNYi
        NW3G2qnT3r+MpFaYbE/gaVRvr0WyBmpurUfMvS96WXNaDUSE=
X-Received: by 2002:aa7:d741:0:b0:522:ab06:7213 with SMTP id a1-20020aa7d741000000b00522ab067213mr4499901eds.27.1692613191320;
        Mon, 21 Aug 2023 03:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEczeFjtn1koyKYLXFdMW1w5mzWAvVlP2Ptfln+ymfh4TciXnX7kdQBk3KT1NYiJ34aiM9A/fFkyGmoZsUVwyE=
X-Received: by 2002:aa7:d741:0:b0:522:ab06:7213 with SMTP id
 a1-20020aa7d741000000b00522ab067213mr4499883eds.27.1692613191035; Mon, 21 Aug
 2023 03:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230703185222.50554-1-andriy.shevchenko@linux.intel.com>
 <ZMK60UphgVuj4Z+L@smile.fi.intel.com> <ZMydcGv8Dvu3Hje1@smile.fi.intel.com>
 <nycvar.YFH.7.76.2308071319140.14207@cbobk.fhfr.pm> <ZND/8wd67YbGs8d5@smile.fi.intel.com>
 <nycvar.YFH.7.76.2308141128260.14207@cbobk.fhfr.pm> <ZOMcHQc8Em/s6C+y@smile.fi.intel.com>
 <ez2oewpi3yeaiejrvbe433ude75pgm3k3s5sh5gnn7pvnzm7b4@ajuopfgwocft>
 <ZOMvpmoWLCgcAyJR@smile.fi.intel.com> <ZOMv4VB0bZpupNlN@smile.fi.intel.com>
In-Reply-To: <ZOMv4VB0bZpupNlN@smile.fi.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 21 Aug 2023 12:19:39 +0200
Message-ID: <CAO-hwJ+Pa0yMV5taEc9+RXEWJzkotpyj4gz2qftyLV4G73F-mg@mail.gmail.com>
Subject: Re: [PATCH v1 00/12] HID: cp2112: Cleanups and refactorings
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 21, 2023 at 11:35=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Aug 21, 2023 at 12:34:30PM +0300, Andy Shevchenko wrote:
> > On Mon, Aug 21, 2023 at 10:51:04AM +0200, Benjamin Tissoires wrote:
> > > On Aug 21 2023, Andy Shevchenko wrote:
>
> ...
>
> > > Long story short, I'm not able to test it right now (and I got quite
> > > some backlog as you can imagine). IIRC the code was fine, so I think =
we
> > > can just take the series as is, and work on the quirks (if any) later=
.
> >
> > Thank you!
> >
> > The thing that might be broken is interrupts handling. If that works,
> > I'm pretty confident with the rest.
>
> I.o.w. first 5 patches to test is already 98% of guarantee that everythin=
g
> is fine.

Actually I applied you series locally, and applied Danny's patches on
top, and I could run your series in qemu with the cp2112 as USB
passthrough.

Everything is working fine, so I can take this one just now.

Cheers,
Benjamin

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

