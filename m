Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB7E301F1C
	for <lists+linux-input@lfdr.de>; Sun, 24 Jan 2021 23:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbhAXWPL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 17:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbhAXWPK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 17:15:10 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E35C061573;
        Sun, 24 Jan 2021 14:14:30 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id o20so7322305pfu.0;
        Sun, 24 Jan 2021 14:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rLPPviRQ+QCNvu1GQTb8W3YFg6K6u4B7Sc28WKqCbbY=;
        b=M7aNY3k7XJqiTw30HbNcJRork+S+HEfT0NDLkMPtXVpeMDInw6jc/EzpbEeNCZAzJn
         mlSyH4iXWc9uCa+rbeOzDbhBWFuzk8z3+dxQwmTmXq+kznhS2NhBaCeGCW+hpsZB4Cbb
         Ulnnd0dj2FVU5pzpwMg6ec8Sy4dsm8PEmZkoe1b9Eh5Pik8a8XyGbkKJYoam7wNeFEXD
         24eRjyWeAQ1qrTLbHPRiKQpBAisYk3kMNaycncBUEX0BlGCojf2uY5DPEZDPYZP1x1jg
         fwFdA4YakjxSR+QiXDaO0e8km3xUOvJjD5lsN+xcIJiVKVY+970hd1Ntd2MYZasm3T+p
         j95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rLPPviRQ+QCNvu1GQTb8W3YFg6K6u4B7Sc28WKqCbbY=;
        b=bRs8G6nCq7bf0i4EBu0htiDdXWqdh4kwAZ6ivXMGREVm0dtwYqaWjFpRdYbM0oEEFF
         6OA9wTb1ji8QeyMkeNZ8U/AOEoSaRej4PBPamOJcVEGgril+tT+RNH8h1+Ii0ArYExnm
         fx34ZA6d2Za/7CIT2fTcAFeAJxZctsKho2Oaseq/TURimITUNMWBzOJ4hmZ+0k/6vC0P
         ZVvVrHB2BEmUyrBRwwSSKXcTJ38fPZZnjYLYRbiHHY/dN+TvLvnp+QdfBuR9q0dDOOug
         y4KL0/nCKewKXjGDf3FZaX+NvsSrVrtb+Lkdr4uZbU0oIluoNS2B0NWMtwvLZ5qiEvCe
         rtLQ==
X-Gm-Message-State: AOAM531izsEjWQGGvC80MbQfBBsPgq/Rl/wZl/b47Dd0H+kPeWzT3Hrv
        sM1M/x/7XW1wPqxffDn5Ics=
X-Google-Smtp-Source: ABdhPJwnQww6okT8P9WVZeh1bYzJGdc4OJWKTQ9AG4BVOxO8eA944M2/ws77CYvWLsDbSuP3wsaKmg==
X-Received: by 2002:a62:54c3:0:b029:1bc:731c:dfc1 with SMTP id i186-20020a6254c30000b02901bc731cdfc1mr3214775pfb.20.1611526469746;
        Sun, 24 Jan 2021 14:14:29 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 141sm14715847pfa.65.2021.01.24.14.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 14:14:28 -0800 (PST)
Date:   Sun, 24 Jan 2021 14:14:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?iso-8859-1?Q?=A0Tan?= Zhongjun <hbut_tan@163.com>
Cc:     andrzej.p@collabora.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, "george.tan" <tanzhongjun@yulong.com>
Subject: Re: [PATCH] Input: auo-pixcir-ts - fix typo
Message-ID: <YA3xQrUxTpnJFBOy@google.com>
References: <20210123035612.143-1-hbut_tan@163.com>
 <YA3wiywDg34rkO9o@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YA3wiywDg34rkO9o@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jan 24, 2021 at 02:11:23PM -0800, Dmitry Torokhov wrote:
> On Sat, Jan 23, 2021 at 11:56:12AM +0800,  Tan Zhongjun wrote:
> > From: "george.tan" <tanzhongjun@yulong.com>
> > 
> > change 'interupt' to 'interrupt'
> > 
> > Signed-off-by: george.tan <tanzhongjun@yulong.com>
> 
> Applied, thank you.

Actually, can you please resend the patch from the account that you use
for signed-off-by statement?

-- 
Dmitry
