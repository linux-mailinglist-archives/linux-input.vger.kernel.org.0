Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D533307A8
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 06:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbhCHFoy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 00:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234610AbhCHFoa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 00:44:30 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD3FC06174A
        for <linux-input@vger.kernel.org>; Sun,  7 Mar 2021 21:44:29 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2465911pjv.1
        for <linux-input@vger.kernel.org>; Sun, 07 Mar 2021 21:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=diWRnKUhd0X5PPxVfKJ8uh93EyMFq5+tYw0pWxc+49Y=;
        b=Ma1HOflbOm4XT5LvneeS2uZclM0XFZSbMKT8ylOE0uwuMkQ7+KAEzPMPp/sgh4a+l3
         hcjWsCldMGFkOvN/8kIGU7hItBHg3BkhroFFkCg0BVz2PJZi9irJiYT9BEgmZ8uW82SX
         +5uQo2zOHQFadxLVPODtKY11Th77ylewlnfFtnVdb4QuDT8T3a4jhW+QRBqPEGmHnzON
         LdpPfdzo9SHqVIxmWcq4eXnS4PEOV9ajvu1tyvyFnHdgQC+kNya3j/wvYfmMkqgL9s8r
         +8iqdGGqU+1UahG66aKNjtutIkOTnKG2R5NeMyDDf7P1Z7zH/pslAezySmAHzHUsulLJ
         t7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=diWRnKUhd0X5PPxVfKJ8uh93EyMFq5+tYw0pWxc+49Y=;
        b=L7+Fv5Hit77ZoU9cof9WWAPWDxnjX+jvbXWkJLCG0RcCiIilIWgMDGeMM398tmgrz9
         A83LMxcDzbH2OyMjg2B2V5+GkRDpgQoxEFc2/F1/1kxXMicTFLRVp5AsD0C13PNJp6Pt
         bSwULzBkRCDx11a4ZBtdK5aKOZf986myekolhz2t5X4PGyOdYMjWGb9TDtTLwz5SvuQR
         A8DDqfDMam3P5pGcxMxt+zlHumPLdP0q3DpL9bqTgMdc65gPql8p7YOxxL/4Xtua5r57
         nhvQQfS7B+PSEZsH31LmKiTgs2Hu6+//Gx3RRLAR/PGESPEuonTFp9KslWOt08r7Ly/e
         CXJw==
X-Gm-Message-State: AOAM531rjH0p+hDqc4BSbphv1EqbZVSo9TGGw1D5TIC4tWRjSATpe25W
        5tf3M+N9DgY8fQ9OUHeEC6OzXCseULs=
X-Google-Smtp-Source: ABdhPJwICQqRjJWb7YGexbqvIZapqxIXkgO7/jMogx/6vhgXnn1XlfXWXUJ4uHviVC/u23YXXQPJmQ==
X-Received: by 2002:a17:90a:31cf:: with SMTP id j15mr22326309pjf.41.1615182268337;
        Sun, 07 Mar 2021 21:44:28 -0800 (PST)
Received: from google.com ([2620:15c:202:201:39e0:7b5c:9fa7:f6e0])
        by smtp.gmail.com with ESMTPSA id w129sm5538455pfb.191.2021.03.07.21.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 21:44:27 -0800 (PST)
Date:   Sun, 7 Mar 2021 21:44:25 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH v3 4/5] Input: exc3000 - add type sysfs attribute
Message-ID: <YEW5ubgAqMm1XXoB@google.com>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
 <20210125182527.1225245-5-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125182527.1225245-5-l.stach@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 25, 2021 at 07:25:26PM +0100, Lucas Stach wrote:
> Add a sysfs attribute to query the type of the touchscreen device.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thank you.

-- 
Dmitry
