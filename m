Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18B3176F17
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 07:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgCCGDx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 01:03:53 -0500
Received: from chill.innovation.ch ([216.218.245.220]:53750 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbgCCGDw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Mar 2020 01:03:52 -0500
Date:   Mon, 2 Mar 2020 22:03:51 -0800
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch DC00A6412A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1583215431;
        bh=CoCegPxzkwOrSb2LMFv1mRjuEAk+XhXfz7ah1mwZ+iI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SF0fmxfG2Fs+V3rpagT9o+yvQ+7Hiy6jPkWlEq9djzzV94xtc87f0xPMMcMJQlqir
         QsLzFPuMvBnU8tRaglCAkLvBH0ceVKX8X0d2LcgjuCOPoml9fXdDhTOJAtw0Fd82cq
         i4Q+rJLaVSi/6n8JdyJHfdPS+IW+hM6BwNkwd8oTg7b9houEANYddbXvTV9HohENbl
         JRBoxDU50dn9HE+Z1gqf7ol7VSkcJ4j+oC5PgtCyC51IoEC96mHw3BHKAPxpFH+BDk
         p8NLulQGA4VRc5FqDA5r/lu1stu3K8uxrOtQ61T2dFqhRyuwLg/JhJI9Qn2uoOQRPO
         yDd/AVFuLnv+Q==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com, nikolas@gnu.org,
        gregkh@linuxfoundation.org, maowenan@huawei.com
Subject: Re: [PATCH] input: keyboard: applespi: Use new structure for SPI
 transfer delays
Message-ID: <20200303060351.GA12060@innovation.ch>
References: <20200227124534.23399-1-sergiu.cuciurean@analog.com>
 <20200229032616.GA27264@innovation.ch>
 <20200302110932.GS1224808@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200302110932.GS1224808@smile.fi.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Mon, Mar 02, 2020 at 01:09:32PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 28, 2020 at 07:26:16PM -0800, Life is hard, and then you die wrote:
> > On Thu, Feb 27, 2020 at 02:45:34PM +0200, Sergiu Cuciurean wrote:
> 
> ...
> 
> > > -	wr_t->delay_usecs = SPI_RW_CHG_DELAY_US;
> > > +	wr_t->delay.value = SPI_RW_CHG_DELAY_US;
> > > +	wr_t->delay.unit = SPI_DELAY_UNIT_USECS;
> > 
> > Looks good to me and tested to confirm things still work.
> 
> Ronald, we have the established tags for such, like Tested-by:, Reviewed-by:.

Apologies, that was sloppy of me. So:

Tested-by: Ronald Tschalär <ronald@innovation.ch>
Reviewed-by: Ronald Tschalär <ronald@innovation.ch>


  Cheers,

  Ronald

