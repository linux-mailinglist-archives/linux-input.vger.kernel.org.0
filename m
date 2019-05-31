Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8DAF3171F
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2019 00:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfEaWTO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 May 2019 18:19:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbfEaWTO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 May 2019 18:19:14 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1712D2229C;
        Fri, 31 May 2019 22:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559341154;
        bh=7x5d5BUU6Eua1GcaZ9iVc3X2KCatlvwlQ+HrL0rUJtE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=d/+sdNEWM4ADrG4PU/C/JsHLejWW8U8XpteeYoonvtxxthtEM/Uih3Ce9qHsfNY3/
         I58neI4F1iA+2ORdoHxY9Z5ibKFSmTkmBbQTvKkLJ6PAC5FEykIYRLzPCqhvm7oKPf
         8JiVjF6p5VITCsNYmvFti6w2JVcWnsWgI/26sHno=
Date:   Sat, 1 Jun 2019 00:19:11 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Joseph Salisbury <Joseph.Salisbury@microsoft.com>
Subject: Re: [PATCH] drivers: hid: Add a module description line to the
 hid_hyperv driver
In-Reply-To: <20190530173720.17994-1-sashal@kernel.org>
Message-ID: <nycvar.YFH.7.76.1906010018310.1962@cbobk.fhfr.pm>
References: <20190530173720.17994-1-sashal@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 30 May 2019, Sasha Levin wrote:

> From: Joseph Salisbury <Joseph.Salisbury@microsoft.com>
> 
> This patch only adds a MODULE_DESCRIPTION statement to the driver.
> This change is only cosmetic, so there should be no runtime impact.
> 
> Signed-off-by: Joseph Salisbury <joseph.salisbury@microsoft.com>
> Reviewed-by: Michael Kelley <mikelley@microsoft.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/hid/hid-hyperv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-hyperv.c b/drivers/hid/hid-hyperv.c
> index 704049e62d58a..d3311d714d359 100644
> --- a/drivers/hid/hid-hyperv.c
> +++ b/drivers/hid/hid-hyperv.c
> @@ -614,5 +614,7 @@ static void __exit mousevsc_exit(void)
>  }
>  
>  MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Microsoft Hyper-V Synthetic HID Driver");
> +

Is there a reason why you didn't CC Joseph on this submission?

CCing Joseph and applying. Thanks,

-- 
Jiri Kosina
SUSE Labs

