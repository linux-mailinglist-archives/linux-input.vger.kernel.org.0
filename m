Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA7A23E410
	for <lists+linux-input@lfdr.de>; Fri,  7 Aug 2020 00:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgHFWf3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Aug 2020 18:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgHFWf2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Aug 2020 18:35:28 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686E7C061574;
        Thu,  6 Aug 2020 15:35:28 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t10so108702plz.10;
        Thu, 06 Aug 2020 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4Ffwx5GNZ1Kn2mNu0I27LVKLuXuWPjCJXsxeuoY5EFg=;
        b=j5+wtdqaGTLR9rIgdHHTG+BaExbHGLXqMXP1KTDhJ/QIcB7jAmDgQRKzkjQRssbBoM
         ioH30UJCdpDzWJ/YU97Q00wgXrUiaIC4pVzyxvfyXoi0iJA8FtIZnk3gA5uGP8YnBEtQ
         o6JSTwEvKjPdiCLzhsm423ziNnJQ0h3WrMYRnDhyHvYg+2y15JgD6eN49uTuvaQQV5pW
         T5pgZfqeVdsLmruAGZcwqPmbYCTn+E1YlyHPspqjgGNCKE9kM9uTeMix7uxnABnvCUsg
         Rk5o2rPWONnlbRqGDpZYtBe4jCde/h/CbiKIMBp+JANcHjd/u5757vCH7NZrzSte9Bwf
         N7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Ffwx5GNZ1Kn2mNu0I27LVKLuXuWPjCJXsxeuoY5EFg=;
        b=WVegnJ7S2gEw17pqiLnsp5YZ6rhRjlgauPlSWEr/xbcrEbBRgqRb38i3qjGi7sNyLz
         DZClFdlrdekEMRgb8Ii+2y0lcrAdm2LiNwOqnSBAoafSt1eF4eO7uQX4Qbewtqro4VcX
         QzKiiVFxJlmTKB8e3dwRtxNMK5q4M+SU9h70OQ7uDKo9bqToqWaBBrxL5C74qmo0aCyu
         IUU6n2Uq91rzRa15qHIABUJ1qSJLph2zvOEU8l/HuRxUyj0aTf554iBpkjQgY6WSbyPm
         TOlSiygodsXftaz/pya8rC6u0JaPdvQG6o/wHjHUHDvncEGdtL9O8qBkIDjvRSyOkhru
         zszQ==
X-Gm-Message-State: AOAM530XecGs38zxkin1YVk3DjxifEir7vLg2cxmlZeW+hKkEms286t1
        msRoGCSzQ2ZXxrI8422uOms=
X-Google-Smtp-Source: ABdhPJx2hR9ZvBQnXEVHXyiWNCCnSd1Do0lNRu6pHF202AzcPDJxz5ZNwoOS6r3cmi5233qYJY8pKQ==
X-Received: by 2002:a17:90a:1697:: with SMTP id o23mr870637pja.95.1596753327917;
        Thu, 06 Aug 2020 15:35:27 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v2sm8308139pje.19.2020.08.06.15.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 15:35:27 -0700 (PDT)
Date:   Thu, 6 Aug 2020 15:35:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: alps: remove redundant assignment to variable ret
Message-ID: <20200806223525.GL1665100@dtor-ws>
References: <20200603135742.130852-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603135742.130852-1-colin.king@canonical.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 03, 2020 at 02:57:42PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

-- 
Dmitry
