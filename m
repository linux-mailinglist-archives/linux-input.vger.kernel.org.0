Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B908D136484
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 02:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730392AbgAJBCY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 20:02:24 -0500
Received: from mail-pg1-f182.google.com ([209.85.215.182]:38154 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730301AbgAJBCY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 20:02:24 -0500
Received: by mail-pg1-f182.google.com with SMTP id a33so153144pgm.5
        for <linux-input@vger.kernel.org>; Thu, 09 Jan 2020 17:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YZr4NhFK9VRmzHURoHp19dmXt5FyLGLjyf944Yq+Z50=;
        b=IFJX/VWVGtOfrf6yqgxmEyEXjpeEVtlQDfv86Q3vm6EHmZYRl86713MBA9t0Fz/vkx
         ahRCdXctreMYIt6oTJodRsVupKmRwapM7FEDMMtZJCjPjMZDahLrYVgeU8DFsa3gOj6E
         YE1X7JkhkamDbom+J3LKvj4YbjesmpkKa0UdN4hhlaqBFVbiaAAeS0aqNTsvq65FhzGg
         8LOaGnNFYhNbTipd+npuzUPp5FQhygq9aAV8te6U++cLBsV/uIXKQImUfKNuUhBGX5PD
         SlY3n7/3498Ddbqx3XhfEoF0kOs9iecdThZJ1QcUs1ky3YSMDHc9/g/M+Mb4bflVFn2D
         tiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YZr4NhFK9VRmzHURoHp19dmXt5FyLGLjyf944Yq+Z50=;
        b=aVrN/T+6FTj3l+mQV0csxNslYAvTT8zc05IQHiAYQ0c6sXAh9lngu5USbKSgjtZVZy
         SeElRiF7Z6s60uceyEurO9aIcoB9/Il+Ol19cbvF49cCtNJmDDdNn4LNpFvOLr6Neqjj
         0dLoUT7KHCm6Wsq3Qn6CwuCKvkd+g2u6APBVMjrYr92CQWckciT88I8+oW8ercO+Nwlg
         x2iNScuNJagdCL02z7Bzv4/Gx6qu7JSL33qF1ObvVNtC1MUW6xjiKVz+GXHUJ/5BDtLF
         BA0B91daU5XlsrtYYcBErAo/2NI9nX2gcd2idtLFleMwPe8Cl/uoZuChEcIqTzFeZZxu
         6emQ==
X-Gm-Message-State: APjAAAXwWCVSSIDI3oF29FebFfdxx9AqMzlgCJLWxtSBXu982WEXYBIK
        uAmOxuejdrH17w6DGuXBhTUcogxh
X-Google-Smtp-Source: APXvYqy9okAQk92oqjROXPKk6uXi4XVSOxErDvVdfGNCsEyp0UiI5mmverQYOLIvOFMh/RTHaOl7uA==
X-Received: by 2002:a63:4c4f:: with SMTP id m15mr993497pgl.346.1578618143724;
        Thu, 09 Jan 2020 17:02:23 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 100sm237954pjo.17.2020.01.09.17.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 17:02:23 -0800 (PST)
Date:   Thu, 9 Jan 2020 17:02:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Will Tipton <willwtipton@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: config option to change key soft autorepeat behavior
Message-ID: <20200110010221.GJ8314@dtor-ws>
References: <CANC6dXB4HQ6kF=JgahM7hFyGLRPx82zQQe04syqfV16_DDpBiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANC6dXB4HQ6kF=JgahM7hFyGLRPx82zQQe04syqfV16_DDpBiA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Will,

On Wed, Jan 08, 2020 at 01:08:54PM -0800, Will Tipton wrote:
> Hello,
> 
> I'd like to add an option to the input subsystem to change the behavior of
> key repeat. Essentially, when two keyboard keys 'a' and 'b' are held down
> simultaneously, I'd like to get 'abababab...' rather than 'abbbbbbbb...'.
> Another example of a request for this feature is here
> <https://tl.net/forum/sc2-strategy/446530-rapid-fire-hotkey-trick?page=4#64>
> .
> 
> Re: implementation -- I think this is a relatively minor change in
> input.h/.c
> <https://github.com/torvalds/linux/blob/master/drivers/input/input.c#L153>.
> When this kernel option is enabled, the timer and repeat_key
> <https://github.com/torvalds/linux/blob/master/include/linux/input.h#L165>
> members of input_dev are replaced by a container of (timer, key) tuples.
> There's one entry in this container for each currently-pressed key, and
> each entry is basically managed the same way the singular timer and
> repeat_key are managed currently.
> 
> I'm curious whether:
> - a patch adding this feature is likely to be accepted.
> - the implementation strategy I mentioned is the best approach.

Given that most environments (X, Wayland) ignore kernel autorepeat and
implement it themselves (since autorepeat parameters are really more of
a user preferences rather than hardware/system properties), I do not
think we should leave the kernel as is.

Thanks.

-- 
Dmitry
