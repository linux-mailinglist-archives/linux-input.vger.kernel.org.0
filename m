Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1262F1C6D5D
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 11:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbgEFJmO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 05:42:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:47814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729134AbgEFJmO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 May 2020 05:42:14 -0400
Received: from pobox.suse.cz (unknown [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1F722082E;
        Wed,  6 May 2020 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588758133;
        bh=q6NKBEVy3YjLLZhfxK6WYMiLhm5hjtD+pDGV3+93BvA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=AWAUYiRgy9RPJXq85MjQxZ8ahN2JfC2kIz60PWwR4oQQG8nCPxFZg69EC/ysM8kxv
         6iX3k4LU41qLkwoBkBZg8GiQ5YOBqxWpE442AR+Y3T3XxEp5VOuaHQAJ51lUYcqgaW
         mjRHhFuKY/G0Z2flRfhQdBt+DfAldVIyEfhJ/Uzg=
Date:   Wed, 6 May 2020 11:42:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 3/6] HID: asus: Add hid_is_using_ll_driver(usb_hid_driver)
 check
In-Reply-To: <85945c78-5ed6-a780-e562-27c710710a8f@redhat.com>
Message-ID: <nycvar.YFH.7.76.2005061141130.25812@cbobk.fhfr.pm>
References: <20200428142254.252063-1-hdegoede@redhat.com> <20200428142254.252063-3-hdegoede@redhat.com> <nycvar.YFH.7.76.2005051631560.25812@cbobk.fhfr.pm> <85945c78-5ed6-a780-e562-27c710710a8f@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 6 May 2020, Hans de Goede wrote:

> >> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >> index b3292ff3f61a..719eff589f92 100644
> >> --- a/drivers/hid/hid-asus.c
> >> +++ b/drivers/hid/hid-asus.c
> >> @@ -842,7 +842,8 @@ static int asus_probe(struct hid_device *hdev, const
> >> struct hid_device_id *id)
> >>    if (drvdata->quirks & QUIRK_IS_MULTITOUCH)
> >>     drvdata->tp = &asus_i2c_tp;
> >>   -	if (drvdata->quirks & QUIRK_T100_KEYBOARD) {
> >> +	if ((drvdata->quirks & QUIRK_T100_KEYBOARD) &&
> >> +	    hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
> >>     struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
> >>   
> > 
> > I am going to push the whole patchset to for-5.8/asus branch later today,
> 
> Thanks.

Now pushed out, thanks.

> > but I guess this one should better be taken as 5.7 fix still, right?
> 
> I know that Benjamin has been insisting on these extra checks, which
> is why I added it. But in practice not having the check does not really
> seem to be a big issue, so whether to add it to 5.7.x or not is your call.

So I guess some wild device fuzzer might in theory be able to confuse it, 
but I don't immediately see how. So let's queue this all for 5.8.

-- 
Jiri Kosina
SUSE Labs

