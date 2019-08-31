Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937E3A4638
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2019 22:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbfHaUlF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 31 Aug 2019 16:41:05 -0400
Received: from smtprelay0220.hostedemail.com ([216.40.44.220]:53257 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728552AbfHaUlF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 31 Aug 2019 16:41:05 -0400
X-Greylist: delayed 539 seconds by postgrey-1.27 at vger.kernel.org; Sat, 31 Aug 2019 16:41:04 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 815698016DD6
        for <linux-input@vger.kernel.org>; Sat, 31 Aug 2019 20:32:06 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id B1B09182CED28;
        Sat, 31 Aug 2019 20:32:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:967:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2551:2553:2560:2564:2682:2685:2693:2828:2859:2892:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6691:8985:9025:9121:9901:10004:10400:10848:11026:11232:11233:11473:11658:11914:12043:12050:12295:12296:12297:12555:12740:12895:12986:13069:13095:13311:13357:13439:13894:14096:14097:14181:14659:14721:14775:21080:21433:21627:21811:21939:30012:30054:30070:30075:30090:30091,0,RBL:47.151.137.30:@perches.com:.lbl8.mailshell.net-62.14.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: sleet46_4c2e89b9f004e
X-Filterd-Recvd-Size: 2290
Received: from XPS-9350.home (unknown [47.151.137.30])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Sat, 31 Aug 2019 20:32:03 +0000 (UTC)
Message-ID: <762056d9c081c40f3fc760c9af79d6851f0a65e5.camel@perches.com>
Subject: Re: [PATCH v3 09/11] Input: alps - remove unlikely() from IS_ERR*()
 condition
From:   Joe Perches <joe@perches.com>
To:     Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Denis Efremov <efremov@linux.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-input@vger.kernel.org
Date:   Sat, 31 Aug 2019 13:32:02 -0700
In-Reply-To: <20190831152500.eg7xqo5ace6wu427@pali>
References: <20190829165025.15750-1-efremov@linux.com>
         <20190829165025.15750-9-efremov@linux.com>
         <20190829175039.GA187474@dtor-ws> <20190831152500.eg7xqo5ace6wu427@pali>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2019-08-31 at 17:25 +0200, Pali Rohár wrote:
> On Thursday 29 August 2019 10:50:39 Dmitry Torokhov wrote:
> > On Thu, Aug 29, 2019 at 07:50:23PM +0300, Denis Efremov wrote:
> > > "unlikely(IS_ERR_OR_NULL(x))" is excessive. IS_ERR_OR_NULL() already uses
> > > unlikely() internally.
> > 
> > The keyword here is _internally_.
> > 
> > https://lore.kernel.org/lkml/20190821174857.GD76194@dtor-ws/
> > 
> > So please no.

I think it poor form not to simply restate your original
objection from 4 message levels below this link

https://lists.gt.net/linux/kernel/2269724

   Hm... I do not like this change. If I read code 
    
    if (unlikely(IS_ERR_OR_NULL(priv->dev3))) 
    
   then I know that it is really unlikely that condition will be truth and 
   so this is some case of error/exception or something that normally does 
   not happen too much. 
    
   But if I read code 
    
    if (IS_ERR_OR_NULL(priv->dev3)) 
    
   I know nothing about chance that this condition will be truth. Explicit 
   unlikely in previous example give me more information. 
    
I alslo think this argument is dubious as it also applies
to any IS_ERR and all the unlikely uses have been removed
from those.


