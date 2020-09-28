Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1A327B802
	for <lists+linux-input@lfdr.de>; Tue, 29 Sep 2020 01:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgI1XVt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 19:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgI1XVt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 19:21:49 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236E0C0613D3;
        Mon, 28 Sep 2020 16:21:49 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id y14so2244983pgf.12;
        Mon, 28 Sep 2020 16:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HRneQLDu10befKfxM4KgT93IxoPsd8gH55wLhVcrzEg=;
        b=McfDiAduM1YU5d6jjqyOViFRVumdDExXqufhBZmZcJztP8jJAUAT+OAWw9FIjkTVhZ
         l1CGApIbrMpkcgfzHusNVRIB7xGGU3wG6pE2em8P06YqoBp4GJ2kwsAWmiNqK62rGCjZ
         x6T47At9bsff3tkp/pjDIVLfOb7UqWYzd/RIRmo7XtPsF3MMQhYN1Jv6kpH61L5DpkLr
         44X29JI+8+D0DoqlIV96mG5rUsmMzRTdAtt58uAnrUjk8lEZO+i6FdxOa5skB+IsjgHF
         9DWVRWLNXsN2r1tH0BzSAJOfUNxFUfKwqF4GBDUaWY1KFW4jvhGfQlcrX5LZxAvfJVSU
         AlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HRneQLDu10befKfxM4KgT93IxoPsd8gH55wLhVcrzEg=;
        b=JrbQLbTHvVxvY+l4ONQsv2h1MWyO/kd+DbcsQjpDi+/iwO66/timR/TCKsGF6fHe24
         I44dLaK6LBvepgD14+J+EXp/OSnlOAHe36XCbLMvK1XLjWp1EUv/vq+9j4s4tQ4giyeQ
         4hz5MPYDDBlvjaTZuMbu91I3ZfXydtU2ELeCgSiEEBHJ9Y82nK9NksDlb18zcq2RasBQ
         UhCgkinh8gMAYuwrEFrXCa5gE+aw+xXmw3imOmll3dzeFX2rx7IDPSv1WSlWzDlT2bGu
         EUio7l930oB5GbW+qnSPPTDDXZN91Tk4mdAkLVZ6ld+z2h5qZCVGypl6JYpwG58eBia8
         qXbA==
X-Gm-Message-State: AOAM530K2XwN6NAaqbB78hXSK87MFxDaHiX8JYLTFPWRTPeuyT5hf2JK
        aOCCYChM3HTWnurVRArQaK4=
X-Google-Smtp-Source: ABdhPJw0VUu/sAGBp0sq+0vPChVSHzxRz016RnEGQmHpHUymV0KVmQwd4sseaGLNuUDTx2WDi9JgKA==
X-Received: by 2002:a17:902:760f:b029:d1:f8be:b0be with SMTP id k15-20020a170902760fb02900d1f8beb0bemr1701798pll.9.1601335308630;
        Mon, 28 Sep 2020 16:21:48 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id y10sm2812323pfp.77.2020.09.28.16.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 16:21:48 -0700 (PDT)
Date:   Mon, 28 Sep 2020 16:21:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Andr=E9s?= Barrantes Silman 
        <andresbs2000@protonmail.com>
Subject: Re: [PATCH] Input: Add nopnp quirk for Acer Aspire 5 A515
Message-ID: <20200928232146.GB2520341@dtor-ws>
References: <nycvar.YFH.7.76.2009252337340.3336@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2009252337340.3336@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 25, 2020 at 11:38:50PM +0200, Jiri Kosina wrote:
> From: Jiri Kosina <jkosina@suse.cz>
> 
> Touchpad on this laptop is not detected properly during boot, as PNP 
> enumerates (wrongly) AUX port as disabled on this machine.
> 
> Fix that by adding this board (with admittedly quite funny DMI 
> identifiers) to nopnp quirk list.
> 
> Reported-by: Andrés Barrantes Silman <andresbs2000@protonmail.com>
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>

Applied, thank you.

-- 
Dmitry
