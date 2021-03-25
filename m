Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E35349C48
	for <lists+linux-input@lfdr.de>; Thu, 25 Mar 2021 23:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhCYWby (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 18:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbhCYWbt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 18:31:49 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9175CC06174A;
        Thu, 25 Mar 2021 15:31:49 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id v3so3271011pgq.2;
        Thu, 25 Mar 2021 15:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EmLcgF1u9OHQdNQJvc1RdIqmppq+TxMi8g7LBfwF3pg=;
        b=RWpg+/QeRT9vqXNET5uBaFAyAO+jQ0pdYIM1O46KSP7ptGhLDWrxy/nYmBcI5Vgbho
         0QjtbA4pMNvJQGfPARYzelplKtcZyIfrUOHSoLed7ILyR8LHjGxPodt1fL+Erez4NIYC
         /y7PQorfEZxx5+7w/dwXEKBgks7rLMk4bgZUDyKt4lp5oYR/bF0Bm70C4It69OxwGi0h
         Sxn3t7+2nSgpGyVf9DVRIwj4mb9vwh3Tw2DD+e7OQ7Xa68kVD2hAj92KKRj+xcx8WBaK
         gbhUrd9YqlsGh/GsKnmnWsnCusW+M7c2rYMVz931/wJSYwG3X/vp+9cXQMtmeuOWBZ6q
         hTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EmLcgF1u9OHQdNQJvc1RdIqmppq+TxMi8g7LBfwF3pg=;
        b=lAtvByB7uU2Y1nokGPtct/D/VziOz2VJtzIs0G8ZttGsOjKYIBptXNsasIn9wSfUjN
         EiKibL3QSBB0PrCSTcGxV29gxlPuH7ipgAVC9oQr6AYhGv6p0RHGarO6cqRJifocEOIq
         Wt2QgwPuiuTBPOGUF7vBJN4msK7CLp56cIVm7TLfyv9RrfYNJe20tm+PLasgp9HPreS9
         zpqpmhAWvVIcActqu/M9AnnN1k0zv8SagRK1ajtwpSmrO9FYodeNpq/8oqtmGMvKeRjK
         5zxFIInUnqt0K5d6KV6GMGgID2KbtTZwEk5IxZ/cAfWb5TEveOrkcXFRkKkP86KI/alj
         zIsA==
X-Gm-Message-State: AOAM532ZIQW5Vtu0JW36fdtO2w69lRAhkRVdwmTf3tk2MrgLWygYNWJF
        SaFzFZJg2fnFCg2lNn5NH+c=
X-Google-Smtp-Source: ABdhPJw3nOyAaQKaKxiPWhfOQEnalAs2/im63G0D9taqrSV7AUphKUNIECzyDij78+l3RscT9yCFfg==
X-Received: by 2002:a17:902:d64a:b029:e6:30a6:64e3 with SMTP id y10-20020a170902d64ab02900e630a664e3mr12368679plh.28.1616711508991;
        Thu, 25 Mar 2021 15:31:48 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3991:e59d:d2d4:59dd])
        by smtp.gmail.com with ESMTPSA id w189sm6546399pfw.86.2021.03.25.15.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 15:31:47 -0700 (PDT)
Date:   Thu, 25 Mar 2021 15:31:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Barry Song <song.bao.hua@hisilicon.com>
Cc:     tglx@linutronix.de, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, maz@kernel.org,
        gregkh@linuxfoundation.org, linuxarm@openeuler.org,
        jonathan.cameron@huawei.com
Subject: Re: [PATCH v5 2/2] Input: move to use request_irq by IRQF_NO_AUTOEN
 flag
Message-ID: <YF0PUMvvH996Xj3+@google.com>
References: <20210302224916.13980-1-song.bao.hua@hisilicon.com>
 <20210302224916.13980-3-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302224916.13980-3-song.bao.hua@hisilicon.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 03, 2021 at 11:49:16AM +1300, Barry Song wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable because of requesting.
> 
> On the other hand, request_irq() after setting IRQ_NOAUTOEN as
> below
> irq_set_status_flags(irq, IRQ_NOAUTOEN);
> request_irq(dev, irq...);
> can also be replaced by request_irq() with IRQF_NO_AUTOEN flag.
> 
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>

Applied, thank you.

-- 
Dmitry
