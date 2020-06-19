Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AC5200909
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 14:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731681AbgFSMyH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 08:54:07 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39009 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgFSMyG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 08:54:06 -0400
Received: by mail-ed1-f68.google.com with SMTP id g1so7517979edv.6
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 05:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7K/WCv0y4HWup7B1kqubs+N2wcwkMd81KQFD40AGHRM=;
        b=ZAIghUKsRwaDMVvcXJaT7mQFaK7IZ/q+6rRqoLocHze1XNz+l6n2JJb1G1VpO/dctz
         GrPdtU2f4xLto4J/sXNB5qw3LhDD9Ke/YD9AR5l9VQyjYw6zZa6J4rAdMCQUtqlO9Cd9
         sCOyNYCWQZKLLd/NuuqS1JHqdoUrXWd2QFat77cGib72f3NKnLvKrwoZ9f+Qon32OJSj
         +Cn+zDydI+z2q/UgYLljKobkndALI7cUHyAu37oRmsz3tpMIygXDEao34P7oP40E/B0y
         JNkeoHoBe930DpuhCG7Ydu1z1s7EzoUaoEER1sqnIBlfT9wW4ig3ACMEvdBDCQPm/g8L
         7MpA==
X-Gm-Message-State: AOAM5301eWPvTMEDHA8nLZGWeRbKIpRuXohEdBQXknqWmNAVBuLIZBIm
        /ViKvRW6u4EyZMIxQKrReCdtXTBIADA=
X-Google-Smtp-Source: ABdhPJwwmqnpkUP06kdc8MY9rMSgojEtcfIMImsXBIps2K/k+T4dCmV3yKNetCgloPT3p8be+ThiuQ==
X-Received: by 2002:a05:6402:a42:: with SMTP id bt2mr3111792edb.42.1592571242455;
        Fri, 19 Jun 2020 05:54:02 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id js3sm4646701ejb.65.2020.06.19.05.54.01
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 05:54:02 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id u26so8775578wmn.1
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 05:54:01 -0700 (PDT)
X-Received: by 2002:a1c:6805:: with SMTP id d5mr1256239wmc.19.1592571241666;
 Fri, 19 Jun 2020 05:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
 <nycvar.YFH.7.76.2006190924380.13242@cbobk.fhfr.pm> <CANq1E4RK_QymZwTB_PORc20K9QaJ=Tonuj7_RJQUj-xvqdjH8g@mail.gmail.com>
 <nycvar.YFH.7.76.2006191340260.13242@cbobk.fhfr.pm> <CANFaMLGkbpO515c5MMKmH4MXcCKK-88qbVitQX3tizwF+iq3_g@mail.gmail.com>
 <nycvar.YFH.7.76.2006191416120.13242@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2006191416120.13242@cbobk.fhfr.pm>
From:   Daniel Morse <dmorse@speedfox.co.uk>
Date:   Fri, 19 Jun 2020 13:53:50 +0100
X-Gmail-Original-Message-ID: <CANFaMLFRpVpWQtJXtpc5iUsFk3QyS56m=VfMnoaU6OM=HLsG_A@mail.gmail.com>
Message-ID: <CANFaMLFRpVpWQtJXtpc5iUsFk3QyS56m=VfMnoaU6OM=HLsG_A@mail.gmail.com>
Subject: Re: [PATCH v3] HID: Wiimote: Treat the d-pad as an analogue stick
To:     Jiri Kosina <jikos@kernel.org>
Cc:     David Herrmann <dh.herrmann@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Jiri,

Thanks for fixing that for me. I thought that the patch in the
attachment was OK except for the metadata, but I just wanted to check
before I sent an updated version through.

If I send through any more submissions I'll move to another mail
client so as to avoid gmail mangling the whitespace. I only realised
it was doing that after I had sent the first version through.

--Daniel

On Fri, 19 Jun 2020 at 13:18, Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 19 Jun 2020, Daniel Morse wrote:
>
> > Does that apply to the version I attached as well as the version in
> > the body of the email? There isn't much I can do about the version in
> > the body of the email as I'm on gmail.
>
> That one is ok when it comes to patch damage, but doesn't have proper
> metadata (changelog, author, etc).
>
> I've fixed that up manually (and applied the patch), but if you could fix
> this for any further submissions, I'd appreciate it :)
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
