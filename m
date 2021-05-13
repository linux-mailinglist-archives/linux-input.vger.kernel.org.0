Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA8537F69D
	for <lists+linux-input@lfdr.de>; Thu, 13 May 2021 13:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhEMLVV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 May 2021 07:21:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:37530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231265AbhEMLVU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 May 2021 07:21:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D41C1613CA;
        Thu, 13 May 2021 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620904811;
        bh=cwqEWwV9yRq3gYtZuQO7urPFM2+sG+9/kIHoib4Cu/w=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=qIczjlnZnAw2l/yN3RCkzMVDo9Z1Q4dsVj9B91ow7NV6xfEjDobUjgdiQmolJP7AR
         tJnPZo/IxhsfDrLffcF77VPdDAyUSh0OPBwoizAip+7opXPi/2abUhWI2xz09I1ZQF
         0yCH8PpkM+vh0c+cte8znLvmcybfAdw06E1iSTgy7nPjS3QHuFmyFlHeRbmBVcFefn
         YsCVRl9QTuBMxxE6z8X+uSRkNKkLyCm8vY0HBXovXdEmun5iQAJr8AL5hSRGICTzbB
         /RuGIph93uxUixTfitGf+oUqtu8NXAnYwUiJZPtmD43B+CaQELR1hNwW6hUk5z74dk
         qv1kdivndJmew==
Date:   Thu, 13 May 2021 13:20:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <uwe@kleine-koenig.org>
cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] HID: intel-ish-hid: Drop if block with an always
 false condition
In-Reply-To: <e200b949-b909-d5da-8c81-06a57fc50b98@kleine-koenig.org>
Message-ID: <nycvar.YFH.7.76.2105131318120.28378@cbobk.fhfr.pm>
References: <20210206151348.14530-1-uwe@kleine-koenig.org> <nycvar.YFH.7.76.2103081107250.12405@cbobk.fhfr.pm> <31028f589e27e246bb3b4b693caeb0b8eae3a285.camel@linux.intel.com> <nycvar.YFH.7.76.2103081716200.12405@cbobk.fhfr.pm>
 <e200b949-b909-d5da-8c81-06a57fc50b98@kleine-koenig.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 10 May 2021, Uwe Kleine-König wrote:

> I expected these patches to go in during the 5.13 merge window, but they
> didn't. I found your pull request for 5.13
> (https://lore.kernel.org/lkml/nycvar.YFH.7.76.2104292151220.18270@cbobk.fhfr.pm/)
> and they were not included there even though the patches were in next since at
> least next-20210310. Looking at
> 
> 	git log --oneline --cherry
> v5.13-rc1...dce6a0d56a7719efcad438f5c46a9d192fd36a89
> 
> (where dce.. was the tip of your for-next for next-20210506 (i.e. before
> 5.13-rc1 was cut)) and it seems there are quite a few more commits that didn't
> make it into your pull request.
> 
> What am I missing?

You are missing the fact that I am a halfwit and I screwed up the merge :) 

for-5.13/intel-ish branch by mistake didn't make it into final for-linus 
unfortunately, due to my mistake.

Thanks a lot for pointing it out, I will fix that up.

-- 
Jiri Kosina
SUSE Labs

