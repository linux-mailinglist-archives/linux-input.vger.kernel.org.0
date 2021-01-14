Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2602F6160
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 14:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbhANM63 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 07:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbhANM63 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 07:58:29 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1048FC061574;
        Thu, 14 Jan 2021 04:57:49 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id c132so3749945pga.3;
        Thu, 14 Jan 2021 04:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gGbzt6fi80meG4s9AF3mOHr1Et9Lp5WnhuA9zSO3M+Q=;
        b=Ro1jsE6YzpXcypgAljTFVXzP33Rs9jQKrv10VocKgzevdXuk9QLARA9f7oemxJPag0
         5tMHz36Ta2vWR0E6+NLuZRoFZVa5yFyUcoTehDD2/wP+z2cRvK3U+VxDmbUO1XOSx8Zf
         gxMagogc7JM5ZZg5pICYFv/zMyaBCvDxiffVfuZ8/tplfNlAIry0jacgidAmViJcxYJI
         CGBDXF1goGNy33bhKev0J9Kmkd78IjE1lZcy/9JcpKnrWn6EXrdMmr3fPVaTNGERAvqS
         6XwA/ssHbq+jcr/3660EXBiwlTBm9+8DhuUfh/V4c42L5kZmpsZqQa/HjvC4yVLhdUbp
         FsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gGbzt6fi80meG4s9AF3mOHr1Et9Lp5WnhuA9zSO3M+Q=;
        b=E6voOyneDfEwhOugYKOS3jxM+XIx9Q2w0z/ODw7aPEGL3nM1ox0WdiCwAxYhtP4W40
         jcEynB4LenugqY6kos+evr2h+XelCEOVDwizAu/UNzao1YIEXhJjRh3jHVzlTguKY+LB
         oxyvv8LGY7SSgEWri357OTqP2G20LYWDGxA0ElcxdmzTFbVZJLllR94Uc67AR/Wdummb
         NV/tROtbFiTq71zavfSuhnXTigO9SNzOM2UY87JU1UL1b2PyyzXtKQDQqdbXDUA+HUDN
         FGcpCcYK6TdrmH1om77zEtzX9LjpZOHvkr0/Ws5H/Ac0keG6mN9v6Zbd/ufh2qe0UIZY
         arVQ==
X-Gm-Message-State: AOAM530Dui0JOMgZWX7YF5CEesfh46RvKYL2ehpl4nZWIX3zX4DyLtiA
        ygYKHZFN5DQemlC8mZdXPQ==
X-Google-Smtp-Source: ABdhPJwnANuoGmoTzO1w3y9QcxqYJwi43TGuaOSb8SwumIz2tqtt7MF3YUBn2VTf15RNQyLupo9x5A==
X-Received: by 2002:aa7:80d8:0:b029:1ae:6ac5:5324 with SMTP id a24-20020aa780d80000b02901ae6ac55324mr7215401pfn.1.1610629068644;
        Thu, 14 Jan 2021 04:57:48 -0800 (PST)
Received: from PWN ([218.190.226.47])
        by smtp.gmail.com with ESMTPSA id 7sm5287413pfh.142.2021.01.14.04.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 04:57:47 -0800 (PST)
Date:   Thu, 14 Jan 2021 07:57:42 -0500
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phong Tran <tranmanphong@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: wacom: Fix memory leak in wacom_probe()
Message-ID: <20210114125742.GA644967@PWN>
References: <20201210112258.477636-1-yepeilin.cs@gmail.com>
 <nycvar.YFH.7.76.2101141320210.13752@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2101141320210.13752@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

On Thu, Jan 14, 2021 at 01:21:13PM +0100, Jiri Kosina wrote:
> > wacom_probe() is leaking memory. Free `&wacom_wac->pen_fifo` when
> > hid_parse() or wacom_parse_and_register() fails.
> 
> Thanks for the patch. It's however already been fixed in 
> hid.git#for-5.11/upstream-fixes (37309f47e2f5) branch that will be going 
> to Linus shortly.

Ah...  I checked linux-input@ before I started working on the bug, but
it seems that Ping sent out a patch just a few hours before I did.

Sorry for the race condition,
Peilin Ye

