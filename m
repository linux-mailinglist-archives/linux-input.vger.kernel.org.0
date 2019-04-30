Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1387B1020A
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2019 23:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfD3VsU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Apr 2019 17:48:20 -0400
Received: from p3plsmtpa07-08.prod.phx3.secureserver.net ([173.201.192.237]:44744
        "EHLO p3plsmtpa07-08.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726048AbfD3VsU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Apr 2019 17:48:20 -0400
Received: from labundy.com ([136.49.227.119])
        by :SMTPAUTH: with ESMTPSA
        id Labqhju8S3EbKLabrhjAnw; Tue, 30 Apr 2019 14:48:20 -0700
Date:   Tue, 30 Apr 2019 16:48:18 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v10 1/2] dt-bindings: input: touchscreen: iqs5xx: Add
 bindings
Message-ID: <20190430214818.GA4181@labundy.com>
References: <1556540652-7616-1-git-send-email-jeff@labundy.com>
 <20190430074924.GB148015@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430074924.GB148015@dtor-ws>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CMAE-Envelope: MS4wfHhXj3btyxoNn/yUnt6f9z3Mf4Ih1KHwoT9dKV3pr/eT5l4T6RA9icMMqPztJwmOFlVzGRBddWtBLM3wnp1wPSl+vuo0WDGagLoc1gZDdR4pwOnKiGba
 RX2zwuDXUXkbjZXLaP7eDjs1GGr3S7Mq9R+c1q3x0BAkYR3Y+7w+RWEoOhMmSv3IOXHAnCxNCwGTg62FEY00/xySN+87HXMS5jcWlym74xHitRW6JrXVuPCy
 FpdwwtrlBDmdygBBqK+m81sXpwMRSR7+0ct1w9T1fKxjiBnnMy/0JMfBrcxO1LSo73sO3zm5twf3iXIklLYARGigK5rtl9bnH8aSJNKA0yJFtIx798bVf+4b
 DK5jd8mV
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Many thanks for your support; your changes look great to me. I'll use
the same indentation style for future patches.

Thanks,
Jeff L.

On Tue, Apr 30, 2019 at 12:49:24AM -0700, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Mon, Apr 29, 2019 at 07:24:11AM -0500, Jeff LaBundy wrote:
> > This patch adds binding documentation for the Azoteq IQS550/572/525
> > family of trackpad/touchscreen controllers.
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> > Changes in v10:
> >   - None
> > 
> > Changes in v9:
> >   - Corrected the polarity of the reset GPIO in the example node to match that
> >     of the device's active-low NRST pin
> >   - Removed previous Reviewed-by trailer as this file has since changed
> 
> Applied with minor formatting changes. I restored Rob's reviewed-by
> since he was happy with the binding.
> 
> Thanks.
> 
> -- 
> Dmitry
> 
