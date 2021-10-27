Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7656243C4B3
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 10:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239253AbhJ0IMn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 04:12:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:45906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235660AbhJ0IMm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 04:12:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29478610FC;
        Wed, 27 Oct 2021 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635322217;
        bh=pZvXI80W6+vcTE+C0hBwqRQn3h1YSRyRrBOR6CINgcU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=FVPdiVkwXDWl9+3ivgiZBU/HdqvwMiB0F8kE50S97GdUJZFH1jjo7B4qNz2/Kirqw
         Epbi64kR5VqgA4vFPW3FqVw8ux5aCXW6/hmJtKJpd6t40sde0LWfqu8aevfOcUi0DM
         kJss1SmM+ntq2LTOoYQDpYNKRNbtz1uJBMF5+cc7FuR83w/vIr+JV5vxF99jX7JOQo
         xznEIWuDu0JXNe09U6paL1Akk5TIkndQNYUiC4wHNpElZmyOD/A8KMOg8jzXi3YRUw
         PMfHHhmcteEOMHRre7Y7yc0c3anlp9x+DemCzTPXv8uTilhO7qbUvlkIsCYIIDt4/A
         lcYVYQbxCoD/Q==
Date:   Wed, 27 Oct 2021 10:10:14 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
cc:     linux-input@vger.kernel.org, Ash Logan <ash@heyquark.com>,
        =?ISO-8859-15?Q?Jonathan_Neusch=E4fer?= <j.ne@posteo.net>,
        =?ISO-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>
Subject: Re: [PATCH v4 0/5] HID: nintendo: Add support for the Wii U
 gamepad
In-Reply-To: <20211019110418.26874-1-linkmauve@linkmauve.fr>
Message-ID: <nycvar.YFH.7.76.2110271009410.12554@cbobk.fhfr.pm>
References: <20210519085924.1636-1-linkmauve@linkmauve.fr> <20211019110418.26874-1-linkmauve@linkmauve.fr>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 19 Oct 2021, Emmanuel Gil Peyrot wrote:

> This driver is for the DRC (wireless gamepad) when plugged to the DRH of
> the Wii U, a chip exposing it as a USB device.
> 
> I tried to use this driver on master over usbip on my laptop, but usbip
> disconnects the device right after the driver created the
> /dev/input/event* files, so instead I have only tested this driver on
> the 4.19 branch of the linux-wiiu[1] downstream.
> 
> Other than that, pretty much all of the HID parts of the gamepad work,
> it’s only missing microphone, camera and NFC input now but those are
> mostly standard (read require quirks) and pertain to other subsystems,
> so I felt like this can be upstreamed already.

Now that proper hid.git#for-5.16/nintendo branch exists, could you please 
fix up the issues reported by the kernel build bot and resubmit?

Thanks,

-- 
Jiri Kosina
SUSE Labs

