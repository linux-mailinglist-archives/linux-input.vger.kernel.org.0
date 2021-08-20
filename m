Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560E93F2C71
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 14:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237828AbhHTMt6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 08:49:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:39810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231685AbhHTMt6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 08:49:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4A85610CF;
        Fri, 20 Aug 2021 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629463760;
        bh=jA8U3AhWgiCF2IF5ScW2YF4iyUAYCUWJxFVDeyXKvWw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Mq5CrCx44YwxpOH88fxwCRdse59k4GVFrdUbe0Xjiy2TH05q28dj7+hyQnVzMbZvT
         scjk1+hCluBmMcGVbJRPR068QFIaTJVRBS8YynyoPDmFsgXOpJv3FRt9cVXomvjs1v
         SXDxy7zhCFDn1v22NSOCwjF3Xq9sb6QqeBw/+w9X0VrXypGG/YN6phIVOHSnC3x0fS
         2oU88pXfsnqXeu3OYE1hEly90lSiNxeFSmsCpL7OueYz1cQ1zyS+8B3fPfbGEmUwgO
         QFuhvN1orYOl3sUBuRsdOBO025COWDSfvtwMAZw/jf84tBVsxWY33/Qsi3k4NtlAg2
         kLdIj/FkeksyQ==
Date:   Fri, 20 Aug 2021 14:49:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Nehal-Bakulchandra.shah@amd.com, shyam-sundar.s-k@amd.com
Subject: Re: [PATCH 0/5] Updates to amd-sfh driver 
In-Reply-To: <20210802140341.901840-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2108201449090.15313@cbobk.fhfr.pm>
References: <20210802140341.901840-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2 Aug 2021, Basavaraj Natikar wrote:

> Changes include updates to the existing FW reporting mechanism, MP2 FW
> status checks, adding power management routines and couple of other
> minor fixes to the existing driver.
> 
> Basavaraj Natikar (5):
>   amd_sfh:Fix period data field to enable sensor
>   amd_sfh:Add command response to check command status
>   amd_sfh:Move hid probe after sensor is enabled
>   amd_sfh:Add support for PM suspend and resume
>   amd_sfh:Add dyndbg prints for debugging
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c | 62 +++++++++++++++------
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 69 ++++++++++++++++++++++++
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   | 23 ++++++++
>  3 files changed, 139 insertions(+), 15 deletions(-)

I have queued the series for 5.15. Thanks,

-- 
Jiri Kosina
SUSE Labs

