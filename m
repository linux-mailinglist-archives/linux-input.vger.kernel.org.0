Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BC8425282
	for <lists+linux-input@lfdr.de>; Thu,  7 Oct 2021 14:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241164AbhJGMHy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Oct 2021 08:07:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:47854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241133AbhJGMHy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Oct 2021 08:07:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA7F66103B;
        Thu,  7 Oct 2021 12:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633608361;
        bh=jVv3R6sqeVy1rgVRcy65RPB2wy1r6zROcghoRzfBqXM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=W5ZpuGjPqIe9DU1k6XcVtWMHxLsA4k3Bn1jXLfj4/c3FK/Ro5GAXcgxfV6OHmaNZB
         8v0tOt0pqX0+fEBHnioUxIJyYrDdcLxxteuJ/auDrbBTlvhkbmzFUFb5hypywmFmdZ
         O4s9T0TVxejSKr4T8wbACKrmthnR6L7inwCTGGwgwTI9v+cYGth/I7S6LXkKXajUas
         XjyZJGMapPt0O7jEjK44uneAjtRHLpXbjMYdAppYPa9/G0PYsA9GeazX4kko55k/6L
         dUelJpVTIUxBl4EpaPB8kpJOvxztSb4C4Knffi2u+I09aVNpfi52NfDckP6g9csTND
         I76ETkcml/hIg==
Date:   Thu, 7 Oct 2021 14:05:58 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: disable sticky fingers for UPERFECT Y
In-Reply-To: <20211001172513.27822-1-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2110071405490.29107@cbobk.fhfr.pm>
References: <20211001172513.27822-1-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 1 Oct 2021, José Expósito wrote:

> When a finger is on the screen, the UPERFECT Y portable touchscreen
> monitor reports a contact in the first place. However, after this
> initial report, contacts are not reported at the refresh rate of the
> screen as required by the Windows 8 specs.
> 
> This behaviour triggers the release_timer, removing the fingers even
> though they are still present.
> 
> To avoid it, add a new class, similar to MT_CLS_WIN_8 but without the
> MT_QUIRK_STICKY_FINGERS quirk for this device.
> 
> Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

