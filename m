Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B45A2EF440
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 15:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbhAHOyQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 09:54:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:50214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbhAHOyP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 Jan 2021 09:54:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E3E32388B;
        Fri,  8 Jan 2021 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610117615;
        bh=DuLNKiY8FZV5pfsrYsZS3WXcSJD/uz36Wmw+PznMxfE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LaCkbGPPwKyNE549gtFVitlfprSV0VeIZWkNhw+MxgYnZYMSnFnh2oK+WFKAY4+ob
         4+A05vjk4MJL6sJYnCxEC35ST9ixPPiKKSC6M0kgCbTJSpv+NvOIINKkOL0xH8qJCz
         tBCFcW0lJWCkCRDsv2hvMdz7T4L2ez6ex9h8PMNSAGPtS2QWVJo2ly+Cq+WX2NlqoX
         aSdizY+CvD7ANONiD4CIgKgp5LZ1YhUXK0HU6kTb7Dekg7CZufb/xxSyyMNtwILpsK
         QitdYmKMcTX+lR3RJ6yj6hRuJe50zmjw1Wr1rQs0wvKbcJuWZN1/R0yn8J8BjXmsib
         6eNVz8AdR2Dbw==
Date:   Fri, 8 Jan 2021 15:53:32 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Seth Miller <miller.seth@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: Ignore battery for Elan touchscreen on ASUS UX550
In-Reply-To: <CAMh5ckdy=z8j7X5BXLtpnOz2-Ha7MZqN-DvJS0e1w4CdiLJ4EQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2101081552560.13752@cbobk.fhfr.pm>
References: <CAMh5ckdy=z8j7X5BXLtpnOz2-Ha7MZqN-DvJS0e1w4CdiLJ4EQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 4 Jan 2021, Seth Miller wrote:

> Battery status is being reported for the Elan touchscreen on ASUS
> UX550 laptops despite not having a batter. It always shows either 0 or
> 1%.
> 
> Signed-off-by: Seth Miller <miller.seth@gmail.com>

Seth, thanks for the patch. It has, however, been line-wrapped by your 
mail client, so I can't apply it as-is. Could you please fix that up and 
resend?

Thanks,

-- 
Jiri Kosina
SUSE Labs

