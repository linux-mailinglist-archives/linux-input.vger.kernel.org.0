Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A0F373B13
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbhEEMZX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:25:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:55934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232314AbhEEMZX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:25:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 004286139A;
        Wed,  5 May 2021 12:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620217466;
        bh=BBoYQnFAksetmX3zMPEwl8rH9Ec47NF9Dr5jATc2/ME=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=A14UOwJhn6Ok3x/5BCIv48ClDdKzS7mO2aQgEg7ko9RhjpDeVikkGMcO3qvc4aan8
         DYPykR29h8QF2JvXCfsW2ZjXhiVNFJCVYEeXxhjxXIT/jSQQuzHR6oLHEJa98Uiy8Z
         Q8AaZEnbhJ2xhkigxKnyJY6gCE4Vf+18WQYSA8hBsGiDg1659tjM+lMPk/1mm3en9J
         gjBE9W8pOxdSf+5KjSDZPaJdVKVHq9a9wjm/hv2aKvpFzfYViaNaup2B94dOzYbzyI
         wMgAMoMWfgoY1hgD55kNktIB9RqaalJM3wDjME8NuMmu+2Catf6eVnjtUOUE5beJKX
         ikaEFd0TAsBfQ==
Date:   Wed, 5 May 2021 14:24:23 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] HID: asus: Cleanup Asus T101HA keyboard-dock
 handling
In-Reply-To: <nycvar.YFH.7.76.2103311141060.12405@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2105051423470.28378@cbobk.fhfr.pm>
References: <20210306133716.453447-1-hdegoede@redhat.com> <nycvar.YFH.7.76.2103311141060.12405@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 31 Mar 2021, Jiri Kosina wrote:

> > There is no need to use a quirk and then return -ENODEV from the
> > asus_probe() function to avoid that hid-asus binds to the hiddev
> > for the USB-interface for the hid-multitouch touchpad.
> > 
> > The hid-multitouch hiddev has a group of HID_GROUP_MULTITOUCH_WIN_8,
> > so the same result can be achieved by making the hid_device_id entry
> > for the dock in the asus_devices[] table only match on HID_GROUP_GENERIC
> > instead of having it match HID_GROUP_ANY.
> 
> Benjamin, could you please Ack this series, as it touches hid-multitouch, 
> please?

Benjamin, friendly ping on this one.

Thanks,

-- 
Jiri Kosina
SUSE Labs

