Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5246F45714F
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 16:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhKSPFL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 10:05:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:51420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230064AbhKSPFL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 10:05:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DE576069B;
        Fri, 19 Nov 2021 15:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637334129;
        bh=u2SGd8bbjGPqTpBgDb3JFcqm1WgcDYulb4A7Tr/R09E=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=OMIH8Tn10N/0rjst90s8RyTz+1x1MA0OoaYfpcCFyuuhkU7QhJtpAsgUnSgDCr6H4
         DDmDTct+CISr4kQbqtU3PnJYGIt3vLRga71/Y5952EnOBBVHG2MBB2kIkt0S5JQbe+
         Vz17I4AvNPW7M/sr83NS2FrH98Xa4p6KpWaRquvQ7/6S6uOnlXcWiMinDRVE37paIy
         oY/C5xLp/0NA4CoXrWeOeu68UNfT6VAz1mgbOaDlF8ryrNHm73A1IJj/VbK2Jnj/5W
         H1r/UBCw81uPRj0/NkebcmMTFFbDrbuAESdroXohu+q/3pcAbF5JsUKigpZxbQtEWB
         Qb/x7hxCWAK3g==
Date:   Fri, 19 Nov 2021 16:02:06 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: magicmouse: Report battery level over USB
In-Reply-To: <20211118165208.5664-1-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2111191601560.16505@cbobk.fhfr.pm>
References: <20211118165208.5664-1-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 18 Nov 2021, José Expósito wrote:

> When connected over USB, the Apple Magic Mouse 2 and the Apple Magic
> Trackpad 2 register multiple interfaces, one of them is used to report
> the battery level.
> 
> However, unlike when connected over Bluetooth, the battery level is not
> reported automatically and it is required to fetch it manually.
> 
> Fix the battery report descriptor and add a timer to fetch the battery
> level.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Applied, thanks José.

-- 
Jiri Kosina
SUSE Labs

