Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7B653A572
	for <lists+linux-input@lfdr.de>; Wed,  1 Jun 2022 14:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243412AbiFAMrk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 08:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353086AbiFAMrh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 08:47:37 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8F411C0C
        for <linux-input@vger.kernel.org>; Wed,  1 Jun 2022 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654087656; x=1685623656;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vZRpaIKLQ0hcJpDrlNgvAs0kvWZc1/TwjxZbpwPQ2eY=;
  b=ZEXHR0NtsnqmDmXGrt8WWSfylpXY2iG9ymOC8rYhIO5F3xwjfGrQ7+z/
   beQdeshbhRt4m/HIMlpcMKi/ZuTSvTQ2vpyuh1rvV9IqaD41meyJmFBUL
   cGYtwLsZ6aHb6R02hgHnWcgoPIDY8e7Z33rvi7sFyjl4PDThvKkP9G8D5
   jlWlvQucxzAY7FIgqlHRwF/tGNuGGqiCf7zNy6Oy3zhm9CP6fnXTCcWk3
   rLZS6gm8VuxMCn2TeWwzLztAo1kKxuFBiVyIiJhdncfMeOc6FQ5Oy9eTB
   wCe/FoU/CdYx6f0W6A8PQ5Zj/dKjFhbckyOs7NtII4VGny5EvDAkI0o2m
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275298031"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="275298031"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 05:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="576918315"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by orsmga007.jf.intel.com with ESMTP; 01 Jun 2022 05:47:34 -0700
Message-ID: <7fe43cb4-3643-03ee-0235-d1572d627ed6@linux.intel.com>
Date:   Wed, 1 Jun 2022 15:47:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: Suspend/Resume (S3) issues with rmi_smbus
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-input@vger.kernel.org, Hugh Dickins <hughd@google.com>
References: <YpSExunpPdgdjQCz@worktop.programming.kicks-ass.net>
 <YpUX3EAzpL4+xgu1@google.com>
 <YpXXu2tbCSCUtUYQ@worktop.programming.kicks-ass.net>
 <YpY5YU+KTg/Dmaex@google.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <YpY5YU+KTg/Dmaex@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SCC_BODY_URI_ONLY,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 5/31/22 18:50, Dmitry Torokhov wrote:
> On Tue, May 31, 2022 at 10:54:19AM +0200, Peter Zijlstra wrote:
>> On Mon, May 30, 2022 at 12:15:40PM -0700, Dmitry Torokhov wrote:
>>
>>> Can you check the entire list of resume operations to make sure that
>>> PS/2 device is resumed before RMI one?
>>
>> It reports psmouse failure *after* the rmi4 failure. Is there a knob to
>> make it print more device model details on resume?
>>
>>> You can also try overriding devices driven by rmi_smbus as needing
>>> synchronous resume (see
>>> https://lore.kernel.org/all/YgHTYrODoo2ou49J@google.com/).
>>
>> I can confirm this works.
> 
> Let's ask Rafael if he has an idea why adding a link between PS/2 device
> and its SMbus companion did not seem to affect resume order. Was there a
> change in 5.18 timeframe (since original reporters said that adding
> device link helped their case).
> 
> Let's also add a couple of more folks who experienced original issue to
> see if they observe this as well.
> 
For me the psmouse keeps working on v5.18 over repeated suspend-resume 
cycles on the same machine that had the regression with the commit 
172d931910e1 ("i2c: enable async suspend/resume on i2c client devices").
