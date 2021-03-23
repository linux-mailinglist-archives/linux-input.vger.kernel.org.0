Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824E63465CC
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 17:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhCWQ63 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 12:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbhCWQ6Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 12:58:25 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC320C061574;
        Tue, 23 Mar 2021 09:58:24 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso10375563pjb.3;
        Tue, 23 Mar 2021 09:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1x45VA7iwWhj8NjeFCXCpxwGnPrZpl1jcoi1rF0hZ9w=;
        b=ke+ejE0bAH1Y71b5mmeNuAyY1ml9x8g9/7Py0npzHShe7uK6H391nOp/Mx6X4QNggs
         5yUY/8VQ4KeqonJ4nZpFniQEkSE+WLzhOoW92vaJZxtlCFDO5pIpjwmRgWKOfSxXLveq
         riQEzQeMpEJpnLIndAtEu6i4EPj4ISaVbyliKhg0HWIGJ8Uyl1QrrNmC4rlMYX9Y0rRI
         o8dSttDyneLw2HQWRp4qRghCj5YUTkx1BtxbUYaZj37yw0nxz/vToOBzMPaqaTL+pvDx
         owD4IJv+8xhgGIuJY0ZllwjRgdlSSXsrml4Itjj6bLecKm5Brx4CwO9R1+K4Yn4JjOG1
         kAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1x45VA7iwWhj8NjeFCXCpxwGnPrZpl1jcoi1rF0hZ9w=;
        b=TH0AsAoltWfBVVLzyl3vjnL9XK5f0D3sA2EOwEO7fO6CR54FVsORBC7uwUMxwlc272
         ohIrlbEAjhWTALBgKkarObjNpRL2g4g0cKfDHj9qXFyyp+JfwbdyK20i/+sK+d6cEPGx
         t4t0zHT8s2o0dZhLEL/uBM9d/JrykaJ11XH4O6fUscV8J7cFpFKBqKTmPA01YY83IEX2
         Zn1kIroxkSyiGJFWY82BK7u1WiquHhsyWqDEG5x/w1/UnmyT+wUvaxdfu3ZngcW/OucK
         Gcgucj9Ar9PQIBW5eCmOTULB6o20J77xmi6AQHOKlYkNU0EvJyedJWPWlFLLcbtyBPZz
         QmrQ==
X-Gm-Message-State: AOAM533RS+ooSPMWsEsLDDyfLbYuJr+0jzI4Kdri9spN0GtrBK48T+HU
        5Fddi8HNlE5ZYG2Rlam61Ew=
X-Google-Smtp-Source: ABdhPJwqZuTpeqfQujnX6uAGYpmek9ibkHlzDlN4XM5CaoFRZgq4IAbIv7dHPcORYTXP1aznxDIAzQ==
X-Received: by 2002:a17:90a:ec15:: with SMTP id l21mr5272921pjy.164.1616518704185;
        Tue, 23 Mar 2021 09:58:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d6b:ca5a:c720:f5c9])
        by smtp.gmail.com with ESMTPSA id gw20sm3192971pjb.3.2021.03.23.09.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 09:58:23 -0700 (PDT)
Date:   Tue, 23 Mar 2021 09:58:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Marcos Paulo de Souza <mpdesouza@suse.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Po-Hsu Lin <po-hsu.lin@canonical.com>,
        Kevin Locke <kevin@kevinlocke.name>,
        Hans de Goede <hdegoede@redhat.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        David Pedersen <limero1337@gmail.com>,
        Rajat Jain <rajatja@google.com>,
        Chris Chiu <chiu@endlessos.org>, Jiri Kosina <jkosina@suse.cz>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - fix Pegatron C15B ID entry
Message-ID: <YFoeKw4byr1U+SGN@google.com>
References: <20210323130623.2302402-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323130623.2302402-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 23, 2021 at 02:06:13PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Zenbook Flip entry that was added overwrites a previous one
> because of a typo:
> 
> In file included from drivers/input/serio/i8042.h:23,
>                  from drivers/input/serio/i8042.c:131:
> drivers/input/serio/i8042-x86ia64io.h:591:28: error: initialized field overwritten [-Werror=override-init]
>   591 |                 .matches = {
>       |                            ^
> drivers/input/serio/i8042-x86ia64io.h:591:28: note: (near initialization for 'i8042_dmi_noselftest_table[0].matches')
> 
> Add the missing separator between the two.
> 
> Fixes: b5d6e7ab7fe7 ("Input: i8042 - add ASUS Zenbook Flip to noselftest list")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thank you.

-- 
Dmitry
