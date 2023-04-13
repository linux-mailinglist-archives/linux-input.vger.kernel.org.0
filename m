Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C086E0F51
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 15:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjDMN4S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 09:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjDMN4S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 09:56:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C034610F0
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 06:56:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 64FAD614CE
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 13:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EC5C433EF;
        Thu, 13 Apr 2023 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681394174;
        bh=FQAbh7PLR8415JmsX806f9JCB8Txatp0s6UJZo+5niE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=jfGz4ePhF5B8PnOMRGwVYzUGkMWxKemCH/JRkyEESDh5qUN9t8jojKQ9WPuEjN3gx
         ywKWk1o0POGJheBDHmKl23t8RTl93PBgXZAx4IWngaCCqkN3QaPbGlr0zdUFdIGQ8s
         AGbmhZIsADHG6UP9+wecqOvIiAu1W+aaofsGOlR0Gd/p/Ay/KK8sRbvCqII930BOrn
         U8vnKYdoyi+yiepZjVWidoDJVsqGd/HN8/tesv6O5MOD/O4a+1SEsBbpRp9JkXRpcl
         fAbOTSx23XYPkBsaA/cjIRr+Mkei9RYdoemfnPvDXCP7B6fNhVD+Djd0LTNEAN35Q6
         TR2B7ULk2oUZg==
Date:   Thu, 13 Apr 2023 15:56:11 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH 0/7] Fixes to amd_sfh 
In-Reply-To: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2304131556060.29760@cbobk.fhfr.pm>
References: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
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

On Tue, 11 Apr 2023, Basavaraj Natikar wrote:

> Changes include correcting structure fields, illuminance values,
> shutdown PM operations, stop all command, increasing sensor
> command timeout and no sensor condition.
> 
> Basavaraj Natikar (7):
>   HID: amd_sfh: Correct the structure fields
>   HID: amd_sfh: Correct the sensor enable and disable command
>   HID: amd_sfh: Fix illuminance value
>   HID: amd_sfh: Add support for shutdown operation
>   HID: amd_sfh: Correct the stop all command
>   HID: amd_sfh: Increase sensor command timeout for SFH1.1
>   HID: amd_sfh: Handle "no sensors" enabled for SFH1.1
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c             |  9 +++++++++
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c      |  2 +-
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c      | 11 +++++++++++
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 10 +++++++---
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h |  8 ++++----
>  5 files changed, 32 insertions(+), 8 deletions(-)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

