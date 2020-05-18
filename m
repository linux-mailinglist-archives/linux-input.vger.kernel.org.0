Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530751D6F89
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 06:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgERECp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 00:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgERECo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 00:02:44 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB82FC061A0C;
        Sun, 17 May 2020 21:02:44 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x13so4329582pfn.11;
        Sun, 17 May 2020 21:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=h5Cc2TYsW6UIzrC+necmilj2lf0PNA7yZd3RY3unZ+w=;
        b=YTDaxaRgxUkLVfnFWXiqM4mZnsCYWTKtljNsPrv6CPhxTamxckj/ynjanSqj9gt0lY
         jPhJ8e3oUbLOgLwIN3gyTEDFVrkqxr/2yVBXAVw8QH7Jd5GCcNskCLPPwHUdGTo5T8da
         QYZaja0KIXqSk0/JgfeCMW1Is7JFpE+bcnEhcppo0GxS9CSRhI0JOJO9D1doB5a7veRL
         NKimOP83w4Lkkmkr6VULiVy6TPhqSfL/nVg5IqwRN7EXhmSOS0h5c+e+Y2PgDbQ8tpoT
         NfPPsHHeMx5K533IBe3c1uoMuyXIjSNEkxh4IO+0+/Gonaf6hDtY1iOOqELwF4S8rorc
         t5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=h5Cc2TYsW6UIzrC+necmilj2lf0PNA7yZd3RY3unZ+w=;
        b=tsRFHeb9kdEsLoaj50+QYvag0MynsLCwAvmDsj4OBnuPz7809jJToGRFLsMgfeGzMA
         vKOkQLlnu4sPnmow1B3Ay+Tm2DaWI2jE8UZIDtaL/YV44zLuUwCYKEm4ykdSvQ1qDmAQ
         XpEvp9jkO26fNwUsvAHcHdWs0oIIu2RlQb0fc4lw6NoJPrusVFWPUyI8nmFlPktQLQo1
         1c/SCjO0Jh+/c+5lPGs/p3ogkSbMlm5DnqKxFmrIj0pvMFAISlNXlrV/2lALbSb6JyGb
         BTMNF+n0EwTbJc+P1cW4B6ZNOcVKoKWxmErPnDBtE4JJjaKKceWQ4XerXmN2T4v0/zcg
         jkFg==
X-Gm-Message-State: AOAM5311MaipeCzOs2N9G1J5ydST+nvxKh3IjESAhWaFQxRqt+WMbHpQ
        g9a7hCqEW9Jw+KzDerXY8R4=
X-Google-Smtp-Source: ABdhPJzqh6QlojiJjbGplGVVOW+iIhmDWG50nWUZrAv91S+DSvFTl2SsI73IjO4C98KZ3tHH3ykTng==
X-Received: by 2002:a62:5ec7:: with SMTP id s190mr14589243pfb.130.1589774563942;
        Sun, 17 May 2020 21:02:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id l192sm1427334pfd.169.2020.05.17.21.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 21:02:43 -0700 (PDT)
Date:   Sun, 17 May 2020 21:02:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] input: elants: override touchscreen info with
 DT properties
Message-ID: <20200518040241.GN89269@dtor-ws>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
 <49ea996878264f7c8bde25204e4ddf4b1e85ae71.1587923061.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49ea996878264f7c8bde25204e4ddf4b1e85ae71.1587923061.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 07:47:51PM +0200, Michał Mirosław wrote:
> Allow overriding of information from hardware and support additional
> common DT properties like axis inversion. This is required for eg.
> Nexus 7 and TF300T where the programmed values in firmware differ
> from reality.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> [moved "prop" before DMA buffer]
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Applied, thank you.

-- 
Dmitry
