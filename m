Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7791D6F5D
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 05:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgERDj0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 May 2020 23:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgERDj0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 May 2020 23:39:26 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CED0C061A0C;
        Sun, 17 May 2020 20:39:26 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t40so4357049pjb.3;
        Sun, 17 May 2020 20:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PHljqotmW4wPYcBu/r9JWz/UBbu2L8eBjX96rTATEJ4=;
        b=YoRq20ed3pwtzr1fKO2bSRcr1UvkRWvSHRtdMPt59Kz3arg8STYBQ5jJBTffXbRf3+
         Fpl+HQdqHEatNgJB18UQlj7MGgRGhIfhZJu8jcnSwCvS7jXfyNDc6GdlP7ZPLoIid4ll
         14sqKghmbiGYeeyVtfdudejk8SYK3zVIZTOts5ftLO4VktIqOCuQ/DwYu+BF+Z7nChMR
         vpmNY8SQGRtTQlaY0QGQT0fkfPpv2/Olr75zH/7c+tFUq/dOn1BAjol8lfsth8lri7cq
         bzHGEVIZ7myA2B33l7hQCzj0JWY6ebyefSZVVQQOkFmeTTv08q3o1RAS1AosVJHFb4/+
         gdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PHljqotmW4wPYcBu/r9JWz/UBbu2L8eBjX96rTATEJ4=;
        b=hpY3xuenaG8FxJyRiUEqVCNLVv6UUvi2UjT5stZ7FXDUxlnjVU8tj4PW2rzXfbcrM0
         STSBm4TytJaMqhcmt2i792EQfz7A4kr4sv1DkJ+xFiMaDga69dVR38/oc/jT6ejOvWmN
         zVW8Q8N0z+IUHhEP9s/RblwAlX8lsIVGqOIMDoaYa2848GKvXGRH7wtdlU8qksl/dBXx
         UGIu2xKfkaj8r7LzpT86TM3UKrASnGsN8QKkpcosOIxlTx9gs75UkgH7w/XJPzJvwuyi
         GgPuiByNXrCmC342EqUq1/tdRWHmYsqvR/Vc9H6NerC2gSzBMTlxf6qijA7aSkAhUwhb
         k+pw==
X-Gm-Message-State: AOAM531PERwgtwTjPtmwpFM/vVjI0iN1ndibDm+zhMpgCyniiPZv512A
        npPMOibTJGAAdqqYTknlYV8=
X-Google-Smtp-Source: ABdhPJxcxbLPQMbvWD5dxgUG97H4+60P+TcweqH9FcDCHFCkqqN3k4y3GrgAkJ5WMv/l19eiGi/Y7w==
X-Received: by 2002:a17:90a:ba18:: with SMTP id s24mr18066235pjr.192.1589773165676;
        Sun, 17 May 2020 20:39:25 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id y5sm472981pjp.27.2020.05.17.20.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 20:39:25 -0700 (PDT)
Date:   Sun, 17 May 2020 20:39:23 -0700
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
Subject: Re: [PATCH v5 03/10] input: elants: remove unused axes
Message-ID: <20200518033923.GM89269@dtor-ws>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
 <d5eee8cd305adb144a11264d70da94f7b6570366.1587923061.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5eee8cd305adb144a11264d70da94f7b6570366.1587923061.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 07:47:50PM +0200, Michał Mirosław wrote:
> Driver only ever reports MT events and input_mt_init_slots() sets up
> emulated axes already.  Clear the capabilities not generated directly
> and move MT axes setup, so they are visible by input_mt_init_slots().
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>

Applied, thank you.

-- 
Dmitry
