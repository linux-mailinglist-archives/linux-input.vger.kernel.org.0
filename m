Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9905A2BA10C
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgKTDUx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgKTDUx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:20:53 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44309C0613CF;
        Thu, 19 Nov 2020 19:20:53 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id v5so2476108pff.10;
        Thu, 19 Nov 2020 19:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3p5FWeIgIQJDLFuwmvUwM8rnwznunzbuQRUNmeAaAYg=;
        b=B30Q3iYe9gCaNBz2sxOyRZ9i7560KAOajQvFL68cyx4Dj5+zJOBt+IBiCU3eTTFjex
         6Dks0TOngmdsI8Ty4yEb9TJEjGUiJcTmRfW4dru8ig3Bs81daR70KQXOjj2Qv6zCG7hT
         +yW4Z+N+0Cm8SIYdHHA0fEDjhkO82Vec8t1lhRNHM14CVYnt9ELwebUrBXDi44GDrazj
         P4HGkdHORrCmqvHS/xjFH6+39YO3KolsOP8pK+ESe6iez017Mt9L4k1Nt8qbvLZCliGL
         tXLiswaVLB7B+NWEZHj4AmTOkB6PO1+RrbQRw+wrr5283BeO40z7pNSG6oz+DopXHger
         1oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3p5FWeIgIQJDLFuwmvUwM8rnwznunzbuQRUNmeAaAYg=;
        b=A3f9+r8UdfU/R+SWQAEJ9gvMfMEAv6PkweOO4LIF868vrOM02E4KTXtO70d7KJAdS8
         YwrioIarFNuLc7i26r4z2XJwGKEsjthMHjiH7+r7sU4l0Gt4ieRBpx81xvwaIRxWqxlZ
         Hxjmozf80amG6IYJDAangSitJLhqVfWF0Xytzkf+OVfvCmIJBHoRmW9BcE957IIHaBxx
         GrkzPaZgvMX0iqW5bnblOLsl4iBirtxdv0vCdyQGIIVY95G8wG7vjZySK1wHidwbx8Xd
         QKAmnu9dA090HXYt3thf6zd7GSc5bD8P7QWi9aiFUTGxOXA1+nrtUOhtIw+5GZHzLa7H
         O1CQ==
X-Gm-Message-State: AOAM533f9Cl+INtjob81RAnLlSn4HpHQrS1XoFCq8wyLxhMVI04esXMW
        TrxAHyKCVdJo2aNvfXBbnSk=
X-Google-Smtp-Source: ABdhPJyYIs1pLWgGzjGb0/rbHxgQilaJ6QiCEvSkMSTzj3R64MNZSGGC8/xJunstO5ztx9sPXxiWDQ==
X-Received: by 2002:a17:90a:460b:: with SMTP id w11mr7740164pjg.12.1605842452809;
        Thu, 19 Nov 2020 19:20:52 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u6sm1179645pgp.57.2020.11.19.19.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:20:51 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:20:49 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "K. Merker" <merker@debian.org>, authored by <andrew@goodix.com>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 13/15] input: touchscreen: goodix: Fix misspelling of
 'ctx'
Message-ID: <20201120032049.GS2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-14-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112110204.2083435-14-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:02:02AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/goodix.c:1168: warning: Function parameter or member 'ctx' not described in 'goodix_config_cb'
>  drivers/input/touchscreen/goodix.c:1168: warning: Excess function parameter 'ts' description in 'goodix_config_cb'
> 
> Cc: Bastien Nocera <hadess@hadess.net>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: "K. Merker" <merker@debian.org>
> Cc: authored by <andrew@goodix.com>
> Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
