Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EA91B8C68
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 06:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgDZEwG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 00:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgDZEwF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 00:52:05 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7768EC061A0C;
        Sat, 25 Apr 2020 21:52:04 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id v63so7072754pfb.10;
        Sat, 25 Apr 2020 21:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=epDqrvtAuf94yge9oIjqpYEyewVbJi5mmlwqSmNq8H8=;
        b=fTuN/5xmLxarPuGsKyTUGHzTRyB+S9k6hu6dbL1tj4I9FKvfdSBqNbX0ubIzvOJoO3
         9EQxQBiyplZPI6msSDXOggVbvFGOZIq6O7J1mVc9dFhf9NfL/wYo14KTm1xm7IymUvxG
         nS76rIw4UGDXUdinOfwZBSuIwDXhIli6MMLsNyQ/EGj1D3YVRCkEEGPC++s6t8tpF33H
         xft5ujtLN5F2k4UC3QFlWhVt7Ab2uKO9EAy9XI3vbt88qqOI7EtDIJG/ARGNKrOGA+qz
         kcb3X3wRURSsicHb2cQAA3ukTy2hzcEwMkJmwPdNjb95Yqn7zRPeB2a/nyu61Z58uIos
         hwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=epDqrvtAuf94yge9oIjqpYEyewVbJi5mmlwqSmNq8H8=;
        b=eq6z2+9Oo0k9g1V/vKvaVwQNVHwOnwyz6dxheWPBgWvN6r1qvs+SlC5cAqVBgaXN3f
         l1evAy4R09ihubvst01B6rOWKGd1S4pcziVDDFUQIRZ5h5Xxmj0Iz/Koz5YZTTZtvSpG
         Xqh5iMzManwax53/S4CHNR6DClrNadaiQugGTaB0LrperotxGptXdg4eUebyWomsxcN3
         pthV42hIsLAh3eTbkfElqv3Fc44eB22rjiPkY803Bf1VFmBLDN1UeCgK4rlshKcUxSIK
         yZN/h4ox+ivHo0K+czHODKP0NubUP+fRtg+pY5wn5HkHoJISdjBAVMmnatwFemCoJxB2
         0xng==
X-Gm-Message-State: AGi0PuZjWuClAKSEXtbOJvwl+QgDg90vlu2i3o9+lGDmVoRzSL76py/+
        yVeI1SvDHaPPUVLzB6AE3U1glwNH
X-Google-Smtp-Source: APiQypJpP3rUbVHL9TOv8uhtyKmX5pdB8/tDahqG0DQs1FIJmisCK/vwcftH8QiKX1PT7oftPIhe+g==
X-Received: by 2002:a63:f4f:: with SMTP id 15mr14627152pgp.7.1587876723692;
        Sat, 25 Apr 2020 21:52:03 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 185sm9710098pfv.9.2020.04.25.21.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 21:52:03 -0700 (PDT)
Date:   Sat, 25 Apr 2020 21:52:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] input: elants: remove unused axes
Message-ID: <20200426045200.GN125362@dtor-ws>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <62e897b0d6f6054dae26c853a9a1f1fb6d3c420b.1586784389.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62e897b0d6f6054dae26c853a9a1f1fb6d3c420b.1586784389.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 13, 2020 at 03:32:23PM +0200, Michał Mirosław wrote:
> Driver only ever reports MT events. Clear capabilities of all others.

This is not true. input_mt_sync_frame() calls
input_mt_report_pointer_emulation() which does emut single-touch events
for the benefit of older userspace (or userspace that is not interested
in multitouch).

Thanks.

-- 
Dmitry
