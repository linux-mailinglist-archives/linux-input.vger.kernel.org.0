Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C13523309
	for <lists+linux-input@lfdr.de>; Wed, 11 May 2022 14:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbiEKMWv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 May 2022 08:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiEKMWv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 May 2022 08:22:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B77D15A744
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 05:22:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B21661B20
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 12:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F379AC340F2;
        Wed, 11 May 2022 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652271769;
        bh=K+XXpiJa6gjcGujoVfClvP0M3omRhard1yDWtjsISTg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=r5OaJmu8lzwMepXZb3iMWoVeiiyhREY/JFDFwy0uGbdfojvNxi0dpdCsXZaMkGYWL
         mnXEQGucYTGkNSWmSn4QHsA0riMZMgt7xeUWStpFlLV1okCZmim/fXvdKKDOd2eG+X
         cFvVdykcyFq0c/FjdqS2tlo//1mhLqz/0jUwdvJHCTpMKCT0UBRyrxDxYrxWsXq7jj
         XE//Uz/Ksv7rrUwWyYqIagkJ0tezIAcRJAAVnaBOTAxQDfPTxiu2mqgv1dzFxDWeEy
         K1gUbMQClkwFhxbO3VwcojNTJjQdVD0AaBrvza/dzSWSGRVOpjyUucuxD+mtvZd87B
         U5cOrqS/TNr3A==
Date:   Wed, 11 May 2022 14:22:45 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Bryan Cain <bryancain3@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/1] HID: apple: Properly handle function keys on Keychron
 keyboards
In-Reply-To: <20220505191221.36172-2-bryancain3@gmail.com>
Message-ID: <nycvar.YFH.7.76.2205111422320.28985@cbobk.fhfr.pm>
References: <20220505191221.36172-1-bryancain3@gmail.com> <20220505191221.36172-2-bryancain3@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 5 May 2022, Bryan Cain wrote:

> Keychron's C-series and K-series of keyboards copy the vendor and
> product IDs of an Apple keyboard, but only behave like that device when
> set to "Mac" mode. In "Windows" mode, the Fn key doesn't generate a
> scancode, so it's impossible to use the F1-F12 keys when fnmode is set
> to its default value of 1.
> 
> To fix this, make fnmode default to the new value of 3, which behaves
> like fnmode=2 for Keychron keyboards and like fnmode=1 for actual Apple
> keyboards. This way, Keychron devices are fully usable in both "Windows"
> and "Mac" modes, while behavior is unchanged for everything else.
> 
> Signed-off-by: Bryan Cain <bryancain3@gmail.com>

Applied, thanks Bryan.

-- 
Jiri Kosina
SUSE Labs

