Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C0538FE43
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 11:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhEYJ5U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 05:57:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:50752 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232805AbhEYJ5S (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 05:57:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1621936547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qt7xSUNOmHAQi4P06mTZcqw+fj0oxkeRlZUfC9qB+no=;
        b=CWxK040fDU6xWiJFGjqBnSfLokQxf0NAodqQwYFO98AYBY+y7HOgzvwJpZdOG830Jp3/YM
        /O5AtRUDHEjsrZFBLTJfzilo/NCxFWr7khzgjEkomXaI0KZttD+0rNSO11nlOwKfPP3Dy1
        ZCgvtP9lLzMN/p7piMTQIv5x53cTzSA=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A2769AE1F;
        Tue, 25 May 2021 09:55:47 +0000 (UTC)
Message-ID: <4086b017d678f2edaea3a87b8eae18a85cc8e89d.camel@suse.com>
Subject: Re: Re: [PATCH] HID: usbhid: enable remote wakeup for mouse
From:   Oliver Neukum <oneukum@suse.com>
To:     =?UTF-8?Q?=E9=A9=AC=E5=BC=BA?= <maqianga@uniontech.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     jikos <jikos@kernel.org>,
        "benjamin.tissoires" <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Date:   Tue, 25 May 2021 11:55:46 +0200
In-Reply-To: <1209199573.51584.1621492845444.JavaMail.xmail@bj-wm-cp-1>
References: <20210517060145.32359-1-maqianga@uniontech.com>
         <1327a9251c74587670970baa0f662cd61006f576.camel@suse.com>
        , <20210517133247.GB1083813@rowland.harvard.edu>
         <1209199573.51584.1621492845444.JavaMail.xmail@bj-wm-cp-1>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Donnerstag, den 20.05.2021, 14:40 +0800 schrieb 马强:
> This is caused by external reasons, as the kernel cannot sense 
> whether it is accidentally triggered or actively triggered. 
> If this kind of unintentional situation is avoided, 
> the keyboard should also be disabled wakeup by default. 
> Otherwise, the normally used computer may be awakened 
> by someone else accidentally pressing the keyboard on standby.
> 

The kernel has to manage keyboards. There just is no genuine
keyboard device user space could open, nor could we do sysrq
or sak if we left the keyboard fully to user space.

Hence keyboards are a special case unfortunately. We will
have to live with two classes of wakeup, keyboards and power
buttons on the one hand, versus everything else.

	Regards
		Oliver


