Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991581CE5B1
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbgEKUhM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 16:37:12 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37512 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbgEKUhM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 16:37:12 -0400
Received: by mail-oi1-f194.google.com with SMTP id r25so16315926oij.4;
        Mon, 11 May 2020 13:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RkbTa/wh/hD8xEtN2/6MKeivff6GdSpulILvCa3y2XE=;
        b=sazM1NrkhS8LT/Ee3CtH/Q7fmZDB5jkmBq4OlUWdRsO0ZnpqFD3cl763RXdC927ZF5
         C+RcI6I7W8tdSoXbaLR5L0UXTBZVkM36DqszURvr/+RKkHxBU+pzs2EyVSy9icO14FCQ
         et8pjZqXrVStCVzJ29vCbumTARh1Dy+xRzBIF/CTJAlcT5Ocej6BAjaWC+sYma73eYYX
         HWN6NTzRczbguZ2+NFLZ/VYo6ukL2h+fu8IBJIKAxK9oDq1UEQbblPcXBO4udkqxYLIM
         wWAwTSs2S1iMpEXbf9KBAxFlyYIeAkWMvM7/GKNob6RZ7D5T2N8lUCUaUqhcMWJdxRWA
         kgxw==
X-Gm-Message-State: AGi0PuYODoCV6UhMQ+Xd9Uh5R7CLLIg980s5401OZVxOJTnV4RhDlxh+
        HMtHPTJwfU2/2Rjt53a+uw==
X-Google-Smtp-Source: APiQypJOatYXUqC0AlrPf2F1LBluMtnPS0NwyyV8HibPhPTgxaoFlJlzDWst6CjUBakGP5I3PFs/zQ==
X-Received: by 2002:a05:6808:6d0:: with SMTP id m16mr22076469oih.33.1589229431254;
        Mon, 11 May 2020 13:37:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v17sm4888402oif.51.2020.05.11.13.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 13:37:10 -0700 (PDT)
Received: (nullmailer pid 3363 invoked by uid 1000);
        Mon, 11 May 2020 20:37:09 -0000
Date:   Mon, 11 May 2020 15:37:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Scott Liu <scott.liu@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        James Chen <james.chen@emc.com.tw>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: elants_i2c: convert
 to YAML
Message-ID: <20200511203709.GA3143@bogus>
References: <20200423173253.711725-1-david@ixit.cz>
 <20200423173253.711725-2-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423173253.711725-2-david@ixit.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 23 Apr 2020 19:32:53 +0200, David Heidelberg wrote:
> Convert elants_i2c.txt DT binding to YAML and put into correct directory.
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/input/elants_i2c.txt  | 34 ---------
>  .../input/touchscreen/elan,elants_i2c.yaml    | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/elants_i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
