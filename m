Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB2B406677
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 06:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhIJE1t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 00:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhIJE1q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 00:27:46 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E840FC061574
        for <linux-input@vger.kernel.org>; Thu,  9 Sep 2021 21:26:35 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id h3so698032pgb.7
        for <linux-input@vger.kernel.org>; Thu, 09 Sep 2021 21:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i0MekwGfKcz4Ygr69HrdPpoe78m6NPJyzuogjElTSKA=;
        b=e9cnBCBycY+bt8rnFF2wCdTS3elRpomiXMui6ySEDMLs9EAVf+McLiPlheakjmO7Qw
         Oq/qMC91249C0C8ae4BMv9GZ7yEI4du2RqCaynk14lYTI72Ih3GGttaHUKIJEZnFKdC1
         bOCxn0w0lIwZ+x8rxMT6XfJBEtE8m6MWD1ryB+wx5S+BP4SsOdFIWvfJhYwdQkkg1r/d
         L1PQwVGntFJv0URTK2MyXxPAvtewQAPkH3vXhOU7e/gp1jWRI7qeRPWsuIalqOxmnULW
         vdE3hpVkl2rnbX+QUwKJeNn1FQ4nvJVs8KovS1ovx4M3ABZ596z2s190iJC1dPsW0eXL
         QqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i0MekwGfKcz4Ygr69HrdPpoe78m6NPJyzuogjElTSKA=;
        b=xT2p8eqzp8xH5YYJ8DGk/3pwZmS1E4Fw8XmTTVRwejYr2FGA1ktFk6omcgYCgeoSNv
         gDpPXBrfqi1LcORgUhLjp+RrMIH4D3h9OQ4o3RpurhWW235XCcvvYjcqzMmuGPiYn6Ye
         YxXbP01rZmdljm1uxen1yLAMXGi82RbhJP+PWiofpu0Cwt+7hH85VAQpq08lQR0EnF4H
         E59qoMTW1661E51Sv8BzvwBwWuV/6bCw5Fx4eIvNfsdPVFP/qSDDsnF6Aw4caVuRaA6M
         9d04QjYswr/Z9C4/VAwT0Grek173p9wASlf9cUhrYEhMfApnOA36nOz0SycHqKAI43RA
         wcKA==
X-Gm-Message-State: AOAM530f3S7Seuc8F6Vf3iKCR3q6OLcuJndmzfw5LQ1UPosM9GnaC8N4
        scxY5Ahxx1IeV1e4QZBxShk=
X-Google-Smtp-Source: ABdhPJyc859LxtMWwfjUFlUoTtJlecYWMZPjsvNJJ/ujQt37yUlVurwT1qv63SPsJNhkM40VWmiROw==
X-Received: by 2002:a62:ddd8:0:b0:435:4de8:2652 with SMTP id w207-20020a62ddd8000000b004354de82652mr976585pff.53.1631247995330;
        Thu, 09 Sep 2021 21:26:35 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:acdc:1d22:e20a:2796])
        by smtp.gmail.com with ESMTPSA id m21sm3653025pjl.14.2021.09.09.21.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 21:26:34 -0700 (PDT)
Date:   Thu, 9 Sep 2021 21:26:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-input@vger.kernel.org, m.felsch@pengutronix.de
Subject: Re: [PATCH v5 2/3] Input: ads7846: Remove custom filter handling
 functions from pdata
Message-ID: <YTreeEgJjV6JYej8@google.com>
References: <20210907200726.2034962-1-daniel@zonque.org>
 <20210907200726.2034962-3-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907200726.2034962-3-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 07, 2021 at 10:07:25PM +0200, Daniel Mack wrote:
> The functions in the platform data struct to initialize, cleanup and
> apply custom filters are not in use by any mainline board.
> 
> Remove support for them to pave the road for more cleanups to come.
> 
> The enum was moved as it has no users outside of the driver code
> itself.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thank you.

-- 
Dmitry
