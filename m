Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C3C36A0F
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 04:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFFCfW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 22:35:22 -0400
Received: from smtprelay0015.hostedemail.com ([216.40.44.15]:59845 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726590AbfFFCfV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 22:35:21 -0400
X-Greylist: delayed 382 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Jun 2019 22:35:21 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 27C16182D5154
        for <linux-input@vger.kernel.org>; Thu,  6 Jun 2019 02:28:59 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id B0B5418224D78;
        Thu,  6 Jun 2019 02:28:57 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:355:379:599:800:960:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2525:2551:2553:2559:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4605:5007:6119:6691:7514:8603:8957:9025:9040:10004:10400:10848:11026:11232:11473:11658:11914:12043:12050:12438:12555:12740:12895:12986:13439:13894:13972:14096:14097:14180:14181:14659:14721:21060:21080:21433:21451:21627:21740:30012:30054:30090:30091,0,RBL:error,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:25,LUA_SUMMARY:none
X-HE-Tag: leg41_13e178e1c213e
X-Filterd-Recvd-Size: 3093
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf13.hostedemail.com (Postfix) with ESMTPA;
        Thu,  6 Jun 2019 02:28:56 +0000 (UTC)
Message-ID: <a1908a998b6d1d1e4cdd097a50b9c9ac9b00caae.camel@perches.com>
Subject: Re: [PATCH] Input: alps: Drop unlikely before IS_ERR(_OR_NULL)
From:   Joe Perches <joe@perches.com>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Date:   Wed, 05 Jun 2019 19:28:53 -0700
In-Reply-To: <36eac452-5477-3670-7980-765d0879ead4@huawei.com>
References: <20190605142428.84784-1-wangkefeng.wang@huawei.com>
         <20190605142428.84784-5-wangkefeng.wang@huawei.com>
         <20190605144240.pfrvlgxsdpacpwxf@pali>
         <36eac452-5477-3670-7980-765d0879ead4@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2019-06-06 at 09:08 +0800, Kefeng Wang wrote:
> On 2019/6/5 22:42, Pali Rohár wrote:
> > On Wednesday 05 June 2019 22:24:28 Kefeng Wang wrote:
> > > IS_ERR(_OR_NULL) already contain an 'unlikely' compiler flag,
> > > so no need to do that again from its callers. Drop it.
> > Hi! I already reviewed this patch and rejected it, see:
> > https://patchwork.kernel.org/patch/10817475/
> OK, please ignore it.

I think the stated reason of better readability isn't
particularly sensible as the object code produced is
actually slightly larger.

x86-64 defconfig (gcc 8.3.0)

$ size drivers/input/mouse/alps.o*
   text	   data	    bss	    dec	    hex	filename
  29416	     56	      0	  29472	   7320	drivers/input/mouse/alps.o.new
  29432	     56	      0	  29488	   7330	drivers/input/mouse/alps.o.old

Also if this unlikely is _really_ useful, perhaps the
!IS_ERR immediately after could also use likely as the
test seems only done for an OOM condition.

> > > Cc: "Pali Rohár" <pali.rohar@gmail.com>
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: linux-input@vger.kernel.org
> > > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> > > ---
> > >  drivers/input/mouse/alps.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> > > index 0a6f7ca883e7..791ef0f826c5 100644
> > > --- a/drivers/input/mouse/alps.c
> > > +++ b/drivers/input/mouse/alps.c
> > > @@ -1478,7 +1478,7 @@ static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
> > >  		/* On V2 devices the DualPoint Stick reports bare packets */
> > >  		dev = priv->dev2;
> > >  		dev2 = psmouse->dev;
> > > -	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
> > > +	} else if (IS_ERR_OR_NULL(priv->dev3)) {
> > >  		/* Register dev3 mouse if we received PS/2 packet first time */
> > >  		if (!IS_ERR(priv->dev3))
> > >  			psmouse_queue_work(psmouse, &priv->dev3_register_work,

