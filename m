Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C598336F32B
	for <lists+linux-input@lfdr.de>; Fri, 30 Apr 2021 02:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhD3Agv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 20:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhD3Agu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 20:36:50 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8608FC06138B
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 17:36:03 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id i190so7723659pfc.12
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 17:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UolD5z9Y/BwrWE8luDd19ytyeSssaRdFYLJsKipLFwE=;
        b=P/hqpiRefzjeEw4nU1fSlFn3OVxYvpuMZfZOtvsE9FKNP0iM9pfamhPjP7nzXsyZks
         7FGb8fAE3eE/H38Tkf3mfJ3BuXYJQb3qvfwBH55NT08gzSgiF6fcPXOXOVcg9Kn64fYW
         aIGgSNRms0U7SqKlSgxjGekCy7UIVAT4vZh8XItASQdQ7WdO1W0ioS7E2EYui1rl7kQx
         zg4TGdIKRnQcctqJVilGt4Q6CNgOb/8hWvaNKxB//BK7l21yDYVtlifDhfjfwRRrRZ0o
         BsrVy/OBnnPGEZOCv1j1qbYCtWoBEOOn9yCfCVlARIj3RVO8lKNBhrNJC/8qHqtil02p
         4cHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UolD5z9Y/BwrWE8luDd19ytyeSssaRdFYLJsKipLFwE=;
        b=hKFp7GVhoSDtPZKVx8OIFF86prEyqDiMnerOQnn9AhrG0AdMWU0e/exgzz9ZZzonkb
         qk2lWjT4EaY3xByryoY0X0QK+hoQ01N5eOMw0s/U1VhRaJabFdnP3G/ZfeyaHbO6fTu7
         GFIX9vVV4m+gdBc6w/GUAyPzz9o4FnkyGq/fbwrL1GRfGcay9g6W3o6N8ooPw1a/Iu9v
         TJplxw0WrTc5IGrsHWACpjr3MLDP2/wMLFxzZ8M5AXAlZnni44X/bvIGwpYmXJG5MAYY
         vW4qo2MGKWvB9GXzwXHmzwGjoeKhhCI93JqgkQR7ksVC+fI5aq5BTIdNejeCnrED5kB9
         PYoQ==
X-Gm-Message-State: AOAM531jjwlYyM8BJTX9cGJRx/2XU6uhBbYfC3sSXmD9A15tRfyJ5I9N
        ZerMTq0SlosRTIOz7qsXzvUZNat4sZo=
X-Google-Smtp-Source: ABdhPJyNGbP2VbFfAou8zF4qFbXsBnaLQgpNPjVDh6CubISsMJ3KofUDczPLdkcuMoJieU089rzJUQ==
X-Received: by 2002:a62:5383:0:b029:28c:8d9e:fa3d with SMTP id h125-20020a6253830000b029028c8d9efa3dmr595294pfb.50.1619742962896;
        Thu, 29 Apr 2021 17:36:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6b9:8bd2:eb38:bd68])
        by smtp.gmail.com with ESMTPSA id r1sm116104pjo.26.2021.04.29.17.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 17:36:01 -0700 (PDT)
Date:   Thu, 29 Apr 2021 17:35:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Phillip Susi <phill@thesusis.net>
Cc:     xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Message-ID: <YItQ72UkqyKuHEk4@google.com>
References: <87o8dw52jc.fsf@vps.thesusis.net>
 <87fsz84zn1.fsf@vps.thesusis.net>
 <YIszOwADJ8jdBov8@google.com>
 <87o8dw8vyg.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8dw8vyg.fsf@vps.thesusis.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 29, 2021 at 08:11:03PM -0400, Phillip Susi wrote:
> 
> Dmitry Torokhov writes:
> 
> > Not every keyboard, but all keycodes above KEY_MIN_INTERESTING which is
> > KEY_MUTE, so that interested handlers could match on devices they are
> > interested in without first opening them or poking through sysfs.
> 
> /Shouldn't/ they be reading sysfs attributes to find that information
> out though?  Isn't modalias there to help modprobe find the right module
> that wants to bind to this device, which doesn't happen for input
> devices?  If user space is looking at this information then isn't it
> getting it by reading from sysfs anyway?

Userspace may or may not have access to sysfs (it does not have to be
mounted) and one can have modules (input handlers) that want to bind to
a specific device (see joydev, mousedev as examples, although they are
not looking for specific keys).

> 
> What in user space looks at input devices other than X and Wayland?  And
> those aren't looking for particular "interesting" keys are they?
> 
> > I don't know why Xen keyboard exports that many keycodes ;) In general,
> > my recommendation is to mirror the physical device when possible, and
> > instantiate several devices so there is 1:1 relationship between virtual
> > and physical devices.
> 
> Xen guys: any input as to why it supports so many "interesting" keys?
> 

Thanks.

-- 
Dmitry
