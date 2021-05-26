Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CA2391513
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 12:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233912AbhEZKkF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 06:40:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233793AbhEZKkB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 06:40:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E385A613D3;
        Wed, 26 May 2021 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622025509;
        bh=EH5hNeUV7Rx2qzUf2ikRb5G4lxugDZTTdqSMZQLuyuc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZJE8RLzLaEolZJReKnJzbSfO5lILPbgW1QNHp2Lwy5qX8PfyRixNAiLR87msQZO1u
         fb87xdjnRMaxopYrayU8wXbdsw627wZygoD3S630ukF4eU+S/2V5L97F0IDNPuMFfW
         YKbxZngb+sAE9+K6hbJn3RTFFODf87eGpMvfv1xWTfNjrtiD3OPRFOemKUy2HURMAC
         nl99i2Iv+2LQY8X3KZsD6kq97bgV3b2YM9c46eJQWfuT56kzPEIfLWR1R4f9xy6/EZ
         5XgbHCf9qkP5DBuz/eo00Lt8xRHOnF2VvewA7psrgp2aUa7A0j5nGGMRZGUcKzYLMS
         xKy189gCdV1ZA==
Date:   Wed, 26 May 2021 12:38:27 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/6] HID: Misc. fixes
In-Reply-To: <20210505213935.631351-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2105261238110.28378@cbobk.fhfr.pm>
References: <20210505213935.631351-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 5 May 2021, Hans de Goede wrote:

> Hi Jiri, Benjamin,
> 
> Here is v2 of what started out as a small series to fix spurious wakeups
> on T101HA 2-in-1s.
> 
> This adds the discussed hid_is_usb_device() helper and uses that in:
> 
> "HID: multitouch: Disable event reporting on suspend when our parent is
> not a wakeup-source"
> 
> To avoid needing to add a "depends on USB_HID" to hid-multitouch Kconfig
> settings.
> 
> I've checked all other hid_is_using_ll_driver(hdev, &usb_hid_driver) callers
> and the only one which can truely benefit from the new helper is the
> hid-asus driver, which also deals with some I2C devices on some Asus hw.
> 
> All other drivers using hid_is_using_ll_driver(hdev, &usb_hid_driver)
> are only for USB devices, so dropping the "depends on USB_HID" does not
> make sense for them.
> 
> The one other driver which may benefit from the new hid_is_usb_device()
> helper would be the Wacom driver which seems to also support I2C devices,
> but that contains a lot of USB specific code, so I don't think we can
> easily drop the "depends on USB_HID" there.
> 
> Even though this is a bit if a mixed-bag of patches, their are several
> dependencies between them, so these should probably all go on a single
> topic branch.

Now in for-5.13/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

