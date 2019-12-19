Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C33126FDF
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2019 22:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfLSVoK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Dec 2019 16:44:10 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40152 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbfLSVoK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Dec 2019 16:44:10 -0500
Received: by mail-oi1-f196.google.com with SMTP id c77so3325476oib.7;
        Thu, 19 Dec 2019 13:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FMElxYGUaSvjFXl0P6MMWBQdNOBXnhJem0sijB1jNlQ=;
        b=YeOBMyFfZwHVBwJpyWwJSSjB8OGUcHXt1F1L427P37yvA1YaRfuTTW6Bv9hxV+2UJd
         nR9FMSU9plfaIJrO8jk3j97y/53PDyHDQJtqXOvR53EVaF84by2VEL1mfAiW33HspL5n
         kh8kPnDt5TfD8+pptuGEOymTzFzVNFYiGKOBBfE33cbYf7vH+CkwbZU+k4UvgAMu+Ur2
         UToV6iuKHi0B07a1U2oNf74DcLEf1fj2ie2iL8qVpke+U2+I1kp7ay0DV7spxcmusy+W
         mkbSEAIQI1VWqPgdH2Dx+l07lJ4kf+6ogLlxsMs4E2nrgXlnUCLhcuIEATn91mgiz0lq
         kRRg==
X-Gm-Message-State: APjAAAWgsaywsUlyuQYisDbQGmm0ltXUSE614P7Nld5+VxAQurzN2Pql
        SU0w4vNTtI5Vf0txeM3Kdg==
X-Google-Smtp-Source: APXvYqxt7sKze7DVN1FPvYYBCO0UXzM6SctbxwLjFwHk62Irq/zGTuZRo/iDgFuvxqEUzX864s353g==
X-Received: by 2002:aca:b1d4:: with SMTP id a203mr3084869oif.150.1576791848821;
        Thu, 19 Dec 2019 13:44:08 -0800 (PST)
Received: from localhost ([2607:fb90:1cd2:8a0d:3549:d84c:9720:edb4])
        by smtp.gmail.com with ESMTPSA id p24sm2563558oth.28.2019.12.19.13.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 13:44:08 -0800 (PST)
Date:   Thu, 19 Dec 2019 13:43:59 -0800
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>
Subject: Re: [PATCH v2 9/9] dt-bindings: input: elants-i2c: Document eKTF3624
Message-ID: <20191219214254.GA25646@bogus>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <882916345a8aa2dc545a1bd2ca150cf913371d1a.1576079249.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <882916345a8aa2dc545a1bd2ca150cf913371d1a.1576079249.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 11 Dec 2019 17:03:26 +0100, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= wrote:
> From: Dmitry Osipenko <digetx@gmail.com>
> 
> The eKTF3624 hardware is similar to eKTH3500.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  Documentation/devicetree/bindings/input/elants_i2c.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
