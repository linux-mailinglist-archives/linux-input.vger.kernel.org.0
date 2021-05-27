Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEB5393493
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 19:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbhE0RNC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 13:13:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235054AbhE0RNB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 13:13:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0392B61176;
        Thu, 27 May 2021 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622135487;
        bh=oVmvWRRlCcRyLy/b6AszYaifCw07E7MxwEGRkQGWFU0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZaIozOcFnGuc5OXbrXL2oelAjrBD/uMugh5HH2ZkpEngfEKjQE65BtN5nUZyKz6m4
         5aqsglEZknHlEDgb8Y4FzYbty2J+mlasoufgBdPccHqFJMgtyf/ijNtt2Z7DKJ3WJ8
         VtkPiE5ZE26PiGDlQj5p4PYycmOVhMMFI4VekbLg=
Date:   Thu, 27 May 2021 19:11:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbmouse: Avoid GFP_ATOMIC when GFP_KERNEL is
 possible
Message-ID: <YK/SvAoog4TKygoY@kroah.com>
References: <20210524145743.GA92203@hyeyoo>
 <20210527164517.GA143281@hyeyoo>
 <YK/Or91JIpbpwWjL@kroah.com>
 <20210527170536.GA143409@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527170536.GA143409@hyeyoo>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 28, 2021 at 02:05:36AM +0900, Hyeonggon Yoo wrote:
> On Thu, May 27, 2021 at 06:54:07PM +0200, Greg KH wrote:
> > It has been only 4 days.  For a non-bugfix and for something that is
> > only a "cleanup" change, give it at least 2 weeks please.
> > 
> > Relax, there is no rush for stuff like this.
> 
> Hello Greg!
> 
> Okay You are right. I'll relax...
> 
> I think I need to be familiar with the process :)

Please go read Documentation/process/ for all of that while you wait :)
