Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CAC1B7323
	for <lists+linux-input@lfdr.de>; Fri, 24 Apr 2020 13:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgDXLe6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Apr 2020 07:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgDXLe6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Apr 2020 07:34:58 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66243C09B045;
        Fri, 24 Apr 2020 04:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587728095;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=fWxhh9ysZoKVDklAV5dePBGZmQBHW/O/YfguNmPUJaE=;
        b=mkn8kJm1GWmbyStvB3TKPtBI9324cufZj5AIcH5O+jTxMbQPVjNQ7urTBtsUPVl9Q+
        LB5rnWwVZJIrxawGUipeoRXXtpCU+zTII8pkF6GSfM6KMNaTtuNbBwbzxpvOK/LHX4mv
        IS8FxgEGKsMBt7LygDGX3ci+fbp80BjHOTyOOg+rO4unS4dBGnHgxJBKwHMD0wsZSZVl
        2txMc4DPby4mAZfWjZlH6qHm/n2PBnGLUMAdyjjPMHmujM9dZdCdzP/F+smKC1ffKq6Q
        tESJYXHg7aA2QCwS5GP1BmbVqnuqZlvIIW6+itJpQt633zAU2VeTSxVIK8edSYl2bfsK
        ejKg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/MbIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3OBYoFlS
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 24 Apr 2020 13:34:50 +0200 (CEST)
Date:   Fri, 24 Apr 2020 13:34:46 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andi Shyti <andi@etezian.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: mms114 - add extra compatible for mms345l
Message-ID: <20200424113446.GA205913@gerhold.net>
References: <20200423102431.2715-1-stephan@gerhold.net>
 <20200424092937.GB460760@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424092937.GB460760@jack.zhora.eu>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 24, 2020 at 12:29:37PM +0300, Andi Shyti wrote:
> Hi guys,
> 
> >  	}, {
> >  		.compatible = "melfas,mms152",
> >  		.data = (void *)TYPE_MMS152,
> > +	}, {
> > +		.compatible = "melfas,mms345l",
> > +		.data = (void *)TYPE_MMS345L,
> >  	},
> 
> it's been some times I haven't been doing this, but is the order
> of the patches correct? shouldn't the binding be updated first?
> 

Yes. I had it correct in my original patch, but apparently swapped the
order accidentally for this one. I will do it correct again next time :)

Thanks,
Stephan
