Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CAE1B887F
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 20:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgDYSYf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Apr 2020 14:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726145AbgDYSYf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Apr 2020 14:24:35 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE04C09B04D;
        Sat, 25 Apr 2020 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587839071;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=WyxuVUhLZGGrHSbH2ipZbYc3BijhBmdyyn9wJF7Ivc0=;
        b=MrOcsueJcRJ1u+J0sLHxjgruB6qRF5ZMpm5yaDxLv8sR/D9azR4UAz9UTsH0KszZ0w
        AanDCdZhJ0SVGQ3twUhExyTtVUZdTH34Tdze4rpPYY7n33sQL6qetQI+OKeSXVsa7rVf
        tiAgE4P93eJzRVlI+Q2ZQN1wiuBzZEiqpKVpZjXnsDehiS3to6ydNhh/Fb8x26ki1zvC
        qewLVs2JvXLvS7tiJeBoLNK+OOMxJimKdtPyKv92dvcK0yRvBk5cTfMh7AE0RJ2hOoEf
        GNO7g6Lk6nDglsymUdlkGyyKWGs/dit+wI+H0ecIKKVxfi8WwLnCJUSsE/FWP4ll/tjF
        +BXg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IcrHBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3PIOOKAk
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 25 Apr 2020 20:24:24 +0200 (CEST)
Date:   Sat, 25 Apr 2020 20:24:17 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: mms114 - add extra compatible for mms345l
Message-ID: <20200425182417.GA116540@gerhold.net>
References: <20200423102431.2715-1-stephan@gerhold.net>
 <20200424092937.GB460760@jack.zhora.eu>
 <20200424113446.GA205913@gerhold.net>
 <20200424132243.GH460760@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424132243.GH460760@jack.zhora.eu>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 24, 2020 at 04:22:43PM +0300, Andi Shyti wrote:
> Hi Stephan,
> 
> On Fri, Apr 24, 2020 at 01:34:46PM +0200, Stephan Gerhold wrote:
> > On Fri, Apr 24, 2020 at 12:29:37PM +0300, Andi Shyti wrote:
> > > Hi guys,
> > > 
> > > >  	}, {
> > > >  		.compatible = "melfas,mms152",
> > > >  		.data = (void *)TYPE_MMS152,
> > > > +	}, {
> > > > +		.compatible = "melfas,mms345l",
> > > > +		.data = (void *)TYPE_MMS345L,
> > > >  	},
> > > 
> > > it's been some times I haven't been doing this, but is the order
> > > of the patches correct? shouldn't the binding be updated first?
> > > 
> > 
> > Yes. I had it correct in my original patch, but apparently swapped the
> > order accidentally for this one. I will do it correct again next time :)
> 
> then with that change:
> 
> Reviewed-by: Andi Shyti <andi@etezian.org>
> 

Hi Dmitry,

I assume there is little reason to resend just to swap the order.
(You could just apply them in reverse order since they do not depend
 on each other...)

But if there is something else I should change just let me know.

Thanks,
Stephan
