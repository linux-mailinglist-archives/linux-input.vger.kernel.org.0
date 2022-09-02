Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72D9A5AABF9
	for <lists+linux-input@lfdr.de>; Fri,  2 Sep 2022 12:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbiIBKBW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Sep 2022 06:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235644AbiIBKBU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Sep 2022 06:01:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A207E8E0F2
        for <linux-input@vger.kernel.org>; Fri,  2 Sep 2022 03:01:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56667B82A5C
        for <linux-input@vger.kernel.org>; Fri,  2 Sep 2022 10:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE980C433C1;
        Fri,  2 Sep 2022 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662112875;
        bh=16WWFmzeBDtpuqSatC4HvVtL6gyMpvD/0w6VJlfiq1I=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=nYJ02rI4qTZMegO4tZJ0YoV9jKvCQi3f4m6KOh5kNUVoeGQ9Tsk53Q2DafeN31Jvl
         quc07XRzYqP1FmczmgDPYjdHyIkpao2L4dqcGaQR7xPTjq8DrY6lpqtutQPgSNrbtL
         iq3TDg6ijqZiW3Iz6cH1OE0bncIybpjRhpmZsi1g9vig/QspZZ6p6TJPO5xOE5wlar
         Ui86quZp4ap8JJEyELGu4O+9LDXPZV/TSZgLxol+LN93+A5tqHNGywykkRMZYz1zgQ
         LK0c50MjbgdpoTZVN/+gxmC8LuIZ/kiVCmbcnE/2GmxQwLWjv+GtepBeWznvYbdLFp
         ziWaj9t5/Vq2Q==
Date:   Fri, 2 Sep 2022 12:01:12 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ping Cheng <pinglinux@gmail.com>
cc:     linux-input@vger.kernel.org, Ping Cheng <ping.cheng@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: Re: [PATCH 1/2] HID: wacom: Add new Intuos Pro Small (PTH-460) device
 IDs
In-Reply-To: <20220826213402.9950-1-ping.cheng@wacom.com>
Message-ID: <nycvar.YFH.7.76.2209021200450.19850@cbobk.fhfr.pm>
References: <20220826213402.9950-1-ping.cheng@wacom.com>
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

On Fri, 26 Aug 2022, Ping Cheng wrote:

> Add the new PIDs to wacom_wac.c to support the new model in the Intuos Pro series.
> 
> Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
> Tested-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>

Applied, thanks Ping.

-- 
Jiri Kosina
SUSE Labs

