Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD39446B42
	for <lists+linux-input@lfdr.de>; Sat,  6 Nov 2021 00:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhKEXgQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 19:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhKEXgQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 19:36:16 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205BBC061570;
        Fri,  5 Nov 2021 16:33:36 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id j9so9577100pgh.1;
        Fri, 05 Nov 2021 16:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MM0zBe3+lgpxRN35m32BV7e0djrGYypyK+XY2hlIPvI=;
        b=q1XEPJonTV0fyWuY2IZAt3OlUkfTRhqbzgBxkEKFDL16Qori9GaFH6LNrKdaTatESN
         SMallXOwObkm/ny67iWwIGLHEQgD9SRUL1A0THCF382ytaC6jxg8UWlalUqksZ/nLbLp
         dFhMg+suq13+v9hSiC1FqFFOi0AHBQ0oAoTkwm5Q00fdQVw6E8nuN+BMrol5eeU+TvHk
         BkP5SX15OiwFtYDe0rafOc6sm6Zzmvx7EcI2tI5QC5ORgs7Nvo5WWmPYlLW2EujpA1Y/
         jxCh8yxxNAqDFoiJIbhSi9p8ONGcYhT/079OIYXhhmuJlQ+B24/nMrZhfiGacbgtaoxq
         5QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MM0zBe3+lgpxRN35m32BV7e0djrGYypyK+XY2hlIPvI=;
        b=VMHKc51nMtFPrHeODWQ+K9+hJnKW0xb3btao8m+zVzUNdD4rGXnlD6RuQNrBbOQd3g
         nS4VDmPUKG+Z1zK90nuINpANeHauH5hkuuzk+eXL1ZXWt1UyzJgRCKOHkYWmdP9YEo2r
         8N0H1lR4XGUOqzgNWNAiffW/dMCUSeGcryVFzMXWOx+3pkGePBPg5ZERkaPUwzriOQwj
         BLCIf7XgNngi3Zvwtof83z+CXnKCbUXwNBvx3qI+aWE5htuDLB3bGpGjfI3a29jIriL5
         L0EQipEu6pT4sVk7tolebtV6rf6rSRYjanBu7ina6wlso5cNgdyNz3nBOZP/T+Yl1y2l
         pGvA==
X-Gm-Message-State: AOAM530nYYqTkehoJKzm5ZSvRTYD44/0RXC3S+7/EpvHx2XxATmOyMK3
        EfNNDeaWLnxGuvvdmTQIk3fSfgcBt3o=
X-Google-Smtp-Source: ABdhPJyqWtZBHh78DP2mdqNED8fHF+niIJbfRurkPV748XQC86I0v9p/aVX96lxJujxbBMnC+Vut0Q==
X-Received: by 2002:a63:e00b:: with SMTP id e11mr47340017pgh.190.1636155214087;
        Fri, 05 Nov 2021 16:33:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:837c:e765:475f:22d3])
        by smtp.gmail.com with ESMTPSA id f18sm8305673pfv.74.2021.11.05.16.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 16:33:32 -0700 (PDT)
Date:   Fri, 5 Nov 2021 16:33:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neal Gompa <ngompa13@gmail.com>
Subject: Re: [PATCH] Input: i8042 - Add quirk for Fujitsu Lifebook T725
Message-ID: <YYW/StbFdd2fYvJg@google.com>
References: <20211103070019.13374-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103070019.13374-1-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 03, 2021 at 08:00:19AM +0100, Takashi Iwai wrote:
> Fujitsu Lifebook T725 laptop requires, like a few other similar
> models, the nomux and notimeout options to probe the touchpad
> properly.  This patch adds the corresponding quirk entries.
> 
> BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1191980
> Tested-by: Neal Gompa <ngompa13@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Applied, thank you.

-- 
Dmitry
