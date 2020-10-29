Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C9429EAFA
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 12:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgJ2Luo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 07:50:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:56440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgJ2Luo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 07:50:44 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6AE820796;
        Thu, 29 Oct 2020 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603972243;
        bh=/ukxgWymwdalEMAGTnI3Q15CVWaQiEo4N4EBb/Pw6Y4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Oqam8c8CE/bzz2LawNIvMduP36RlBq+ZTYRtaXOquu7PYfCEih7pA2+hyVD40V32p
         M6r2JQ+j39eNBXR50OoW1Z1B5D6d86udMJgSjZB28WXBahQEgZ3tH66+Wj2Juxqux1
         Tx8qhIQCeuAWJ55HPy5VWlgQYfEyC8N2JRLPzJsU=
Date:   Thu, 29 Oct 2020 12:50:40 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] HID: i2c-hid: Put ACPI enumerated devices in D3 on
 shutdown
In-Reply-To: <20201026154606.10409-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2010291250310.18859@cbobk.fhfr.pm>
References: <20201026154606.10409-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 26 Oct 2020, Hans de Goede wrote:

> The i2c-hid driver would quietly fail to probe the i2c-hid sensor-hub
> with an ACPI device-id of SMO91D0 every other boot.
> 
> Specifically, the i2c_smbus_read_byte() "Make sure there is something at
> this address" check would fail every other boot.
> 
> It seems that the BIOS does not properly reset/power-cycle the device
> leaving it in a confused state where it refuses to respond to i2c-xfers.
> On boots where probing the device failed, the driver-core puts the device
> in D3 after the probe-failure, which causes the probe to succeed the next
> boot.
> 
> Putting the device in D3 from the shutdown-handler fixes the sensors not
> working every other boot.
> 
> This has been tested on both a Lenovo Miix 2-10 and a Dell Venue 8 Pro 5830
> both of which use an i2c-hid sensor-hub with an ACPI id of SMO91D0.
> 
> Note that it is safe to call acpi_device_set_power() with a NULL pointer
> as first argument, so on none ACPI enumerated devices this change is a
> no-op.
> 
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

