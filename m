Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739A3373B05
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbhEEMWo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:22:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:51450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232440AbhEEMWi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:22:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2D0E611EE;
        Wed,  5 May 2021 12:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620217301;
        bh=7IVvOEZYV1CnnsssmX7NXV+hvmd9q7XFY0JyQhEY/pQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=an75OSjlBEhBvTKKggaac94MbNhQgqhcpgF3VB1SKvI3UFoUpiesjudgTBGB7PDgK
         k3LDifkV+WUTgbPtrh1DgdZLhsGWsfA/gQCiMsp9knaGyrO0g/Tl1v7ygM12OCB0uD
         oHfq0l4Dn954nAxeO/VwjyJR/9FhspIOz4nAdjtzn76ivZHKjqDs39N4ZkPPFFmt6x
         PxLOrcbx6T8myn0YBJJzAvifwp9W4BVqP7qulw6lDgMdD2CkQBsAjosdAzJXB23p2+
         NEQh+YIBsekbhG2KYUDZ7M6N+xdXLzqxeaU3tb/nLqUdXRHhCzlv90zoQV5sZXpFTr
         fqIUE9wVhboJg==
Date:   Wed, 5 May 2021 14:21:38 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Moody <benjamin.moody@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Moody <bmoody@member.fsf.org>
Subject: Re: [PATCH] HID: semitek: new driver for GK6X series keyboards
In-Reply-To: <20210207184704.2961-1-benjamin.moody@gmail.com>
Message-ID: <nycvar.YFH.7.76.2105051421290.28378@cbobk.fhfr.pm>
References: <20210207184704.2961-1-benjamin.moody@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 7 Feb 2021, Benjamin Moody wrote:

> From: Benjamin Moody <bmoody@member.fsf.org>
> 
> A number of USB keyboards, using the Semitek firmware, are capable of
> handling arbitrary N-key rollover, but due to a buggy report
> descriptor, keys beyond the sixth cannot be detected by the generic
> HID driver.
> 
> There are numerous hardware variants sold by several vendors, mostly
> using generic names like "GK61" for the 61-key version.  These
> keyboards are sometimes known collectively as the "GK6X" series.
> 
> The keyboard has three USB interfaces.  Interface 0 uses the standard
> HID boot protocol, limited to eight modifier keys and six normal keys;
> interface 2 uses a custom report format that permits any number of
> keys.  If more than six keys are pressed simultaneously, the first six
> are reported via interface 0 while subsequent keys are reported via
> interface 2.
> 
> (Interface 1 uses a custom protocol for reprogramming the keyboard;
> this can be controlled through userspace tools and is not of concern
> for the present driver.)
> 
> The report descriptor for interface 2, however, is incorrect (for
> report ID 0x04, the input field is marked as "array" rather than
> "variable".)  The descriptor appears to be correct in other respects,
> so we simply replace the incorrect byte before parsing the descriptor.
> 
> Signed-off-by: Benjamin Moody <bmoody@member.fsf.org>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

