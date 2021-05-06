Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4ECE375C2B
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 22:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbhEFU1y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 16:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhEFU1w (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 16:27:52 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5523C061574
        for <linux-input@vger.kernel.org>; Thu,  6 May 2021 13:26:52 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id m11so5955221pfc.11
        for <linux-input@vger.kernel.org>; Thu, 06 May 2021 13:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6PS4r5ihm0TuTFmfAJ2NxYhkHmZSjT5J6bjZKfQ3GX4=;
        b=lJX8V3dsO+IedLBuCkDF8k0tvFt6ddIGfxv2EHMfH8XYiqjCm/tMVd46N+tDLqBBSO
         uVwM8SLavveoTp/5so3jz4RDXzHuvGavDxV00ZmfzespKFCvm7A8QAIRhm2luq+CX5YD
         kR1HyIpgjjKOLXFZmGd0w5iqP8MIdvhkwIGKxjYYOqrvgrYMae/AQ20xUC1mQdtH/whN
         17rHE5ybJVP66G87wFYxfYtX2/5PjYKbGbENgp5siKPyBNOFZloGfur4kjXXZpf0OHPl
         MZBgcfdxgf1SsT4LmajECuDWxLLhz/c2DGind/Orbv0so7nK3vSrriqZtGCvizuvY91N
         6rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6PS4r5ihm0TuTFmfAJ2NxYhkHmZSjT5J6bjZKfQ3GX4=;
        b=XHbGK99Cmn7LANl0n3N892rvDzdOFfsIwZgVX9MVXENK7mA+8w8XQzY+qT5qXS2USt
         MgLzVjDnX87gfiYBzJZjFXa75noES+TUEbQQmH6YgYnoxjZJPQJ6QaSTMzC81P4dCmHh
         btEg70xBYih46qGdnJlgpHlruZEgmfafCucCaJ7ija5TeLJGrYsbIK6mfgWvuQtrVwN5
         pTPbeMjpY4HztZ5RRgJ7UGIlQv+q7MQ43pc8drt1zEh6q146/vIN70+V2+9xK+v8RjM5
         n7dC7djvQKhma50Cko2ucBtn69izAuMpwaTRJmsnLBsMOY49Y8IPvHsZvmmOXI63AX+a
         hUGw==
X-Gm-Message-State: AOAM532SewnSeykN6QJ3W/CLnCODlU74RfNSueSy2v7KquLz45F+6iM3
        S430D+3H0YnaSOJ6nB1BlRNzkHe/8ms=
X-Google-Smtp-Source: ABdhPJwyOd9a/hNWBoTSoQpiUH3+3o7sEIxqT9F2v1nZL3DFH01uXnAbmQ64QQV0BapasH5VDSAa2w==
X-Received: by 2002:a62:1517:0:b029:28e:a871:ffb2 with SMTP id 23-20020a6215170000b029028ea871ffb2mr6632315pfv.19.1620332812328;
        Thu, 06 May 2021 13:26:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5228:3770:a497:742])
        by smtp.gmail.com with ESMTPSA id b2sm10735266pji.28.2021.05.06.13.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:26:51 -0700 (PDT)
Date:   Thu, 6 May 2021 13:26:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Phillip Susi <phill@thesusis.net>
Cc:     xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Xen Keyboard: don't advertise every key known to man
Message-ID: <YJRRCEJrQOwVymdP@google.com>
References: <87o8dw52jc.fsf@vps.thesusis.net>
 <20210506143654.17924-1-phill@thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506143654.17924-1-phill@thesusis.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 06, 2021 at 02:36:54PM +0000, Phillip Susi wrote:
> For reasons I still don't understand, the input subsystem allows
> input devices to advertise what keys they have, and adds this
> information to the modalias for the device.  The Xen Virtual
> Keyboard was advertising every known key, which resulted in a
> modalias string over 2 KiB in length, which caused uevents to
> fail with -ENOMEM ( when trying to add the modalias to the env ).
> Remove this advertisement.
> ---
>  drivers/input/misc/xen-kbdfront.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
> index 4ff5cd2a6d8d..d4bd558afda9 100644
> --- a/drivers/input/misc/xen-kbdfront.c
> +++ b/drivers/input/misc/xen-kbdfront.c
> @@ -254,11 +254,6 @@ static int xenkbd_probe(struct xenbus_device *dev,
>  		kbd->id.product = 0xffff;
>  
>  		__set_bit(EV_KEY, kbd->evbit);
> -		for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
> -			__set_bit(i, kbd->keybit);
> -		for (i = KEY_OK; i < KEY_MAX; i++)
> -			__set_bit(i, kbd->keybit);
> -

By doing this you are stopping delivery of all key events from this
device.

Thanks.

-- 
Dmitry
