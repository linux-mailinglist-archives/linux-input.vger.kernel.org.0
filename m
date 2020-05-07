Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B521C8835
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 13:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgEGL3s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 07:29:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:54694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgEGL3s (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 07:29:48 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28AEC2084D;
        Thu,  7 May 2020 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588850988;
        bh=HgoUKpNDb+hWunlBZAHCaIfOGRsmlVOGyZr0E7MwtR4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=q/nh+Ov0DWc2/jSGsGcF+urSQOgepDgSuxJe2O+VDwLBdCT3JSAtJObTt8gCxj/0C
         15Sr7LBvAYqF+nBq1zVeHgYV/NI7doclxUK2NEeROKPs7Dw+YRojCO0HRxrxJazZZV
         6nP9XQn6fCF1zWt0EyRTWC2PYw0WUU9l4xQCsK9s=
Date:   Thu, 7 May 2020 13:29:45 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] HID: asus: Add depends on USB_HID to HID_ASUS Kconfig
 option
In-Reply-To: <20200507095334.11645-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2005071329160.25812@cbobk.fhfr.pm>
References: <20200507095334.11645-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 7 May 2020, Hans de Goede wrote:

> Since commit 4bc43a421218 ("HID: asus: Add
> hid_is_using_ll_driver(usb_hid_driver) check") the hid-asus.c depends
> on the usb_hid_driver symbol. Add a depends on USB_HID to Kconfig to
> fix missing symbols errors in hid-asus when USB_HID is not enabled.
> 
> Fixes: 4bc43a421218 ("HID: asus: Add hid_is_using_ll_driver(usb_hid_driver) check")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied on top of the for-5.8/asus queue. Thanks,

-- 
Jiri Kosina
SUSE Labs

