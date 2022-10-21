Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B794D607668
	for <lists+linux-input@lfdr.de>; Fri, 21 Oct 2022 13:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbiJULoo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Oct 2022 07:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiJULon (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Oct 2022 07:44:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48ED31F93
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 04:44:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7A051B82B9C
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 11:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59243C433C1;
        Fri, 21 Oct 2022 11:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666352678;
        bh=uMfQKJTFgJK9DDzH/Cfrgh8SHXcjtkz5O8RuYbajTM0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Zigxs68Z9ulsdvO8VknCKYjpHw/fLFz7OaAJH9fe4PW1DU3fsdHluFT3lk4aShK55
         SOmVAQcBS821DIavYHp7iyoQx6fNcaboKs//u0bHBn2ZgE+C8bM2v1iZENyAjHrwHb
         JSODiHSmijvvqgtp52kBrMZiuBwHv2F3As7Aj/jSTCbguuPtUIPvHNs5BJmHwy7ZN3
         3EUeg0xVrvGZudYhCtCSj3csQ+Yp7q4wMpfRtT0A6aIXPXpWGcGEm4ZnTIMxDiZehQ
         WSJzVAQqbzpVrALFNTSfVlvT/iFjOfD4QTvqpN8c9F8t6U7ZoJMqiEqiy0bmBMN8Ew
         FyxOvs212rDVQ==
Date:   Fri, 21 Oct 2022 13:44:34 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
cc:     jic23@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 0/2]  HID: mcp2221: fixes related to IIO additions
In-Reply-To: <20221020153000.30874-1-matt.ranostay@konsulko.com>
Message-ID: <nycvar.YFH.7.76.2210211344210.29912@cbobk.fhfr.pm>
References: <20221020153000.30874-1-matt.ranostay@konsulko.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 20 Oct 2022, Matt Ranostay wrote:

> This series resolves sparse warnings, and undefined references errors when
> GPIOLIB isn't enabled.
> 
> Matt Ranostay (2):
>   HID: mcp2221: fix 'cast to restricted __le16' sparse warnings
>   HID: mcp2221: correct undefined references when CONFIG_GPIOLIB isn't
>     defined
> 
>  drivers/hid/hid-mcp2221.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Now applied on top of hid.git#for-6.2/mcp2221. Thanks,

-- 
Jiri Kosina
SUSE Labs

