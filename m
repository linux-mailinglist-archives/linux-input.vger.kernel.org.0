Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B151D2638DB
	for <lists+linux-input@lfdr.de>; Thu, 10 Sep 2020 00:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgIIWLt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Sep 2020 18:11:49 -0400
Received: from smtprelay0119.hostedemail.com ([216.40.44.119]:47168 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726426AbgIIWLt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Sep 2020 18:11:49 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 7970318225E0D;
        Wed,  9 Sep 2020 22:11:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:960:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:2898:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3873:4250:4321:5007:10004:10400:10848:11026:11232:11473:11658:11914:12043:12296:12297:12438:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21627:21990:30012:30054:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: cork39_10056d8270e0
X-Filterd-Recvd-Size: 2050
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf05.hostedemail.com (Postfix) with ESMTPA;
        Wed,  9 Sep 2020 22:11:47 +0000 (UTC)
Message-ID: <ad58952a64bdf8e64bf4da5461db43c6a30d3b70.camel@perches.com>
Subject: Re: [PATCH v3] HID: add vivaldi HID driver
From:   Joe Perches <joe@perches.com>
To:     Sean O'Brien <seobrien@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Date:   Wed, 09 Sep 2020 15:11:46 -0700
In-Reply-To: <20200909150254.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
References: <20200909150254.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-09-09 at 15:03 -0700, Sean O'Brien wrote:
> Add vivaldi HID driver. This driver allows us to read and report the top
> row layout of keyboards which provide a vendor-defined (Google) HID
> usage.
[]
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
[]
> @@ -814,6 +814,13 @@ static void hid_scan_collection(struct hid_parser *parser, unsigned type)
>  
>  	if ((parser->global.usage_page << 16) >= HID_UP_MSVENDOR)
>  		parser->scan_flags |= HID_SCAN_FLAG_VENDOR_SPECIFIC;
> +
> +	if ((parser->global.usage_page << 16) == HID_UP_GOOGLEVENDOR)
> +		for (i = 0; i < parser->local.usage_index; i++)
> +			if (parser->local.usage[i] ==
> +					(HID_UP_GOOGLEVENDOR | 0x0001))
> +				parser->device->group =
> +					HID_GROUP_VIVALDI;

Can you please make this less indented code
so there are fewer line breaks?

Something like:

	if ((parser->global.usage_page << 16) != HID_UP_GOOGLEVENDOR)
		return;

	for (i = 0; i < parser->local.usage_index; i++) {
		if (parser->local.usage[i] != (HID_UP_GOOGLEVENDOR | 0x0001))
			continue;
		parser->device->group = HID_GROUP_VIVALDI;
		break;
	}


