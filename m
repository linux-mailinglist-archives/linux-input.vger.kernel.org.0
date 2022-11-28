Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB53363B111
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 19:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbiK1SUU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 13:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234171AbiK1ST0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 13:19:26 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB772E9EE
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 10:04:47 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id s196so10640248pgs.3
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 10:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGdAX7dA+BUDbKy4gLK4le8gR32ltDTL8PTQaE8mLYk=;
        b=pwrPrpqyhyeHuWWjE/rZQ3O2+TXqwinKilBFRQbqqfsmoAFzczIYp5pelZ7NYhOLhd
         +QRJ44rasizyBi9qZU5G86I2ceQvI1AG5qCwJjTN1h0j+MtjpUZEjGz4w1EEMUrQIvSe
         qJ+B4uixx9ZkREwnEiKmEP767+RtjAxJGLPS+/TnohgKDohBMKwq/ir8/8jGKNYOAMcJ
         /6SWmDTXdXljF7DveRJ4MwOOFDzdIKtHOJstK8T18ioOSD3qu9wUIwYuGcegLFtxLI1P
         Jax/Wunv4m6cClAe2LpHRz5d9bl0dlj2jaQXSB3fTdh50PSRwxbBvfPubnG3ojkgMzW3
         CEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGdAX7dA+BUDbKy4gLK4le8gR32ltDTL8PTQaE8mLYk=;
        b=KVwLQKGsqaemJnDwtpMw3hyqUD0QXuMY5VZBch2aB7UvP4duDpPw+dt7LlR11mR9Qf
         I474TLibf24IjAFtqGV+4VMNaNxtOrK+6KliYWnfPERmiVLp2fWDxCXSYpm8Nf/d5Ccn
         jVYRTLzzZ0uP09WWhVYWRBzmz12lN7gCt7h1xl8Ie5oXPPBPArqtmUq7v6+4acrlZXVl
         293//XdM1y2ofzPJsOB/NNoHFbf0Jo1f93hH5JO+EqytkhjRn/kMglCmGx/W7+pu8KDj
         1HoS8aZq0l2j9E2QdegIp404itZXrtOeB06FsGMVIH2RjwPhqqz/efVdtxgWBLeNTyoG
         cJcA==
X-Gm-Message-State: ANoB5pkPxRk/SdiTnulOSwJZH5a1+TH2qAhD9vRDX7+mLGhkjztsIit/
        WRsHVjNuChzdZFtBEccTA48=
X-Google-Smtp-Source: AA0mqf4tSNdF+n0bLrjtK5lEmnD2twhX2Kr4Remooo5p7NJDi37zX6CwlXnt0NBVHHlfbCsNwuqDgw==
X-Received: by 2002:aa7:8a0c:0:b0:56c:2a86:d74 with SMTP id m12-20020aa78a0c000000b0056c2a860d74mr33321048pfa.73.1669658687137;
        Mon, 28 Nov 2022 10:04:47 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:fd7c:c075:f9ff:46c4])
        by smtp.gmail.com with ESMTPSA id bb8-20020a170902bc8800b00174c0dd29f0sm9125067plb.144.2022.11.28.10.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 10:04:46 -0800 (PST)
Date:   Mon, 28 Nov 2022 10:04:43 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 7/9] Input: n64joy - Fix DMA buffer alignment.
Message-ID: <Y4T4O0wVd2EMWOJ9@google.com>
References: <20221127144116.1418083-1-jic23@kernel.org>
 <20221127144116.1418083-8-jic23@kernel.org>
 <20221127184844.f967054e30c47a3caa5090eb@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127184844.f967054e30c47a3caa5090eb@gmx.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 27, 2022 at 06:48:44PM +0200, Lauri Kasanen wrote:
> On Sun, 27 Nov 2022 14:41:14 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > The use of ____cacheline_aligned to ensure a buffer is DMA safe only
> > enforces the start of the buffer alignment. In this case, sufficient
> > alignment is already ensured by the use of kzalloc().
> > ____cacheline_aligned does not ensure that no other members of the
> > structure are placed in the same cacheline after the end of the
> > buffer marked.  Thus to ensure a DMA safe buffer it must be at the end
> > of the structure.
> 
> This move is unnecessary, because the cacheline is 16 bytes and the
> buffer is 64 bytes.

I think it is still worth moving it or alternatively adding a comment
why we believe the following member will not be sharing cacheline with
the buffer.

Thanks.

-- 
Dmitry
