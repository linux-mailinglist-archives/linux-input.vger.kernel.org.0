Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA393437BC
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 05:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhCVEDC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 00:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhCVECb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 00:02:31 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D907FC061574;
        Sun, 21 Mar 2021 21:02:30 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id b184so10059562pfa.11;
        Sun, 21 Mar 2021 21:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3l6ZrjsZm4u5OBG6YpG7X+rvDJ5crFIccoSCLeN3KEI=;
        b=N/udh4JBHRESLu3hSgocpc7n+rccl3zmiDW+NjZMag/9qd3T1OPay7GCDO5ecJdxgQ
         ctfqsUaEiLyJbOXL4vkTFtlWykXzKY6a0jMHN/HULM8mlShTiK4J4rFUwcCvx7EX8W6G
         mFvdNytHEU2BfQ0F2u90n3o4RDA1hU1yEeYFM5EOJpnofKwnS829YSRQp9ms4uqfzBAQ
         CJ6EIASqZ7nKrhhUU6BA58HujAaAxmwskXjOjyq+CY+4PcKL2U3HajQQ86hRt570Yghb
         AfUiy2brWOZF93oEKGn48VuHBCOLzv1FEb28PflntBXo24IEvHtrTSAG2Ak+mBLFVspj
         cdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3l6ZrjsZm4u5OBG6YpG7X+rvDJ5crFIccoSCLeN3KEI=;
        b=JvefskBVJkQuUj0d+6eZDXWsdQ3zBIh4UPNFsXhoLTaopV4OZeE+C66sSeD6kyB6k5
         WJKVTeFaOUZSJGm1iGXuNNQyW3M2KWVrqnGt9GMWZsyqpEv8MpmH+WclpWyLCjSlnEhl
         M+/PkeyGeA/4Kn4Wr3Nvn9QumvMVAnBDojxy0Othy9GUQpsEpJLKKs/e7RPBU5l06PBI
         atrzq4PwQoUwIfIgasxWEpbAQoZa6454YR0gboiWSBKepNyyyZRubF6TinCya46BZ5oQ
         v3EFynJDrWAAjvZILFsA4Gc3padDQi14TKAhUy2DWh6QjzPnRSKClDpT5BYX+X5XLlVb
         micw==
X-Gm-Message-State: AOAM533BGXeZegqi+g8EXSurpNwdUEnzKsrHbRMxrlWSUruv5iirf9ST
        6frk56WruHoT4nUdzBLYvXI=
X-Google-Smtp-Source: ABdhPJwq2x1OusaP0MQMBkVYDLV6+Evgzr5qS8V+Ix9++aDcBpyZ3uU93qVQAkQhSqP7JL0ZllhOEw==
X-Received: by 2002:a63:4850:: with SMTP id x16mr20462595pgk.176.1616385750344;
        Sun, 21 Mar 2021 21:02:30 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id 2sm11666269pfi.116.2021.03.21.21.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 21:02:29 -0700 (PDT)
Date:   Sun, 21 Mar 2021 21:02:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/9] Input: iqs5xx - optimize axis definition and
 validation
Message-ID: <YFgW0grnP/dsU5SS@google.com>
References: <20210313191236.4366-1-jeff@labundy.com>
 <20210313191236.4366-3-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313191236.4366-3-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 13, 2021 at 01:12:29PM -0600, Jeff LaBundy wrote:
> Set the maximum ABS_MT_PRESSURE value and use the existing U16_MAX
> definition instead of a magic number to validate ABS_MT_POSITION_X
> and ABS_MT_POSITION_Y.
> 
> Also use input_set_abs_params() rather than input_abs_set_max() to
> avoid having to call input_set_capability() separately.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
