Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDA445BE652
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 14:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiITMwF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 08:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiITMwE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 08:52:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731786BD54
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 05:52:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D65F6210B
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 12:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F116C433C1;
        Tue, 20 Sep 2022 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663678320;
        bh=BcZy4OAPlr6mpBT0LUSr/NpAVmf7EZVJX7uNMQjRGNE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=reic3IcjWgaTLlV/sYfNp7hmL06moHpNcCxSYQQd+PWmcVSTXmgYEp5cq6QNAq4Qk
         /8Fv9T0WvJuPv9kmY6F7l0wGIG61eTdYHxSZh2rhOWvNdszK88K+GTlJaAtBAj+jh0
         ipwfZsHYk7cYCO8v2Qu1J3A2FU/Osq8dKSlrXYTnO5E0BCMmPPbPBoiZHasa+bPOtY
         mbzwaPuYmRBWbGqgsZoIeInIXTxgs+CnoikHGOyYBiHW6R0p8mo2zyNAjlJCHVCKzR
         dhXY5KNk58ci9z2ZtrBawtKfuyOsbXtJFiArU/BfzA4/lK8hYamC3pPZ4lCUG6L9la
         pOlfUD47g/jJQ==
Date:   Tue, 20 Sep 2022 14:51:50 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hyunwoo Kim <imv4bel@gmail.com>
cc:     erazor_de@users.sourceforge.net, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] HID: roccat: Fix Use-After-Free in roccat_read
In-Reply-To: <20220904193115.GA28134@ubuntu>
Message-ID: <nycvar.YFH.7.76.2209201451270.16823@cbobk.fhfr.pm>
References: <20220904193115.GA28134@ubuntu>
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

On Sun, 4 Sep 2022, Hyunwoo Kim wrote:

> roccat_report_event() is responsible for registering
> roccat-related reports in struct roccat_device.
[ ... snip ... ]
> Since the device node of this driver does not set separate permissions,
> this is not a security vulnerability, but because it is used for
> requesting screen display of profile or dpi settings,
> a user using the roccat device can apply udev to this device node or
> There is a possibility to use it by giving.
> 
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

