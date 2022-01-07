Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B116487EC4
	for <lists+linux-input@lfdr.de>; Fri,  7 Jan 2022 23:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbiAGWHy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 17:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbiAGWHy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 17:07:54 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0652C061574
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 14:07:53 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id s1so6620382pga.5
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 14:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8A8iKkbeW/oKo7eGFKakGvv3qh+5pLCIfMGGzUt6vpo=;
        b=FAG9OVb+cIqT+e/ozjNQOOGJfamMoMBTPHiiNB0V11sGoQHh6c+Q+Zz815nmHDO6Q7
         zp+Yyfju+IhdQwRjPPPgfYQjgNKFTx0I1Ri+J55E9Gjs7j5boMtpL1Nzu7FzDe3cmNeF
         B68k5IxP+RI6paPQYIcm6iXKBL5DMlAC9AwzrgYwBDdVc04hBuihtegumRp7OlHJF0si
         fpvUgHWmiMJfuj32VhVQW4sPqm1mCUXV/XNszDDu+6rDXEZGpb0mQz6uqEAxR4/5jtDh
         bSsb0DgtVIziHzxuKfgC2elVbnWspk3h/D4ORAOPCstylBDlMiXXrphxCi5/zYXzt0lx
         y2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8A8iKkbeW/oKo7eGFKakGvv3qh+5pLCIfMGGzUt6vpo=;
        b=CuvxuQJ5Hqq7DLT9uCNfSfBnZ+N1W4ZNwUiBSiu90WMSFZ88eYVU4E7iW7n1QPF1tV
         6k78W1+o27qsc2eyI7mfuRa/A0OymeHcq600gK+9/5/NjoGju3JbYb/W5s1N+QAJIH1o
         eSywvagyfAUVEPvozX+/X40r7gN4fWP+Nfe10uBGDwH7ZsYfuS5lJvxZrKQbiv6dQY6a
         Q+u+nuMJ8KMJGLiQG464TE/P0hOp3xxUnmVd/F3yVG1PFlFGDO4vEv3m9wELH1BOfpBN
         SN0k7kCORq7T8bjmmJypxaIb8W//r9tv7i5feh2f0DHwjDV5v1ISegXNX5RfEZcx7h6q
         pulA==
X-Gm-Message-State: AOAM531Z7VpnIbuLaYn11ZhP52MClCefPo4+7EBbVanQo8Y+c9Or/xg2
        KrC+BEGhvxN1mkRIGVcgBOyd+MNeIVU=
X-Google-Smtp-Source: ABdhPJxo6fBdc/r8s48Qe/RsinOL3R77GbJOsPvp3kNPWitUUmCFuOaiZbGMsOE5x5Q3XPONxgG0yw==
X-Received: by 2002:a05:6a00:2182:b0:4a7:ec46:29da with SMTP id h2-20020a056a00218200b004a7ec4629damr65786814pfi.68.1641593273278;
        Fri, 07 Jan 2022 14:07:53 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a85:a3d:72a9:2009])
        by smtp.gmail.com with ESMTPSA id m12sm6733pfh.64.2022.01.07.14.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 14:07:52 -0800 (PST)
Date:   Fri, 7 Jan 2022 14:07:50 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH 13/18] Input: MT - toggle ABS_PRESSURE pointer emulation
Message-ID: <Ydi4/xYdgTv9Umqh@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-14-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221191743.1893185-14-acz@semihalf.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

On Tue, Dec 21, 2021 at 07:17:38PM +0000, Angela Czubak wrote:
> Add a function to switch off ABS_PRESSURE generation if necessary.
> This may be helpful in case drivers want to generate ABS_PRESSURE events
> themselves from ABS_MT_PRESSURE.

This needs better explanation for why it is needed. I assume this is to
use ABS_PRESSURE to report "true force" for devices. If this is correct
then I believe we should define a new flag for input_mt_init_slots()
and check it here and also use it to calculate the force across contacts
in input_mt_sync_frame().

Or did I misunderstand the point?

Thanks.

-- 
Dmitry
