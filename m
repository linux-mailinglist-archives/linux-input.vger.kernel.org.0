Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304F32C688F
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 16:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbgK0PPz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 10:15:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:47166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727653AbgK0PPz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 10:15:55 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EAE6F22240;
        Fri, 27 Nov 2020 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606490154;
        bh=VnC+MS5zTtVzK57UXfr1wk/NCimsOp/f/CJsud5WcSA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=nbY0LnuErKYHoYDCUYRAo0aFQCt4Z9uGY5r3s/Qr86myPzrmQh2eBLn766CJKP/eB
         o7yJOUrYkG6tSGRYF/1/WA909i/JYOp9T/fNtCAL0wcPRYhXfDP/IccyryBEjG730y
         gsE71l77+8CgA3L+LYpCREnmysqGwQbM2vGM3TqA=
Date:   Fri, 27 Nov 2020 16:15:51 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: ite: Add support for Acer S1002 keyboard-dock
In-Reply-To: <20201125223745.390464-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2011271615400.3441@cbobk.fhfr.pm>
References: <20201125223745.390464-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 25 Nov 2020, Hans de Goede wrote:

> Make the hid-ite driver handle the Acer S1002 keyboard-dock, this
> leads to 2 improvements:
> 
> 1. The non working wifi-toggle hotkey now works.
> 2. Toggling the touchpad on of with the hotkey will no show OSD
> notifications in e.g. GNOME3. The actual toggling is handled inside
> the keyboard, this adds support for notifying evdev listeners about this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

