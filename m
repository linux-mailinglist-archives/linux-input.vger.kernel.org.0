Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C386577EEE
	for <lists+linux-input@lfdr.de>; Sun, 28 Jul 2019 12:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbfG1KAp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Jul 2019 06:00:45 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34512 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfG1KAp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Jul 2019 06:00:45 -0400
Received: by mail-lj1-f193.google.com with SMTP id p17so55602512ljg.1
        for <linux-input@vger.kernel.org>; Sun, 28 Jul 2019 03:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VrvLj6DFILi3b6Ly4mqOa6I/R2U+lWxphu8GYtz8y9w=;
        b=A3PC0/FgamXcChCWuBEWJtJ4VRcc10GbgpMuBkG2txX6oqZ5CoqQxjlFm1URa5pak3
         IcwpfjaFFeTRB9ER+McWfyjI2BHXUphzl6F+3dE3ZfFMR2hiRI2CiFA+3TsqPBPipbrm
         aq6mFmgjw72NjPFUaYoYzxyNeNSLn52XWwKDA+Na6PybcYJ+d+vT/qRABOngIwRDsZFc
         04YUplBIv5kJ5hFLuTQIlUWRggL4mVMOvfMvaS5cc85yYqzN8hLe2l2PqAXbZUpXc5Z0
         qyd0Lu3WJD0ZTKCrFctHlgyTvPc6fEZa/KeTCsn69fHic90UkzOENi0Fqott9tfzTX4n
         YZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VrvLj6DFILi3b6Ly4mqOa6I/R2U+lWxphu8GYtz8y9w=;
        b=CybDkNgTSMkd/a5gSeBm/gu/BKhMqtuTAyi5bO2mPwdYAsPghOvsHskyqdLtns8qY/
         VSM5Xa9ekEqvTG+ewmL3pkoRWgwJW2RDADZS3oWMzjdWEpU1t8mtnEV/MLnSx6Mwfrj7
         1pnQ2VgxNnsACw2fI1U6jYs3Ghq14un/5wDfqXTZW0ZluJiDee7mlmcFuDGAuxJXMZM4
         2gTCnXQvEQaOmAJq11s/3VqCAtGModfEFxTl339t9UhuHaGCyt2PQmAymWPWubZAIHOL
         SoqZ656ZQbAeDtL8eN5x3xr88mNFbtcVOp7QBWNAHHLcPhojlDApwcQbA3akcwJBc7rc
         SFHw==
X-Gm-Message-State: APjAAAXLfik7crJQit2z+leOMno9+E9YeZBGO408bZR2YqoH3gZGJNEW
        2qZZYtVByA0eJDkmWLA/TTU=
X-Google-Smtp-Source: APXvYqxKebqHb+JbkhDR06wc85yORqJ4fHi6zWcUPsOelb+nJkGmCUV+I80VF9LmgEyKjRD8rB5pSw==
X-Received: by 2002:a2e:301a:: with SMTP id w26mr53265295ljw.76.1564308043518;
        Sun, 28 Jul 2019 03:00:43 -0700 (PDT)
Received: from localhost ([178.155.13.240])
        by smtp.gmail.com with ESMTPSA id s26sm11974342ljs.77.2019.07.28.03.00.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jul 2019 03:00:42 -0700 (PDT)
Date:   Sun, 28 Jul 2019 13:00:38 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v1] Input: mpr121 - Switch to use
 device_property_count_u32()
Message-ID: <20190728100038.GB775@penguin>
References: <20190723173800.66553-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723173800.66553-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andy,

On Tue, Jul 23, 2019 at 08:38:00PM +0300, Andy Shevchenko wrote:
> Use use device_property_count_u32() directly, that makes code neater.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Please ping me if you do not see it in the tree by rc5. I'll sync with
upstream to pull in this new API around rc4.

Thanks.

-- 
Dmitry
