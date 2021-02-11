Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6688319110
	for <lists+linux-input@lfdr.de>; Thu, 11 Feb 2021 18:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhBKR2p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Feb 2021 12:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbhBKRZc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Feb 2021 12:25:32 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA41C0613D6
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 09:24:52 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id v3so4719086qtw.4
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 09:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2abXiNl3RZRQjnO0dtD/c9PkPNV+MSnIZ1bJmImPtpM=;
        b=2DogJ1OE24n2sCTSMQdQ1dk03Pu7SJ18NjkG6AdLkl55s+3Su1QgwGrfgwXFOiM8LI
         pA0U7u9PJB1SCjW61yI6Dus/60yOB5XORxQfrhjIS+F1goAoI/SX43bYjNTQdkB5jOsJ
         Q5KF8uoObO9t7iqwOBCqbIxxcXDPjB1si8GixtZd6+mrIFNqCoOrbhU5xjj5rdAF9cbn
         AKCZA+EOZ0Oznsq6Nm67mM5dRe51lEWx9+cufSOmuKoIEUF6dupXUdBI0XXkvmnSRIZ4
         c+fwgAzhHv+ldwsVVFGxupTzPEPRcVPppLeCMo6bq3OS3sCBcdmIa3yIy6SlBo6vN23k
         1vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2abXiNl3RZRQjnO0dtD/c9PkPNV+MSnIZ1bJmImPtpM=;
        b=lewDP2Zi0he0Chwk8IW3sYif0gB2nXQ7FIWveaCJYaofj/3fYxyBajtMTfn84Qz8Py
         y9bzh7WARrDONjiqixLxRaKpAPPq7tLrqjZQW0Da1SCEuYmnRgVnZFnBM25+jZTyc28m
         lgX++mp1Nuz2axSt5TaDdQ8ddCy+3FvH/Ost0hvlHdYR4Ml4jphyxsE0LCn+uFDqcMSl
         TVXLy7j0RMeugFQUNE8wdh8ftrbswdEK1+ducp3xkM7OxzKRVq2ekIFVHrQc3sHrgmBo
         FUXILFc+u3Z2zZoZBMt3rB5n3A1jBDRvTJS59q+ILAxdizvywrhRr6r44jGuSRKcpqE/
         kPlw==
X-Gm-Message-State: AOAM532jOM0Cb8kfFW+fHxxHcw6SUUitIWMHkQvTuCeis7wGXqU2/3p+
        JJNggzh7w7sJSTHrTkQL4DSeQTOzYdoyxHEVh7erpQ==
X-Google-Smtp-Source: ABdhPJw31bdolfGirUYahAcdlzpOJyR9KEV+zob5BYCYsJtNeDgPWJRSQpcW/IPkMip5rrwxWwmHwbekLhBCeGUSL8E=
X-Received: by 2002:ac8:1408:: with SMTP id k8mr8503708qtj.204.1613064291740;
 Thu, 11 Feb 2021 09:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20210207214908.79573-1-roderick@gaikai.com> <CAO-hwJJ1JtY=o=n72X4m9Lcy=UNkFgukE5kfTEMWke+BvBuyeA@mail.gmail.com>
In-Reply-To: <CAO-hwJJ1JtY=o=n72X4m9Lcy=UNkFgukE5kfTEMWke+BvBuyeA@mail.gmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Thu, 11 Feb 2021 09:24:40 -0800
Message-ID: <CANndSK=1=aRKD5jZ6qqaHp-H+mMu_HOiJf4ozyT2zb_=3YFpHw@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] HID: new driver for PS5 'DualSense' controller
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        =?UTF-8?Q?Samuel_=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?Q?Florian_M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 11, 2021 at 8:07 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Sun, Feb 7, 2021 at 10:49 PM Roderick Colenbrander
> <roderick@gaikai.com> wrote:
> >
> > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >
> > Hi,
> >
> > This is an updated version with a few small changes suggested by
> > by Barnab=C3=A1s and Benjamin. It is mostly a few additional checks and
> > a few checkpath related changes.
> >
> > Changes since v5:
> > - Fixed a couple of checkpath warnings.
> > - Renamed firmware_/hardware_version show functions.
> > - Used DEVICE_ATTR_RO for firmware/hardware_version show functions.
> > - Changed player_ids array to static const.
> > - Added error check for power_supply_powers.
> > - Ensured devm_kasprintf return value is checked.
>
> Thanks a lot for the quick resubmission (and for Barnab=C3=A1s final revi=
ew).
>
> I double checked that Baranab=C3=A1s' comments were addressed and added t=
he
> rev-b to the series.
>
> The series is now pushed to for-5.12/playstation.
>
> Cheers,
> Benjamin
>

Great news! Thanks everyone for their help.

Thanks,
Roderick
