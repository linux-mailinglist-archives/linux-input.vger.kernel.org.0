Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FE05F0677
	for <lists+linux-input@lfdr.de>; Fri, 30 Sep 2022 10:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiI3Ib5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 04:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiI3Ibz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 04:31:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0730311265D
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 01:31:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F032BB82720
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 08:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2CCC433D7;
        Fri, 30 Sep 2022 08:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664526709;
        bh=sbLUUW5CTJybjg/x966X+Ddz3Ld0koFbyTCy3nVLSKQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=p6iSBs19WBc0SXQYGQt8tl581TGrbb8bX5Fuf5U2mRAo7W6jdXBty+lgy46wvwEse
         hZEfsMBG7904C4VghmMVbp/Hwgxf0TvW0dEQ2cNhBkTMwfFVzB24eG54LKITnRvB3e
         5nKUP02H63NBE9ohRGD0pLXXe3najsomjQUzBrwzKCATIWJm9LsULRDPew4zPqnt29
         W1wJBW4zJYx9uY/H9iKLNuJdNFg92oM0j/ZdXHSkcE788xOwEx+Mr55ZBhmM78kfkI
         +RwH35opc1Gr6OVRYOr78X/rVmnV/3t5LadepoMmOvnaHObPK07TAFQu7kSlDKxK4Z
         GE0wEM9h9udtw==
Date:   Fri, 30 Sep 2022 10:31:46 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Updates to amd_sfh driver
In-Reply-To: <20220927102726.1599178-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2209301031410.16823@cbobk.fhfr.pm>
References: <20220927102726.1599178-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 27 Sep 2022, Basavaraj Natikar wrote:

> Changes includes to replace dev_err to dev_dbg and to handle
> "no sensors" case for SFH1.1.
> 
> v2:
>         - Add more verbose changelog 
> 
> Basavaraj Natikar (2):
>   HID: amd_sfh: Change dev_err to dev_dbg for additional debug info
>   HID: amd_sfh: Handle condition of "no sensors" for SFH1.1
> 
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

