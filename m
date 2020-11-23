Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7652BFFDC
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgKWGQJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWGQJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:16:09 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A713C0613CF;
        Sun, 22 Nov 2020 22:16:09 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id f17so4746932pge.6;
        Sun, 22 Nov 2020 22:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DCable7HD0+HY74+Qw8G8kXCq/5diaicwzgNs65pvMk=;
        b=qvo3vdUEn6Dr1q8jy+2s18T8gVFxM74lo14TdhJ+BGxaPXd2TqPoOOcVw43warPNDP
         sjG8upXo07fUkA7FyAC0lcvAvL3F8j72LBJI3jARwRfx9Vjyf0lP7q7VzjkWRdbR4qsf
         25L3hIeqDRWpqlOcTU8z5dBN8PPgk++IR12z41IfBJnkYCCtdBy2ANkrZ7xf2Hzel4SR
         XArioSAW/EWUKnF55v0RrAu77xOKpHAi7PrdIb1PiGcMk2Hn5N3kAl4LeWM5/HmAitRH
         1IeQ+Hhlao6xwxRES5Ew6QgYRVSWAIdI1dEFXxm1G9Izj0JRHXeVsLNCZmAPE63XeGUK
         FKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DCable7HD0+HY74+Qw8G8kXCq/5diaicwzgNs65pvMk=;
        b=sKxk18hYl+xHxMcw9wK2Z6HKhFm1ld9U1V9FxbX4mM/wAhvXgAh12/EL74KxllVuBG
         eomkcXOqSCMLliI87alnXZ9OuD1jIafaxXT00jFu5JLvvX1LLNo/oD3pYLRLqF1GEVv0
         uPNd94iqKO40aKdEzWADFLeETwLunLbX60W24dJmKdh6TOKdOWVQuBpRDs841Plh/bjx
         37lBI/tisWg3jShZetdSEBCP7nLOiORj0pPkQK87WnODNzOwf5h/7Wj9FLL82LCKjz3k
         hUpXFLxdAR9Y186Iy6nxB3xi83gOITiJzgh8iG3vCqhvaJgJUAybsNbK3KlMgRsbYwsg
         Kmzg==
X-Gm-Message-State: AOAM533A0n69kRX70reqR8edGq+ZkjNwWzGy2DH1k18j/NvUjaAYJZXk
        2HbMjn68k8iPi829P7LSM0c=
X-Google-Smtp-Source: ABdhPJzmZZRHxAR1fcOINagoGLJvYnlLKw7XpDyizR7ahjnXatVDlyv8GiD2+2Zy4S/96PSdaoKIGQ==
X-Received: by 2002:a17:90a:66c7:: with SMTP id z7mr23224312pjl.175.1606112168624;
        Sun, 22 Nov 2020 22:16:08 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g14sm1740617pfo.198.2020.11.22.22.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:16:08 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:16:05 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 141/141] Input: libps2 - Fix fall-through warnings for
 Clang
Message-ID: <20201123061605.GX2034289@dtor-ws>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <d2944854e3e118b837755abf4cbdb497662001b7.1605896060.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2944854e3e118b837755abf4cbdb497662001b7.1605896060.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 20, 2020 at 12:41:12PM -0600, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a
> warning by replacing a /* Fall through */ comment with the new
> pseudo-keyword macro fallthrough.
> 
> Notice that Clang doesn't recognize /* Fall through */ comments as
> implicit fall-through markings.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied, thank you.

-- 
Dmitry
