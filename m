Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295D663B138
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 19:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiK1SZ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 13:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbiK1SZJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 13:25:09 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7E329356
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 10:16:36 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 82so3193792pgc.0
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 10:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t+qa+AyG4b145OGD1+HH558aRY1lEb7oUm0mcXzdBKE=;
        b=k9vkGtjlcPA5TqEpThXZEsplFr22gTHSrmqHKS4d3SpNKWXfzi5OZIV0osa0PuII6b
         fqVKYyBhZHLWmypXfMOar/DEcvhZEO9FXhE+sSuf1AF9gac9Ri8B3+HEWfHwUU7EWZCF
         7Fl8zMi735lFFeud6+JZ97IWc3IrPOn904YVK958OeFOgho/l36QAlfpVsZB62ED1lth
         KmrEnS4uSsR7xchfRHCC9iXqiOfk1Hr9YKQLcKwX/gD2QsQa2vrtAjr1BIPcCro250ky
         SgzqXleuBNmyJwLKis0a5eZMOYZAaPtpLXbPRlhCzuofz5M6m3NmGn/JKds7NPjRQXnX
         nxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+qa+AyG4b145OGD1+HH558aRY1lEb7oUm0mcXzdBKE=;
        b=30RjLpB8bU4lbwViiBRgJgGKwt5We5bjnqmu4WFD+lSRZUqC4wono/ncUQ6XAGEk2l
         59nQ0UVw1M4gzk10KaQUlDvqlptgNEtyfsIyVIU9hN4VWmERC1LsEKobJ+7a1beLtq9b
         13q8762BAZHutuUkO17qfs9++DnvCF+YAjp2gfssByxctgvFdH6xcYxMImwvrtbvFqOS
         hxy6mDM74cXuAu+dmu4VZliThk0IT/qXuwqAsEQFe9AFMAk8bR1Al4nskjNcTFXBaAHu
         NRPIVNUa87JT+M2Whs++FjCWT7OOIShblKbCghiKaxOQoLEnuDOgIeMKYsBUFNRmHA3S
         xFfw==
X-Gm-Message-State: ANoB5pnAgqNqQeJ4QAUj08u5ykjIUqKFsWXizxHOENZEOOsJD4dB9962
        2fwaEDQOdoY3xeSN3hRRm/c=
X-Google-Smtp-Source: AA0mqf4dosokvCMNW0RjfsXsHa0GGfNHiHIgBHPEyEg+tHG780RhHxltLnSsd5TcVdcP1ZGsAV3wPw==
X-Received: by 2002:a63:4b16:0:b0:476:d0b8:1117 with SMTP id y22-20020a634b16000000b00476d0b81117mr45827449pga.104.1669659395706;
        Mon, 28 Nov 2022 10:16:35 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:fd7c:c075:f9ff:46c4])
        by smtp.gmail.com with ESMTPSA id l8-20020a17090a72c800b0020ae09e9724sm1820090pjk.53.2022.11.28.10.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 10:16:34 -0800 (PST)
Date:   Mon, 28 Nov 2022 10:16:31 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Daniel Mack <daniel@zonque.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Tomohiro Yoshidomi <sylph23k@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Lauri Kasanen <cand@gmx.com>,
        Daniel Hung-yu Wu <hywu@google.com>
Subject: Re: [PATCH 0/9] Input: Fix insufficent DMA alignment.
Message-ID: <Y4T6/5968KFxJAhP@google.com>
References: <20221127144116.1418083-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127144116.1418083-1-jic23@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jonathan,

On Sun, Nov 27, 2022 at 02:41:07PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> This problem was discovered in IIO as a side effect of the discussions about
> relaxing kmalloc alignment on arm64 and resulted in a series of large
> patch sets.
> 
> https://lore.kernel.org/linux-iio/20220508175712.647246-1-jic23@kernel.org/
> 
> Unsurprisingly there are cases of it in other subsystems.
> 
> The short version of this is that there are a few known arm64 chips where
> ___cacheline_aligned enforces 64 byte alignment which is what we typically
> want for performance optimization as the size of the L1 cache lines.
> However, further out in the cache hierarchy we have caches with 128 byte
> lines.  Those are the ones that matter for DMA safety.
> So we need the larger alignment guarantees of ARCH_KMALLOC_MINALIGN which
> in this case is 128 bytes.

I wonder if we could have something like ____dmasafe_aligned instead of
sprinkling ARCH_KMALLOC_MINALIGN around?

> 
> There is one other use of ____cacheline_aligned in input:
> joystick/iforce/iforce-usb.c
> 
> Whilst suspicious I'm not sure enough of the requirements of USB to
> know if they are there for DMA safety or some other constraint.

Yes, USB has requirements similar to SPI.

Thanks.

-- 
Dmitry
