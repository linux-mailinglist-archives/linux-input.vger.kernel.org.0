Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9ADC3FE28F
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 20:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243822AbhIASy6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 14:54:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:35648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343671AbhIASyw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Sep 2021 14:54:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2A3661131;
        Wed,  1 Sep 2021 18:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630522429;
        bh=XZ8iW6MZ8uzAD8NrpD8rSGkgOZzPZAsbD/exYXGVr9Y=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=gn8IlCPvFgFcTgSYMUasr8xjOtCSnxDlhGMIlprF7gIwWecW00s+fAelVQpR7SGVp
         gD4B4szfHrdpbkWLj017FYLnFZ016nJkPEWremFBwFwxUtPMJfIlEInXji2BLU2WHP
         Dst2wQog6aCQRgNI8L5FrJ2t1V1zAJXnKr01nzhcqwcJS5pKkKhUmjgrP0oDef+vwM
         BPt5gtBoTsX1pDMwcjHuse0c/e1ivS2bVsUFxehQ/WmzfV2oh0R0fWFZjc0ZNfR8dc
         sgy7Ge4vm59pLnGaUi9MkLsrziD5nCRqyhvA8tU23i1GVyjKi0POdZbwX7MfeZKWJ3
         IrnhiCAsQ4UCg==
Date:   Wed, 1 Sep 2021 20:53:39 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Michal Kubecek <mkubecek@suse.cz>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        linux-input@vger.kernel.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/3] HID: usbhid: Fix flood of "control queue full"
 messages
In-Reply-To: <20210901163549.GA404634@rowland.harvard.edu>
Message-ID: <nycvar.YFH.7.76.2109012052530.15944@cbobk.fhfr.pm>
References: <20210819195300.GA8613@rowland.harvard.edu> <000000000000c322ab05c9f2e880@google.com> <20210820140620.GA35867@rowland.harvard.edu> <nycvar.YFH.7.76.2108241351490.15313@cbobk.fhfr.pm> <CAO-hwJ+i4MqOj0umUW9kFgYSZLt3QMb6hDZHQwb8AKH9pKxSTg@mail.gmail.com>
 <20210901153811.GA403560@rowland.harvard.edu> <20210901155145.qflw5s4zqiud7gke@lion.mk-sys.cz> <20210901163549.GA404634@rowland.harvard.edu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 1 Sep 2021, Alan Stern wrote:

> From: Michal Kubecek <mkubecek@suse.cz>
> 
> [patch description by Alan Stern]
> 
> Commit 7652dd2c5cb7 ("USB: core: Check buffer length matches wLength
> for control transfers") causes control URB submissions to fail if the
> transfer_buffer_length value disagrees with the setup packet's wLength
> valuel.  Unfortunately, it turns out that the usbhid can trigger this
> failure mode when it submits a control request for an input report: It
> pads the transfer buffer size to a multiple of the maxpacket value but
> does not increase wLength correspondingly.
> 
> These failures have caused problems for people using an APS UPC, in
> the form of a flood of log messages resembling:
> 
> 	hid-generic 0003:051D:0002.0002: control queue full
> 
> This patch fixes the problem by setting the wLength value equal to the
> padded transfer_buffer_length value in hid_submit_ctrl().  As a nice
> bonus, the code which stores the transfer_buffer_length value is now
> shared between the two branches of an "if" statement, so it can be
> de-duplicated.
> 
> Signed-off-by: Michal Kubecek <mkubecek@suse.cz>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Fixes: 7652dd2c5cb7 ("USB: core: Check buffer length matches wLength for control transfers")
> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: stable@vger.kernel.org
> 

Thanks Alan, applied and I will be sending whole HID tree to Linus soon.

(BTW, something broke your threading, so 2/3 and 3/3 were not threaded 
together with 1/3).

-- 
Jiri Kosina
SUSE Labs

