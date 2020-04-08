Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E55F1A1CBA
	for <lists+linux-input@lfdr.de>; Wed,  8 Apr 2020 09:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgDHHgT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Apr 2020 03:36:19 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:33319 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgDHHgT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Apr 2020 03:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586331375;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=sjnB8w1eg3xxKwvMLCRQkJECWsSSDwKnucOYw682BT8=;
        b=rjfLrzj21oEGMXHJsrWhM+bziAdnhuwHI/tuY57+5xA3mgRl6nf/dVsx03Cwzh2RTb
        H1lWFZoL/v8s3WoNGo/BROyu0Cvmdl+1GsezyZhwYdydupWOQWRjzvN0+k4ey6zxZRRL
        bIweLHmZcqox7rC7U7YrLhmnxkDtl1eZz/ZHQgRYzMV/iep/HJiHYOSXR3Y0pAXoLuad
        nnwpacrUFEbjL+YLB3nTV2v1uGCP4XeLkKXuwR+D1LAO1WPi2JBtAaofnSqTnN07kKgs
        na4m7IIBk6W9g0INw+uNPoExgkOYMpTz3OBeNe9dmhqnSH/WGAzeRNLOsadVt9MBV1oO
        iZRQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IcfFBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w387a8EA4
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 8 Apr 2020 09:36:08 +0200 (CEST)
Date:   Wed, 8 Apr 2020 09:36:03 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andi Shyti <andi@etezian.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: mms114: document melfas,mms345l
 binding
Message-ID: <20200408073603.GA948@gerhold.net>
References: <20200405170904.61512-1-stephan@gerhold.net>
 <20200405170904.61512-2-stephan@gerhold.net>
 <20200407215143.GD207210@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407215143.GD207210@jack.zhora.eu>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 08, 2020 at 12:51:43AM +0300, Andi Shyti wrote:
> Hi Stephan,
> 
> On Sun, Apr 05, 2020 at 07:09:04PM +0200, Stephan Gerhold wrote:
> > The mms114 driver now supports MMS345L; document the
> > melfas,mms345l binding that is used for it.
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Andi Shyti <andi@etezian.org>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> 
> just one nitpick, the signing should be sorted in chronological
> order, I see that you reverted it.
> 
> You first signed it as the author, then I reviewed it and the Rob
> acked it, so that it should be:
> 
>   Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>   Reviewed-by: Andi Shyti <andi@etezian.org>
>   Acked-by: Rob Herring <robh@kernel.org>
> 
> you reversed it.
> 

I didn't really "reverse" it, I didn't know the order of these tags is
important at all. :) Is this documented somewhere?

Since I have added the tags and re-sent the patch,
I thought it would make sense have my Signed-off-by last.

I suppose this can be easily fixed up if Dmitry wants to apply the
patch. But if I should re-send with the order changed in some way,
just let me know. :)

> Other than that, I'm sorry I couldn't help you but I haven't
> received answers from Samsung about getting the prototypes.
> However I don't see reason for not applying the patch.

It's fine, don't worry :)

I just think at this point we should either take my patch
(and preserve existing behavior for all currently supported devices),
or accept the potential breakage when refactoring the driver
(because seemingly no-one is able to test it on the other versions
at the moment).

Thanks,
Stephan
