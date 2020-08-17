Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633E524643D
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 12:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgHQKRe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 06:17:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:51228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgHQKRd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 06:17:33 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFC7D20758;
        Mon, 17 Aug 2020 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597659453;
        bh=nLxOhwLTOA/j+CBD23HoDC8yf9oqIOVY5PxuWru9gKk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=VInhwW4kWuR+6+/thk08uxtXySbHlP0CSdDt3Mqzucf74fKy3saRJMNKLUg8j1tZQ
         k3vtqdbdoGurzt0d96qdnDl4odBr0MKEqZbotNqcKSa5+JUkNRtKUmQoZ3NP00+fWw
         sSI4B4YwAdIUFoFOc1K6+NWN3Ser9HOq0o+noUJE=
Date:   Mon, 17 Aug 2020 12:17:31 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     BALATON Zoltan <balaton@eik.bme.hu>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dan Bastone <dan@pwienterprises.com>
Subject: Re: [PATCH] HID: apple: Add support for Matias wireless keyboard
In-Reply-To: <nycvar.YFH.7.76.2008171214110.27422@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2008171216390.27422@cbobk.fhfr.pm>
References: <20200720205741.0A114747871@zero.eik.bme.hu> <nycvar.YFH.7.76.2008171214110.27422@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 17 Aug 2020, Jiri Kosina wrote:

> > The Matias Wireless keyboard has an Apple like layout and identifies
> > as ISO RevB Alu keyboard. Use hid-apple for it so Fn key and media
> > control functions work as expected.
> > 
> > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> So If I understand correctly, this keyboard identifies itself with Apple 
> VID, but in fact it is not.
> 
> I'd like to make sure that we don't break the real 
> USB_DEVICE_ID_APPLE_ALU_REVB_ISO device produced by Apple; CCing Dan 
> Bastone, who added this device ID back in 2011 (4a4c879904aa). Dan, any 
> ideas please?

OK, Dan's e-mail address doesn't work any more. Let's conservatively queue 
this for 5.10, and in case there are any regression reports against stock 
Apple keyboards, we'll have to look for ways to work it around.

Yay for VID sharing :/

Thanks,

-- 
Jiri Kosina
SUSE Labs

