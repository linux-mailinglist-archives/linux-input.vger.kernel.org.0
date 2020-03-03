Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6EA1785C1
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 23:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbgCCWjJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 17:39:09 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41114 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbgCCWjJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Mar 2020 17:39:09 -0500
Received: by mail-oi1-f194.google.com with SMTP id i1so50026oie.8;
        Tue, 03 Mar 2020 14:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=a6/0B8KLI+wIuIFwR3hPyELWveCaOwNjzdatSPUN1sc=;
        b=hUYlL9psYJ1UKkn6Ol3wf5SS8AonlIJdDyXXsxh4sKXUTwKLNccyhFHzoZDU1FZukg
         1GyXZDHdqHfcMqXg+H9Adazf5jB7j2pKloFRmf4S+635WgSEUAKtYd8aw7MCz7tMhxud
         pLdvm2Ak9xOjuYVfUaObtfmODTM870RQku6bizKQZu6bTz6wsYatoRUTyhrsSRFLjUsZ
         bTogNX7Y0X8lwqteI9mHY5R0IKJqPLk3m6qdCy+rOQ8NLyniAooUEZLUMfAFwCfznjAf
         qA3XTuhvWN0N7MXGq2Zao4OlMY/afGkZCBxLPLj5PqF7HEZBKNdH5Lay3yGnpSwmWJ/U
         K36Q==
X-Gm-Message-State: ANhLgQ0LKLmXAqmPjFxQ32AccY8ULl/pSKgGA3AAnMGwLD7/8JL3UuKM
        F2fp5FcJPH5vgR/geIWbkQ==
X-Google-Smtp-Source: ADFU+vs51yl6SSgJqKRKqM4Xl3vwqt/V4nBzrTXPJP2xNpu7td6+1mMvUOkm25pJRe//I5M0J+vZGw==
X-Received: by 2002:a05:6808:610:: with SMTP id y16mr558376oih.89.1583275148253;
        Tue, 03 Mar 2020 14:39:08 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k16sm1883065otp.52.2020.03.03.14.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 14:39:07 -0800 (PST)
Received: (nullmailer pid 21088 invoked by uid 1000);
        Tue, 03 Mar 2020 22:39:06 -0000
Date:   Tue, 3 Mar 2020 16:39:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     devicetree@vger.kernel.org,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Fix typo in file name of
 twl-familly.txt
Message-ID: <20200303223906.GA21037@bogus>
References: <20200227170702.4582-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200227170702.4582-1-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 27 Feb 2020 18:07:01 +0100, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= wrote:
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/devicetree/bindings/input/twl4030-pwrbutton.txt   | 2 +-
>  .../devicetree/bindings/mfd/{twl-familly.txt => twl-family.txt} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/mfd/{twl-familly.txt => twl-family.txt} (100%)
> 

Applied, thanks.

Rob
