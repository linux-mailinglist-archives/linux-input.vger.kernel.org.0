Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B664144BBD4
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 07:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhKJG47 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 01:56:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhKJG46 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 01:56:58 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0143C061764;
        Tue,  9 Nov 2021 22:54:11 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id e65so1413368pgc.5;
        Tue, 09 Nov 2021 22:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BlOgRYG0UGxpdRFxlaBzsqKsQOHJ3q8tV1OaQ8amQ+E=;
        b=HnJ46feLtrFJIHmhnIcQ5GfWioxluthbopC5uvAH5z7KLZFwrMm8nnDQekblkqaHtJ
         lwZz6YIqarNawPf/kOUbYSlL5TWT7VFL/+bXe4WI8gd3i8zRByATUhFX8R3WywzGVjtq
         VBUSzMyj4/5XIG9W1m1qm8RIyJynFqqSx1IJ9x2WyH7bGGP4IqrxxApyZBol7wldPovN
         27flVdbVHar3wqsj+77qwuUIBK8QBKta/jiMffrpKhAuzZ+uLH02f5iQJ8UqXSUE4det
         PniC3LjhBLAtddfT5yjNfPHetLVnmOKO7dUUOjm3RLy+wKxeQkk7VcUkjxcv1pNlyCB+
         QIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BlOgRYG0UGxpdRFxlaBzsqKsQOHJ3q8tV1OaQ8amQ+E=;
        b=mJGA6CSDtzSs2OmmGeSrq52a/1X4deOukvgyYiXr0pMsZWdHRqHHpJNOLq8TUpYM0+
         vcxJtEsvTdzPv7/DbydLT3ADz05zPu/A19mZSRIf+fffeV+dPpwHyVhpU0Ai7MgbGOoF
         OzNexqkQcobCnVYM/TEtUKdjK571GUSbw5FBcfaD9jHihOJfVXOzqZfdjaYrkzqp1xye
         54J8ewe6RLqazX+uGxA6f2iVxHiTzIclfNuX1sYrPbetitfKmnnTU/lpQPapVNvDo7pZ
         rAIYzm10HCH9ry+jkGUnTB9EJXFuQurN4CLiZVrQ0POQumRPuw8T8BBw168RaMOKiPyT
         f74A==
X-Gm-Message-State: AOAM530+NWihoLTGncSxqbrHVTxNukQQVuEYX2c3W2wL6RHW/p3Xm1md
        /68yWpCZh8f0v+S2FU7yO7gMUrjddJc=
X-Google-Smtp-Source: ABdhPJwi7B3sZb14jU84M8nVrX3O/N91cWk/r7tEqZAGi9ELDnPIEa7u/EWLHgiAu4Rqd8ZDGNtlWA==
X-Received: by 2002:a63:8b4b:: with SMTP id j72mr10346685pge.10.1636527251265;
        Tue, 09 Nov 2021 22:54:11 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b345:ee3a:151d:b1d1])
        by smtp.gmail.com with ESMTPSA id t38sm9724881pfg.218.2021.11.09.22.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 22:54:10 -0800 (PST)
Date:   Tue, 9 Nov 2021 22:54:07 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair23@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] Input: wacom_i2c - Use macros for the bit masks
Message-ID: <YYtsj2LjK8ygCETU@google.com>
References: <20211009113707.17568-1-alistair@alistair23.me>
 <20211009113707.17568-2-alistair@alistair23.me>
 <YWZYy8OsqJx1J8VA@google.com>
 <CAKmqyKM=wHN=NhfSBFT243oTkozcpFrqt1xM8xRP6Yf4ONGG1Q@mail.gmail.com>
 <CAKmqyKO1q4k8eXsJF1fGu6CNR1q9=_1MhwyCoJ2858rCNQBZKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKO1q4k8eXsJF1fGu6CNR1q9=_1MhwyCoJ2858rCNQBZKQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 09, 2021 at 07:58:00PM +1000, Alistair Francis wrote:
> 
> I'm assuming you don't need me to re-send this. Let me know if you
> want me to though.

It is applied now, thank you.

-- 
Dmitry
