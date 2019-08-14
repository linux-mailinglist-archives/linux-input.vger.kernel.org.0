Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8AC8DC30
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2019 19:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbfHNRsO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Aug 2019 13:48:14 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40641 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbfHNRsO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Aug 2019 13:48:14 -0400
Received: by mail-pl1-f196.google.com with SMTP id a93so50950183pla.7;
        Wed, 14 Aug 2019 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0NgxYQZyADX7wGeMf0qg8RogagcfEOIY3QXxQvCx6fI=;
        b=gkUo10isoegn4SBnVHc/SxhQpAVtJoBCEjnMMYwpmtTIAaP0KX6tTSW4Wlc41T7NOI
         Z9Zv1CNw0TM2L8bVcrAzvdlaKALot9PyfplL95knbvOnObki+0pw8f7Md8IZmJiZGHpw
         I8ECQyV+ideNMiGKgEEBP+rhPmsFQLv9ZpOfwExj7cXTwJFywnJJMtQCCTE3thfapCaj
         luXEz2fVIAh+2v+Je68tXBgrvNxqJBcaKK7WYgrKiT162cNAcQuPkCawNoCeIiN2mucc
         KC0zm2BbvYvk2gHR6Oi90A+9xdkc20Z07EYpmJLyOVgXslqWvK5ug6Q6WbKLmadOEpcP
         8y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0NgxYQZyADX7wGeMf0qg8RogagcfEOIY3QXxQvCx6fI=;
        b=JSy1chz7M6HpknVbipJuLKaJgXEW+GlMPKqvx2cSwDcvb8yjl2vgAEpCDGriPlXO8Z
         r2m/aTNt8AlKyS2qcC12/2VuIt0fSJ05vHK+DrEteeMC5g7/BVoEkCrPvLW50dCbd7Iw
         o3KVTztfmFZLzSGHr+XVT10Wb98LWqyF1CaSueNmXzna4FjF+vYG5XgVB1gQqd351AYT
         GHPgb/OQ6bQ/54TZFjXLpkR7uMFleIxOc/ADPpkI+kuDkCaAWThct13w7pVt89X5UhNk
         1raPZ3KLVKbnEPwaq61R7F5BcH20I9azE9mIGy8hCCrsGu6ZyAcTj4OsHvjZX3FFHa29
         AvIA==
X-Gm-Message-State: APjAAAWZb83agDJorBOhy6AlObTGoPUvNOkyza4mTksujd8tPfjZsdhx
        eZuRm89QjC/7f/XBIRDgA+4=
X-Google-Smtp-Source: APXvYqw0rP/rPYfBL/2kR6Jfxvyiykgzo5X9oZ0tapP/Do+OFFuCSHZzWBMt/vcchc5RqT6ElyWIQQ==
X-Received: by 2002:a17:902:e106:: with SMTP id cc6mr514588plb.255.1565804893019;
        Wed, 14 Aug 2019 10:48:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p1sm445586pfn.83.2019.08.14.10.48.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 10:48:11 -0700 (PDT)
Date:   Wed, 14 Aug 2019 10:48:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 21/57] Input: Remove dev_err() usage after
 platform_get_irq()
Message-ID: <20190814174809.GB121898@dtor-ws>
References: <20190730181557.90391-1-swboyd@chromium.org>
 <20190730181557.90391-22-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730181557.90391-22-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 30, 2019 at 11:15:21AM -0700, Stephen Boyd wrote:
> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
> 
> // <smpl>
> @@
> expression ret;
> struct platform_device *E;
> @@
> 
> ret =
> (
> platform_get_irq(E, ...)
> |
> platform_get_irq_byname(E, ...)
> );
> 
> if ( \( ret < 0 \| ret <= 0 \) )
> {
> (
> -if (ret != -EPROBE_DEFER)
> -{ ...
> -dev_err(...);
> -... }
> |
> ...
> -dev_err(...);
> )
> ...
> }
> // </smpl>
> 
> While we're here, remove braces on if statements that only have one
> statement (manually).
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Applied, thank you.

-- 
Dmitry
