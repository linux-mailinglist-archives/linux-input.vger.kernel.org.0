Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802E342FFE6
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 05:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243541AbhJPD3p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 23:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239736AbhJPD3o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 23:29:44 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10DBC061570
        for <linux-input@vger.kernel.org>; Fri, 15 Oct 2021 20:27:36 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so10656570pjb.1
        for <linux-input@vger.kernel.org>; Fri, 15 Oct 2021 20:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MTwQ89Jbur9zL81z1AQ9o2ibuUOT9FLvWFxUN9UPh30=;
        b=F0SxKJYh13qxC9sWaVamWReYX5aF/lE38HiD/SdE4Q+JgnCmR7RZe5WgRQyYZg2RrF
         Oz22VWbbiNQ4zz5jBEn1dObRs3AUrAHrF6632J/Lk9PaV3SS5uew3u/uvDlbVYo6/hB4
         yuAt/+RBSFmSsGwTlCqiNT2HjWcDrpGXF7qYGVMJbfXQbnBciuRb+iIMgDeJ0hfvyqoy
         Tm941dJvwg2bzPqq2oGP6cLDS6XidTk4UBVb3qHn+Pj6x9NQ9wMbSRe99JseYmKM6y4y
         gpN79B/ynRoPtx7uYiAyr6a+mygcmwmKdsc0C14Zta8DSAlW7d5wysRD++kW6G5sS/Rs
         HoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MTwQ89Jbur9zL81z1AQ9o2ibuUOT9FLvWFxUN9UPh30=;
        b=dy3PHOb1ky4JQsS2eIfxt0ssZHxvufdxuJtW47KJLDv1mqZAQZZkChliWmR3h1mx/o
         9wA+OWYMVVQyAeuhllKYLK958dQegWU/DnuR74KckhTcxHu1IKk5qJS16zo/Vpgi2/NC
         emE7aNJWMBCg6z8dQ0Hr8IoYOYz2dgFnToWKB/lTg0G9OEYg0P6a+gmnEQfAc2qBPi9C
         psDYPhiWQouRn+gT9Y1gZFK+LedPTDnwzlrMEu1ROFwdKQuiP8vsCJ5/M/eH/TyMgM20
         jQrrl0WOtkWwE3wyzGwhAQIyzSTBYFVvhx4h2I3mNXzHOqDORFoAtT7bXmPDzkU7GDNW
         HFvw==
X-Gm-Message-State: AOAM532c1wTeHejhEuqncFlRacv4+RDiOp74FEVKsFL9lAxbo7fNeDFy
        LLzVEgDgnQn90MTEkMZbJwpMWHesol0=
X-Google-Smtp-Source: ABdhPJzlU0QcggadpIcmxlkiRxYjeSx4mUwHrbaJPZqybNVCRcTnAigYB48CKoLYd4PQcBpTZ3KkcQ==
X-Received: by 2002:a17:90a:df91:: with SMTP id p17mr32135621pjv.185.1634354856060;
        Fri, 15 Oct 2021 20:27:36 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6a02:4736:3b83:a269])
        by smtp.gmail.com with ESMTPSA id y3sm5791988pge.44.2021.10.15.20.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 20:27:35 -0700 (PDT)
Date:   Fri, 15 Oct 2021 20:27:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-input@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] Input: tm2-touchkey - report scan codes
Message-ID: <YWpGpMMzIIM9bnWn@google.com>
References: <20211013112305.41574-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013112305.41574-1-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 13, 2021 at 01:23:04PM +0200, Stephan Gerhold wrote:
> Report the index of pressed touch key as MSC_SCAN code to userspace
> so it is possible to identify which of the keys was pressed (not
> just the function that is currently assigned to the key).
> 
> This is done similarly also in mcs_touchkey and mpr121_touchkey.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Applied, thank you.

-- 
Dmitry
