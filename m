Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96F9870B60
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 23:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbfGVVbA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 17:31:00 -0400
Received: from smtprelay0154.hostedemail.com ([216.40.44.154]:57761 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728016AbfGVVbA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 17:31:00 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id E622EC1DCA0;
        Mon, 22 Jul 2019 21:30:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:2897:2919:3138:3139:3140:3141:3142:3352:3622:3865:3871:3872:4250:4321:4362:4605:5007:7514:7576:7903:7904:10004:10400:10848:11026:11232:11658:11914:12048:12296:12297:12740:12760:12895:13069:13095:13311:13357:13439:14181:14659:14721:21080:21433:21451:21611:21627:21740:30054:30056:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:25,LUA_SUMMARY:none
X-HE-Tag: berry89_86aa08292963
X-Filterd-Recvd-Size: 2129
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Mon, 22 Jul 2019 21:30:57 +0000 (UTC)
Message-ID: <f686e93180d2f91c78801be124e8aac36145d9b0.camel@perches.com>
Subject: Re: [PATCH v2 3/3] HID: core: only warn once of oversize hid report
From:   Joe Perches <joe@perches.com>
To:     stillcompiling@gmail.com, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Mon, 22 Jul 2019 14:30:55 -0700
In-Reply-To: <20190722212613.24906-3-stillcompiling@gmail.com>
References: <20190722163642.10417-2-stillcompiling@gmail.com>
         <20190722212613.24906-1-stillcompiling@gmail.com>
         <20190722212613.24906-3-stillcompiling@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2019-07-22 at 15:26 -0600, stillcompiling@gmail.com wrote:
> From: Joshua Clayton <stillcompiling@gmail.com>

Thanks Joshua

> On HP spectre x360 convertible the message:
> hid-sensor-hub 001F:8087:0AC2.0002: hid_field_extract() called with n (192) > 32! (kworker/1:2)
> is continually printed many times per second, crowding out all else
> Protect dmesg by printing the warning only one time.
[]
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
[]
> @@ -1311,8 +1311,8 @@ u32 hid_field_extract(const struct hid_device *hid, u8 *report,
>  			unsigned offset, unsigned n)
>  {
>  	if (n > 32) {
> -		hid_warn(hid, "hid_field_extract() called with n (%d) > 32! (%s)\n",
> -			 n, current->comm);
> +		hid_warn_once(hid, "%s() called with n (%d) > 32! (%s)\n",
> +			      __func__ ,n , current->comm);

All the other bits are fine, but this line is oddly written
with unusual spacing around 'n'.

Normally it'd be something like:

		hid_warn_once(hid, "%s: called with n (%d) > 32! (%s)\n",
			      __func__, n, current->comm);


