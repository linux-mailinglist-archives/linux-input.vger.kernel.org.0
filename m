Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D168D3664EE
	for <lists+linux-input@lfdr.de>; Wed, 21 Apr 2021 07:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234854AbhDUFlY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Apr 2021 01:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbhDUFlX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Apr 2021 01:41:23 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DA1C06174A;
        Tue, 20 Apr 2021 22:40:50 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id p16so17038430plf.12;
        Tue, 20 Apr 2021 22:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tz/1YLak3C2mdGfTxiavo+SW8NvwR0wTpkEAogFdEMQ=;
        b=eIHbYrmFhAfP4GMs4jOK134+pFUSXvPIzF4F4qGRT/C4rs0rIr3CxpbSEIfCdQU1Hl
         bk+tU3q0H3Sdx1EaUoxz5VZ1JV2zHUqBzXG2vSq1UegKTAoYC4qXcYC9wh+xTPl1Qk7I
         Ubqz2QpPQ5sckLYMDpVe+ZDMcVrVCGICrcX1/4rLbb6EknNeXCqmzRLPkZ/Ij92Rhb3q
         2nsIkdoN1YgVz3Fdc1hqxGL6MFqH8zqchQX8jkzfBSxNQO2g4SA2lkxEvCAsn0NkpTfc
         eKhFDi6chfSUTeH6cNOn0mE2akDPIJnVCm6iR6s7b5i3fF0EeeplSCnn7KxKs4MLll20
         LQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tz/1YLak3C2mdGfTxiavo+SW8NvwR0wTpkEAogFdEMQ=;
        b=uf0DRa648hBorxu99tt+MR3oXjbISwZJFvHB8q0WcURg64OuTS0X+ivQdfwljvfJzU
         2jk7z6obTo3SJsazZnNB2d5uNxGVOK9tB0iFLDLpYQPk/7izKGta4WUFENEKK8aXOG6P
         0o4GrLsVdoWlSsFqZzqf0ysqh9oFtvnfOMlBqpNzr2DnC69LDwgSMmGP0Iy2RJ9Yzgkq
         jTwSpC5ErbwurqOfZoMsL8VbbEyClJaO9bUKbeRTweTtNgcR1jm5ST8j2S0saXMSKzt/
         bXA1DW+zLkxsMPqquEAEOyGsgNZmc/duiICB6iQR6CSRDo+bVei3cGMq5uSaidhbsJP7
         C0QQ==
X-Gm-Message-State: AOAM531kobC4ublzyPWUBSXynnOu2I0jUkR5rr6vo16DYf6hPvBluVIY
        ZmUzTIS2781sGLxy+yAb9hbyIHU0vUg=
X-Google-Smtp-Source: ABdhPJxkhfM8E+r6GkwGoNudsvs1kPqFhcTMeMXeBjBvi4ipLS+yWEMxKOpjlwN130tSfSC99n0+dw==
X-Received: by 2002:a17:902:edd0:b029:ec:8e2a:d6ed with SMTP id q16-20020a170902edd0b02900ec8e2ad6edmr21176740plk.32.1618983649760;
        Tue, 20 Apr 2021 22:40:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b533:61c1:84ff:eacd])
        by smtp.gmail.com with ESMTPSA id k127sm683705pfd.63.2021.04.20.22.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 22:40:48 -0700 (PDT)
Date:   Tue, 20 Apr 2021 22:40:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: repair reference in HYCON HY46XX
 TOUCHSCREEN SUPPORT
Message-ID: <YH+63pkPpT52PkFV@google.com>
References: <20210419060023.3460-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419060023.3460-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 19, 2021 at 08:00:23AM +0200, Lukas Bulwahn wrote:
> Commit aa2f62cf211a ("Input: add driver for the Hycon HY46XX touchpanel
> series") adds the file ./drivers/input/touchscreen/hycon-hy46xx.c, but the
> file entry in MAINTAINERS refers to ./drivers/input/touchscreen/hy46xx.c.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/input/touchscreen/hy46xx.c
> 
> Repair the file entry by referring to the right location.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied, thank you.

-- 
Dmitry
