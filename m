Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E812C414B
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbgKYNkm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 08:40:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:56830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729488AbgKYNkm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 08:40:42 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA54520637;
        Wed, 25 Nov 2020 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606311641;
        bh=aYXsVmzotIRkbr4oSSNU7CmWyRWH2rmfdsi2Y5FPXAs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=r0wTjDLTe4hnZ/Gyx27I9N81yucPOlTW0y6BeN5mx60vbBM0INchHti+P7g3Klh0p
         7t3nYg7VlymBvhq0h8EHg/xl1p/k4myseIDPxeOxitzpzS47rx9bCPL2nLtQF0jm4Y
         4CKVpCU0GhnM0JLkEYJ2tStQf1Fzf/Ef+GpYNJyA=
Date:   Wed, 25 Nov 2020 14:40:38 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pascal.Giard@etsmtl.ca
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, sanjay.govind9@gmail.com
Subject: Re: [PATCH v2] HID: sony: support for ghlive ps3/wii u dongles
In-Reply-To: <acf595c3-1b0a-4d73-8087-784d89bdec91@email.android.com>
Message-ID: <nycvar.YFH.7.76.2011251439500.3441@cbobk.fhfr.pm>
References: <acf595c3-1b0a-4d73-8087-784d89bdec91@email.android.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 25 Nov 2020, Pascal.Giard@etsmtl.ca wrote:

> Thank you for reviewing this new version.
> 
> You are right, we could totally do without GHL_GUITAR_CONTROLLER.
> 
> This can be seen as premature generalization or an excess of optimism; 
> I'm assuming that the PS4 also needs magic control messages to behave 
> correctly, and that I will figure those sooner than later. But I may be 
> assuming too much and this will be trivial to add when the time comes.

Yeah, let's extend this only when really needed.

> Do you want me to submit a v3?

Please do, thanks. I'll merge that one, I promise :) Sorry for not 
having catched this in v1 already.

-- 
Jiri Kosina
SUSE Labs

