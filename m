Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 438FA4B54C7
	for <lists+linux-input@lfdr.de>; Mon, 14 Feb 2022 16:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355533AbiBNP3U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 10:29:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345116AbiBNP3T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 10:29:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564FBC65
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 07:29:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0D9F4B81151
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 15:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA58EC340E9;
        Mon, 14 Feb 2022 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644852548;
        bh=E50FMKQSthVajpeie4z6fYIy9EMD1LGphBs9FfJdIJU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=oZxnI9Osef5RUaSu7A2kgFkVbFre9+Yu3ODgc8D5xDDc8SEHaX6ZnYIhe+JWaaoXd
         Zxa0QXFST9v1UK0ismLT2GnowgsbTEE9cf55kPuJf82HBufQ70Sj9IdNil/27cppNx
         dq+7n1co73GT97CpF4j61/Fif9IrOl8bJhX6/w/48hxks/d9O0jinlj51C50XnXoaj
         B1a41kwYy0Jc78juUL7ugJf1PijMFjl1Cz//+fwwd7ssFbzl+aGOo4qO2Vqa3hNDC5
         OXZxQTmon1YEAXA8EFjKJQaVcv/+hQ+vxj/WmXokayQzEJnKnCvgbYX7dZ0BnRYr8z
         ukUdAG6UHQzIA==
Date:   Mon, 14 Feb 2022 16:29:05 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Nehal-Bakulchandra.shah@amd.com
Subject: Re: [PATCH 0/5] Handle amd_sfh work buffer and interrupts 
In-Reply-To: <20220208122112.942471-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2202141628540.11721@cbobk.fhfr.pm>
References: <20220208122112.942471-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 8 Feb 2022, Basavaraj Natikar wrote:

> Changes include to handle amd_sfh work buffer in PM operations, disable
> interrupts for sensors commands, process and clear interrupts on 
> newer AMD platforms like Renoir, Cezanne.
> 
> Basavaraj Natikar (5):
>   HID: amd_sfh: Handle amd_sfh work buffer in PM ops
>   HID: amd_sfh: Correct the structure field name
>   HID: amd_sfh: Disable the interrupt for all command
>   HID: amd_sfh: Add functionality to clear interrupts
>   HID: amd_sfh: Add interrupt handler to process interrupts
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 72 +++++++++++++++++++++++++-
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.h |  4 +-
>  2 files changed, 74 insertions(+), 2 deletions(-)

I have queued this for 5.17 still.

Thanks,

-- 
Jiri Kosina
SUSE Labs

