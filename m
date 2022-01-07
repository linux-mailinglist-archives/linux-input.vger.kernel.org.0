Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12BA487EBA
	for <lists+linux-input@lfdr.de>; Fri,  7 Jan 2022 23:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbiAGWBF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 17:01:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiAGWBF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 17:01:05 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6160C061574
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 14:01:04 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id t187so6211107pfb.11
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F7zcf4TrJEprlTvIf884EySlyFlFeiMUA2eoZolnPWI=;
        b=m70BQCq/p6quIsWrDElb1HtajDEesxmZEq8L7+a8KWvwIQ1xluWVSCJ7kVCN7uW1P6
         1cN0rONV9iIaicfLOOERdcPRday8eRoO8/vQemAGTPF3+jnrvjVzzJ08PL9zoTmHnl9Z
         EqgrLsmxwO2BdA9U+2ikbmwBKat/bXlRXuKFRClYL0e8VLRRUvOpKCvk8UMlgUFyAALg
         0eGoFxVXydzGruzguU2xnWI1iF08XA5GMw3dVyq5m8x6eIfcWNvpgblU6bQjtj9TW/QA
         ESxXfm96uweTYJZqbtdWYPY+Z3cI/5JK/ABebsDEbwo5Wxq0MiCyItMuPReEbTMQxIuK
         d5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F7zcf4TrJEprlTvIf884EySlyFlFeiMUA2eoZolnPWI=;
        b=47PeiFbf+kRLYx7i78AU3o9vc8nCgB5bvWFQcSesfCXgWHKeIF3YnjXgV1p46XCTaC
         pHcOjssM+0Jl3dhtsnsKmkim6KUp0kjwXB14MGkIaINXcSU4M6mOesOKcd3NTb7czbNc
         CHlX2m3i5f1KzMp8LTIK5xQ7mrQ7bAoTqGLEm5JIJBRPCrxyyHvw8siHpV527ovDig6q
         T52UtNv8GZdJKwWWZxmBjIl3K8aiuY0sepfeSPgBJWL0qBOfMhbdjBoPY9ikjB+gK/8V
         fdKxN2TFT9ssnwLZ2IIVoXfwr83qu621l2oVWpR1Y3E0mfrbk2BSkr2RbgiHx/4u0Chh
         UCmQ==
X-Gm-Message-State: AOAM531MWrmGnlRLWXsZhzQScC8XH9zcJktZpPHkQX4jXIoDTy9zFvSj
        0I+7J0Fhj2MecF/i6Dhn1NE=
X-Google-Smtp-Source: ABdhPJzaL8XibBjDbffq87bk3/Ej3bVKDK9qucc4fCKZq7D4H33qvFJp8+4vw7MhL4TcbouEl1J5mA==
X-Received: by 2002:a05:6a00:b89:b0:4bb:15c:908c with SMTP id g9-20020a056a000b8900b004bb015c908cmr67339607pfj.34.1641592864287;
        Fri, 07 Jan 2022 14:01:04 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a85:a3d:72a9:2009])
        by smtp.gmail.com with ESMTPSA id k6sm7194459pff.17.2022.01.07.14.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 14:01:03 -0800 (PST)
Date:   Fri, 7 Jan 2022 14:01:01 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH 05/18] HID: introduce hid_get_feature
Message-ID: <Ydi4HRZs079kA/OU@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-6-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221191743.1893185-6-acz@semihalf.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 21, 2021 at 07:17:30PM +0000, Angela Czubak wrote:
> Move mt_get_feature from hid-multitouch to hid-core as it is a generic
> function that can be used by other drivers as well.
> 
> Signed-off-by: Angela Czubak <acz@semihalf.com>
> ---
>  drivers/hid/hid-core.c       | 39 ++++++++++++++++++++++++++++++++++++
>  drivers/hid/hid-multitouch.c | 38 +++--------------------------------
>  include/linux/hid.h          |  1 +
>  3 files changed, 43 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index dbed2524fd47..c11cb7324157 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -1796,6 +1796,45 @@ int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
>  }
>  EXPORT_SYMBOL_GPL(hid_report_raw_event);
>  
> +/**
> + * hid_get_feature - retrieve feature report from device
> + *
> + * @hdev: hid device
> + * @report: hid report to retrieve
> + */
> +void hid_get_feature(struct hid_device *hdev, struct hid_report *report)

If this is a generic API I believe it should return success/error code
so that users can decide what to do.

Thanks.

-- 
Dmitry
