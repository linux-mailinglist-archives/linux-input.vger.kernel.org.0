Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 479FF100134
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2019 10:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfKRJYX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Nov 2019 04:24:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:36202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbfKRJYX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Nov 2019 04:24:23 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEDD320727;
        Mon, 18 Nov 2019 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574069063;
        bh=P2SnQ+swBMLAm+pYO6ij+VDFLpl7q/D8rsBBFNOs1RE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=dkSYW/pMZb+0zXMT3id9QMuxzzCxE0JTWe0fnWvW2ZH1sr1IVa5//iJytNLpfsiTq
         5bx1KJxExl3NBy2WWIr3bs+YpXDAQwgRsuoBbyC9ROxkVV5FjFsihlEqYYrn4HV5mx
         UrDrLvsijcqIa2VG+fCvd5LWBaSHLWG7ty2obtcE=
Date:   Mon, 18 Nov 2019 10:24:19 +0100 (CET)
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
In-Reply-To: <6931c116-78fb-9ad9-aab1-f15799118c82@synaptics.com>
Message-ID: <nycvar.YFH.7.76.1911181024040.1799@cbobk.fhfr.pm>
References: <20191023012344.20998-1-aduggan@synaptics.com> <nycvar.YFH.7.76.1911151626120.1799@cbobk.fhfr.pm> <6931c116-78fb-9ad9-aab1-f15799118c82@synaptics.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 15 Nov 2019, Andrew Duggan wrote:

> Since this second patch was for the input subsystem I decided to just 
> make them separate patches instead of creating a series. However, based 
> on Dmitry's feedback it was determined that the second patch wasn't a 
> good idea and it won't be applied. This first patch is enough to fix the 
> issue by preventing the call to rmi_unregister_transport_device() if the 
> subsequent call to register failed. The only change I would make to this 
> patch would be to remove the last sentence of the comment. If you choose 
> to apply that patch then would this be a change you would make? Or would 
> you prefer I submit a v2 with this update?

I've modified the changelog and applied. Thanks,

-- 
Jiri Kosina
SUSE Labs

