Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16757295C50
	for <lists+linux-input@lfdr.de>; Thu, 22 Oct 2020 11:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896236AbgJVJ45 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Oct 2020 05:56:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896233AbgJVJ44 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Oct 2020 05:56:56 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09457223FB;
        Thu, 22 Oct 2020 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603360616;
        bh=90bb1gJhfJD64pb0HpEHmEhvZajNKCT+ryB+3oL3ZuY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=t335529Xa9mLvDI7yyfPjDa/rciKSKeVlICoGpqfHpnTGDGkvUCutAOxXUYln0nYp
         KHXQW+5AV2PCll/VHsIwQF9QOTy0WqDkro2CaVF8bTU0auSrS29KuoOpqrvLm5NGKF
         rf+k3v1aq7lvgfblet/S6GglAwfwAfIQ/Nn4/fXs=
Date:   Thu, 22 Oct 2020 11:56:52 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Harry Cutts <hcutts@chromium.org>
cc:     LKML <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Add PID for MX Anywhere 2
In-Reply-To: <20201021135612.258558-1-hcutts@chromium.org>
Message-ID: <nycvar.YFH.7.76.2010221156450.18859@cbobk.fhfr.pm>
References: <20201021135612.258558-1-hcutts@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 21 Oct 2020, Harry Cutts wrote:

> It seems that the PID 0x4072 was missing from the list Logitech gave me
> for this mouse, as I found one with it in the wild (with which I tested
> this patch).
> 
> Fixes: 4435ff2f09a2 ("HID: logitech: Enable high-resolution scrolling on Logitech mice")
> Signed-off-by: Harry Cutts <hcutts@chromium.org>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

