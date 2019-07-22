Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23BFA706AF
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 19:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731252AbfGVRXN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 13:23:13 -0400
Received: from smtprelay0155.hostedemail.com ([216.40.44.155]:41475 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728233AbfGVRXN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 13:23:13 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 9E65B100E86C5;
        Mon, 22 Jul 2019 17:23:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:355:379:599:800:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:2897:3138:3139:3140:3141:3142:3352:3622:3865:3871:4250:4321:5007:7514:7903:7904:10004:10400:10848:11026:11232:11658:11914:12048:12296:12297:12740:12760:12895:13069:13095:13311:13357:13439:14181:14659:14721:21080:21433:21611:21627:21740:30054:30056:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:25,LUA_SUMMARY:none
X-HE-Tag: walk80_1ab20649d4030
X-Filterd-Recvd-Size: 1884
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Mon, 22 Jul 2019 17:23:02 +0000 (UTC)
Message-ID: <f7b1a46569a7208eb2be3b5cc3432b0aa97fc3ee.camel@perches.com>
Subject: Re: [PATCH 2/2] HID: core: only warn once of oversize hid report
From:   Joe Perches <joe@perches.com>
To:     stillcompiling@gmail.com, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Mon, 22 Jul 2019 10:23:00 -0700
In-Reply-To: <20190722163642.10417-2-stillcompiling@gmail.com>
References: <20190722163642.10417-1-stillcompiling@gmail.com>
         <20190722163642.10417-2-stillcompiling@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2019-07-22 at 10:36 -0600, stillcompiling@gmail.com wrote:
> On HP spectre x360 convertible the message:
> hid-sensor-hub 001F:8087:0AC2.0002: hid_field_extract() called with n (192) > 32! (kworker/1:2)
> is continually printed many times per second, crowding out all other kernel logs
> Protect dmesg by printing the warning only one time.
[]
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
[]
> @@ -1311,7 +1311,7 @@ u32 hid_field_extract(const struct hid_device *hid, u8 *report,
>  			unsigned offset, unsigned n)
>  {
>  	if (n > 32) {
> -		hid_warn(hid, "hid_field_extract() called with n (%d) > 32! (%s)\n",
> +		hid_warn_once(hid, "hid_field_extract() called with n (%d) > 32! (%s)\n",
>  			 n, current->comm);
>  		n = 32;
>  	}

Is this papering over an actual defect somewhere else?
Trivially, this could use "%s: ...", __func__, ...


