Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA302C40A2
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 13:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgKYMzW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 07:55:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:50564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729334AbgKYMzW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 07:55:22 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D227D206E5;
        Wed, 25 Nov 2020 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606308921;
        bh=N00h6+B7Af2g0ryoTX+CHzUF/w3UJtcNZfPSyiyDDVA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=nfhJ+akBcune4UhqTu+G1BXU3R63IQO4MeOQdHWFavl58x1EZYyIuNbXXfvvmSEKV
         2OFGK1pP/TFgJO8j5nP0Cnb/nt6evDz98ARjUXc+CWLy3+f6DlshNn1bT959SWZPgR
         4fwRTnqmKMmFqTOX5CLMxuSnv6b8lfwNiwBojdLw=
Date:   Wed, 25 Nov 2020 13:55:10 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 0/3] HID: sony: various DS4 improvements
In-Reply-To: <20201110072229.9112-1-roderick@gaikai.com>
Message-ID: <nycvar.YFH.7.76.2011251354360.3441@cbobk.fhfr.pm>
References: <20201110072229.9112-1-roderick@gaikai.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 9 Nov 2020, Roderick Colenbrander wrote:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> 
> Hi,
> 
> This patch series provides a number of independent DS4 driver
> improvements.
> 
> The first patch improves DS4 battery level and battery status
> reporting. The current implementation interpreted the value
> ranges and status levels incorrectly.
> 
> The second patch fixes a DS4 dongle kernel crash (bug 206785).
> The specific problem is related to Steam, which implements
> its own user-space DS4 driver using hidraw. It collides during
> DS4 dongle hotplug, causing 'out of order HID feature reports'.
> The driver didn't expect this and this led to a kernel crash
> later on due to interpreting data incorrectly. The workaround
> is checking if the right data was returned and retrying.
> Though, I really really dislike this type of fix. Long-term
> some solution is needed to perhaps prevent hidraw and evdev
> drivers to step on each other's toes. For now this fixes
> the current problem.
> 
> The last patch fixes sysfs cleanup issues encountered using
> the DS4 dongle.

Hi Roderick,

I've applied the kernel crash fix to for-5.10/upstream-fixes and remaining 
two to for-5.11/sony.

Thanks,

-- 
Jiri Kosina
SUSE Labs

