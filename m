Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117D230BBE5
	for <lists+linux-input@lfdr.de>; Tue,  2 Feb 2021 11:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhBBKQu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Feb 2021 05:16:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:47050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229483AbhBBKQs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 2 Feb 2021 05:16:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50D8864E30;
        Tue,  2 Feb 2021 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612260966;
        bh=D1z+7hvfH8BBbQ794heYv3zLWOeb4/j24TKN2iQJP1o=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=NeEtv4qRFlfzwlQVudcA0C/dyXsFwLX7DkQOWBH7i24uwNrQiHH//fljzQoO3ckT/
         8Zr45ZqIhsu9wB7cr6U+lcIasKbdjoiFUoV+S7EmBnm0iGwC4s14q5WeXb4APNrk+I
         uY9NYmJQ0f7ISgnuVT1taXoO6u3RSaf9cutx4aJ3V0JpW7alRMKr7j5S90lp7SqMOp
         ppuzf/ZhDfFh1G2q3r/At67UhVaOIemJ8DN9ZyGib8BO+5IzxPEOpvGiVNqvxPQ5eg
         b9ZHsYs9ZBppgF6GUOGmsQPJXR5AhV9Kp77FPib5aAx93g6bcJp/Sea5Nd2XanxQhG
         DRe9t96XlEF3g==
Date:   Tue, 2 Feb 2021 11:15:55 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        seobrien@chromium.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-input: avoid splitting keyboard, system and
 consumer controls
In-Reply-To: <X//jjawwbm8FxbQU@google.com>
Message-ID: <nycvar.YFH.7.76.2102021115451.28696@cbobk.fhfr.pm>
References: <X//jjawwbm8FxbQU@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 13 Jan 2021, Dmitry Torokhov wrote:

> A typical USB keyboard usually splits its keys into several reports:
> 
> - one for the basic alphanumeric keys, modifier keys, F<n> keys, six pack
>   keys and keypad. This report's application is normally listed as
>   GenericDesktop.Keyboard
> - a GenericDesktop.SystemControl report for the system control keys, such
>   as power and sleep
> - Consumer.ConsumerControl report for multimedia (forward, rewind,
>   play/pause, mute, etc) and other extended keys.
> - additional output, vendor specific, and feature reports
> 
> Splitting each report into a separate input device is wasteful and even
> hurts userspace as it makes it harder to determine the true capabilities
> (set of available keys) of a keyboard, so let's adjust application
> matching to merge system control and consumer control reports with
> keyboard report, if one has already been processed.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Queued in for-5.12/core. Thanks,

-- 
Jiri Kosina
SUSE Labs

