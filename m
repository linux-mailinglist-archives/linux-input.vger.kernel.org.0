Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7141B3053
	for <lists+linux-input@lfdr.de>; Tue, 21 Apr 2020 21:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDUT2f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 15:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725963AbgDUT2e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 15:28:34 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4783DC0610D5;
        Tue, 21 Apr 2020 12:28:33 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so1831543pjb.3;
        Tue, 21 Apr 2020 12:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ylAfLFxsriqqePphFNepgAUrNjlPLS6CtzpqdHOIzFc=;
        b=kha6OSbMInYcR9hm2zEI4iW2rTk379V3SLY+qdnGPuuh7YiO6Ds8IwXpMj3ruCruxX
         TUkUFOV5mrR9VhYMh7d9p8FH/FxmnIEO1+PU4ALzbok/93K4jYK96C2QMa1FHW7AF+Wl
         G5iFQS858+MqaCdBCOyvgxb8fpixLU5ncqS9iM9nuOwB45vU/YUMvrQNKxg3RTHaoMCR
         4ykMNSyaugFvsHcXnS55Ny+qpuKgFwuTWMirAzQgie0P7ViKveBfLCgwbdHO3Pks53Je
         i9u3Mf+hWK7a6xLXsUxTpwvm9qFrb48Dlp55wmdYyAfLAX1PL+IgjG/6quSwfUJJDNwh
         B1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ylAfLFxsriqqePphFNepgAUrNjlPLS6CtzpqdHOIzFc=;
        b=nnBgGgXNfLVWt0j4zJo7+UabSU0FzX5Md69b6Cd443LjT97peiqaleeY4MXftPodGP
         l9fsL5TlK+8COndHoaeRdold8PebqSnPKJOAYe5DCYSB1GX0V45nkEUAxZcL8+73Dcgl
         xBiH+hFGGpiBewRgKUCN7grtHjsXdCkKYp6xbHBANFQacd2Vk/BepEQlxgKUS8HdbWMq
         K5b7hUD9pR45V/4NMmuLMBklm/w/TH/3N4kKoqk0ExXq1tog2QzOkK0m7bieBgZruJa6
         loLYIPajR95dmNOgmHEglsZYXHT8k7FBs/TrnGgwU5ekjZ0X6kZad6Y6fe987+P3FqKy
         AN8g==
X-Gm-Message-State: AGi0PuYqHjWhvXsufp+lZGj8a+RonBgZtwB2DUbXw37kLffjmPHXjf+Q
        Hzd4w1atY2nqzn0Z0HGrmt8=
X-Google-Smtp-Source: APiQypKa7+JJBgKWMKENf1y38p33ouL8FwaQ2E3Ko3mn7fuLxfJvmhBJyaH9VbcgEiIgNxIey9DUxA==
X-Received: by 2002:a17:90a:d0c5:: with SMTP id y5mr7257509pjw.67.1587497312525;
        Tue, 21 Apr 2020 12:28:32 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id o63sm3326604pjb.40.2020.04.21.12.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 12:28:31 -0700 (PDT)
Date:   Tue, 21 Apr 2020 12:28:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Brendan Shanks <bshanks@codeweavers.com>
Cc:     linux-input@vger.kernel.org, rydberg@bitmath.org,
        linux-kernel@vger.kernel.org,
        Mathieu Maret <mathieu.maret@gmail.com>,
        mmaret@pixium-vision.com
Subject: Re: BUG: ff_effects lost after a fork
Message-ID: <20200421192829.GB125362@dtor-ws>
References: <20191127101008.GA327265@nuka.localdomain>
 <5404D7D5-47EF-4399-B0D9-B3C68A3D5895@codeweavers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5404D7D5-47EF-4399-B0D9-B3C68A3D5895@codeweavers.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 21, 2020 at 11:53:19AM -0700, Brendan Shanks wrote:
> 
> > On Nov 27, 2019, at 2:10 AM, Mathieu Maret <mathieu.maret@gmail.com>
> > wrote:
> > 
> > Hi,
> > 
> > I'm using evdev for vibrator interface.  I can register ff_effect
> > and play them.  But, if I do any kind of fork, all the effects are
> > flush and cannot be used.
> > 
> > You can find, below, an example of such a program.  From some trace
> > have put in the kernel, it's seems that at the end of the system()
> > call, evdev_flush get called.
> > 
> > evdev_flush() will call flush_effects() that will remove all the
> > registered effects.
> > 
> > I've only one device with vibrator and it's a imx6 4.1.15 kernel.
> > But code looks the same that in linus master that why I'm posting it
> > here. I hope that it will not waste people time
> > 
> 
> Hi everyone,
> 
> I’m also hitting this bug with games that use force-feedback steering
> wheels under Wine/Proton. It typically shows up as EVIOCSFF ioctls
> failing with EINVAL, since all the effects were unexpectedly flushed.
> 
> The problem is that input_ff_flush() is called whenever a file
> descriptor is closed, but there can be multiple descriptors open to
> the same file description (through fork(), dup(), etc).
> input_ff_flush() removes all effects added by that file description,
> which the users of the other descriptors certainly don't expect.
> 
> As for the fix, maybe fd_ops->flush() shouldn’t be implemented at all?
> In the current design, effects “belong” to a file description (a
> struct file *), not a descriptor. This seems sensible to me: a process
> could open a device, upload an effect, then fork(), and it makes sense
> that the child would have full control of the effects created by the
> parent. It seems to me like nothing should be done when a descriptor
> is closed, and input_ff_flush() should be called only when the whole
> struct file is released.
> 

Yes, I agree, we should drop setting fops->flush and move the code into
evdev_release(). This will ensure that the effects are stopped and
erased once file is closed, but will allow passing the descriptors
around.

Can I get a real patch for this please?

Thanks.

-- 
Dmitry
