Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D079A2B8C6B
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 08:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgKSHeb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 02:34:31 -0500
Received: from smtprelay0186.hostedemail.com ([216.40.44.186]:41808 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725931AbgKSHeb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 02:34:31 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 6D0BC837F253;
        Thu, 19 Nov 2020 07:34:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:960:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:2914:3138:3139:3140:3141:3142:3352:3622:3866:3867:3868:3870:4321:5007:7875:9036:10004:10400:10848:11026:11232:11658:11914:12043:12295:12297:12679:12740:12895:13069:13311:13357:13439:13894:14659:14721:21080:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:3,LUA_SUMMARY:none
X-HE-Tag: able15_1f0184d27341
X-Filterd-Recvd-Size: 1903
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Thu, 19 Nov 2020 07:34:29 +0000 (UTC)
Message-ID: <9100d801f26e0a068462f9582b7ce193be813966.camel@perches.com>
Subject: Re: [PATCH] Input: adp5589-keys - use BIT()
From:   Joe Perches <joe@perches.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org
Date:   Wed, 18 Nov 2020 23:34:28 -0800
In-Reply-To: <20201119072440.GA116840@dtor-ws>
References: <20201119072440.GA116840@dtor-ws>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-11-18 at 23:24 -0800, Dmitry Torokhov wrote:
> Let's use BIT() macro instead of explicitly shifting '1'.
[]
> diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c

> @@ -651,13 +652,13 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
>  		unsigned short pin = pdata->gpimap[i].pin;
>  

trivia:

Perhaps nicer to create and use a temporary

	unsigned int bit = BIT(pin - kpad->var->gpi_pin_col_base);

so in these places below:

>  		if (pin <= kpad->var->gpi_pin_row_end) {
> -			evt_mode1 |= (1 << (pin - kpad->var->gpi_pin_row_base));
> +			evt_mode1 |= BIT(pin - kpad->var->gpi_pin_row_base);

			evt_mode1 |= bit;

>  		} else {
>  			evt_mode2 |=
> -			    ((1 << (pin - kpad->var->gpi_pin_col_base)) & 0xFF);
> +			    BIT(pin - kpad->var->gpi_pin_col_base) & 0xFF;

			evt_mode2 |= bit & 0xff;

>  			if (!kpad->is_adp5585)
> -				evt_mode3 |= ((1 << (pin -
> -					kpad->var->gpi_pin_col_base)) >> 8);
> +				evt_mode3 |=
> +				    BIT(pin - kpad->var->gpi_pin_col_base) >> 8;

				evt_mode3 |= bit >> 8;


