Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFB61CE2C5
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 20:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729713AbgEKS3d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 14:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729673AbgEKS3d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 14:29:33 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89BCC061A0C;
        Mon, 11 May 2020 11:29:31 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f7so5113445pfa.9;
        Mon, 11 May 2020 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H4KxnQZj7MMF+XFizw+0KM4p3VPjuRnYCCVLLa+bQEU=;
        b=nREcErpP1OJWWHKl6ghnKOeW2GKGIh6MCXUIDRhGjtgd0VYJTGnpHPnP9lR6nVsxJP
         UWa3W0KAtUslzNajPouGKgHUuKK7CHW4wDRq5zmbTi4+30s4qkl6UK5zo3H1gyd2V20b
         fixwqV43MdJD2QQ8bxQvNBSgiF6cStXyHmQvDze+mwo6q4bpfwSzr57xSJzzxo0KxkLS
         yF/n+HqgY4C1GY9oh9Y4dq3RVZgmsDJN2DY5BsAfvoIo8e6IdpCGou+c5GdYOXLLgkaB
         QiWa0RXlR8KvT2uPvPziSPBjBXa4/plss/Az/m4Me3Vcn3r/I8zxqg2glPhm5VuWtG6V
         3eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H4KxnQZj7MMF+XFizw+0KM4p3VPjuRnYCCVLLa+bQEU=;
        b=Rj5kIgsxn9eAoMQP0PwWspiWDy3kXSz52+r/KDFCG0V9w+mdK8czUarweXTPrIHSv5
         aHSVFKuDLDtW3TitisvABW2jhnWxkGImp3yaL+X6bWowrJ9f/hooOk4FTf9FfiVJVXLR
         a0j7p5jKh1mui9yuAg6R6gaNrKAntXebZGUafN/z7BuL1d2IHQhI9CajK7FAHe7age5i
         2VJgDD6APBqtOiWYgSedQLPEvRqlpaZebO8iwr1r3uoh51Ua1Op2hzquC8Gbhj+z1jr3
         c8Ry1tLrxO068Uha/WRtp/iKM/Dul8ZobWO8SHxUW6ufztVSGfZGykyYt3cKUGl7ErS8
         kHGg==
X-Gm-Message-State: AGi0PuarkXtd9s83QI9nfZDlNqeEFjWEkcm/5S8feD1vq/c7MzJCXD+o
        9HSoD/hHP/5GwfX17qK5azI=
X-Google-Smtp-Source: APiQypLioLOYpTUjlKnMPx3S4Dgj8UBE8iQJGVmCsArVCnPKl5V2exwha0LsAKBoWoN0GjWyML4zWw==
X-Received: by 2002:a63:5663:: with SMTP id g35mr15553849pgm.356.1589221771093;
        Mon, 11 May 2020 11:29:31 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id j35sm8472856pgl.74.2020.05.11.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:29:30 -0700 (PDT)
Date:   Mon, 11 May 2020 11:29:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        kernel@collabora.com
Subject: Re: [PATCH 6/6] tty/sysrq: Add configurable handler to execute a
 compound action
Message-ID: <20200511182928.GV89269@dtor-ws>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
 <20200511135918.8203-7-andrzej.p@collabora.com>
 <20200511162113.GC2221063@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511162113.GC2221063@kroah.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 11, 2020 at 06:21:13PM +0200, Greg Kroah-Hartman wrote:
> On Mon, May 11, 2020 at 03:59:18PM +0200, Andrzej Pietrasiewicz wrote:
> > Some userland might want to execute e.g. 'w' (show blocked tasks), followed
> > by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
> > upon a single magic SysRq. Or one might want to execute the famous "Raising
> > Elephants Is So Utterly Boring" action. This patch adds a configurable
> > handler, triggered with 'C', for this exact purpose. The user specifies the
> > composition of the compound action using syntax similar to getopt, where
> > each letter corresponds to an individual action and a colon followed by a
> > number corresponds to a delay of that many milliseconds, e.g.:
> > 
> > ws:1000c
> > 
> > or
> > 
> > r:100eis:1000ub
> 
> Cute, but why?  Who needs/wants this type of thing?

On Chrome OS the first time user presses SysRq-X it will try to kill
chrome (and that will cause crash to get uploaded if user consented).
The 2nd time within 5 seconds the same combo is pressed, it will dump
blocked tasks in syslog and try to sync and then panic. On panic the
device will reboot, logs will be scraped from pstore, and uploaded for
analysis.

Thanks.

-- 
Dmitry
