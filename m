Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369E65232C3
	for <lists+linux-input@lfdr.de>; Wed, 11 May 2022 14:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiEKMRL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 May 2022 08:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiEKMRL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 May 2022 08:17:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD5842ECD
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 05:17:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2914061802
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 12:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B7DC340F2;
        Wed, 11 May 2022 12:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652271429;
        bh=LxionXCOYA73HvshORfrJzkAj5QIs+dC63c+iza/QlQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=kr6gSjMij+lg9dV9mQ+COq1jm1hyyQZ1DN7ulMS7nEubosOXTYkKStZwsUT5oOfRI
         0K7YFCLaFLxUHUV5ro+AHTtbBXU7HE3kkR5kBq5mw60mmcHGmhHrNDN4C7dis3goK+
         bbgtpsui+n7OKwI7ShUZipFxMg6Sl9nYnDKVXtAUCO+4ZGvlw9/96T4PN9/IWpfR34
         Azl3Q+Zv/yCRdQ4amKFA3UduALTUdaVjL0H+idI8oLhn69R8SZc9PI0FgIoTY4oHK2
         u5K/kHf17oQ/9rFked11NtNq9/puIKgNotP3Hj+RJLT9RbXxObphlXRER0oEQracpN
         6coNDXMc/uvTA==
Date:   Wed, 11 May 2022 14:17:05 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH 0/7] Enhancements and fixes to AMD SFH driver 
In-Reply-To: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2205111416560.28985@cbobk.fhfr.pm>
References: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
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

On Mon, 9 May 2022, Basavaraj Natikar wrote:

> Changes includes to support sensor discovery, add sensor name by index
> for debug info, clean up string generated for the HID device to make it
> more obvious.
> 
> Before:
> hid-generic 0020:1022:0001.0003: hidraw2: <UNKNOWN> HID v0.00
> Device [hid-amdtp 1022:0001] on
> 
> After:
> hid-generic 0020:1022:0001.0003: hidraw2: SENSOR HUB HID v0.00
> Device [hid-amdsfh 1022:0001] on pcie_mp2_amd
> 
> Basavaraj Natikar (7):
>   HID: amd_sfh: Add support for sensor discovery
>   HID: amd_sfh: Add sensor name by index for debug info
>   HID: amd_sfh: Modify the bus name
>   HID: amd_sfh: Modify the hid name
>   HID: amd_sfh: Add physical location to HID device
>   HID: amd_sfh: Move bus declaration outside of amd-sfh
>   HID: core: Display "SENSOR HUB" for sensor hub bus string in hid_info
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c | 45 ++++++++++++++++++++----
>  drivers/hid/amd-sfh-hid/amd_sfh_hid.c    |  9 +++--
>  drivers/hid/amd-sfh-hid/amd_sfh_hid.h    |  1 -
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 17 ++++++---
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  5 +++
>  drivers/hid/hid-core.c                   |  4 +++
>  include/uapi/linux/input.h               |  1 +
>  7 files changed, 69 insertions(+), 13 deletions(-)

The series is now in hid.git#for-5.19/amd-sfh. Thanks,

-- 
Jiri Kosina
SUSE Labs

