Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E423295D95
	for <lists+linux-input@lfdr.de>; Thu, 22 Oct 2020 13:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897464AbgJVLm6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Oct 2020 07:42:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:56588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2897463AbgJVLm5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Oct 2020 07:42:57 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 597B02227F;
        Thu, 22 Oct 2020 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603366977;
        bh=vg9bLrqZsiCro7gaHo07E5A4K+A2WkJLfh+z5QffRuM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=i6hYAtbBnK09I+7PambG3fVYcaTXEKqpZQa1ivAZMLg5AXbzgpWeb2pS3a4evaShe
         e9O4dY7TX9aq8e1Ff7dpYnIM5c4Yf4pxfUQ6Xh1UebFC8I0/jgfVQDj5Q/onjDANNJ
         j6MQS7R7Yv2Z6ozeXvT/Vmb7Wt0XgyGnsF1EcsBg=
Date:   Thu, 22 Oct 2020 13:42:54 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: ite: Replace ABS_MISC 120/121 events with touchpad
 on/off keypresses
In-Reply-To: <20201019074814.17722-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2010221342450.18859@cbobk.fhfr.pm>
References: <20201019074814.17722-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 19 Oct 2020, Hans de Goede wrote:

> The usb-hid keyboard-dock for the Acer Switch 10 SW5-012 model declares
> an application and hid-usage page of 0x0088 for the INPUT(4) report which
> it sends. This reports contains 2 8-bit fields which are declared as
> HID_MAIN_ITEM_VARIABLE.
> 
> The keyboard-touchpad combo never actually generates this report, except
> when the touchpad is toggled on/off with the Fn + F7 hotkey combo. The
> toggle on/off is handled inside the keyboard-dock, when the touchpad is
> toggled off it simply stops sending events.
> 
> When the touchpad is toggled on/off an INPUT(4) report is generated with
> the first content byte set to 120/121, before this commit the kernel
> would report this as ABS_MISC 120/121 events.
> 
> Patch the descriptor to replace the HID_MAIN_ITEM_VARIABLE with
> HID_MAIN_ITEM_RELATIVE (because no key-presss release events are send)
> and add mappings for the 0x00880078 and 0x00880079 usages to generate
> touchpad on/off key events when the touchpad is toggled on/off.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

