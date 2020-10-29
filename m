Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0043529F38E
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 18:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgJ2Rpa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 13:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbgJ2Rpa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 13:45:30 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF36C0613CF;
        Thu, 29 Oct 2020 10:45:28 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id i7so1021254pgh.6;
        Thu, 29 Oct 2020 10:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5f7qhadfWduXYz6g9qMehuuDkBNh1i8FL4UUvnf55YI=;
        b=keZVC2nCFfiWp+UAImpguKdH/WBVPGsrcpnD6Dh6qIcJ535Ze10ngriIhch0MFkPha
         Op2tUVv112FypuPXjD9Wu7BMr3KrU0f7u2HgWnTvOd9WwfvRS4QGRnEOt6SHxbqN3+Z+
         kYwitz5ypqB3FpanujsCutUeTwbwExBHbCCtZCP0Vsi//+X7H15gRQqEbMVX9blwDrwq
         thlS/klE5vI7p5MHpkW5CtGX4cRCwJhU9cvx5QB0X2zETYiJXEaXjxdiFuWTlcv1OJZI
         8NnXRqTynKh99K+SNpZB+tYhe6w7Vcr1du85COGdNyyHzYHP07bi3xeoVMjpxwQouCo2
         j5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5f7qhadfWduXYz6g9qMehuuDkBNh1i8FL4UUvnf55YI=;
        b=FRe67+cmpYPNkFASuyqR6CQgOv6GC3jgtK6dbqOW/27KFgy5Uyifek9JYdEzE974dD
         gkiij4rlplv9aaKBG3+tmwdQk8FhGLSpDRbXlSgAbdhq3KYf4c/fI5/McQdPiy7/il03
         Udwa/ptLqHgL9j3NRe1nDtwyPgx6gNXJlfS8iuDzJ6p2Lx7qBTAN3q5io6XK0JTYCX0Y
         7J6jY/Zeo7WJ1aTJ4ihfycNMr+7N4mjnBy3BgykIUKkf+oZSxr2Qi5d9rRTKJu3gfMtM
         zvtbviziRKdQnbO3gEx6X6dzeVoPjQlmsv5YbaVMsvorX2XW0NdsMFRN420vtIfBe3Op
         6r5g==
X-Gm-Message-State: AOAM533BZx0vHAZs1iREuLIWEEg0jpxl5+BEFJce01a3zsx63mx6f6r3
        t2k7Az0C8Lifhwd76j3hTd/56PalMOo=
X-Google-Smtp-Source: ABdhPJx5CnzFgnh3jVSCvERAlDXMwpRX4IPdJZehJnsRFjWmI4GZt0EKtYCRUvxXLoF89xOxOLrryw==
X-Received: by 2002:a63:1649:: with SMTP id 9mr4773894pgw.91.1603993528137;
        Thu, 29 Oct 2020 10:45:28 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id y137sm3514219pfc.77.2020.10.29.10.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 10:45:27 -0700 (PDT)
Date:   Thu, 29 Oct 2020 10:45:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     HyungJae Im <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        Jungrae Kim <jryu.kim@samsung.com>
Subject: Re: [PATCH v2] input: add 2 kind of switch
Message-ID: <20201029174524.GC2547185@dtor-ws>
References: <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
 <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
 <20201029135715.GB3470996@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029135715.GB3470996@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 29, 2020 at 02:57:15PM +0100, gregkh@linuxfoundation.org wrote:
> On Thu, Oct 29, 2020 at 10:27:47PM +0900, HyungJae Im wrote:
> > From: "hj2.im" <hj2.im@samsung.com>
> > Date: Thu, 29 Oct 2020 22:11:24 +0900
> > Subject: [PATCH v2] input: add 2 kind of switch
> 
> Why is this in the body of that patch?
> 
> > 
> > We need support to various accessories on the device,
> > some switch does not exist in switch list.
> > So added switch for the following purpose.
> > 
> > SW_COVER_ATTACHED is for the checking the cover
> > attached or not on the device. SW_EXT_PEN_ATTACHED is for the
> > checking the external pen attached or not on the device
> 
> You didn't answer the previous question as to why the existing values do
> not work for you instead of having to create new ones?
> 
> 
> > 
> > Signed-off-by: Hyungjae Im <hj2.im@samsung.com>
> > ---
> >  drivers/input/Kconfig                  |  20 ++
> >  drivers/input/Makefile                 |   3 +
> >  drivers/input/cover_detect.c           | 242 ++++++++++++++++++++++++
> >  drivers/input/ext_pen_detect.c         | 243 +++++++++++++++++++++++++
> >  include/linux/mod_devicetable.h        |   2 +-
> >  include/uapi/linux/input-event-codes.h |   4 +-
> >  6 files changed, 512 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/input/cover_detect.c
> >  create mode 100644 drivers/input/ext_pen_detect.c
> 
> If this is v2, what changed from v1?
> 
> And this is 2 different drivers, it should be 2 different patches at the
> least, right?>

Actually the should simply use gpio-keys.c for this and dispense with
the custom drivers.

Thanks.

-- 
Dmitry
