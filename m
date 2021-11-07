Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A68447130
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 03:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhKGCLY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Nov 2021 22:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233960AbhKGCLX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Nov 2021 22:11:23 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD25EC061570;
        Sat,  6 Nov 2021 19:08:41 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso6102171pjb.2;
        Sat, 06 Nov 2021 19:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3nnBpGdOeaJRDN69qh4dK4QvbfmyZ6Hj3OtdwnEorAk=;
        b=RxNp8e/+Ha6W/BWl/Oz+nDPj4ZE+6DGq85LSNx1ZDnbX7FTMUZZuOEZvt/AAGlh+at
         x/qxMSAJLH+YEqkP8djU4FsH+3j5ppw20yo7cqxaBkSOihwL9l/I29kp3wAcqveNKCFc
         gFU43nxBPNIQFJfP/IGa99zaGWQDNhteWFR/grvzMEJH5YfRNM4JeALu754g87hkn9Dj
         11lDqDXF4UNKzJVB+2TdjNVDeqPusIO1Ycka+32K3UsHS9+bVVQ1mKB+yJLDnvUNi6S2
         SXdCPPOtkPy5P8bjekJoUO9zbHgF044jVCM4sRkGyFsKtAluOP0xI77QffdsGdZoYJdS
         BDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3nnBpGdOeaJRDN69qh4dK4QvbfmyZ6Hj3OtdwnEorAk=;
        b=CDh7UAPuy02icRQqn2mxJzhYbK5zmHBkJDv33RYSO6q71jwc6lPT+n/nuK/k1WC9sz
         O7QqwWrWiZN3tntuZGBN6SysB/DiytDVjifu+j7r1QbPJ9ZetPEpVkACkyTyifDzhTH6
         5Lh3mvlxIw9EYyidbIABiw5e1OEkHG0kRkocumJlaqcHrYonNvYC501/dEoJjC2NckTt
         IEtii2d3Ncase8ffNCtZ9uNQB9J9JSnB8gbapvbvyyNMthCDFiHqselXlmg2mYAVRNW3
         qTljKLpEC4287+v0uPfTn0NH7RqKhRYA8rpgPfE6Mf278ce9oO+eUS2f0QKoXKPSg485
         YscQ==
X-Gm-Message-State: AOAM533iSgWhwwrZwPS+l40NOKdoCE8DFPUn9wX/N4CoitK0ZVmEvmrx
        w5oKMZAlAfPn2iMjb9ci78M=
X-Google-Smtp-Source: ABdhPJzC4f3H/uG3d7S8jVQErdyYWuUtFR5M0+mkgmOxFdn681h4AikMOWtFiwNiEGS73KLnXfk7dg==
X-Received: by 2002:a17:90a:cb98:: with SMTP id a24mr41775689pju.69.1636250919174;
        Sat, 06 Nov 2021 19:08:39 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:53c2:e6fc:3a1a:b644])
        by smtp.gmail.com with ESMTPSA id a2sm9121648pgn.20.2021.11.06.19.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 19:08:37 -0700 (PDT)
Date:   Sat, 6 Nov 2021 19:08:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?iso-8859-1?Q?Vin=EDcius?= Reis <itsme.vreis@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, angiolucci@gmail.com
Subject: Re: [PATCH] HID: hid-asus.c: Maps key 0x35 (display off) to
 KEY_SCREENLOCK
Message-ID: <YYc1I8aTLxd0FOE2@google.com>
References: <20211008222327.9324-1-angiolucci@gmail.com>
 <CAKdAkRTdCSC_6UqWkcT3p697+d0kwEqMSSR=M9vw-NPAjdZ4SQ@mail.gmail.com>
 <CALawNGC3HTV86+LAkMNf_nApqnUoAQ7UPEXOj9WXake5DhHkpQ@mail.gmail.com>
 <YYWoRW9NRC58zQ9w@google.com>
 <CALawNGBookRkFSGdGJrW1hboJ8kpsPj_rwAkNXQ3mU32oDv-sA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALawNGBookRkFSGdGJrW1hboJ8kpsPj_rwAkNXQ3mU32oDv-sA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vinícius,

On Sat, Nov 06, 2021 at 08:48:29PM -0300, Vinícius Reis wrote:
> Hi Dmitry,
> 
> Thanks for explaining this a little bit more, I've got the point: The current
> key code triggered by the kernel is correct, the real issue is the lack of
> support for that particular code by current desktop environments.
> 
> I'm new to contributing to the Linux kernel; the proper way to rollback
> this would be by me just sending a revert patch to the respective
> maintainer?

Has the patch been accepted? I'd wait for Jiri or Benjamin to chime in
as to what they want to do.

Thanks.

-- 
Dmitry
