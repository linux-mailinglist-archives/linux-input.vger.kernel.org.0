Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C0E2A90BB
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 08:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgKFHuy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 02:50:54 -0500
Received: from smtprelay0115.hostedemail.com ([216.40.44.115]:53504 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725848AbgKFHuy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Nov 2020 02:50:54 -0500
X-Greylist: delayed 329 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Nov 2020 02:50:53 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id A8EBC1801BE96
        for <linux-input@vger.kernel.org>; Fri,  6 Nov 2020 07:45:24 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 39DD1100E7B45;
        Fri,  6 Nov 2020 07:45:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:152:355:379:599:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:3138:3139:3140:3141:3142:3352:3622:3865:3868:3870:3871:3872:4321:5007:6119:7903:10004:10400:10848:11026:11232:11473:11658:11914:12043:12297:12438:12740:12895:13069:13311:13357:13894:14659:14721:21080:21451:21627:30054:30075:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: magic28_0601ba1272d0
X-Filterd-Recvd-Size: 2193
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Fri,  6 Nov 2020 07:45:21 +0000 (UTC)
Message-ID: <b2cb1fc8aca53ef9ff5d3ff913f2ad4a5e95b1f9.camel@perches.com>
Subject: Re: [PATCH 10/20] input: mouse: synaptics: Place braces around
 empty if() body
From:   Joe Perches <joe@perches.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Peter Osterlund <petero2@telia.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Bruce Kalk <kall@compass.com>,
        this to <linux-input@vger.kernel.org>
Date:   Thu, 05 Nov 2020 23:45:20 -0800
In-Reply-To: <20201106072630.GD1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
         <20201104162427.2984742-11-lee.jones@linaro.org>
         <20201106072630.GD1003057@dtor-ws>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2020-11-05 at 23:26 -0800, Dmitry Torokhov wrote:
> On Wed, Nov 04, 2020 at 04:24:17PM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/input/mouse/synaptics.c: In function ‘synaptics_process_packet’:
> >  drivers/input/mouse/synaptics.c:1110:6: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
[]
> > diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
[]
> > @@ -1106,8 +1106,9 @@ static void synaptics_process_packet(struct psmouse *psmouse)
> >  					num_fingers = hw.w + 2;
> >  				break;
> >  			case 2:
> > -				if (SYN_MODEL_PEN(info->model_id))
> > +				if (SYN_MODEL_PEN(info->model_id)) {
> >  					;   /* Nothing, treat a pen as a single finger */
> > +				}
> 
> This gives me:
> 
> WARNING: braces {} are not necessary for single statement blocks
> 
> from checkpatch.

As the entire case 2 is effectively a noop, why not just comment it better
and remove the if (SYN_MODEL_PEN(...)) test altogether.


