Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AAA3437B7
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 05:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbhCVEBV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 00:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbhCVEAu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 00:00:50 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BBBC061574;
        Sun, 21 Mar 2021 21:00:38 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id l123so10063975pfl.8;
        Sun, 21 Mar 2021 21:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1DIwMV0RzFYf1B8g+q7W2LZ1vNqd+mBasexii7umqKw=;
        b=b7AmKwwiVbZY7L9dLZqXd/deRf4uL8r37ujKap+M/cGvfKOG9D0sAe4oQ43gmjPDAO
         gxznEsUd0u0qP//WjZdcGqOhRCoRf6Gw7pZC5np2i76rQ9qXZUb6VeY2Lv3bIsnkubPB
         +cBV5doCoox9Y0xNdJFgRXXkJNtfb/T8huZ8EOf5vIMYYDtR4K69GlhzYnL8G4sbSj1v
         NDriHEB58ZHJ+Q6n/4Qdi3CRx+ZS+OqceXRQnUeLd6cUmRQEGoXvD0N6u4h/qrhADQ+k
         mNmNYQMJBCZgMHXcOo7bPSzyraSf437gKNXsg9l37RbVtAowJras21DKiL3Lu/gk6cv3
         bA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1DIwMV0RzFYf1B8g+q7W2LZ1vNqd+mBasexii7umqKw=;
        b=cegjgK73rc1jDQ+WZFF9GHl2jIg0oXELvzM0fT7kuxxKqzK0T/OqHot2i+ODAz9yRP
         YXy2qrziorLyYQ1/AWrHqwdFkisSclRcQaiM266OzyNyxGfJ1UdwWLxwiViqbCKv+nxC
         UZ9nUtnTuB7bBNHxQhUIczPFpSv3qIzDq4XCL0mPjhmlyqSjKOmm3vnYgoRjzn5ksFi3
         QYXgDEES9ToTYF9xOmy56ULLRiXQjsL+faPNRApNx3E2HPI1LRjX8KtvKQQGGljMsSVI
         t1AtpwUhTWiKcOXUTMtaQ58hUEuzhm+hSyUlQA0X5QKcyM2i+rKK9lioicjmoScd688a
         bz5Q==
X-Gm-Message-State: AOAM532FWb70MvwC5c6k9ak8juqTgG6UlMrq5rVofg704zNNPgb5+wYy
        UMZEWHNRYH21gtXSjNBXbg8=
X-Google-Smtp-Source: ABdhPJzDJijxg/gdod+lz0blwNB+meQy2YLonITiNKFCCN6jGXshhf03qRTROW5uxUpmIxgsqo6qhg==
X-Received: by 2002:a63:d94d:: with SMTP id e13mr21433228pgj.160.1616385638450;
        Sun, 21 Mar 2021 21:00:38 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id bg16sm11804368pjb.43.2021.03.21.21.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 21:00:37 -0700 (PDT)
Date:   Sun, 21 Mar 2021 21:00:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/9] Input: iqs5xx - update vendor's URL
Message-ID: <YFgWYkwEgWJNBbPw@google.com>
References: <20210313191236.4366-1-jeff@labundy.com>
 <20210313191236.4366-2-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313191236.4366-2-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 13, 2021 at 01:12:28PM -0600, Jeff LaBundy wrote:
> Replace 'http' with 'https' and correct the spelling of the nearby
> word 'datasheet'.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
