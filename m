Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132E623E40D
	for <lists+linux-input@lfdr.de>; Fri,  7 Aug 2020 00:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgHFWe5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Aug 2020 18:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgHFWe5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Aug 2020 18:34:57 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B6DC061574;
        Thu,  6 Aug 2020 15:34:57 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id u20so3938937pfn.0;
        Thu, 06 Aug 2020 15:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gyuJ0He/a1da98HsKNWgll33VXGA3KLrT8I9Ge5lc30=;
        b=kVRjWmZGCsr8ZmY0KIM24NUkpPosbX5+cMW+9ViLyfjM/9z1Hv2/b4Ni+Mcy/jmqgu
         78p/uikozvJRtS9iDTAo2dGC4tjLP59emb2z9Sg48ncuwJKROhv7v4eH67woYmU8B2uv
         QZI1vBtzJE95O2yaoBIMAEoQAxUXRN49ozK2W8vgoLvAS+gqpvuwJJoo1PRAhiW5RJ12
         A/Ozb5XyHl+xGzMiDBCLInZcMd4tN+ox7cP6/EJyoYj5jodNl3B1MoP6U45ZMp/dmkiE
         ron4eAhxJACjrVPmom+UjZ+D3E59cAAa14bj/eKPalvwxeJ1DVr0mrs5nZ45V7oL/VIO
         TWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gyuJ0He/a1da98HsKNWgll33VXGA3KLrT8I9Ge5lc30=;
        b=r2EN906QqCtyZKM/qu+Mj3CXwAfcquKnitKqFOV5Y91vsAX5lWtxQkqFFbb3IeZ+FM
         xMtli9MpXYMUmQT6Eyqo+tddVSVuHX4aWZ4hVl4X6FNVflnttVQc9FQFkZ2x5r7+JBcC
         TtPxa0Lu70fOSjyXhrIAnwrh727yFjivcYdejGQkwwo0pkZtYQ5z8C8ykthEEJ9RLYVa
         VVXc8IlOUzyX2lvObRVAgkINn2bEztXt+zaZXt7OwhPxSkmyQJFk0ck2EO6BVZOQ2RKm
         PGPMtxZ5f5+vtlQcNnxkvXA1bwR3kVMkHBa0nc3Dcf5dj3dK+vov0Q1DJ67uHPbItOPC
         cdoA==
X-Gm-Message-State: AOAM5314s3koQeiXgjHaipdSJt+V56tRuQYCh3swjyw1cX1N+2Q16mCy
        YurJlC16ZSJGuNU04WAcSBS262dMahs=
X-Google-Smtp-Source: ABdhPJzoRn2wEXnh57GiQaK69hZDKLp23vTXkuoOTaYbOejmSJcJnx2q5fDTI/fIaz/0zQgbOyf+tw==
X-Received: by 2002:a62:27c7:: with SMTP id n190mr2084749pfn.128.1596753295628;
        Thu, 06 Aug 2020 15:34:55 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v2sm8307324pje.19.2020.08.06.15.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 15:34:54 -0700 (PDT)
Date:   Thu, 6 Aug 2020 15:34:53 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2] input: ims-pcu: return error code rather than -ENOMEM
Message-ID: <20200806223453.GK1665100@dtor-ws>
References: <20200603152151.139337-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603152151.139337-1-colin.king@canonical.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 03, 2020 at 04:21:51PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the assignment of -ENOMEM to error is redudant because error
> is not being read and -ENOMEM is being hard coded as an error return.
> Fix this by returning the error code in variable 'error'; this also
> allows the error code from a failed call to input_register_device to
> be preserved and returned to the caller rather than just returning
> a possibly inappropriate -ENOMEM.
> 
> Kudos to Dan Carpenter for the suggestion of an improved fix.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 

Applied, thank you.

-- 
Dmitry
