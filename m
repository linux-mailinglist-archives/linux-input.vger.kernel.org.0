Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5810123D2D
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 03:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfLRCiQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 21:38:16 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34649 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRCiQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 21:38:16 -0500
Received: by mail-oi1-f195.google.com with SMTP id l136so343782oig.1;
        Tue, 17 Dec 2019 18:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=obJWdgonapo+l8PRn+mHd3xv4tPrAwkC145ThpY8G/c=;
        b=FYc+KLeJw6R5zMqSPN92yipAgEQN+vjiIesqOlTmzkdfTQ/M1HIGN3OiTJDZ+hWXj7
         zAr1koHUxvyjyHuw8POkqsQWkPrftGGZ5zZMskh6jR1ZLIUg2TLpfN4Vnsy08QgtPjEe
         exh/RDMB1rtJQTNX7DnpMnTbb91JAIt64AuodV3Kao6fyWjsr6gkJBjj4tNi69T7fwqV
         Eh0mTfpJGMEPKtjsu3xrRYiaWSPh7rMLgvWE9gVhR/KKKsyXU9dHezVQwO9Ki3H9BZmG
         xBEYGjW0cQGl3zSpnFRW8rt0tQzj8Llcat9kPRjoMkS2hagpUvkwX45756sS7Qe0j51a
         nr2g==
X-Gm-Message-State: APjAAAVzL5LkG7rnjPMgE8rGZ+xoZCJcWLNM3qP3iokvRPzVZSIeH+1K
        NTg1vogdQ2jtsViNKJs25g==
X-Google-Smtp-Source: APXvYqxVpED4be4cHdekfCg6SeeUA1uRfPLf0sUgp4sLwhRNeXTVWDz1+gckrOE+Vv8qcIeflcll9A==
X-Received: by 2002:aca:568f:: with SMTP id k137mr133252oib.63.1576636695090;
        Tue, 17 Dec 2019 18:38:15 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s4sm275981otq.56.2019.12.17.18.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 18:38:14 -0800 (PST)
Date:   Tue, 17 Dec 2019 20:38:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: input/touchscreen: add bindings for
 zinitix
Message-ID: <20191218023813.GA18525@bogus>
References: <20191209204629.27243-1-michael.srba@seznam.cz>
 <20191209204629.27243-2-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209204629.27243-2-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 09, 2019 at 09:46:29PM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for the zinitix bt541 touchscreen.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  changes in v2: none
>  changes in v3: document zinitix,mode property
> 
> 
>  .../bindings/input/touchscreen/zinitix.txt    | 40 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt

Reviewed-by: Rob Herring <robh@kernel.org>
