Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DF432DEAF
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 01:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhCEAzZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 19:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhCEAzZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Mar 2021 19:55:25 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03180C061574;
        Thu,  4 Mar 2021 16:55:25 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id h13so855124pjt.0;
        Thu, 04 Mar 2021 16:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y7XTV/TMEjXkNOAuL6EZnBWRhY4A+ZiPKSoAJ0vB9xE=;
        b=DgC1AJPRjWSLjT5YNP36rKUdrgk9V+xdGik4amT+mbu9lKc9C0PFEaMpSYB4OmZ0e3
         xnxytMUZFH61Kk5XYZVZXSa0hrUxuOKr6yNYLoOBO1+r9kGeMETZoumgK5e36Iselklg
         AVmOOdogp9qCL+wVFtwjf3YWT7Njzy85t46gQ1TXD6kRXq0zfSrATJaJKsZmhuU4m2g7
         392ieNbwwS98QJC2dQ7LJK4SRXnB8YUo0bN/WkzgiE92wOUhsoh/JnBNa5Zqhb01T7xc
         +h9oIv+w8joxq8P03LLDPrYbHSJlD055oBTtSBQhV4J6wP5voGyOn69JM1QKdogo4dEK
         EUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y7XTV/TMEjXkNOAuL6EZnBWRhY4A+ZiPKSoAJ0vB9xE=;
        b=rb2SttMr8XTn0OQ2bJXXTwwm3cZOGvDxT4z0mYH3qUUtP0I7YlWJfBA7pD2HYM9e+t
         liTtyp8MghgSIi53rKwZcBp8kyMj/GOkDwU7kooMwHtSdTeQaF/I4I4EUeD9i+3bNrhb
         pCIRuaqgO2mh0IwwSaF9gJa8A/ToZW2RWh3UGYIBuNXYQIGSIuklBoeoEe1Evy2X7+VG
         mbZWJyljEgQu8wFeJPR9YfcJoCKX0Pc0GMt9utYrROpHCGst0142TADbq1JLYiTXCZmP
         Xx67t2inFwt8MYsdQBpLhzeJoH03a83JKp6y2K+ZoiYlnbgEq821RDh/746LMSnxAi9w
         BVrA==
X-Gm-Message-State: AOAM530+v6d1UIJkswWcxYfnMln36q5ViVQjSbYE9wveanu8J3/DQOP8
        pS+i1aBRX/pLFbIP9uIRW2Y=
X-Google-Smtp-Source: ABdhPJxiuQmR6rHe7w2SXtsZo+VW4CHQSxE3tvOXc0SqSDTmPYNvNrp1kWwBXQ8SY5emtO3oHchKBQ==
X-Received: by 2002:a17:90a:6383:: with SMTP id f3mr7069643pjj.14.1614905724544;
        Thu, 04 Mar 2021 16:55:24 -0800 (PST)
Received: from google.com ([2620:15c:202:201:c91f:96a9:615f:28ed])
        by smtp.gmail.com with ESMTPSA id b7sm507604pgh.37.2021.03.04.16.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 16:55:23 -0800 (PST)
Date:   Thu, 4 Mar 2021 16:55:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        phoenix <phoenix@emc.com.tw>, "dave.wang" <dave.wang@emc.com.tw>,
        "josh.chen" <josh.chen@emc.com.tw>
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new dev ices
Message-ID: <YEGBeWHRfL4gN9pX@google.com>
References: <20210226073537.4926-1-jingle.wu@emc.com.tw>
 <YDx8M4Rhdi8hW4EO@google.com>
 <1614647097.9201.jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614647097.9201.jingle.wu@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Tue, Mar 02, 2021 at 09:04:57AM +0800, jingle.wu wrote:
> HI Dmitry:
> 
> So data->ops->initialize(client) essentially performs reset of the
> controller (we may want to rename it even) and as far as I understand
> you would want to avoid resetting the controller on newer devices,
> right?
> 
> -> YES
> 
> My question is how behavior of older devices differ from the new ones
> (are they stay in "undefined" state at power up) and whether it is
> possible to determine if controller is in operating mode. For example,
> what would happen on older devices if we call elan_query_product() below
> without resetting the controller?
> 
> -> But there may be other problems, because ELAN can't test all the older devices , 
> -> so use quirk to divide this part.

OK, but could you please tell me what exactly was changed in the newer
parts behavior regarding need to reset after powering them on?

Thanks.

-- 
Dmitry
