Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4820F295C4C
	for <lists+linux-input@lfdr.de>; Thu, 22 Oct 2020 11:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896135AbgJVJ4k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Oct 2020 05:56:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2411154AbgJVJys (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Oct 2020 05:54:48 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F33C9223FB;
        Thu, 22 Oct 2020 09:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603360488;
        bh=dGy74J5Y/cDT6L/xspFbhh870sr9xBIxRlFcu4XxPSQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=eBqW8/vnHr71Hpd3vI2NeCH7ehegEPCIpHAU/AgV1fvvjHc3sZg0ZnQSUIrzTvH56
         24WoJbwwB5D3Nx09Ne7uRMTX41WIv1dEZEqBqdbQDiUUcJHVHw93kMTIbAy2MfQVgW
         xLRR+dJ8OOybMuOyWd5aRs8nn5P4QoNdoBpgliVY=
Date:   Thu, 22 Oct 2020 11:54:44 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     David Edmondson <david.edmondson@oracle.com>
cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: multitouch: Re-enable trackpoint and buttons on
 Lenovo X1 Tab gen2
In-Reply-To: <20201016143244.1303262-1-david.edmondson@oracle.com>
Message-ID: <nycvar.YFH.7.76.2010221154120.18859@cbobk.fhfr.pm>
References: <20201016143244.1303262-1-david.edmondson@oracle.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 16 Oct 2020, David Edmondson wrote:

> Use the FORCE_MULTI_INPUT class and quirk added in
> commit 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk
> for some devices")
> to enable event reporting from both the trackpad and the
> trackpoint/buttons in the Lenovo X1 Tab gen2.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

Hi David,

there is already a patch in Linus' tree doing this (4a6a4c966ccf38). 
Thanks,

-- 
Jiri Kosina
SUSE Labs

