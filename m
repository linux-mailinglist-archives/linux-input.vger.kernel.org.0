Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF9067187C
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 11:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjARKGY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Jan 2023 05:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjARKEl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Jan 2023 05:04:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7CA69B1E
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 01:11:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0DFB8B8118F
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 09:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1ECC433EF;
        Wed, 18 Jan 2023 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674033068;
        bh=n85wNzwCx2+cFijse8j/mrGyp52Nk8xfIMcGL+w2G1s=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=RcOhLmyYIa9woYLLHzRfgXYV3Y5dkI/FeN6S5XWF7rlm9FttPkxb+7yJ+5Sbp8Y4w
         60PH2Z77lXuM4bd97SQxJ7gK6E+KB5eZeV3ygHQMH5r+SoFIOPUoERpOfWW1gJGN8B
         0BxvbR51UeW8spoJOpWdjJ2fodqy3fNMJ6L7Rf3SV+U8m5H56Wvyozn7iF5/FWp+Ur
         Mo/hWggcSwanQgByAaEpMOaUeZNa1Lu5gCkD2mcDEUKn8Zi/ishZWfHUWUU9iF2Azm
         Ld+MP+0PL90zkLcj4zzpP6WBEuuz6Wg0T5abbsuvfyWoSZwHrpBVsYWbU+CbwuY/aq
         4xnaP2S6B68PQ==
Date:   Wed, 18 Jan 2023 10:11:10 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 3/5] HID: playstation: sanity check DualSense calibration
 data.
In-Reply-To: <20230106015910.3031670-4-roderick.colenbrander@sony.com>
Message-ID: <nycvar.YFH.7.76.2301181010590.1734@cbobk.fhfr.pm>
References: <20230106015910.3031670-1-roderick.colenbrander@sony.com> <20230106015910.3031670-4-roderick.colenbrander@sony.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 5 Jan 2023, Roderick Colenbrander wrote:

> Make sure calibration values are defined to prevent potential kernel
> crashes. This fixes a hypothetical issue for virtual or clone devices
> inspired by a similar fix for DS4.
> 
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>

Applied to for-6.2/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs

