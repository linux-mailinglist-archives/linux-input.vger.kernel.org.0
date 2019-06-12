Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 917B241F45
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 10:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbfFLIfi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 04:35:38 -0400
Received: from smtprelay0021.hostedemail.com ([216.40.44.21]:7082 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727241AbfFLIfi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 04:35:38 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 0AAC818224D63;
        Wed, 12 Jun 2019 08:35:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2551:2553:2559:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3871:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4605:5007:6119:7903:8603:9025:9040:10004:10400:10848:11232:11658:11914:12043:12050:12555:12740:12895:12986:13069:13311:13357:13439:13894:14096:14097:14180:14181:14659:14721:21060:21080:21433:21451:21627:21740:30012:30054:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:36,LUA_SUMMARY:none
X-HE-Tag: coat46_4dee5fffc4c39
X-Filterd-Recvd-Size: 2907
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf05.hostedemail.com (Postfix) with ESMTPA;
        Wed, 12 Jun 2019 08:35:35 +0000 (UTC)
Message-ID: <1e403b07f8e9843deb893de156e6c03f53948cca.camel@perches.com>
Subject: Re: [PATCH] Input: alps: Drop unlikely before IS_ERR(_OR_NULL)
From:   Joe Perches <joe@perches.com>
To:     Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Date:   Wed, 12 Jun 2019 01:35:34 -0700
In-Reply-To: <20190612071444.5uih6em5o73dbvtf@pali>
References: <20190605142428.84784-1-wangkefeng.wang@huawei.com>
         <20190605142428.84784-5-wangkefeng.wang@huawei.com>
         <20190605144240.pfrvlgxsdpacpwxf@pali>
         <36eac452-5477-3670-7980-765d0879ead4@huawei.com>
         <a1908a998b6d1d1e4cdd097a50b9c9ac9b00caae.camel@perches.com>
         <20190612005913.GJ143729@dtor-ws> <20190612071444.5uih6em5o73dbvtf@pali>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2019-06-12 at 09:14 +0200, Pali Rohár wrote:
> On Tuesday 11 June 2019 17:59:13 Dmitry Torokhov wrote:
> > Hi Joe,
> > 
> > On Wed, Jun 05, 2019 at 07:28:53PM -0700, Joe Perches wrote:
> > > On Thu, 2019-06-06 at 09:08 +0800, Kefeng Wang wrote:
> > > > On 2019/6/5 22:42, Pali Rohár wrote:
> > > > > On Wednesday 05 June 2019 22:24:28 Kefeng Wang wrote:
> > > > > > IS_ERR(_OR_NULL) already contain an 'unlikely' compiler flag,
> > > > > > so no need to do that again from its callers. Drop it.
> > > > > Hi! I already reviewed this patch and rejected it, see:
> > > > > https://patchwork.kernel.org/patch/10817475/
> > > > OK, please ignore it.
> > > 
> > > I think the stated reason of better readability isn't
> > > particularly sensible as the object code produced is
> > > actually slightly larger.
> > > 
> > > x86-64 defconfig (gcc 8.3.0)
> > > 
> > > $ size drivers/input/mouse/alps.o*
> > >    text	   data	    bss	    dec	    hex	filename
> > >   29416	     56	      0	  29472	   7320	drivers/input/mouse/alps.o.new
> > >   29432	     56	      0	  29488	   7330	drivers/input/mouse/alps.o.old
> > 
> > If gcc produces worse code for double unlikely, you should probably
> > report it to gcc folks, no? Or double unlikely turns into likely?
> 
> Is measured size of stripped or unstripped binary? Plus with or without
> debug symbols? Double unlikely version should have more debug symbols
> and therefore also larger size.
> 
> But if unstripped version with double unlikely is larger then it is for
> sure compiler bug.

defconfig so no debug symbols.

It's not necessarily a gcc bug as gcc doesn't
guarantee compiler repeatability.


