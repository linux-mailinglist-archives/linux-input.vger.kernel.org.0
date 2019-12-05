Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDD51148C4
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 22:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbfLEVkZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 16:40:25 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38602 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729914AbfLEVkZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Dec 2019 16:40:25 -0500
Received: by mail-oi1-f196.google.com with SMTP id b8so4212529oiy.5;
        Thu, 05 Dec 2019 13:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5B07evfQjYRmezpr618YMj75/8A+9fi/BoaS8w0bgCw=;
        b=M6XVYNYjZtPHc+Guj34IwmgNCmc8y72L5Hle7hmqODjye9KXsoBMTGKnris3SmOBuM
         v1NFQFKAMC7wvdIgvKVe6/Jdd3rQ9W/9yBbJHzPb9iwr9zTY/JnXAEa/y/cUs4qYvShL
         qd6AXftKdn8yzE7IaTw2WujQGHTV+iA+3r7oo1vBCdNkchU1suMJQNms/+PTrN6ScwQG
         qqSaqdZs3O0lRtf5jac943MgsH2BCZOBFiI6Qk3V/7/JUEfnXSf7J8w/ewhP+xzezyCs
         yAoejrbNz5+4Qv7lmXoriHymph80ZzMAxml3cir+ZoHlktxzj2ftglAD+89mNIY7Oaeu
         aNTg==
X-Gm-Message-State: APjAAAX2QtmeuWLolWl7oYDdS1IZ6foVuHRGU45s9Q79meyWaCXeDLWN
        pzQzg2ClbATjtjvIlv9Jog==
X-Google-Smtp-Source: APXvYqxEtg3YSKnAqJeM+USaEc+2azfpgWhVrK3I05OmYCtSEJzGliakgatYJcxuupfvARlqBjslqw==
X-Received: by 2002:aca:aad8:: with SMTP id t207mr8998770oie.138.1575582024374;
        Thu, 05 Dec 2019 13:40:24 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g5sm3798447otp.10.2019.12.05.13.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 13:40:23 -0800 (PST)
Date:   Thu, 5 Dec 2019 15:40:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, Adam.Thomson.Opensource@diasemi.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Input: da9062 - add key-opmode
 documentation
Message-ID: <20191205214022.GA5072@bogus>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127132304.22924-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 02:23:02PM +0100, Marco Felsch wrote:
> The onkey behaviour can be changed by programming the NONKEY_PIN
> bitfield. Since the driver supports the reconfiguration we need to add
> the documentation here.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
> - add da9061/3 references
> - adapt binding description to be more general
> 
>  .../devicetree/bindings/input/da9062-onkey.txt         | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
