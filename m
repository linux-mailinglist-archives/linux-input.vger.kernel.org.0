Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA51FE129
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 16:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfKOP0p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 10:26:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:41150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727443AbfKOP0p (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 10:26:45 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4677520732;
        Fri, 15 Nov 2019 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573831604;
        bh=BVxxb9+UOFFTgsa9g0iLp6vpD4tPWMdD8Z1mE+iK9pE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=E/PHRXyxQEWCRrANnkRAMeTDMgI4eTCO3PjZizbCoxBO9ILygaRFQzediAKpx/C8S
         igWxICt2VcVK5jXWuuqHELIC4D1VvvGXe9wFURSl7iNG8YE2oSpEGuTZqNn2nVxwCm
         MlP8GHLWR9x80QJA9qQ9vMyCVqbUn2mrpUGOkHIE=
Date:   Fri, 15 Nov 2019 16:26:41 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Andrew Duggan <aduggan@synaptics.com>
cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Federico Cerutti <federico@ceres-c.it>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] HID: rmi: Check that the RMI_STARTED bit is set before
 unregistering the RMI transport device
In-Reply-To: <20191023012344.20998-1-aduggan@synaptics.com>
Message-ID: <nycvar.YFH.7.76.1911151626120.1799@cbobk.fhfr.pm>
References: <20191023012344.20998-1-aduggan@synaptics.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 23 Oct 2019, Andrew Duggan wrote:

> In the event that the RMI device is unreachable, the calls to
> rmi_set_mode() or rmi_set_page() will fail before registering the RMI
> transport device. When the device is removed, rmi_remove() will call
> rmi_unregister_transport_device() which will attempt to access the
> rmi_dev pointer which was not set. This patch adds a check of the
> RMI_STARTED bit before calling rmi_unregister_transport_device().
> The RMI_STARTED bit is only set after rmi_register_transport_device()
> completes successfully. A subsequent patch in the RMI core will add
> checks to validate the pointers before accessing them.

Andrew,

my mailbox doesn't seem to have that 'subsequent patch' ... was it ever 
sent and I missed it? If so, could you please resend it?

Thanks,

-- 
Jiri Kosina
SUSE Labs

