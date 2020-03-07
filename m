Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBD8217C9FD
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 01:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCGA5u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 19:57:50 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:47078 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgCGA5u (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 19:57:50 -0500
Received: by mail-pf1-f195.google.com with SMTP id o24so1907614pfp.13
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 16:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XVuHkwKdFcINlY5r534wFOLsX6vm4Mc6IquYBCNpEsE=;
        b=LeByFGIE4F8Rq82YcGoQa88kKJThbV/nLxEvwTrb+PI0lH1tzEffzW8MJGtMJiczbs
         jDrvCCyORvgrJuu6S5S7ro2cva4y5sf/PRaxmXLh8fRPCLSVBPlEbMVKPTKh+7LT+8yE
         W6+21QA1qE5YegUecMe8hiexMrsfi2h0CZnNPzDlYV2uNUqTUWUFx629mRfqFDuIrusS
         MiF6ceMdUvKc/+UakWE4ao59JbiNKrMS8bXP2CuZRm0+tk3cTp/BU+yOjB08fgi8FwX+
         S1gkp7WmoljuqcdDSTBtsdVp85D1jtNPeR24t1i/aiXJ4o7YgwCn5aYuv7eIJ20me9E7
         fpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XVuHkwKdFcINlY5r534wFOLsX6vm4Mc6IquYBCNpEsE=;
        b=l+24g9YrtCcRrVHVTj4AC40B1Espv8rc726jyJOLmSxeVRt6MxTkWdnbbQCl5FV1Sz
         y0B7OjKFwPMKtegw2emEV3qRWyt7W71fyGR/eQjW3ymMrIZksc1/JeJnLnR1Gjlx2Gzo
         /ygPY1u9WF1qdeQWpiE0x510cUJwycI407thystILQ+zAuPiAXE6DtJIBdm0WSCLr14o
         FvnshRjpmun4GFYvN1++Jgi2ACjYnz3idFxU+G6DLhqGbFGY85aS6ZHrAl4D+vDUEpBn
         oDdnK33oLgdDbGMaAITIe/xl9pdKy7Svl+70JlzikNxgDL/PKpu1bTtZJz+LXuTRMxtL
         9D2w==
X-Gm-Message-State: ANhLgQ0a90nhsfFYHjFOCIqVUj1GJUZY5EQJaLBDtOPkXsS78qXWPt6p
        apdEzfIw6bZkEA/pkXfpLKA=
X-Google-Smtp-Source: ADFU+vtgBH2QSNGI7qObkwn7fvHNZGY34Ddsig+Ll3w98OHAOoQAH/Hui9wSVEuZvjpWPoNNCmoLmA==
X-Received: by 2002:a63:dc0d:: with SMTP id s13mr5487306pgg.129.1583542669757;
        Fri, 06 Mar 2020 16:57:49 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id t71sm10657088pjb.41.2020.03.06.16.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 16:57:49 -0800 (PST)
Date:   Fri, 6 Mar 2020 16:57:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v1 5/5] Input: edt-ft5x06 - allocate buffer once for
 debugging
Message-ID: <20200307005747.GN217608@dtor-ws>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
 <20200303180917.12563-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303180917.12563-5-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andy,

On Tue, Mar 03, 2020 at 08:09:17PM +0200, Andy Shevchenko wrote:
> There is no need to allocate buffer each time we switch modes. First of all,
> the code is protected by checking the factory_mode state. The size of the
> buffer is static and can't be changed after ->probe() anyway.

Why do we need to keep memory allocated if it is not going to be used
majority of the time? How much is the code savings vs. allocated memory
size (without considering having multiple devices connected to the same
system).

Thanks.

-- 
Dmitry
