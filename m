Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB23236F297
	for <lists+linux-input@lfdr.de>; Fri, 30 Apr 2021 00:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhD2WaH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 18:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhD2WaH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 18:30:07 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E85C06138B
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 15:29:20 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id k3-20020a17090ad083b0290155b934a295so657022pju.2
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 15:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sgF8y4qSHbAjhen0CmXgaqp9XHrSaJSa2Q0ESkD13WA=;
        b=tq/cCsIlvCnJBh+3GLUA7LgqRyfI04kFbPdD9WHZk2Znx/Zt/POlsXiTUSE7byz8iu
         5Nk1Vml6RCrecdX0Mj8NfTIy1LQSsNzyO6qPu1Ap6FbanlAKVxZi9rt/bAz94dpFmhdP
         FfPfYN3B90VIAW3APEFFyEFrZ0j0A5AYYbc3AA0jQBzMncEU0jXHmk7au9r966Q/ys+/
         DxUOK+OrQVAGqrM9DkAGb5x8mHOXQdtvz9BFfKc3nWPEhYULmb1iHgD4QOlv27PydA8h
         RdJDISkmkSr6mOEBfrUxevPGXE8GzZGH/jVoCgaf3XUrCmcqI7n5fwkR9p98ECahB/2y
         ycuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sgF8y4qSHbAjhen0CmXgaqp9XHrSaJSa2Q0ESkD13WA=;
        b=nZrhvM9h/cS/aM7fglTgho8rGIBtVlOvDUt46X1XGpEYCieN9FpAiSuyg1INubo+y9
         74GZfkfYBdPtXPEQtZvo5+BAzNbQOjHX6EmDS54PoKgZLzGY0X7S0SVP4vVcZeSLMCz+
         W9eVgeXrDaVQQbVGfyJd3PPypEp6Xgo0RbNe0B28UlwvAC3ImiFgF2fQxxnD8QwcQCwN
         OKF6S2xJY3CoSZghx/0lnhfWtEMRbzjgdD9ecK1+X5dmHCeM+kYMBaZdI5rPXRwMwTqs
         xXG53enttn1CuFSyoqfeFKi+8JNPaAetgJiWbOcXRk3Chq/MmEkGRFMcRWrw86DVJxiu
         ypDg==
X-Gm-Message-State: AOAM533wS2ywi2K+bxy25YEuV+yFqA5pUq/dK9LTJf9yttkFsWqAM0gi
        J5EBigWXi0x9pMGJ2eFH+cc=
X-Google-Smtp-Source: ABdhPJwgS6dsHbtbdrmvAQv+WZG+s4dvsTwRZXxtfYQ5DPAe1rBRbtNpHlCFOQxg18hW22IsKoszwA==
X-Received: by 2002:a17:90b:915:: with SMTP id bo21mr2068048pjb.27.1619735359172;
        Thu, 29 Apr 2021 15:29:19 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6b9:8bd2:eb38:bd68])
        by smtp.gmail.com with ESMTPSA id j7sm2048pfd.129.2021.04.29.15.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 15:29:18 -0700 (PDT)
Date:   Thu, 29 Apr 2021 15:29:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Phillip Susi <phill@thesusis.net>
Cc:     xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Message-ID: <YIszOwADJ8jdBov8@google.com>
References: <87o8dw52jc.fsf@vps.thesusis.net>
 <87fsz84zn1.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsz84zn1.fsf@vps.thesusis.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 29, 2021 at 04:10:09PM -0400, Phillip Susi wrote:
> 
> It appears that input/input.c is responsible for the insane modalias
> length.  If I am reading input_print_modalias() correctly, it appends a
> "k" plus every key code that the keyboard supports,

Not every keyboard, but all keycodes above KEY_MIN_INTERESTING which is
KEY_MUTE, so that interested handlers could match on devices they are
interested in without first opening them or poking through sysfs.

> and the Xen Virtual
> Keyboard supports a lot of keycodes.  Why does it do this?

I don't know why Xen keyboard exports that many keycodes ;) In general,
my recommendation is to mirror the physical device when possible, and
instantiate several devices so there is 1:1 relationship between virtual
and physical devices.

In cases where it is not feasible, we need to be more careful about
declaring capabilities. For xen-kbdfront I do not think the keyboard
portion should be declaring keys from the various BTN_* ranges.


>  
> Phillip Susi writes:
> 
> > So I have finally drilled down to the modalias for the Xen Virtual
> > Keyboard driver being so long ( over 2KB ) that it causes an -ENOMEM
> > when trying to add it to the environment for uevents.  This causes
> > coldplug to fail, which causes the script doing coldplug as part of the
> > debian-installer init to fail, which causes a kernel panic when init
> > exits, which then for reasons I have yet to understand, causes the Xen
> > domU to reboot.
> >
> > Why is this modalias so huge?  Can we pare it down, or or is there
> > another solution to get uevents working on this device again?  Maybe the
> > environment block size needs to be increased?  I don't know.
> 

Thanks.

-- 
Dmitry
