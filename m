Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119AB38D6AF
	for <lists+linux-input@lfdr.de>; Sat, 22 May 2021 19:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhEVRnR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 May 2021 13:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhEVRnR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 May 2021 13:43:17 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80592C061574;
        Sat, 22 May 2021 10:41:51 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id z17so24087860wrq.7;
        Sat, 22 May 2021 10:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YHD1e+JQGQGMc3+rMXMHcBcnJySLJrJC7AlPg2zBHcg=;
        b=gT5l6S/mpGJwGk6leUvKGijfTjhmoluw4aXAcnfY2xlaP932ELeWy+4fm1XQ/PLTEC
         cUBGde28rdG/vw7WVv476agM9/vFSGPtDvNF7npia/kqZH+FlIzTbcCZmP28syxcCbKF
         kIh/XfqvK8ig++QDiBbY+idf4xS0FJOfhlYP94xSgGMmPM/PXEASdvtcuFmyiB66vSTn
         ahbvM5bGUlJBqlcoW6UqpL0m+tj8AZXhE/D1Xcfb61UNeLg2feobGT9g4Bm9KBBxt6n6
         znFoMI7+AUPiPp30LpnvXA5euYCLUF+f8rvi0M9G0LzHn1cxbNJAs64Tfxa2vfDkyoVj
         3w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YHD1e+JQGQGMc3+rMXMHcBcnJySLJrJC7AlPg2zBHcg=;
        b=VKrsitbeZxg0TZe0z5dC7z36c9CXLIs0CCZ/h7Epzhru0t36aJkzCk5bRL/5SpyTua
         2gKxdi/xYRPVybO1KGd2N1pwohQwnYOQ9yIfjslQ8JJ3IXQn3aR8CZaGQ8XJaW2j9mrr
         iOTJLuOqqhKatwb+n3EM9YyueHTQ1FYuO1CRuUoRCmztdcvo6wqTKYBKoa8tgzzEuZmq
         6XjbGEGVV9ISx9LAfLHtBshJ2nX3C0+xs6C/83dlRIfOJmBnYjrZegTHLmsubrMpBwkX
         Ws7/3pH8EqVTIcR2hgi3/jpl++kE/E5zPs2D/vLeBsC8sJ7iI3lh+GS3pPRBAkDYdIdR
         nJxw==
X-Gm-Message-State: AOAM532nDPNmqKraGAgA1YkBh5/s0jMdjZn2UPHOUj6e8QfByAkmvbgx
        rassQR5cESbscZLnPCLJTws=
X-Google-Smtp-Source: ABdhPJyxbh8W1Wu5DbUQXe6Aax/wji5G44dzvrYR6iT7Cv/oojpfbrUoDgDQ2/mSCxn8NbA60wCGhQ==
X-Received: by 2002:a5d:5306:: with SMTP id e6mr14241739wrv.324.1621705309966;
        Sat, 22 May 2021 10:41:49 -0700 (PDT)
Received: from elementary-os.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id b15sm6021551wru.64.2021.05.22.10.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 10:41:49 -0700 (PDT)
Date:   Sat, 22 May 2021 19:41:47 +0200
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Rong Chen <rong.a.chen@intel.com>
Cc:     jikos@kernel.org, kbuild-all@lists.01.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [kbuild-all] Re: [PATCH 3/5] HID: magicmouse: Magic Trackpad 2
 USB battery capacity
Message-ID: <20210522174147.GA7547@elementary-os.localdomain>
References: <20210511182023.730524-3-jose.exposito89@gmail.com>
 <202105121712.MGWeLu1Q-lkp@intel.com>
 <20210515185021.GA177131@elementary-os.localdomain>
 <eeba0785-1d5c-7d4a-d5c4-af6ffb3f4f8b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeba0785-1d5c-7d4a-d5c4-af6ffb3f4f8b@intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 20, 2021 at 05:18:51PM +0800, Rong Chen wrote: 
> Hi José Expósito,
> 
> I think it's related to HAS_IOMEM in drivers/usb/Kconfig:
> 
> menuconfig USB_SUPPORT
>         bool "USB support"
>         depends on HAS_IOMEM
>         default y
>         help
> 
> 
>           This option adds core support for Universal Serial Bus (USB).
>           You will also need drivers from the following menu to make use of
> it.
> 
> and I found a similar issue fixed by the below commit:
>
> [...]
> 
> Best Regards,
> Rong Chen

Hi Rong,

Thank you very much for taking the time to help me out with this issue, I really appreciate it.

As you mentioned, the issue was related with depends on in Kconfig, I'll email a new version of the patches.

Best regards,
Jose
