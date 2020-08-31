Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE582573E1
	for <lists+linux-input@lfdr.de>; Mon, 31 Aug 2020 08:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgHaGmd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Aug 2020 02:42:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbgHaGmb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Aug 2020 02:42:31 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B37E3206F0;
        Mon, 31 Aug 2020 06:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598856150;
        bh=7S1S2oN08Lg27+dmCUgRly7ZYRkbNHIdRCemkqo8+p4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ehr1eWmnIjX8eRvEPz7ZSwqOHZxhbw6a2FicywWpKpC0Ttnn29SfVV9+m1ZS1QGuS
         TeF+rOfoNZaOeabWJZ+szi/qXvrKrQVYrg/LT+iI5ZRKdy36nFHstP9p2IyMVXirML
         VNqXvAjYHWziZOG7hqwuRYn1P1vKy9A3i1ZG2yn0=
Date:   Mon, 31 Aug 2020 08:42:27 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Igor Raits <igor.raits@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: logitech-hidpp-device 0003:046D:406F.0006: item fetching failed
 at offset 0/0
In-Reply-To: <1e4e728832dc53439e95753e2ae101526084b3e9.camel@gmail.com>
Message-ID: <nycvar.YFH.7.76.2008310841440.27422@cbobk.fhfr.pm>
References: <1e4e728832dc53439e95753e2ae101526084b3e9.camel@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 30 Aug 2020, Igor Raits wrote:

> I've hit some weird issue when upgrading from 5.8 to 5.9-rc2 in Fedora.
> My Logitech MX Ergo is not working anymore after update. Moving trackball does not move cursor.
> 
> In the logs I see following:
> 
> Aug 30 09:44:51 kernel: logitech-hidpp-device: probe of 0003:046D:406F.0006 failed with error -22
> Aug 30 09:44:51 kernel: logitech-hidpp-device 0003:046D:406F.0006: hidpp_probe:parse failed
> Aug 30 09:44:51 kernel: logitech-hidpp-device 0003:046D:406F.0006: item fetching failed at offset 0/0
> Aug 30 09:44:51 kernel: hid-generic: probe of 0003:046D:406F.0006 failed with error -22
> Aug 30 09:44:51 kernel: hid-generic 0003:046D:406F.0006: item fetching failed at offset 0/0
> Aug 30 09:44:41 kernel: apple 0003:05AC:024F.0005: input,hiddev97,hidraw2: USB HID v1.11 Keyboard [Keytron Keychron K2] on usb-0000:3c:00.0-1.4/input1
> Aug 30 09:44:41 kernel: apple 0003:05AC:024F.0004: input,hidraw1: USB HID v1.11 Keyboard [Keytron Keychron K2] on usb-0000:3c:00.0-1.4/input0
> Aug 30 09:44:40 kernel: logitech-djreceiver 0003:046D:C52B.0003: hiddev96,hidraw0: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input2
> Aug 30 09:44:39 kernel: hid-generic 0003:046D:C52B.0003: hiddev97,hidraw2: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input2
> Aug 30 09:44:39 kernel: hid-generic 0003:046D:C52B.0002: input,hiddev96,hidraw1: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input1
> Aug 30 09:44:39 kernel: hid-generic 0003:046D:C52B.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:3c:00.0-1.1/input0
[ ... ] 
> Anybody knows what might be the problem? I'll try to revert commits 1 by 1 to see which one could help.

This should be fixed in 5.9-rc3 via commit 5b0545dc18. If you still see 
the issues even with this commit applied, please let me know.

Thanks,

-- 
Jiri Kosina
SUSE Labs

