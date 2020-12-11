Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5802D70F7
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 08:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390788AbgLKHa1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 02:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgLKHaY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 02:30:24 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CB5C0613CF;
        Thu, 10 Dec 2020 23:29:43 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id s2so4159689plr.9;
        Thu, 10 Dec 2020 23:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UB6efhDsS9xRat1NQFQJw/q7UT13nhmz/jWhy+1Kerw=;
        b=m51MMZMi5v0oWw+nqIu2K2MvwAqxDjDNe7nZg63upYUf+gsKhj5VGUBq/uPEL0hYnt
         I5lI08eCjeV14XVZtujRJCq/qSTFwDkf/jEHuMrQQGsUOph+US2EK9KHMjjnCUodxC+U
         Z/xBWgQwUpqGBDMY5tZQfMUoCsNShudJmTs8Lg4gsfIuoKYV1PaKz9WC8kYLr7Cb1ueh
         7xMOIL/U3uYKKk/hKKmVZ5dYiOkJfK8afwRXvt5H+vsuKtltd78p3J/NzcOlf0BIJzDe
         4KmuDS15041sB6GZIRdMM6bMd+0Wktu8PzSdGiwF5Y7l1J+sMwZxAYLdNeTqoeqTXRky
         1dKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UB6efhDsS9xRat1NQFQJw/q7UT13nhmz/jWhy+1Kerw=;
        b=W/ItoIqBimS8jS5InjvYHm695v+BNFVdQZAFX353BvLjtX4OLe3zL/05JxtUhYZv6X
         FxJDoihtZNaz7s4d1TbAuzT13mZwsBp4nmZlRlF+LZhonSr79AYrIrWTcSj1Prshb2If
         bJZv9HZG7ZNJSbWDrvYz85K6+ISguYp01/y1QaL6pYLnJ9EqegKmb/jU/xupkyZj7Dsc
         V4s60M+vIZV0LetXkTe0NI+L+v0Bocjcd63Wxvrq5qBODy14Zdd1HakSB7cuBIZ7dbZK
         hZz16M6Z5lnCGouQo2jb6zep6la/usi+BxhvAm2KrgZH+xeHOBi0uahJu/nMBAoN2Ogt
         vEGg==
X-Gm-Message-State: AOAM532EoHQHsUVMopooVG1uWjn62n4hJb0tdFAw7GzsieO3pVZSa+ls
        1qiIOnQL0CXSWQ2LIBEcFh0=
X-Google-Smtp-Source: ABdhPJww0lVvwcDROgiFy9IevptvjXn99SpP/2DczQTwKLS7EsqAJzyg1DvUf7IjuB8o2jTWSJdWfA==
X-Received: by 2002:a17:902:b616:b029:da:fcfd:7568 with SMTP id b22-20020a170902b616b02900dafcfd7568mr10006158pls.35.1607671783390;
        Thu, 10 Dec 2020 23:29:43 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h123sm3640023pfg.37.2020.12.10.23.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 23:29:42 -0800 (PST)
Date:   Thu, 10 Dec 2020 23:29:40 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 2/4] input: elants: support old touch report
 format
Message-ID: <X9Mf5G6yvIEAoh2C@google.com>
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Michał,
On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
> @@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
>  			}
>  
>  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
> -			if (report_len != PACKET_SIZE) {
> +			if (report_len != PACKET_SIZE &&
> +			    report_len != PACKET_SIZE_OLD) {
>  				dev_err(&client->dev,
> -					"mismatching report length: %*ph\n",
> +					"unsupported report length: %*ph\n",
>  					HEADER_SIZE, ts->buf);

Do I understand this correctly that the old packets are only observed on
EKTF3624? If so can we expand the check so that we only accept packets
with "old" size when we know we are dealing with this device?

Thanks.

-- 
Dmitry
