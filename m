Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BF42D6FF0
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 06:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgLKF6e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 00:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388912AbgLKF5w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 00:57:52 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBF5C0613CF;
        Thu, 10 Dec 2020 21:57:11 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 11so6333928pfu.4;
        Thu, 10 Dec 2020 21:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z+jq7+VFFNpWKUlNALp4/8M6IesbB5MA3IS0NQeyYTs=;
        b=KHglEB9UhtICqEHIVqDCnLlpzCowMaNV9yWuvkV/UiqIsUvG60dGKuAd5LHUb4MdQZ
         jCySQFvKCM0wfadcmLKsCQF9Mp8Bw79MyYMS7asG2tF+qgdxUKW0HD9uYYybVghl5Hld
         Gdn2vMZoc+0g/3/PJ9Ih9YQ04VWKqIbCq0VrDcZExpNomloXX1Eouz/9H6Fb2neClW2y
         z5+ctfvnpw4igULb9TNZCuejdUzw5ZHyH4ZiPkUShKdKs/jx0l65XsRzrbJwksljMLQ/
         UvHKVnzSdzFXiO9mxlEBOdcmDcGEDVwToJw02r6ZCx5X+JaioNq13i2CPvKiuerX3Zds
         wcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z+jq7+VFFNpWKUlNALp4/8M6IesbB5MA3IS0NQeyYTs=;
        b=JdyqmbYBz8+M49vZG/5Tb2920JrujyDNIu/G2hUCRnIcMY04rxiUW+eeP5MQ3fpdVw
         hcAH4Nm74YKm5jlvPsXuwTCB+4cAz3eL+TgjRjM6cbYjw61kRjTkejrlNg3kQgeyp7DJ
         3UV80TxTKtuLwnqmrBufZ7lYZ72DB66swcRx/HNDmkWqU1y+Tbcwgr3y7+Wpfvdyz+eo
         +Fi8mydm++et51JVuiRBPg6GDas0ZDsKEMtoAi+IV8+jJvvV9V8/SKj2Nw1fVqPj9eIx
         Gm51FloMYFJF0YieaRTApDY9AibDhiE7bT/YeQkVKjZitBJ7s6b/sp9dQ1MZXtfVL73Y
         LWBg==
X-Gm-Message-State: AOAM531uQDS4M4PIvew4yVNOxud8t0e54DK/2SlBnkHlKR5L/mra/pPM
        tUBWNRmqemhkzSq36vidYuE=
X-Google-Smtp-Source: ABdhPJxkZeIoKvdpdemo9ya1/LStG4XZAawDx/MqwODw8ykzMiMhfjA5UeBdPi1VAR9phip4pbUMAQ==
X-Received: by 2002:aa7:9435:0:b029:195:f6a2:b610 with SMTP id y21-20020aa794350000b0290195f6a2b610mr10232971pfo.32.1607666231506;
        Thu, 10 Dec 2020 21:57:11 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s21sm8627352pgk.52.2020.12.10.21.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 21:57:10 -0800 (PST)
Date:   Thu, 10 Dec 2020 21:57:07 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
        allison@lohutok.net, info@metux.net
Subject: Re: [PATCH] input: rmi4: rmi_spi: Use new structure for SPI transfer
 delays
Message-ID: <X9MKMwF+wQLRMLMt@google.com>
References: <20200227130336.27042-1-sergiu.cuciurean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227130336.27042-1-sergiu.cuciurean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 27, 2020 at 03:03:36PM +0200, Sergiu Cuciurean wrote:
> In a recent change to the SPI subsystem [1], a new `delay` struct was added
> to replace the `delay_usecs`. This change replaces the current
> `delay_usecs` with `delay` for this driver.
> 
> The `spi_transfer_delay_exec()` function [in the SPI framework] makes sure
> that both `delay_usecs` & `delay` are used (in this order to preserve
> backwards compatibility).
> 
> [1] commit bebcfd272df6 ("spi: introduce `delay` field for
> `spi_transfer` + spi_transfer_delay_exec()")
> 
> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>

Applied, thank you.

-- 
Dmitry
