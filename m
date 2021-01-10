Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9122F05A9
	for <lists+linux-input@lfdr.de>; Sun, 10 Jan 2021 07:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbhAJGSR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Jan 2021 01:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbhAJGSR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Jan 2021 01:18:17 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E41C061786;
        Sat,  9 Jan 2021 22:17:37 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id m6so3432310pfk.1;
        Sat, 09 Jan 2021 22:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9E9hsQT79EQ4tK7F/8rBZQNNeuDoV/YakQtH0ebvTwc=;
        b=jj9VRtB8VHZd4mqOGOyd+0hx/vnFv9d8WDIUKUyMzeAx6TTs2RS79OfAazYkT4Uazk
         ZZwOEpD21riUZNax/VHdL+Y+Yjsd0tAcWqmKz6klA0M3S47/db9PebLM3q8N5C1i8oHM
         OygvfezBwwOzqGQ92PvOEIBXWTtck5oPqNSSwoBxFOHp3symR3toN4ZpqZcuL2osRUBz
         vKzVfygSLAuPOFdKE9ukdXcLXACqzBatFGl/bYe8A6QfmaDqKrZr/d3TIBhwFycDCIUl
         l5cnlupn3hlv95Q9SK3s6T/wDAiO9Lz5ttjI/6t4Joltry0AbSrKue874lDYY1wG0iKB
         MkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9E9hsQT79EQ4tK7F/8rBZQNNeuDoV/YakQtH0ebvTwc=;
        b=QV2bX00IeAJih43CmMdG/1FZi+8XzH3u+mKuUB22EOQM9LmAkxNhrQlCDH6XVb7sjU
         bYvLVwLKzQCyGHiElk9T02R8y4Kk5KVBM6ewjOdo7i0vOmfh/ZKaMrofiWZ6EALUp45J
         92yeWWPJdOsfiIZI/41FuZJBnp/3EIcZ1xJieakTgIJ+auvv2x/VWOoju2zx3FsFd0aV
         7SXcaw8SFEroaEFJesmi7LOLJAwheuxtIlh8CG+D5UmEzgS6y/2/FHOJzr4XWj7hOaCd
         th+AH6yL1EGgncpVJO24TaPrmllOKdlRpjetvgsV4ixUW7+wmDeA0dPOVnixwLKpZjYn
         r23Q==
X-Gm-Message-State: AOAM530vYf786zLZXLiM9yaeNSnRhP/YJk1i3B67Oois2gc1j2QD0iw8
        t026r8Eri6R6Z6PooCCrVek=
X-Google-Smtp-Source: ABdhPJzYHYvEAS4na9rCdU080D+8jhv12eHq7Rsf/jXQKC9ev2ECe6Ah4U3VudsvLTOvLZmIR/hYtw==
X-Received: by 2002:aa7:9a07:0:b029:1a6:5f93:a19f with SMTP id w7-20020aa79a070000b02901a65f93a19fmr11404058pfj.21.1610259456711;
        Sat, 09 Jan 2021 22:17:36 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 84sm15027293pfy.9.2021.01.09.22.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 22:17:35 -0800 (PST)
Date:   Sat, 9 Jan 2021 22:17:32 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-input@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 0/2] Add support for Goodix GT9286 chip
Message-ID: <X/qb/P8wV6JPymOu@google.com>
References: <20210109135512.149032-1-angelogioacchino.delregno@somainline.org>
 <5c923458ee8f86efed2ab1c49906dd89789f663b.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c923458ee8f86efed2ab1c49906dd89789f663b.camel@hadess.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 09, 2021 at 03:37:40PM +0100, Bastien Nocera wrote:
> On Sat, 2021-01-09 at 14:55 +0100, AngeloGioacchino Del Regno wrote:
> > Add support for the GT9286 chip, tested on F(x)Tec Pro1 (MSM8998).
> 
> Can you please add this test information to the commit message for the
> goodix.c patch?
> 
> Feel free to add my:
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> to both patches when you send a v2.

I added this to the patch by hand, there is no need to submit v2.

Thanks.

-- 
Dmitry
