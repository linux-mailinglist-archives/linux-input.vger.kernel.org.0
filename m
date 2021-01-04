Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644872E8F3E
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 02:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbhADBpg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 20:45:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbhADBpg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Jan 2021 20:45:36 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA98C061574;
        Sun,  3 Jan 2021 17:44:55 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id q22so15382376pfk.12;
        Sun, 03 Jan 2021 17:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X6YpyZpRmubo1ACvagSXHSQh8cS9M0st8O4oooQ8FUU=;
        b=CJ54pe2BNKkIPTjcA6uJ850e4wl7yJzS3TgYIanYc/vKIhzgi91m/Nvb9hLdWi7Y33
         se6k2SwADn96wTgjWpxaY+Sfh+RWpvmf1dXuveKW6ACuBa3vm1XVfKi6Qsb0jtQlZ68I
         iV7mP4C9iimXrvEYa5ImvEU0slgrmPNVcB8SKscxtUd9OB4Yu1y8DScxEv6QKFky1Xq8
         TEqML6S9ke7+qiws3Pk5bJH5UuBA/Ee2Kk02WKN1MdKTmZmvChkp2B6TyGEYyC5pO3X/
         O57cei3c3yCMz8cQ1clUwFuoe8jAlcHzX56I55sRKzx0oZ/4xU9ekmB4klQFxwIQT42c
         mEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X6YpyZpRmubo1ACvagSXHSQh8cS9M0st8O4oooQ8FUU=;
        b=BQdEs/bFN9b8cIuzm8TnFpBidELgpMxu1ebKL9j/4DJ3zzZA4jt996cud8r8+dZl21
         Hs/Nr21BGZ7lo7anPZS8sSvHFRvbtrAOLUs7fw9OHGnQpirXASX+xkftYL+GA/fFOsHN
         /fxS8IZgQlwWWBtQXc3PgXfLxctSxIsr/lJG+usvcaLWXfNJ4dflMXtWKBBj7AKat4gs
         b21iLiZFs0VvCDJnQKXgDO3xxMkmDRShGL9jmZclLtjS9pD1V9Zy6xS1LJavvDJ1Etsp
         nDGA5PWnoIhHDZMMdbcvC3XlqxxWo27RzvbuWwnFfYaB1ZA6X5y+JH3/xUgLvYnvaAXZ
         cEuQ==
X-Gm-Message-State: AOAM532+Wyij9NliCIN051EnOfWdeDCX+QltdGwJP7CwiAASxDNgTGVd
        53tlIODfFW2v+AKsSNQVjkU=
X-Google-Smtp-Source: ABdhPJz2VEauCHifBmjfek65hGMhBojfA3byMyH2JKsrYkqWiNjLHxSXqKrB382QnNU4rIaK5q/EXw==
X-Received: by 2002:aa7:82cc:0:b029:19e:1328:d039 with SMTP id f12-20020aa782cc0000b029019e1328d039mr64980452pfn.70.1609724695402;
        Sun, 03 Jan 2021 17:44:55 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id bf3sm18807499pjb.45.2021.01.03.17.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 17:44:54 -0800 (PST)
Date:   Sun, 3 Jan 2021 17:44:52 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andrej Valek <andrej.valek@siemens.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: st1232 - fix off-by-one error in resolution
 handling
Message-ID: <X/JzFFbQKUgSHP2z@google.com>
References: <20201229162601.2154566-1-geert+renesas@glider.be>
 <20201229162601.2154566-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229162601.2154566-2-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 29, 2020 at 05:25:59PM +0100, Geert Uytterhoeven wrote:
> Before, the maximum coordinates were fixed to (799, 479) or (319, 479),
> depending on touchscreen controller type.  The driver was changed to
> read the actual values from the touchscreen controller, but did not take
> into account the returned values are not the maximum coordinates, but
> the touchscreen resolution (e.g. 800 and 480).
> 
> Fix this by subtracting 1.
> 
> Fixes: 3a54a215410b1650 ("Input: st1232 - add support resolution reading")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
