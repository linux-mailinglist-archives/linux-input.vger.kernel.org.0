Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81BA33358B
	for <lists+linux-input@lfdr.de>; Wed, 10 Mar 2021 06:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhCJFqq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Mar 2021 00:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbhCJFqg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Mar 2021 00:46:36 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99384C06174A;
        Tue,  9 Mar 2021 21:46:36 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id z5so7936250plg.3;
        Tue, 09 Mar 2021 21:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kSS5OLOoNWvPXwzh/j7X5vj/WS7ktp3KnT6xi3GJsko=;
        b=gVJxTVFlnUD7/SNeFHlheEeJ7Xjlv4xL0QJfhIxw8lSfCoantUEPA5Q1fdtitvNWUF
         KSvi8yftiZBH29TyT64RI00s9x33PNdNVjJyynfRZQsH3mFuKy8HEPEWh4BOGeMkFyTM
         MEmDneM1VP8dr7FNzIU5Knqvfiv8jkzW3yvJ1/GwnzRfp92GHY+uYG+1v2Vtpn1xVlTi
         l+sncQGT6oWRVmuBbwE/sQg0vHLJ5tYJE70OI/GffSu0wyZ/mB/Ern10k1gwgfyEhBS5
         U7gWCXkRsuIWIT6W4QL6l1JGQUgmAeLzFXhzQD+jfxY/Mkutaf6aIHCI9Hz0vom+ZnjK
         f06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kSS5OLOoNWvPXwzh/j7X5vj/WS7ktp3KnT6xi3GJsko=;
        b=qMBxf8ko3VwyFEjIRoj0FMWtimCMnoGg1cEhTh4RppbuOj7zQJSi5hFVRy6vhZwFCj
         K0R8VKXFefLQfRdZmq8QnnHeB+C/cugF5zJUX5Zm++rGXeqeol/G1YDJPdyBz1owDhqL
         Lw86qipbYPb/AcOzEILQ+++c//mif0e7auSPJlfBzsE+qwwwqrMZiwi/MV4XaloMGS1z
         IFPrBP4JD1pAqGCczOG3jsFVFgM0W5MQoJjjyTRIAd60iuFufRyhKsTcxtV9PlQUUPhz
         gwoeb1HbvdJBvogr9MCdm7F0RBtLprUeVtLD6fd2JwQFaKKboTE560/SX7Wjy7N9WWUG
         vuUg==
X-Gm-Message-State: AOAM532SBO7yOvzvobN51KsyGeJiAL87sz0evqAEw+6ptvD8ZpY1VA9s
        h/yFDxSBX7BoOLXZ4gXRzM8=
X-Google-Smtp-Source: ABdhPJzT+Lmv/Tgj/7BJnPqT7Ydy13ileA2JKpbX3XIDVJwZOf1AOj/neqCZcfMH7+874bywozpbiQ==
X-Received: by 2002:a17:90a:8417:: with SMTP id j23mr1835846pjn.224.1615355195604;
        Tue, 09 Mar 2021 21:46:35 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e86b:7759:70dd:2bbf])
        by smtp.gmail.com with ESMTPSA id j21sm7015614pfc.114.2021.03.09.21.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 21:46:34 -0800 (PST)
Date:   Tue, 9 Mar 2021 21:46:32 -0800
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     'linux-kernel' <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        'phoenix' <phoenix@emc.com.tw>,
        "dave.wang" <dave.wang@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new dev ices
Message-ID: <YEhdODWV66v0KqeM@google.com>
References: <1614647097.9201.jingle.wu@emc.com.tw>
 <YEGBeWHRfL4gN9pX@google.com>
 <004f01d7115e$3ba005e0$b2e011a0$@emc.com.tw>
 <YEGJ7z479pqyBW1w@google.com>
 <005401d71161$ef9b20e0$ced162a0$@emc.com.tw>
 <YEWXcV62YpxbBp9P@google.com>
 <005d01d713f8$e4b715a0$ae2540e0$@emc.com.tw>
 <YEbRazfF0iTreYYz@google.com>
 <00ce01d714ef$2598f740$70cae5c0$@emc.com.tw>
 <1615301614.16870.jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615301614.16870.jingle.wu@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 09, 2021 at 10:53:34PM +0800, jingle.wu wrote:
> Hi Dmitry:
> 
> Was this the only issue with the updated patch? Did it work for you
> otherwise?
> -> Yes, the updated patch can work successfully after fix this issue.

OK, great, I applied it.

Thanks.

-- 
Dmitry
