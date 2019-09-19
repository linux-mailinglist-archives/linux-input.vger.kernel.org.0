Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E91CDB7EE3
	for <lists+linux-input@lfdr.de>; Thu, 19 Sep 2019 18:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390447AbfISQQS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Sep 2019 12:16:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41921 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390392AbfISQQR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Sep 2019 12:16:17 -0400
Received: by mail-pg1-f194.google.com with SMTP id s1so1046270pgv.8;
        Thu, 19 Sep 2019 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=96xe+OxUUUEMI/u9mJy0dqx2snvxcxxbBsQp1afyLAo=;
        b=AYcsZiJpkFXAuzPdPo8T3AeSLUIs3sMm82CxyxycywWyutH6kSFLclIKY04edqfwP6
         L2dSDaWpTDnbfGiwVGy+RgE78hzzBlpgQjZPz5aSgDihq6uUKaZ3i3TSKmZTCBFs/t/A
         BUgIua9qgMH6FTKFLe+agpWSC8A/p4jjTxCadFf/Tt7pbKzskzVuFjPSu2ix6a2aCCkv
         ZtbGo6aqThuakltuWBd7X8S+ik53tA22bYz0+GmoCBBOccJX2hCi1WyhY8C6BwfxK2OF
         XHSNWQS4ycT/GJV9UeAJ/jYVeJ6nZf9x6XEWE8NJ8QC51AOHIqGbdaAXE4KGhi18Iras
         rsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=96xe+OxUUUEMI/u9mJy0dqx2snvxcxxbBsQp1afyLAo=;
        b=ObpuO6yTm3MuOTM/zMq6oZkaYguZ8l8wt+G20yA3U7RHcYlsUPukes0R6ejRzK0HVv
         Jn1+Pvvk4LXZzJm9emqp4tYXqNiqWR3iNQQxyjUeNcGBF4LI6IZmRP55VXm0Oad/YLTP
         61xDrIvWpucc605AJNnQ210URi7B9nFaeKLuZ3rk1RPTK7gxJjEml7l3fYHbnpsfTOC6
         sMulUwwRdjBVQrTd2CpJJXc156olwLPFgWZ7RBeJLRYtcWzoKBpUuyUlyIXDs4Z5EFjC
         jjyJqc205W8G819qdWzrAaWq2VelvmTbBxym7ZjftXu9If0emRwuGteRrrLhEeiOj9Eu
         KSfA==
X-Gm-Message-State: APjAAAXOfjXj+z55krrpZL92ti04WAdLJrsg06h8qDjeaxeArFNNyVxv
        TdrVPmlyccMgtX+c5Y5Mc98khNaZ
X-Google-Smtp-Source: APXvYqw9AcaTW8XkQKZMXZmSbH9wuZgAFQSCFBAKJcCxD2ADg668NsCpGOXaFVGC/RPKgnXN+bWHcg==
X-Received: by 2002:a62:bd08:: with SMTP id a8mr11275941pff.85.1568909776652;
        Thu, 19 Sep 2019 09:16:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 22sm10066261pfj.139.2019.09.19.09.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 09:16:15 -0700 (PDT)
Date:   Thu, 19 Sep 2019 09:16:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rishi Gupta <gupt21@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hidraw: replace printk() with corresponding
 pr_xx() variant
Message-ID: <20190919161613.GR237523@dtor-ws>
References: <20190912203119.GC636@penguin>
 <1568824151-12668-1-git-send-email-gupt21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568824151-12668-1-git-send-email-gupt21@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rishi,

On Wed, Sep 18, 2019 at 09:59:11PM +0530, Rishi Gupta wrote:
> This commit replaces direct invocations of printk with
> their appropriate pr_info/warn() variant.
> 
> Signed-off-by: Rishi Gupta <gupt21@gmail.com>
> ---
> Changes in v2:
> - Removed manually adding prefix "hidraw:".
> 
>  drivers/hid/hidraw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
> index 006bd6f..2d082f3 100644
> --- a/drivers/hid/hidraw.c
> +++ b/drivers/hid/hidraw.c
> @@ -197,14 +197,14 @@ static ssize_t hidraw_get_report(struct file *file, char __user *buffer, size_t
>  	}
>  
>  	if (count > HID_MAX_BUFFER_SIZE) {
> -		printk(KERN_WARNING "hidraw: pid %d passed too large report\n",
> +		pr_warn("pid %d passed too large report\n",
>  				task_pid_nr(current));

It looks like here and in the instance below you actually have a hid
device, so you can use hid_warn() instead of pr_warn(), similarly to
hidraw_send_report().

The change to pr_info() in hidraw_init() is good.

Thanks.

-- 
Dmitry
