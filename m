Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2C967188E
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 11:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjARKIc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Jan 2023 05:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjARKHx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Jan 2023 05:07:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8204665EEE
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 01:13:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2C3C5B8118F
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 09:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D70C433F0;
        Wed, 18 Jan 2023 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674033211;
        bh=5Wei7Yl9E6IvQz6cOag1a/vKrXAfK2BzUFT/EYy+8eY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=vA5imcc1TOVIp3Od8ptPYjYqiE/ZYnjhMJVoImmDoOYdkk9aBSSg0eI9JE0rgJaQk
         Grfd8pMecgPRvG9viRnWKm5Uuu+FuFpwnEGfcxIscr2zEGhkCqH8x4yNM9ZO5jtYEH
         n+C1pS0oj/Ek9Q9d5EyjScDKXVhRQVwR+X+c1+JxTCyQNVAUNBrSk2+TJHCUK5J1Ef
         NGAE/DAcloOX/kkqWrvjWRyr/oeD0Du2bL1EuXgrjsE9ZMWvSWCwNp79xP7DHsZ9W7
         KOUxxzCqBXen5o0V5et3WtbqyW1IeTsEuhMm4aYVdMUMCrrJzXm0aHq+WmVtM3W66K
         PWg4Lh4L48amg==
Date:   Wed, 18 Jan 2023 10:13:32 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 0/5] HID: playstation: various DS4 and DualSense fixes
In-Reply-To: <20230106015910.3031670-1-roderick.colenbrander@sony.com>
Message-ID: <nycvar.YFH.7.76.2301181013030.1734@cbobk.fhfr.pm>
References: <20230106015910.3031670-1-roderick.colenbrander@sony.com>
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

> Hi,
> 
> This patch set contains a number of small fixes and stability improvements.
> 
> The stability patches are most critical as they prevent kernel crashes.
> Over the years there have been various buggy devices usually clone devices,
> but now apparently some official devices with wiped calibration data.
> It is hard to handle all permutations of devices as some have constants,
> some have broken constants (e.g. wrong sign of a coefficient). We disable
> calibration when we see an invalid 0 denominator. The patch adds the same
> logic to both the DualShock4 and DualSense code.
> 
> As part of the calibration stability improvements, a thorough review was
> performed of the calibration code as it was suspected it was potentially
> incorrect. It was found to be only slightly wrong for the handling of the
> bias of the gyroscopes. Two patches fix this for both DualShock4 and DualSense.
> There is only a marginal impact on practical values as the bias values
> tend to be quite small.
> 
> Thanks,
> Roderick Colenbrander
> Sony Interactive Entertainment, LLC

I am splitting the stability ones (for 6.2) from the small improvements / 
cleanups (for 6.3).

Thanks,

-- 
Jiri Kosina
SUSE Labs

