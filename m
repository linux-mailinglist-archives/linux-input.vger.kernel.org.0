Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9013232B92
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 07:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgG3Fy5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 01:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgG3Fy5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 01:54:57 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A48C061794;
        Wed, 29 Jul 2020 22:54:57 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w2so15907542pgg.10;
        Wed, 29 Jul 2020 22:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E2EytgWa9qS3s3TGjba78LOYjqPjnfrso56HtBNJ3vs=;
        b=dMGBNNheZT94oRg069QeKz0G83l/o/KAqpKdDXLqbA/25gDCJwUPmLDp0gJug7n2oB
         Cs+Sv6DDRNPNcByfncSp6OXBJDlg+q8XLJgLltBfADo31Bx3p2+KeC4mJMgkDbtW/MgU
         dBf6e8JdSo1ZE7peNriXIFno4LJlbTTaY+4EJusw0mWsLXZBS4RRN8Zzc2t2D7PBPhsX
         wwIyhlPhd9GuJoZ81XwQQ2mB0aUcbdu7L1S5I1qGe2H29+TQ+sNGEw5NUu+yNPhRuOfM
         1QF+eZyVct01KIQToQrSqXSMkp7A6YMTyCLkEe58EGNpJRbT7KTTk9M7clk22yNuz0fo
         J3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E2EytgWa9qS3s3TGjba78LOYjqPjnfrso56HtBNJ3vs=;
        b=X0TvukvM0CvdPAJ4kyJdnyE1Vxjtlq42mUtfnlSyQKmQopDjUYucpn74Tj1AnwVaHL
         /78zsx1HLrSg/YttrAY26wQqZOyIbXSJ/3eCSuXXaKR/soo+Sj4fwEGr3hM+AqdyAC6l
         irwNnyxXvBFR72L5C+2g1NAJkYMWD6+F9l8S58aUUBkNVgKfk87yLf+P6WVxaZxDidTr
         bpxu3N1pINrt78OPsP+vfrNmzlzJKWBebShipyRy66ZVcPSSAZgB7R5C/eyfuzF0/mjn
         mmm1wWGtmfUdxF6DVouIN4xMOrduHI3+LVG2QWs0WoNSnNzJOQ4vXjA6Bqd92KQUlpzq
         y9BA==
X-Gm-Message-State: AOAM533AZGtjyQSd/4iVvvXCsIzSlvaWv0JlP1zb26YED2H124TywCJ5
        AeP6h3fvVnGAn7AdEbRPSW0mQGCPIAI=
X-Google-Smtp-Source: ABdhPJy254U51wdr6zJE2fW77WYleMshzMMhW/c8Tk9JqOI24a32XSE9O0QVy3cKHoNgwpWQXwS0KA==
X-Received: by 2002:a63:c049:: with SMTP id z9mr31858702pgi.353.1596088496550;
        Wed, 29 Jul 2020 22:54:56 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id f73sm3143925pfa.19.2020.07.29.22.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 22:54:55 -0700 (PDT)
Date:   Wed, 29 Jul 2020 22:54:53 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com, digetx@gmail.com
Subject: Re: [PATCH 1/1] Input: atmel_mxt_ts: split large i2c transfers into
 blocks
Message-ID: <20200730055453.GC1665100@dtor-ws>
References: <20200729092252.6394-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729092252.6394-1-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiada,

On Wed, Jul 29, 2020 at 06:22:52PM +0900, Jiada Wang wrote:
> From: Jiada wang <jiada_wang@mentor.com>
> 
> Some I2C controllers constrain maximum transferred data in an I2C
> transaction by set max_[read|write]_len of i2c_adapter_quirk.
> Large i2c transfer transaction beyond this limitation may fail to complete,
> cause I2C controller driver aborts the transaction and returns failure.
> 
> Therefore this patch was created to split large i2c transaction into
> smaller chunks which can complete within max_[read|write]_len defined
> by I2C controller driver.

Can we consider implementing this chunking logic in i2c core? Otherwise
we will need to adjust pretty much every driver to do this.

Thanks.

-- 
Dmitry
