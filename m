Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185F63B2EE6
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 14:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhFXMbV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 08:31:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229448AbhFXMbV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 08:31:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76D87613EC;
        Thu, 24 Jun 2021 12:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624537742;
        bh=ptYzv12FcfuaXvLp7c84fIeEWzzjzuXlDBVCh6BO2Lw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=sxBgpwfPE5QFkJiY+9Y8kaJ4IZyy/T5v8p8B5rTodL+Ap4f+2meY0C40cPgMw0M+h
         Q0r57Uox3K+7wsAJpYca41ChRXxV1A00/fmTZSVMdpGOAKPaVcYbeRS3SktLTXcv0d
         o74ICz8qKjJl9yKO00wsFreFmUTNW1zEgqtnYahzBHFsCX0Y2Hkw/S+ZSTmiGlJpCV
         M141Zbtqsj43cUYX8cpmKUKJDXYyAohMdBCGSSjMak5E4rDVYfhkNk8tJyPduF8q9n
         wZtONcEmKFC1nXCsYQp0CnsN8PzR5BKioCfSR+srZPa0ydHtU1s7/S/K8KH0y004HJ
         mLiFPzCK0eWnA==
Date:   Thu, 24 Jun 2021 14:28:59 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Nehal-Bakulchandra.shah@amd.com, shyam-sundar.s-k@amd.com
Subject: Re: [PATCH 0/3] Add SFH sensor support for newer AMD platforms
In-Reply-To: <20210618081838.4156571-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2106241428430.18969@cbobk.fhfr.pm>
References: <20210618081838.4156571-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 18 Jun 2021, Basavaraj Natikar wrote:

> AMD SFH firmware (MP2) has evolved since the time the last driver update
> has been pushed. The way in which the MP2 FW and the driver communicates
> have also changed with changing silicon versions. Hence there is an
> update to the data structure and the things around it.
> 
> With this in-place, the AMD next generation SoC's like Renoir, Cezanne
> are added here along with the support for Ambient Light Sensor (ALS).
> 
> Finally, bringing in initial support for Human Presence Detection (HPD)
> sensor on supported generations.
> 
> Basavaraj Natikar (3):
>   amd_sfh: Extend driver capabilities for multi-generation support
>   amd_sfh: Extend ALS support for newer AMD platform
>   amd_sfh: Add initial support for HPD sensor
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c      |  43 ++++---
>  drivers/hid/amd-sfh-hid/amd_sfh_hid.h         |  12 +-
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  89 +++++++++++++-
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  43 +++++++
>  .../hid_descriptor/amd_sfh_hid_desc.c         |  48 +++++++-
>  .../hid_descriptor/amd_sfh_hid_desc.h         |  11 +-
>  .../hid_descriptor/amd_sfh_hid_report_desc.h  | 112 ++++++++++++++++++
>  7 files changed, 324 insertions(+), 34 deletions(-)

Now queued in for-5.14/amd-sfh. Thanks,

-- 
Jiri Kosina
SUSE Labs

