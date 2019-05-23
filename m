Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26031276CD
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2019 09:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfEWHUT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 May 2019 03:20:19 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33927 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfEWHUS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 May 2019 03:20:18 -0400
Received: by mail-pg1-f196.google.com with SMTP id c13so2663303pgt.1;
        Thu, 23 May 2019 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vVdvf+2AWc5KiT7ANjzVMpQGfeM7dtNm+6KXSHSOP8k=;
        b=nkF10v4JCYOwrht2XoSkD6Q0oMFEuMm3xKt/rhQixekJiLi3cOetXjAl267F2iQQqi
         Db0+puF7qIf5sKMnOz0BPNWy6L+8aZPauRH7tN8oeztJ/rMZBDnd6JCCivAZ3aJbHPpi
         URSNZi3GMStxpBNBOxLUbb77WRvTzkm7iTmT7rYAkbJJrCC+Cv+lBsUyMKz/d8F9cuzV
         qv9hIp3idIRJbU2+3tfLArt8woNUjaDO01cVpqZJumWRkzkyWYb2rWg7L5kKruIfc+UH
         BZnDTo9mPhYxsbye+Z2SvlwuRt7rAYgjAXjnuSBdGPMpHF+TtUYexuXvUJnb8k4da0gw
         WnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vVdvf+2AWc5KiT7ANjzVMpQGfeM7dtNm+6KXSHSOP8k=;
        b=Z/KpqHzl4prA/DYsu9ELRdIGdrcxar38U+EiMM4D2WeAyddMtWFxiyvJEYqWYDs9mX
         00KUld6CIe8qHm/31STqOMp3ZLo4nzL/CNnOG0Sf+MAdPT3WEYVmABLQyeEOTVIUnn3f
         m49VQGz1DPK5oUc9W8BIVmZfvW2d3lSqeCyBa0nE718UCaFVHo0F+fyzZegYnqv4O1OG
         J0iP/rmdoIg12oZtCF63Zr0NgRbLzMLQFNKR0mT3WNGVuX8Ymqo2Y4+TALL6WtNi8xsr
         GFmZ6j32Wh86KpmZIHt6TLMMojddm5TbhLNmF0gJM/7FlnITupkRQwd+5IXux+XQoymy
         lsGQ==
X-Gm-Message-State: APjAAAWhpcWO6pPWeWS+kQV1SOt1HiECznktiD/fF9wRr3faDI7A0GQd
        2lsG1Ah4igLLe6XTWpxi+BQ=
X-Google-Smtp-Source: APXvYqyfsahn4cHjUoe4Kd29p3jy4+veEkTqMNNg7fxpDMnCTvtKIY28QJKZIB28YRlB1nwzmKbc8w==
X-Received: by 2002:a17:90a:3510:: with SMTP id q16mr217374pjb.13.1558596017252;
        Thu, 23 May 2019 00:20:17 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id n27sm58830999pfb.129.2019.05.23.00.20.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 00:20:16 -0700 (PDT)
Date:   Thu, 23 May 2019 00:20:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Danct12 <danct12@disroot.org>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: silead: Add MSSL0017 to acpi_device_id.
Message-ID: <20190523072015.GB121292@dtor-ws>
References: <20190522045455.15769-1-danct12@disroot.org>
 <6c18472f-bedd-6e6d-121c-8a311495c3c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c18472f-bedd-6e6d-121c-8a311495c3c3@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 22, 2019 at 12:12:47PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 22-05-19 06:54, Danct12 wrote:
> > On Chuwi Hi10 Plus, the Silead device id is MSSL0017.
> > 
> > Signed-off-by: Danct12 <danct12@disroot.org>
> 
> Patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

We however need to have a real name for the Signed-off-by.

Thanks.

-- 
Dmitry
