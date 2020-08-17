Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA58246433
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 12:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgHQKPn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 06:15:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726653AbgHQKPm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 06:15:42 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8E4920738;
        Mon, 17 Aug 2020 10:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597659341;
        bh=khtutIQkFltI68xUUMBML8b8IYSW0qnqxPWWfbEYhYM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=NVLyDLjo6vZOiw0f49mfNPe8XVYdxxlgyHpcr6GVHuouLeLTlDv2Ic0wHCEKxBaTs
         hpzhqYB+fpCKfz/ZLE7iM0ErL84VNzsC5FoaO6B3RBXxwtGD+N6wypbpvccB+ne0K2
         mfG/+V+p17dUIW05+IqXQwNa6oFxpPv7FZ0oY7IE=
Date:   Mon, 17 Aug 2020 12:15:38 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     BALATON Zoltan <balaton@eik.bme.hu>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dan Bastone <dan@pwienterprises.com>
Subject: Re: [PATCH] HID: apple: Add support for Matias wireless keyboard
In-Reply-To: <20200720205741.0A114747871@zero.eik.bme.hu>
Message-ID: <nycvar.YFH.7.76.2008171214110.27422@cbobk.fhfr.pm>
References: <20200720205741.0A114747871@zero.eik.bme.hu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 20 Jul 2020, BALATON Zoltan wrote:

> The Matias Wireless keyboard has an Apple like layout and identifies
> as ISO RevB Alu keyboard. Use hid-apple for it so Fn key and media
> control functions work as expected.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

So If I understand correctly, this keyboard identifies itself with Apple 
VID, but in fact it is not.

I'd like to make sure that we don't break the real 
USB_DEVICE_ID_APPLE_ALU_REVB_ISO device produced by Apple; CCing Dan 
Bastone, who added this device ID back in 2011 (4a4c879904aa). Dan, any 
ideas please?

Thanks,

-- 
Jiri Kosina
SUSE Labs

