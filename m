Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B53266025D
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 15:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjAFOl7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Jan 2023 09:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjAFOl6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Jan 2023 09:41:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190AE5E651
        for <linux-input@vger.kernel.org>; Fri,  6 Jan 2023 06:41:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A90EE61376
        for <linux-input@vger.kernel.org>; Fri,  6 Jan 2023 14:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084F1C433D2;
        Fri,  6 Jan 2023 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673016117;
        bh=8EsxnIBfDu3hX7I4HWdnma591isFDpzGurRz4gzs2kY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=o9g+mwDFquqmPxFUFq9UMGp5UDAR8JuWhDSyajBNkn4vwwvK7SViQjcfPszzCy3qS
         jDcY/KkA9SrhmsqjuwJXnc/3GAcZEaZwsgkElORhwFktIB9Dnnrz2vTxrLfKkbcxlt
         5M0yTuUvIXwveahYCUb6ufZSriYeuyvo2FGd3bqevFrOwn/ZfK1fwguGaTNYwM/ozg
         trOqRydyA8B5Z98G2vAaawj1MV6X69TWEEfL+I5PxbMz1P67Q/ZMGNeUhZ0rc0N9tY
         7y/B5ud3pUmKVSfcM7qj6CtOGY51Sjmt+g5FCM7+J4kcOjjtlYljuLpkSJomNYL/2Y
         0ReMonhgqU/oQ==
Date:   Fri, 6 Jan 2023 15:41:56 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Christian Zigotzky <chzigotzky@xenosoft.de>
cc:     anpatel@nvidia.com, linux-input@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Darren Stevens <darren@stevens-zone.net>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>, linux-input@vger.kernel.org,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
Subject: Re: [PASEMI] Nemo board doesn't reboot anymore after the commit
 "HID: usbhid: Add ALWAYS_POLL quirk for some mice"
In-Reply-To: <75f18191-c311-18f2-bfdb-ac82fb166e1b@xenosoft.de>
Message-ID: <nycvar.YFH.7.76.2301061540530.1734@cbobk.fhfr.pm>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de> <75f18191-c311-18f2-bfdb-ac82fb166e1b@xenosoft.de>
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

On Fri, 6 Jan 2023, Christian Zigotzky wrote:

> Hello,
> 
> The reboot issue is still present in the RC2 of kernel 6.2. We still need the
> usbhid.patch. [1]
> 
> Please check the bad commit. [2]

Ankit,

have you tested with all the devices that you added the quirk for in your 
original patch?

Unless I hear otherwise, I will just drop 
the quirk for USB_DEVICE_ID_CHERRY_MOUSE_000C before this gets clarified.

Thanks,

-- 
Jiri Kosina
SUSE Labs

