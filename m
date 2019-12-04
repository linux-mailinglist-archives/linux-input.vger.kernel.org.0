Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C708113042
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2019 17:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbfLDQuw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 11:50:52 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:17744 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfLDQuw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Dec 2019 11:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575478250;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=qcxSP5ltwRsHLylUXdQzf4MV6ssvVHBNEyHcwO0mBeg=;
        b=HHHCGVGuTfEjuN8HQIDuMuFw7njmBNDmHUS///Uy3mjRasUO4wPs+P8H93Qu4na8Nn
        wZcluZ61LhcGXw1u9uTANUwncwFKh0KZAwtAYKk9NRBUSZmFpKcCK007SHg4S4MQz1JH
        m2wfkRAwL7LvGEH6GHg3ow+a8ByHJdWz6e/i30LdbQzljt4pjNYUOfmqXUHf3gbsUhcE
        6OIKdMjHObJXrhLREmKkIlaP5qKEkFq9pLkXuLUraSl354ZcTjMFOB1ikhgwqHtqKTuk
        pAsKQPfU3aBkXV1UVn7J/Cg/oN0SHPutm11wZPDf+uO1nJUHIt8s/uEiqDNZKunRJ6qG
        6qhQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDd/LYtbif"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.0.2 AUTH)
        with ESMTPSA id R01a59vB4GlhEwI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 4 Dec 2019 17:47:43 +0100 (CET)
Date:   Wed, 4 Dec 2019 17:47:37 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/2] Input: mms114 - use smbus functions whenever
 possible
Message-ID: <20191204164737.GA2426@gerhold.net>
References: <20191020202856.20287-1-andi@etezian.org>
 <20191020202856.20287-2-andi@etezian.org>
 <20191021093423.GA1116@gerhold.net>
 <20191021154105.GC2278@jack.zhora.eu>
 <20191021162632.GA83253@gerhold.net>
 <20191021163956.GB1353@jack.zhora.eu>
 <20191022032140.GV35946@dtor-ws>
 <20191022111729.GA2913@jack.zhora.eu>
 <20191118133229.GA182934@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118133229.GA182934@gerhold.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mon, Nov 18, 2019 at 02:32:36PM +0100, Stephan Gerhold wrote:
> Hi Dmitry,
> 
> On Tue, Oct 22, 2019 at 02:18:39PM +0300, Andi Shyti wrote:
> > Hi Dmitry,
> > 
> > > If regmap is too much work then as a stop gap we could maybe only
> > > convert write functions and mention why read needs to be custom.
> > 
> > regmap is not too much work but I don't have the device with me,
> > I might get one at some point, but can't do anything right now.
> > 
> > Perhaps, for now you can take Stephan's patches and I would
> > update everything once I get the device. They are not mutually
> > exclusive, anyway.
> 
> What do you think about this?
> 
> My patches for MMS345L keep behavior for MMS114 and MMS152 as-is,
> so we can be sure that there are no regressions for them.
> 
> Cleaning up the driver to use SMBUS and/or regmap instead of the custom
> read/write methods is definitely something we should attempt to do
> at some point, but only when we can properly test them on MMS114.
> 
> Until we have a MMS114 test device available, I would say that
> applying my patches is the least intrusive way to make MMS345L work.
> 

I would really like to find a solution for this.
If it helps, I can re-send my patches for MMS345L (although they still
apply cleanly...). Let me know what you would prefer!

Thanks,
Stephan
