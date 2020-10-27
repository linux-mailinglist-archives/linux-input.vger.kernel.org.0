Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CE9299ED5
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 01:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440830AbgJ0ASF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 20:18:05 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:50648 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439217AbgJ0AKY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 20:10:24 -0400
Received: by mail-pj1-f65.google.com with SMTP id p21so4094008pju.0;
        Mon, 26 Oct 2020 17:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1azfFq7q86IJb4o/XiSShhCM71XtUbCQRnzUDV1c5hs=;
        b=CoL3T/+foImUudkNj5w5m35TvLFtBjZHoI8jYuhYhaec+00NWjtfC9ivEQmBCy3TDf
         +Xj8PsDtA4yfW1HZW2lXOlOPANfg4PBtw6oARbLMXSvHmYTD14Zbw8RoXXAMStI3Zfju
         sThv9XVhpuGxHhbDKKMKQfJybAd6BIojpT8RvF0dWGwTB0Q6oYAb4c9y9PuYWvceNFKj
         Ylzd9Y6gYhU9U/v2dtJh2jJi3GqSVoKTgTIY6KIOi2gOC7wcKWOgrqOzr+XbQh8WMVqO
         jZHv9fGS+3PrtVpdc9WWcG31+WAfmJmvZozi72V+39FgjJ3jf3zKsXrwHXuIiMSTbo2h
         +Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1azfFq7q86IJb4o/XiSShhCM71XtUbCQRnzUDV1c5hs=;
        b=lHx+KKUQ3HsknPgefFCg/tT9w7v0zwt0Jl+jfbjJJ6KjFBGtXVZaM3w2hW3MnO+AkI
         gqV51irUJXFfAB6qOTCm5IR+D3OzHb5X3ZGaJo7KNkHwg+Xk0eu1Mz9BI108nCFiS+cX
         QqiqqBNZABtc4VOVICwV0Tgf/mwHuWBUds+wyXB4kJK3z0gBYXSqILsfBKa5nkzobD/q
         IKTm0wGhNLdS4zLB5UhnvzsQgQfcNcc7rbnSwT83aCE6rRWXDMId6hok0l4Cm9dGcGzg
         /D7mNYXI+AAlbrnK0ddPCvIZbEpcJvYn5r7hybc1lXvjIMj5BQQsGRTR8LO38kdk1h3T
         /PJQ==
X-Gm-Message-State: AOAM530VUCCE5c7fnl5tWHrFqSOAcE0YXx1NQ5WxE4dreff84UqZfL+/
        9LZLxMce2tbAZTKoYL42zmHC9iT0nAg=
X-Google-Smtp-Source: ABdhPJyfyJ2C84xMaPcFdyLvVpQYe5GC5bPxz4jk88YO2/9URWIbpKmzD8TisO3JIqUbUxyBFmkHmQ==
X-Received: by 2002:a17:902:6a8c:b029:d5:da81:dc42 with SMTP id n12-20020a1709026a8cb02900d5da81dc42mr400568plk.40.1603757423415;
        Mon, 26 Oct 2020 17:10:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z13sm1814233pgc.44.2020.10.26.17.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 17:10:22 -0700 (PDT)
Date:   Mon, 26 Oct 2020 17:10:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: adxl34x - clean up a data type in adxl34x_probe()
Message-ID: <20201027001020.GG444962@dtor-ws>
References: <20201026072824.GA1620546@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026072824.GA1620546@mwanda>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 26, 2020 at 10:28:24AM +0300, Dan Carpenter wrote:
> The "revid" is used to store negative error codes so it should be an int
> type.
> 
> Fixes: e27c729219ad ("Input: add driver for ADXL345/346 Digital Accelerometers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

-- 
Dmitry
