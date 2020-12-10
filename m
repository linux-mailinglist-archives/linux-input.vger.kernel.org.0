Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E162D5213
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 04:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731259AbgLJDvs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 22:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730914AbgLJDvk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 22:51:40 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F91AC0613D6;
        Wed,  9 Dec 2020 19:50:56 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id w4so2912898pgg.13;
        Wed, 09 Dec 2020 19:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dPjBPu9cpVHm88U4UD4X9nEgu/9xVZnUbnkc3WRW/cg=;
        b=Xv/s+xlZMiLSZWX+ND3o48l0FgwqnOv4VROLyirBreykQjZf4IFmMY7DdY7/L1zaSr
         QwJXsXKnxSAAqSQoRQ/uNmsJLER7TMM0Riyg+rBlYoUemtxD74hWG2Wmh/Hv4jPuRCoJ
         zyZI0f0TdSokk7KovYhCbppBVFAOx28xz9MbO4GghM6j1ZpVwe5PY0aPK/FcD1a3eOQ/
         eE3VTmreM2haOiJmHMiIWnZvWbOLxvvLNGkTwlApr1ZjF0FOh82kcDc0/oVZnB07jkbu
         EqKK4ZI9+lbI6Gcvmq3fQl1moc5+VO5bxrpwE7mqY6PJT0bQ0WnU916FgOOLKXAmRM+B
         X5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dPjBPu9cpVHm88U4UD4X9nEgu/9xVZnUbnkc3WRW/cg=;
        b=Q3j71vwimTDb6NeCswy9r8TM8uqY6noRduc64ImsJE0xRSDYj2SW9jYpv9semxx8uJ
         1JyvZSTblqOxUjakCdtZJyaM+KgAJ28kQ5RLe0Q275LNw4zYbTVRLp63hnefmGKJ5tnO
         NAEeZB/HNppS+TnT0cn4YjANAaBT1XUueiXQpyUiYAbLvjR5/meJImHl3v5Vn1o22DFe
         cYA1xO6ZzIU//W3D/Zn9Pu6CvjA+hNqTa9OYybyQGwh7WsedQSYYxLTFcy9aIfkV8X09
         NxvWtLW0f/A8Fj3fzumBQ9pCvEwx7xXWdStjiqbRIP61cRYTgxILh2+zJfTBVvdwWWdS
         oYkw==
X-Gm-Message-State: AOAM532OLT+mqF2xKI4qzve+9AVzCsAtL+Tv3cQzxxhOCmKjTX/Yd1mM
        m/6ISetuMhKKbMroJp5AaiY=
X-Google-Smtp-Source: ABdhPJyItofwmN2r3pwSo0qZOvIQSbw+Z3qM7Tikc+jG3quB2W/oC/cQsN3q/VA944mKVXhIOitg4A==
X-Received: by 2002:a62:d003:0:b029:19d:cf06:f8c2 with SMTP id p3-20020a62d0030000b029019dcf06f8c2mr4988085pfg.48.1607572255888;
        Wed, 09 Dec 2020 19:50:55 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q22sm819494pjg.15.2020.12.09.19.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:50:55 -0800 (PST)
Date:   Wed, 9 Dec 2020 19:50:52 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: Input: tm2-touchkey - document
 vddio-supply
Message-ID: <X9GbHHC2I6KY3D1/@google.com>
References: <20201203131242.44397-1-stephan@gerhold.net>
 <20201203131242.44397-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203131242.44397-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 03, 2020 at 02:12:41PM +0100, Stephan Gerhold wrote:
> The Samsung touchkey controllers are often used with external pull-up
> for the interrupt line and the I2C lines, so we might need to enable
> a regulator to bring the lines into usable state. Otherwise, this might
> cause spurious interrupts and reading from I2C will fail.
> 
> Document support for a "vddio-supply" that is enabled by the tm2-touchkey
> driver so that the regulator gets enabled when needed.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Applied, thank you.

-- 
Dmitry
