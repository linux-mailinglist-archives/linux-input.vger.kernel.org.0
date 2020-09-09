Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3820F262740
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 08:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgIIGhu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Sep 2020 02:37:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:43676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbgIIGhs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Sep 2020 02:37:48 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F96920936;
        Wed,  9 Sep 2020 06:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599633468;
        bh=RQV4YBxuPOtXWiIQO+MHa542tOogyAyYK/6OUZ4xHiQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=cgzbLISyDpdXrTjvZQAwS42Hfd1jlksJNiZNs8pFK3YdpiqMxuPJOEgZjCoNI+fDk
         IlBoe8hJgCmckvXfjdjjj7jYhi3D8I4KUMRKwGAg2HnrlmW93r7IufUBP/q0CbgEaU
         2icpCykO0+NYoV+Uj2UwyjHqBjIDfiZSc4eRCGUY=
Date:   Wed, 9 Sep 2020 08:37:45 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: ite: Add USB id match for Acer One S1003 keyboard
 dock
In-Reply-To: <20200901075642.4648-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2009090837360.4671@cbobk.fhfr.pm>
References: <20200901075642.4648-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 1 Sep 2020, Hans de Goede wrote:

> The Acer One S1003 2-in-1 keyboard dock uses a Synaptics S910xx touchpad
> which is connected to an ITE 8910 USB keyboard controller chip.
> 
> This keyboard has the same quirk for its rfkill / airplane mode hotkey as
> other keyboards with ITE keyboard chips, it only sends a single release
> event when pressed and released, it never sends a press event.
> 
> This commit adds this keyboards USB id to the hid-ite id-table, fixing
> the rfkill key not working on this keyboard. Note that like for the
> Acer Aspire Switch 10 (SW5-012) the id-table entry matches on the
> HID_GROUP_GENERIC generic group so that hid-ite only binds to the
> keyboard interface and the mouse/touchpad interface is left untouched
> so that hid-multitouch can bind to it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-ids.h | 1 +
>  drivers/hid/hid-ite.c | 4 ++++
>  2 files changed, 5 insertions(+)

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

