Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A755B191979
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 19:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgCXSv4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 14:51:56 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39257 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgCXSv4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 14:51:56 -0400
Received: by mail-pl1-f196.google.com with SMTP id m1so7784342pll.6
        for <linux-input@vger.kernel.org>; Tue, 24 Mar 2020 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cn3tfRuKblonsq43UebSN9wKU+eeXHupBvwu4QxmVos=;
        b=bi3HWPuVSEe5Sx6r5rUkjEVdYxYCleEtxo6hhuIJQXt989EZbou+h64GMmlGFBJnVQ
         xNmV07Bf1tLrFWPnK1vSwaIMVF+1Ua7bCUKD+CY+V8jvqJMMTdoNLaot/pEhkBad+qNp
         h+aAIxRN/pxvm3VA+wXfKniGHVNCS3a1+aHfGtrt13aj5CRD2eMP3lJak01v4Y81ctxZ
         6NWu9XKAUzkbhEHTVd373pc2wMFX4ayaIyy7k8b/BOFapHY+8cRBu006vGYA9rfwBBhM
         Qkbl8nYAftlsPlX/ftf5c6D4VRYe5Dl8t4khunLh0LC9tVk8jRxtRvtIfH5kB1U9/x4s
         TpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cn3tfRuKblonsq43UebSN9wKU+eeXHupBvwu4QxmVos=;
        b=J1seIZQGZLU8+7Am+JTsCkJ8GOCGs3DGAJVG7F5ZPfIJfntlVpbFEHq3JNt9gmx2rG
         y2CtQWuFitCT0+IIZULY/MtbQk2TWdkk/+yaMzd4yfUcTvSQcrW6vel2vtVqmaD71s0z
         UdlWUTZg28Q8IUapbQdimzaqyaQa/36NjZkHHpAOKf1yu9xoHcmF9Fgy9rOxiSH6wxSj
         FcS6euhpAMl7OC2x1UjKH28jFBQhXgSzxggn86MfCrmIGO1/G0dSTnoO8/HbDJ5t2Vh5
         SiXbgG1yEcc3Xd8nf6NQBzbdgtfbPw9r/ZVZD5qyGX3LpNY+BaGoSE5YUEkQYX5DSFX+
         221Q==
X-Gm-Message-State: ANhLgQ1yghRcOcdBCqykDl7VoeMYpz/Zr24lOMXCYEuQIbZRMX8EhCEU
        z9eOY/M6DHWA4RSBlpur0v43Rw90
X-Google-Smtp-Source: ADFU+vvtsp62CVF/NZ6zPJEoXWd3bR7z4HwtYowMScWxvHtpIs73xDqY1DFTNcU6n0qda76hqDPCAA==
X-Received: by 2002:a17:902:b198:: with SMTP id s24mr27169155plr.89.1585075914447;
        Tue, 24 Mar 2020 11:51:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id nk12sm2997874pjb.41.2020.03.24.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:51:54 -0700 (PDT)
Date:   Tue, 24 Mar 2020 11:51:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: Re: [PATCH v3 01/11] Input: goodix - Refactor IRQ pin GPIO accesses
Message-ID: <20200324185152.GB75430@dtor-ws>
References: <20200307121505.3707-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200307121505.3707-1-hdegoede@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 07, 2020 at 01:14:55PM +0100, Hans de Goede wrote:
> Suspending Goodix touchscreens requires changing the interrupt pin to
> output before sending them a power-down command. Followed by wiggling
> the interrupt pin to wake the device up, after which it is put back
> in input mode.
> 
> So far we have only effectively supported this on devices which use
> devicetree. On X86 ACPI platforms both looking up the pins; and using a
> pin as both IRQ and GPIO is a bit more complicated. E.g. on some devices
> we cannot directly access the IRQ pin as GPIO and we need to call ACPI
> methods to control it instead.
> 
> This commit adds a new irq_pin_access_method field to the goodix_chip_data
> struct and adds goodix_irq_direction_output and goodix_irq_direction_input
> helpers which together abstract the GPIO accesses to the IRQ pin.
> 
> This is a preparation patch for adding support for properly suspending the
> touchscreen on X86 ACPI platforms.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied the lot, thank you.

-- 
Dmitry
