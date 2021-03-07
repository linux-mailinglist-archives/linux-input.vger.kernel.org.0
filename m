Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E898F33052C
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 00:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhCGXNx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Mar 2021 18:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbhCGXNb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Mar 2021 18:13:31 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3C0C06174A;
        Sun,  7 Mar 2021 15:13:31 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so1957657pjh.1;
        Sun, 07 Mar 2021 15:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jGcwt7DEuJ68Ac2bsaHWCN7LSfJT9ajCQ9YM+pMaaiU=;
        b=f2SxAqJ3sBOCsYuLf96uInoECdBQ16qxhYvu8ZgXQ5CQaxuTxglbjBwzrn7QiZbmy3
         67983VSfwGSmDaqtlcPuIO1jVUcrEeUL5Za9/wvxw/vKjO7Urzt/Qu0u+C4u3Rue6v0M
         qKjHS6DNIGabGu/9zNbLBGx4NywL4QaWglvxFlmUMpyn/INXv5vKXs4qIoHcM+d4lMwK
         uUAf2ru3eScxGlF6X+xnNmKbOGVPcWJCtoRoJAOcVC5P/cBG83vMY73xnwbbL07bQIcS
         u0/c2fds35WOuWKxDVcYVcv7oTSylwQiDhgJD+/sbKCRE1qEzhC8E6nio2QvXhXbLvre
         sJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jGcwt7DEuJ68Ac2bsaHWCN7LSfJT9ajCQ9YM+pMaaiU=;
        b=Sj962aa4aurowgI5VjHbPSE42sxP14qYUVGmvFp9ymuQLq/QMGwrZ6er7IpuDnbCj5
         shyXby98kcawfW74ZjERr9VhKKbZQcAvlVqgyUeQwinaVbMrjl+lgdzsPiRY7Q+qNJQN
         5ZfxWsEBhwq8+LH3t2aOGNumAwKdLxGn7Q31DIOqCOjhacf5As/YJqPr5huwwJPsqYWR
         NW7VUY0BYJtEmUQqV5ehDxwfxDp3eVeL+RfXnobSPLgUxDT/NqLK67I7gAO2EgADtfuB
         UflDHHR2JNvbmTFAF+ZFjv7c6POARAhcuMK9ACdNr+OUOzALXeQk/+js/mP5DkztccKs
         FGEA==
X-Gm-Message-State: AOAM531HiNfy4AYYRW2Q0TNhKNeL/1n8ZbwJg+4dFESJ/pOHR7bxwTPa
        W0lMLdeNHXYo4g9XJY3P/xQ=
X-Google-Smtp-Source: ABdhPJwK+sK9iuVv30RZQmzbTOnaCRhhSu58z68pbkVfwTiJUvCz5eD/ZsdzmBkJ/svoOQWvRplM0w==
X-Received: by 2002:a17:90a:31cc:: with SMTP id j12mr21228287pjf.203.1615158811083;
        Sun, 07 Mar 2021 15:13:31 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bc9b:5ab2:d763:15bc])
        by smtp.gmail.com with ESMTPSA id mz11sm5855009pjb.6.2021.03.07.15.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 15:13:30 -0800 (PST)
Date:   Sun, 7 Mar 2021 15:13:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     andi@etezian.org, Rob Herring <robh@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] input: s6sy761: fix coordinate read bit shift
Message-ID: <YEVeFz0wFtLXRG7v@google.com>
References: <20210305185710.225168-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305185710.225168-1-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 05, 2021 at 06:58:10PM +0000, Caleb Connolly wrote:
> The touch coordinate register contains the following:
> 
>         byte 3             byte 2             byte 1
> +--------+--------+ +-----------------+ +-----------------+
> |        |        | |                 | |                 |
> | X[3:0] | Y[3:0] | |     Y[11:4]     | |     X[11:4]     |
> |        |        | |                 | |                 |
> +--------+--------+ +-----------------+ +-----------------+
> 
> Bytes 2 and 1 need to be shifted left by 4 bits, the least significant
> nibble of each is stored in byte 3. Currently they are only
> being shifted by 3 causing the reported coordinates to be incorrect.
> 
> This matches downstream examples, and has been confirmed on my
> device (OnePlus 7 Pro).
> 
> Fixes: 0145a7141e59 ("Input: add support for the Samsung S6SY761
> touchscreen")
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

Applied, thank you.

-- 
Dmitry
