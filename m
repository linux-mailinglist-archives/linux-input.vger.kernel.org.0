Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD162EA124
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 00:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbhADXwN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 18:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbhADXwN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 18:52:13 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704A9C061574;
        Mon,  4 Jan 2021 15:51:32 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id v19so20079344pgj.12;
        Mon, 04 Jan 2021 15:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FhUpEO+5p3LEHY1dTLvydWrAfFUq4dwKw8m6KddxEmo=;
        b=De23hGEmQ/leNj7ycpp5iQ3hkQofyF7JfOyYD2sqy8X2nWNNSxVF7Pyc3onyM17ERJ
         dVOGaqxUE3f3meX9ZlUp5ob69x6F2WxBj8Yc9xgJVit6m/y9d3aHDadFcMIcx/0AP0xn
         cQn2tBbrJartCZLBllkNjXSJElxHxeAl/udknSWHzddcAaCX2JWZVALOEIEzmwFGRgDs
         8uZrY3kxMTAHLKCbdr7wX2sxCFvo+tJJOkhxgLfmb8z/G8HJqBUe0HkzvfrIo8VBlLit
         Z3vgDvLNdoQVXd8uOHrQfiUYnnqBOHzDQ6WvUPSyRsY/AkE2y2WwxXjtoEgDe5KMpbPp
         jMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FhUpEO+5p3LEHY1dTLvydWrAfFUq4dwKw8m6KddxEmo=;
        b=W5N+K+u1rVPkUkLupWRL4cRgVmZUw2jhfQAr/GnU8GFhkDm4rXOCchVbyemus8Y2i+
         53iGwIxCX43DgC6kiE45VOQACW+zq44278lPXUWszsKXeiGtqYk24eA+znD462iZtBqt
         1UQXeuULA01CWhloGks+hnH50NYc9VJeb7cRUqNgafC8pyS3BL0LobyPYtr6HG0kHDIC
         276wuD/Jgwcp/nZpnBGjf3ia0SEXJam5MChdJnihBmFwjkfWM1oydRG4odNjZe+R5g5L
         6FN6sxa7ZHQ8C8kPSSeJf0qYoV4wTPDrDeS6FZXYRpXVFjLvP5l0ZeuuwpKXg+2yb/Vl
         qHIQ==
X-Gm-Message-State: AOAM5311EHmqOeV9IN7sIxak0zWnvmYNUhMFR4tirZtfQUo852oIQkxh
        QWsU0RfK71P0CZgazqlvJ/WMMv/NXkc=
X-Google-Smtp-Source: ABdhPJzPa6e+ftPXqqpYzv+JSZ9avkLgWKVdMZKxpEoeo6jG2Z6gMtIwhAJQwpCzv+Aeylx5BUq5nw==
X-Received: by 2002:a62:37c7:0:b029:1aa:22ea:537d with SMTP id e190-20020a6237c70000b02901aa22ea537dmr66214026pfa.56.1609797406347;
        Mon, 04 Jan 2021 13:56:46 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u25sm57058108pfn.170.2021.01.04.13.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 13:56:45 -0800 (PST)
Date:   Mon, 4 Jan 2021 13:56:43 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <j.w.r.degoede@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        linux-input@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add swap-x-y quirk for
 Goodix touchscreen on Estar Beauty HD tablet
Message-ID: <X/OPG5caR4SJ/PMH@google.com>
References: <20201224135158.10976-1-hdegoede@redhat.com>
 <99d3da8d-3319-3904-25d1-a9ff34be653f@redhat.com>
 <c7b47af9cc3bd1d38b6c3582f6e63d7876365ee9.camel@hadess.net>
 <2ce7980e-e90f-f778-d349-44e35b3baf1d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce7980e-e90f-f778-d349-44e35b3baf1d@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Mon, Jan 04, 2021 at 02:24:27PM +0100, Hans de Goede wrote:
> 
> Dmitry, once I have a patch ready to move the goodix rotated_screen
> and inverted_x_screen DMI quirk tables to platform/drivers/x86/touchscreen_dmi.c
> where all other (x86) touchscreen quirks have been gathered so far, the question
> becomes how to merge that patch ?
> 
> I see 2 options:
> 
> 1. Have 2 separate patches, one adding the quirks to
> platform/drivers/x86/touchscreen_dmi.c and a second patch removing the
> DMI tables (and the code handling them) from goodix.c. And then merge
> them through the pdx86 resp. the input tree.
> 
> 2. Have 1 big patch doing both.
> 
> The downside of 1. is that there might be a point in git history where
> the coordinates of the touchscreens regress. Depending on which pull-req
> lands first (if the pdx86 pull-req for 5.12-rc1 gets merged first there
> is no issue). But only when git-bisecting so I think that 1. is best to
> avoid any merge issues. At least platform/drivers/x86/touchscreen_dmi.c
> sees a lot of activity every cycle. So another option would be to 
> do 1 big patch and then merge that through the pdx86 tree (I can provide
> an immutable branch for that).
> 
> Dmitry if you can let me know which way you would prefer to move forward
> with this then I can prepare the 1 or 2 patches (once I hear back from the
> "Cube I15-TC" quirk patch author).

I am fine with a single patch going through either platform or input
tree. We could even have an immutable branch off 5.10 and merge it into
both trees to ensure there are no clashes.

Thanks.

-- 
Dmitry
