Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66390558C66
	for <lists+linux-input@lfdr.de>; Fri, 24 Jun 2022 02:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiFXAqk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 20:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiFXAqj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jun 2022 20:46:39 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A552B506D8;
        Thu, 23 Jun 2022 17:46:38 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id jh14so728068plb.1;
        Thu, 23 Jun 2022 17:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sIdY8E7TPCFQuAYGIBmf2H9K9cIwrMOxniECOy7MOi4=;
        b=pUdfvWyLKE7BkpKAvg5o7Gf9bznenorHWZg3wNMXLVlFLNGFZ0fsj/hw0UkxUJNRnS
         71qqEwOzeLSKtHugx4FZAhVvBoqWVERtpS9w+Gxz10Fq6gXeoVTMTRZuD6plmDO/bh1I
         6yArz6zhtTAVSTx9hNzqliG4MyS1G9B8aJExF8qMWxi9a/+XGjWC32PIrFxaUNPA6K0X
         t1PMnA5J76JstGv2belbQ2vBlwPnRdTNaG0jhFFZvDPJkO1WFHARFWJtsZIjX42YcNAJ
         BwnxdwuJvqfdKwDRRYi6H5IQIgkQWH4pRkW8rgC50KiXL+AulZzGnkJnzQeMbqx4Xjsk
         rJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sIdY8E7TPCFQuAYGIBmf2H9K9cIwrMOxniECOy7MOi4=;
        b=sbpnPH9WQHNeGipH9teSkue0Z+qGWO42LGR5VzD5/bwdOvQyVbyMoego4PH31JZg/y
         VRWliTtHNZhPICBlKdUwOaWd344uGCRvFZ2HrU8OABb8GbGskPhD+ETfUtumGadCdOwT
         5fY42YN1anOuztrwRiIHSfIhpgT1NvVXBVojMyrhYopgMZ7tA23ltzE4PTqng00u2spm
         Tmdi0plo+OH2Rast041lJB7gw4Rya2PFfM5rZaQGD0dmAw3XMNcjEg+2kRNldrdoeHU9
         djgx7pXtAlWI0YxMhQYCkiiwjG6wc45RtBYSmji41aEDDncRMSSM9RLcEdPtLRT9tv5c
         xPKQ==
X-Gm-Message-State: AJIora+qJWyuHW2Mu1DRtssi7nrbAA8sa3xqigyMA75/zLeEBFayFk3g
        /KmNC3zZrWo2rVvu8/YodC4=
X-Google-Smtp-Source: AGRyM1vGRRlLVIpHuYL0G1wLJZv3g2j6dZ3O8SmJPVbijIndNL1YGoyZ1M3n3LqodaRxEkIPE6Ij7w==
X-Received: by 2002:a17:90b:3a8f:b0:1ec:93d4:f955 with SMTP id om15-20020a17090b3a8f00b001ec93d4f955mr767446pjb.23.1656031597995;
        Thu, 23 Jun 2022 17:46:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:96d9:dda4:3142:7c7a])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902bd0c00b0016a35647038sm400880pls.106.2022.06.23.17.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 17:46:36 -0700 (PDT)
Date:   Thu, 23 Jun 2022 17:46:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     jkosina@suse.com, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: doubts concerning locking and signals in input_register_device()
Message-ID: <YrUJagnenN9Zv88n@google.com>
References: <d7f6c510-d367-718c-64b2-e368ef5486fc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f6c510-d367-718c-64b2-e368ef5486fc@suse.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oliver,

On Mon, Jun 20, 2022 at 02:48:01PM +0200, Oliver Neukum wrote:
> Hi,
> 
> I am looking at this code in input_register_device():
> 
>         error = mutex_lock_interruptible(&input_mutex);
>         if (error)
>                 goto err_device_del;
> 
> The problem is not the scope of the locking, but how the
> lock is taken.
> AFAICT this code will be called in the context of an
> ordinary task when you set a configuration through usbfs.
> usb_set_configuration() has to probe all interfaces
> of a device under its new configuration and does not
> handle -EINTR, which input_register_device() will
> return when a signal interrupts taking the mutex.
> 
> Hence there is a window for a race during which a
> mistimed harmless signal will cause a failure of probe()
> 
> Now, as this is fairly core code I'd rather ask what
> you think before I make the simple fix of taking
> the mutex with uninterruptible sleep. What is to be done?

The reason I believe we should be using interruptible or killable
versions of locking is to give a chance to bail (with Ctrl-C or kill or
whatever) in case the system is wedged for some reason.

Where would this mistimed harmless signal come from unless user actually
tries to interrupt module loading/driver binding/sysfs access?

Thanks.

-- 
Dmitry
