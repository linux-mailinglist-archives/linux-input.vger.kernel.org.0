Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8952B8C07
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 08:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgKSHKY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 02:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgKSHKX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 02:10:23 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5608C0613CF;
        Wed, 18 Nov 2020 23:10:21 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id w4so3372946pgg.13;
        Wed, 18 Nov 2020 23:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ICaP/kRHh+WJ0q5LTDudZxgEHWqr09tmT1z9R/ohpRw=;
        b=MfqFCxi19rVS8Ff0tmmkLCT2cyyvM03XwdGC2CNMuZbQbxAQ/4AxQFJh3kNkqZ2Pnj
         pbyW71qA8gIKh/fGQllNQEmoCTZTmmsuPB3E5o4TapyfO1smUxD8qbFBp6hQ5q2ZqOr2
         H+oQFGLl752p41F1dSaHgRqoovgXIxvmp97FaTlQgdYZo93LBBFZw004TQooz2hVCUYk
         ycx4K5gQJ1mX4JciE8n+SqAVC1juQjV18dQ3L5/2SBM3Y3oCBoRSvwEcL76mXoQH+hOG
         9gluvvFl+2Zyqjl9Dzzw/v9FlmIuuRiOamVueMLTO8vTQkyIurOhO9jnbJ3wq8M5cPsx
         Qj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ICaP/kRHh+WJ0q5LTDudZxgEHWqr09tmT1z9R/ohpRw=;
        b=CfwAuS67IoLKsvao/mMHManE99JfvZ4EcPWLqC2UCJnC1TEl6nMaDt0uSf8D2skCsX
         A5fFKXKyrXWCTRaqWUC1j8lStjVfk5hYTbl3oGptGhEz/UzWgiiS95TYxMVUhbRXriUd
         W1FOLavBclBDkXpSVJdrx2hW9bEKt18IaLEVMD1KbRTtCiZstQr9MkBIIA2x7JbC9rdh
         XNx/gwszobGTQgop5qsPJwXXCeQVbORSUpujTmU2AcCqdAfjJxzQq29ueN65s+9UlndS
         6o+XWE4ON1rZPA2zDiFWZffWUbsZ/1Vm4torWbGCYTUrrF0NLXwY7eTIbRbrg6lsb2nA
         3R8w==
X-Gm-Message-State: AOAM532REIbpnLM2Vz0hT9gyNn3TD+9omVwCo0h4GOD0V+Z0vPOVkuuR
        JJ2sGdRfg/UR1GHl8/oFgKI=
X-Google-Smtp-Source: ABdhPJyouFz2b0USmhiP26a7Cwh4MtbYHD7wOlb3uJHR0sKCEURdlwplc7i8gWWEHcgd/TcpiDLuKQ==
X-Received: by 2002:a62:a11a:0:b029:18a:df9e:f537 with SMTP id b26-20020a62a11a0000b029018adf9ef537mr7645545pff.29.1605769821284;
        Wed, 18 Nov 2020 23:10:21 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x192sm27568173pgx.9.2020.11.18.23.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:10:20 -0800 (PST)
Date:   Wed, 18 Nov 2020 23:10:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] Input: adp5589: remove setup/teardown hooks for
 gpios
Message-ID: <20201119071018.GE2034289@dtor-ws>
References: <20201112074308.71351-1-alexandru.ardelean@analog.com>
 <20201112074308.71351-4-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112074308.71351-4-alexandru.ardelean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 09:43:06AM +0200, Alexandru Ardelean wrote:
> This is currently just dead code. It's from around a time when
> platform-data was used, and a board could hook it's own special callback
> for setup/teardown, and a private object (via 'context').
> 
> This change removes it, as there are no more users in mainline for this.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Applied, thank you.

-- 
Dmitry
