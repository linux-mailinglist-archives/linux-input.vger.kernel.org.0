Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1C84EC813
	for <lists+linux-input@lfdr.de>; Wed, 30 Mar 2022 17:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348103AbiC3PWh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Mar 2022 11:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348128AbiC3PWg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Mar 2022 11:22:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBEA192367
        for <linux-input@vger.kernel.org>; Wed, 30 Mar 2022 08:20:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B001D616D4
        for <linux-input@vger.kernel.org>; Wed, 30 Mar 2022 15:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4B6C340F2;
        Wed, 30 Mar 2022 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648653650;
        bh=UOoLJUWpoQacm9BPqCWNvSBiV/M7BF9bz8QyF0cHSOk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Nj/ECaXM2NLiERs8meeHLRwKewfLONCnCHzemKzmvHyzsp4qzNB699zkrRmKwP123
         N0Oxutu7DbouEqqGNX5GeCS/AyrLPSuXyQ5NkoNIZkRmpwLBh2KB1NiIeBssYDVP95
         6EIAEzuro9FVa7hehjS/eBF0Ihe0A3kKAxCHQu8eJwni0ISQ+UUGOUd5MOzmTHOr58
         4CLjnuuKPFXi4UK8SXpwlV2wErBNZmHo7tQxhnChaW8NOwhAGTDUXhQWQwx/lhQ2Fy
         bZUZhxn2ns1pKL57gC4ILRc3AD4klTn/NRkUUtJQoH87W3JLkNfUGZbaYaPGXZ0ec5
         3wpCasbZx1xwQ==
Date:   Wed, 30 Mar 2022 17:20:46 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Even Xu <even.xu@intel.com>
cc:     srinivas.pandruvada@linux.intel.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: add ADL and RPL device id
In-Reply-To: <1648650465-32730-1-git-send-email-even.xu@intel.com>
Message-ID: <nycvar.YFH.7.76.2203301720300.24795@cbobk.fhfr.pm>
References: <1648650465-32730-1-git-send-email-even.xu@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 30 Mar 2022, Even Xu wrote:

> Add device IDs of Alder Lake N and Raptor Lake S into ishtp support list.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied to hid.git#for-5.18/upstream-fixes

Thanks,

-- 
Jiri Kosina
SUSE Labs

