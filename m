Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17932330ADB
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 11:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhCHKKA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 05:10:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:59804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231759AbhCHKJs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 05:09:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6ADC650E6;
        Mon,  8 Mar 2021 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615198188;
        bh=tvHSEsOoxYF8Igo5hVmVM0Z7ob6rTMVfFOXdpa1tZh0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=mD58Jsv8A7jIeRBECVuiRR1JWE1i7f5mdtGL7hhiNYDt8lWk+5xmydPb6rPet1+/H
         OaqWQXGaOmdSZLFeX9tcUsq2iNju2camGtmnOlhpo+HsQOKip/dqX6HrxfjYvoWngu
         62dI/Q0Nqw8gxVD9hkqR6kMC4iDW1UnJhdwtvzI0sE36GSJiy9Kt1hPE+4/aiIekBh
         pK8IjHE8X1Jz1AwkPl8Nwy0SdhPoGXNTP+i9O0UxF/YrMyxRtLEut+i2m/E/KVGoCx
         nnd7o/qLIYTlRzlMJhQB8Ps9koK7hMNKR42Rs2nhMk+FcCTO+wIUU/gTAd7mZhnXY5
         GG7m9QemHKxLA==
Date:   Mon, 8 Mar 2021 11:09:45 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Maxim Mikityanskiy <maxtram95@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Terry Junge <terry.junge@plantronics.com>,
        JD Cole <jd.cole@plantronics.com>, JD Cole <jd@jdc.me>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Workaround for double volume key
 presses
In-Reply-To: <20210207144740.6238-1-maxtram95@gmail.com>
Message-ID: <nycvar.YFH.7.76.2103081108590.12405@cbobk.fhfr.pm>
References: <20210207144740.6238-1-maxtram95@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 7 Feb 2021, Maxim Mikityanskiy wrote:

> Plantronics Blackwire 3220 Series (047f:c056) sends HID reports twice
> for each volume key press. This patch adds a quirk to hid-plantronics
> for this product ID, which will ignore the second volume key press if
> it happens within 5 ms from the last one that was handled.
> 
> The patch was tested on the mentioned model only, it shouldn't affect
> other models, however, this quirk might be needed for them too.
> Auto-repeat (when a key is held pressed) is not affected, because the
> rate is about 3 times per second, which is far less frequent than once
> in 5 ms.
> 
> Fixes: 81bb773faed7 ("HID: plantronics: Update to map volume up/down controls")
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
> People from Plantronics, maybe you could advise on a better fix than
> filtering duplicate events on driver level? Do you happen to know why
> they occur in the first place? Are any other headsets affected?

Makes one wonder how the Windows driver is dealing with this indeed.
Anyway, as there doesn't seem to be better cure available for now, I have 
applied the patch. Thanks,

-- 
Jiri Kosina
SUSE Labs

